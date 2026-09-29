import 'package:flutter_test/flutter_test.dart';
import 'package:voxelith/data/models/models.dart';
import 'package:voxelith/state/streak_rules.dart';

void main() {
  final mon = DateTime(2026, 9, 28); // pazartesi
  String key(DateTime d) => StreakRules.dayKey(d);

  test('dün pratik yapıldıysa seri artar, hak harcanmaz', () {
    final r = StreakRules.onPractice(
      streak: 4,
      lastDayKey: key(mon.subtract(const Duration(days: 1))),
      freezes: 1,
      today: mon,
    );
    expect((r.streak, r.freezes, r.used), (5, 1, 0));
  });

  test('aynı gün tekrar pratik seriyi değiştirmez', () {
    final r = StreakRules.onPractice(
      streak: 4,
      lastDayKey: key(mon),
      freezes: 2,
      today: mon,
    );
    expect((r.streak, r.freezes), (4, 2));
  });

  test('kaçırılan günler koruma hakkıyla kapatılır', () {
    final r = StreakRules.onPractice(
      streak: 10,
      lastDayKey: key(mon.subtract(const Duration(days: 3))), // 2 gün kaçtı
      freezes: 2,
      today: mon,
    );
    expect((r.streak, r.freezes, r.used), (11, 0, 2));
  });

  test('hak yetmezse seri 1\'den başlar ve haklar korunur', () {
    final r = StreakRules.onPractice(
      streak: 10,
      lastDayKey: key(mon.subtract(const Duration(days: 4))), // 3 gün kaçtı
      freezes: 2,
      today: mon,
    );
    expect((r.streak, r.freezes, r.used), (1, 2, 0));
  });

  test('7\'nin katı seride bir hak kazanılır, üst sınırı aşmaz', () {
    final y = key(mon.subtract(const Duration(days: 1)));
    expect(
      StreakRules.onPractice(
        streak: 6,
        lastDayKey: y,
        freezes: 0,
        today: mon,
      ).freezes,
      1,
    );
    expect(
      StreakRules.onPractice(
        streak: 13,
        lastDayKey: y,
        freezes: 2,
        today: mon,
      ).freezes,
      UserProfile.maxStreakFreezes,
    );
  });

  test('Plus her hafta bir kez doldurulur, ücretsiz doldurulmaz', () {
    final plus = StreakRules.refillForPlus(
      isPlus: true,
      freezes: 0,
      lastRefillWeekKey: '',
      today: mon.add(const Duration(days: 2)),
    );
    expect(plus.freezes, UserProfile.maxStreakFreezes);
    expect(plus.weekKey, key(mon));
    final again = StreakRules.refillForPlus(
      isPlus: true,
      freezes: 1,
      lastRefillWeekKey: plus.weekKey,
      today: mon.add(const Duration(days: 5)),
    );
    expect(again.freezes, 1);
    final free = StreakRules.refillForPlus(
      isPlus: false,
      freezes: 0,
      lastRefillWeekKey: '',
      today: mon,
    );
    expect(free.freezes, 0);
  });

  test('profil JSON geriye dönük uyumlu', () {
    final p = UserProfile.empty.copyWith(
      streakFreezes: 2,
      freezeRefillWeekKey: '2026-09-28',
    );
    final back = UserProfile.fromJson(p.toJson());
    expect((back.streakFreezes, back.freezeRefillWeekKey), (2, '2026-09-28'));
    final legacy = Map<String, dynamic>.from(UserProfile.empty.toJson())
      ..remove('streakFreezes')
      ..remove('freezeRefillWeekKey');
    expect(UserProfile.fromJson(legacy).streakFreezes, 0);
  });
}
