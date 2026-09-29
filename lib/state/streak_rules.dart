import '../data/models/models.dart';

/// Seri (streak) ve seri koruma kuralları — saf fonksiyonlar, tarih dışarıdan
/// verilir (test edilebilir, `Clock` kuralına uygun).
///
/// - Aynı gün tekrar pratik: seri değişmez.
/// - Dün pratik yapılmışsa: seri +1.
/// - Arada N gün kaçırılmışsa ve N ≤ koruma hakkı: N hak harcanır, seri +1.
///   Yetmezse seri 1'den başlar (haklar korunur).
/// - Seri her 7'nin katına ulaştığında 1 koruma hakkı kazanılır
///   (en fazla [UserProfile.maxStreakFreezes]).
/// - Plus: her pazartesi haklar en üst sınıra doldurulur.
class StreakRules {
  static String dayKey(DateTime d) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${d.year}-${two(d.month)}-${two(d.day)}';
  }

  static DateTime? parse(String key) {
    final parts = key.split('-').map(int.tryParse).toList();
    if (parts.length != 3 || parts.any((p) => p == null)) return null;
    return DateTime(parts[0]!, parts[1]!, parts[2]!);
  }

  /// Haftanın pazartesisinin anahtarı.
  static String weekKey(DateTime d) {
    final day = DateTime(d.year, d.month, d.day);
    return dayKey(day.subtract(Duration(days: day.weekday - 1)));
  }

  static ({int streak, int freezes, int used}) onPractice({
    required int streak,
    required String lastDayKey,
    required int freezes,
    required DateTime today,
  }) {
    final todayKey = dayKey(today);
    if (lastDayKey == todayKey) {
      return (streak: streak, freezes: freezes, used: 0);
    }
    final last = parse(lastDayKey);
    final day = DateTime(today.year, today.month, today.day);
    var next = 1;
    var left = freezes;
    var used = 0;
    if (last != null && streak > 0) {
      final missed = day.difference(last).inDays - 1;
      if (missed <= 0) {
        next = streak + 1;
      } else if (missed <= freezes) {
        next = streak + 1;
        used = missed;
        left = freezes - missed;
      }
    }
    if (next > 0 && next % 7 == 0) {
      left = (left + 1).clamp(0, UserProfile.maxStreakFreezes);
    }
    return (streak: next, freezes: left, used: used);
  }

  static ({int freezes, String weekKey}) refillForPlus({
    required bool isPlus,
    required int freezes,
    required String lastRefillWeekKey,
    required DateTime today,
  }) {
    final current = weekKey(today);
    if (!isPlus || lastRefillWeekKey == current) {
      return (freezes: freezes, weekKey: lastRefillWeekKey);
    }
    return (freezes: UserProfile.maxStreakFreezes, weekKey: current);
  }
}
