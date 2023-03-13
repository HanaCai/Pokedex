import 'package:untitled/untitled.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
        textTheme: AppTextStyles.textTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.yellow,
          selectionColor: AppColors.yellow.withOpacity(0.2),
          selectionHandleColor: AppColors.yellow.withOpacity(0.8),
        ),
        primaryColor: AppColors.yellow,
      );
}
