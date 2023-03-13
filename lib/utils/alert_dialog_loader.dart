import 'package:untitled/untitled.dart';
import 'package:untitled/views/widgets/background_blur_widget.dart';

class AlertDialogLoader{
  AlertDialogLoader._();

  static load({required Widget dialog,}){
    final context = AppKey.navigation.currentContext as BuildContext;
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            appBar: AppAppBarStyles.transparent,
            backgroundColor: Colors.black26,
            body: BackgroundBlurWidget(
              child: Container(
                height: AppSize.height,
                width: AppSize.width,
                alignment: Alignment.center,
                child: dialog,
              ),
            ),
          );
        },
      ),
    );
  }



}




