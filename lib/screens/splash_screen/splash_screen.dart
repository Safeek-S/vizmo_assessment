import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../constants/app_constants.dart';
import '../../app_navigations/navigation_helper.dart';
import '../widgets/popup.dart';
import 'splash_screen_vm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenViewModel vm = SplashScreenViewModel();

  @override
  void initState() {
    super.initState();
    vm.fetchEvents();

    vm.popupStream.listen((event) {
      if (event is PopupEvent) {
        showAdaptiveDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CustomPopup(
                imagePath: event.imagePath,
                title: event.title,
                message: event.message,
                buttonText: event.buttonText,
                callBack: event.callback,
              );
            });
      }
    });

    vm.navigationStream.listen((event) {
      switch (event.navigationType) {
        case NavigationType.push:
          Navigator.pushNamed(context, event.appRoute!.name,
              arguments: event.data);

          break;
        case NavigationType.pop:
          Navigator.pop(context);
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                Color(0xff6200EE),
                Color(0xffEDE5F9),
              ],
            )),
            child: Observer(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Center(
                    child: Text(
                      'Vizmo',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppFonts.extraLargeText,
                          fontWeight: AppFonts.bold),
                    ),
                  ),
                  
                ],
              );
            })));
  }
}
