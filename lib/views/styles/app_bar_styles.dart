import 'package:untitled/untitled.dart';


class AppAppBarStyles {
   AppAppBarStyles._();
   static AppBar get normal => AppBar(
      toolbarHeight: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.whiteDeep,
      systemOverlayStyle:   SystemUiOverlayStyle(
         statusBarColor: AppColors.whiteDeep,
         systemNavigationBarColor: AppColors.whiteDeep,
         systemNavigationBarDividerColor: AppColors.whiteDeep,
         systemNavigationBarIconBrightness: Brightness.dark,
         statusBarIconBrightness: Brightness.dark,
         statusBarBrightness: Brightness.dark,
      ),
   );
   static AppBar get white => AppBar(
      toolbarHeight: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      systemOverlayStyle:   SystemUiOverlayStyle(
         statusBarColor: AppColors.white,
         systemNavigationBarColor: AppColors.white,
         systemNavigationBarDividerColor: AppColors.white,
         systemNavigationBarIconBrightness: Brightness.dark,
         statusBarIconBrightness: Brightness.dark,
         statusBarBrightness: Brightness.dark,
      ),
   );
   static AppBar get black => AppBar(
      toolbarHeight: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.custom('27262F'),
      systemOverlayStyle:   SystemUiOverlayStyle(
         statusBarColor: AppColors.custom('27262F'),
         systemNavigationBarColor: AppColors.custom('27262F'),
         systemNavigationBarDividerColor: AppColors.custom('27262F'),
         systemNavigationBarIconBrightness: Brightness.dark,
         statusBarIconBrightness: Brightness.dark,
         statusBarBrightness: Brightness.dark,
      ),
   );
   static AppBar get transparent => AppBar(

      toolbarHeight: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      systemOverlayStyle:   const SystemUiOverlayStyle(
         statusBarColor: Colors.transparent,
         systemNavigationBarColor:Colors.transparent,
         systemNavigationBarDividerColor: Colors.transparent,
         systemNavigationBarIconBrightness: Brightness.dark,
         statusBarIconBrightness: Brightness.dark,
         statusBarBrightness: Brightness.dark,
      ),
   );

}

