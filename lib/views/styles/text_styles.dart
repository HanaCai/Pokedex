import 'package:untitled/untitled.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextTheme get textTheme => TextTheme(
        headline1: _headline,
        headline2: _headline.copyWith(fontSize: 30),
        headline3: _headline.copyWith(fontSize: 28),
        headline4: _headline.copyWith(fontSize: 24),
        headline5: _headline.copyWith(fontSize: 18),
        headline6: _headline.copyWith(fontSize: 16),
        subtitle2: _subtitle,
        subtitle1: _subtitle.copyWith(fontSize: 16),
        bodyText1: _bodyText,
        bodyText2: _bodyText.copyWith(fontSize: 14),
        // caption: myCaption,
        // button: myButton,
      );

  ///Font Size 32
  static TextStyle get headline1 => AppTheme.theme.textTheme.headline1!;

  ///Font Size 30
  static TextStyle get headline2 => AppTheme.theme.textTheme.headline2!;

  ///Font Size 28
  static TextStyle get headline3 => AppTheme.theme.textTheme.headline3!;

  ///Font Size 24
  static TextStyle get headline4 => AppTheme.theme.textTheme.headline4!;

  ///Font Size 18
  static TextStyle get headline5 => AppTheme.theme.textTheme.headline5!;

  ///Font Size 16
  static TextStyle get headline6 => AppTheme.theme.textTheme.headline6!;

  ///Font Size 16
  static TextStyle get headline7 =>
      AppTheme.theme.textTheme.headline6!.copyWith(fontSize: 14);

  ///Font Size 18
  static TextStyle get subtitle1 => AppTheme.theme.textTheme.subtitle1!;

  ///Font Size 16
  static TextStyle get subtitle2 => AppTheme.theme.textTheme.subtitle2!;

  ///Font Size 14
  static TextStyle get subtitle3 =>
      AppTheme.theme.textTheme.subtitle2!.copyWith(fontSize: 14);

  ///Font Size 16
  static TextStyle get bodyText1 => AppTheme.theme.textTheme.bodyText1!;

  ///Font Size 14
  static TextStyle get bodyText2 => AppTheme.theme.textTheme.bodyText2!;

  ///Font Size 12
  static TextStyle get bodyText3 =>
      AppTheme.theme.textTheme.bodyText2!.copyWith(fontSize: 12);

  static TextStyle get caption => AppTheme.theme.textTheme.caption!;

  static TextStyle get button => AppTheme.theme.textTheme.button!;

  static final TextStyle _headline = TextStyle(
    fontSize: 32,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.interBold,
    fontStyle: FontStyle.normal,
  );

  static final TextStyle _subtitle = TextStyle(
    fontSize: 18,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.interSemiBold,
    fontStyle: FontStyle.normal,
  );

  static final TextStyle _bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.interMedium,
    fontStyle: FontStyle.normal,
  );
}
