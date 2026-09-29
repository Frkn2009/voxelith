<#
.SYNOPSIS
  VOXELITH icin guvenli gelistirme / test / commit-oncesi kontrol araci.
  Turkce karakter iceren kullanici profili yolundaki native-asset
  derleyici sorunundan kacinmak icin ASCII bir klon yolu + C:\pub-cache kullanir
  (bkz. docs/DEVAM_SAYFASI.md "TEKRAR YASANMASIN").

.EXAMPLE
  .\tools\mission-control.ps1 status
  .\tools\mission-control.ps1 check
  .\tools\mission-control.ps1 precommit
#>

[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [ValidateSet("status", "analyze", "test", "check", "remote", "backup", "precommit")]
    [string]$Command = "check"
)

$ErrorActionPreference = "Stop"

# Varsayilan: bu scriptin bulundugu reponun koku (ASCII yolda olmali).
$RepositoryPath = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$PubCachePath = "C:\pub-cache"
$BackupPath = "$RepositoryPath-backup"

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host "===================================================" -ForegroundColor DarkCyan
    Write-Host "  $Title" -ForegroundColor Cyan
    Write-Host "===================================================" -ForegroundColor DarkCyan
}

function Assert-Repository {
    if (-not (Test-Path $RepositoryPath)) {
        throw "Repository bulunamadi: $RepositoryPath (once gercek repodan buraya senkronla)"
    }
    Set-Location $RepositoryPath
    if (-not (Test-Path ".git")) {
        throw "$RepositoryPath bir Git repository degil."
    }
}

function Set-VoxelithEnvironment {
    $env:PUB_CACHE = $PubCachePath
    if (-not (Test-Path $PubCachePath)) {
        New-Item -ItemType Directory -Path $PubCachePath -Force | Out-Null
    }
    Write-Host "Repository : $(Get-Location)" -ForegroundColor Gray
    Write-Host "PUB_CACHE  : $env:PUB_CACHE" -ForegroundColor Gray
}

function Invoke-Backup {
    Write-Section "YEDEKLEME"
    if (-not (Test-Path $BackupPath)) {
        New-Item -ItemType Directory -Path $BackupPath -Force | Out-Null
    }
    $stamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $patchFile = Join-Path $BackupPath "before_$stamp.patch"
    git diff --binary | Out-File -FilePath $patchFile -Encoding utf8
    if ((Get-Item $patchFile).Length -gt 0) {
        Write-Host "Commit edilmemis degisiklikler yedeklendi: $patchFile" -ForegroundColor Green
    }
    else {
        Remove-Item $patchFile -Force
        Write-Host "Commit edilmemis degisiklik yok, yedek dosyasi olusturulmadi." -ForegroundColor Gray
    }
}

function Invoke-RemoteCheck {
    Write-Section "REMOTE GUNCELLIK KONTROLU"
    git fetch origin --prune

    $branch = git branch --show-current
    if ([string]::IsNullOrWhiteSpace($branch)) {
        throw "Aktif branch tespit edilemedi."
    }

    $upstream = git rev-parse --abbrev-ref "@{u}" 2>$null
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($upstream)) {
        Write-Warning "Bu branch icin upstream tanimli degil. Remote ilerleme kontrolu yapilamadi."
        return
    }

    $remoteCommits = git log --oneline "HEAD..@{u}"
    if ($remoteCommits) {
        Write-Host ""
        Write-Host "UYARI: Remote branch ilerlemis. Commit/push oncesi entegrasyon gerekli." -ForegroundColor Yellow
        Write-Host $remoteCommits -ForegroundColor Yellow
        exit 2
    }
    Write-Host "Remote branch guncel." -ForegroundColor Green
}

function Invoke-Analyze {
    Write-Section "DART ANALYZE"
    dart analyze
    if ($LASTEXITCODE -ne 0) { throw "dart analyze basarisiz." }
}

function Invoke-Tests {
    Write-Section "FLUTTER TEST"
    flutter test
    if ($LASTEXITCODE -ne 0) { throw "flutter test basarisiz." }
}

function Show-Status {
    Write-Section "GIT STATUS"
    git status -sb
    Write-Section "SON COMMIT"
    git log -1 --oneline
    Write-Section "DEVAM DOSYASI"
    if (Test-Path "docs\DEVAM_SAYFASI.md") {
        Write-Host "Bulundu: docs\DEVAM_SAYFASI.md - kod yazmadan once oku." -ForegroundColor Green
    }
    else {
        Write-Warning "docs\DEVAM_SAYFASI.md bulunamadi."
    }
}

Assert-Repository
Set-VoxelithEnvironment

switch ($Command) {
    "status"    { Show-Status }
    "remote"    { Invoke-RemoteCheck }
    "analyze"   { Invoke-Analyze }
    "test"      { Invoke-Tests }
    "backup"    { Invoke-Backup }
    "check"     { Show-Status; Invoke-Analyze; Invoke-Tests }
    "precommit" {
        Invoke-Backup
        Invoke-RemoteCheck
        Invoke-Analyze
        Invoke-Tests
        Write-Section "COMMIT ICIN HAZIR"
        Write-Host "Yedekleme, remote kontrolu, analiz ve testler basarili." -ForegroundColor Green
    }
}
