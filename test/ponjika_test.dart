import 'package:flutter_test/flutter_test.dart';
import 'package:ponjika/ponjika.dart';

void main() {
  test('Ponjika returns correct formatted string', () {
    final result = Ponjika.format(
      date: DateTime(2025, 4, 17),
      format: "DD MM, YY (WW) - SS",
      showSeason: true,
      showWeekDays: true,
    );

    // Output for April 17, 2025 should be ৩ বৈশাখ, ১৪৩২ (বৃহস্পতিবার) - গ্রীষ্ম
    expect(result, contains('বৈশাখ'));
    expect(result, contains('১৪৩২'));
    expect(result, contains('বৃহস্পতিবার'));
    expect(result, contains('গ্রীষ্ম'));
  });
}
