import 'dart:async';

import 'package:assessment/utils/utils.dart';
import 'package:flutter/material.dart';

abstract class IPopupEvent {
  String? title, imagePath, message, buttonText;
  Function? callback;
}

class PopupEvent extends IPopupEvent {
  final String? title, message, buttonText, imagePath;
  final Function? callback;
  PopupEvent(
      {required this.message,
      required this.title,
      this.callback,
      this.buttonText,
      this.imagePath});
}

mixin PopupMixin {
  final StreamController<IPopupEvent> _popupController =
      StreamController<IPopupEvent>.broadcast();
  Stream<IPopupEvent> get popupStream => _popupController.stream;
  Sink<IPopupEvent> get popupSink => _popupController.sink;

  void dispose() {
    _popupController.close();
  }
}

class CustomPopup extends StatelessWidget {
  final String? title, message, buttonText, imagePath;
  final Function? callBack;
  const CustomPopup({
    super.key,
    this.title,
    this.imagePath,
    this.message,
    this.callBack,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        width: width * 0.02,
        height: height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath!,
              width: width * 0.5,
              height: height * 0.1,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.03, bottom: height * 0.012),
              child: Text(
                title!,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                message!,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
      actions: [
        callBack != null
            ? Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.5, height * 0.015)),
                    onPressed: () async {
                      if (await NetworkConnectivity.isConnected()) {
                        await callBack!();
                      }
                    },
                    child: Text(buttonText!)),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
