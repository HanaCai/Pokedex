import 'package:get/get.dart';
import 'package:untitled/untitled.dart';
import 'package:untitled/views/screens/splash/splash_screen.dart';

import 'utils/initializer.dart';


void main() {
  Initializer.initialize();
 runApp(const Untitled());
}

class Untitled extends StatelessWidget {
  const Untitled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) {
        return GetMaterialApp(
          title: 'Pokedex',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppKey.navigation,
          theme: ThemeData(),
          home: widget,
        );
      },
      child:const SplashScreen(),
    );
  }
}
    
