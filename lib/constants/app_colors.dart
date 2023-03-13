import 'package:untitled/untitled.dart';

class AppColors {
  AppColors._();

  static Color get white => const Color(0xFFFFFFFF);

  static Color get gray => const Color(0xFF666E85);

  static Color get whiteDeep => const Color(0xFFFAFAFA);

  static Color get yellow => const Color(0xFFFDC620);

  static Color get black => const Color(0xFF1B1A1F);

  static Color custom(String code) {
    final color = code.replaceAll('#', '');
    return Color(int.parse('0xFF$color'));
  }

  // static Color get random {
  //   return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  // }
  static Color get random {
    int vale = 0xFF4CCFB6;
    final colors = [
      const Color(0xFF4CCFB6),
      const Color(0xFFF56E6A),
      const Color(0xFFF9D776),
      const Color(0xFF72C1F9),
      const Color(0xFF7683F9),
      const Color(0xFFF9AD76),

    ];

    return colors[Random().nextInt(5)];
  }
}
