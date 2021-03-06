import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:intl/intl.dart';


class Utilities {
  static DateFormat _timeFormat = DateFormat("hh:mm a");
  static DateFormat _dateFormat = DateFormat("MMM dd");

  static Future<bool> isInternetWorking() async {
    bool condition1 = false;
    bool condition2 = false;

    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        condition1 = true;
      }
    } on SocketException catch (_) {
      condition1 = false;
      // showInToast(MessagePrompts.NO_INTERNET);
    }

    //----------------------------------------------------------------------//

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        condition2 = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        condition2 = true;
      } else
        condition2 = false;
    } on SocketException {
      //showInToast(MessagePrompts.NO_INTERNET);
      condition2 = false;
    }

    return condition1 & condition2;
  }


  static String formatTime(DateTime time){
    return _timeFormat.format(time);
  }
   static String formatDate(DateTime date){
    return _dateFormat.format(date);
  }
  static void showInToast(String message,
      {ToastType toastType, int toastPos = 2}) {
    FlutterFlexibleToast.cancel();
    FlutterFlexibleToast.showToast(
        message: " " + message,
        toastLength: Toast.LENGTH_SHORT,
        toastGravity: toastPos == 2
            ? ToastGravity.BOTTOM
            : toastPos == 1
                ? ToastGravity.CENTER
                : ToastGravity.TOP,
        icon: toastType == null
            ? null
            : toastType == ToastType.ERROR
                ? ICON.ERROR
                : toastType == ToastType.INFO
                    ? ICON.INFO
                    : ICON.SUCCESS,
        radius: 12,
        elevation: 10,
        imageSize: 35,
        textColor: Colors.white,
        fontSize: 14,
        backgroundColor: toastType == null
            ? Colors.black
            : toastType == ToastType.ERROR
                ? Colors.red
                : toastType == ToastType.INFO
                    ? Colors.blue
                    : Colors.green,
        timeInSeconds: 2);
  }

  static showPlatformSpecificAlert(
      {@required String title,
      @required String body,
      @required context,
      Function onDismiss,
      DialogAction addionalAction,
      Widget additional,
      bool canclose = true,
      bool dismissable}) async {
    return await showDialog(
      context: context,
      barrierDismissible: dismissable == null ? false : dismissable,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(
                  title,
                  textAlign: TextAlign.left,
                ),
                content: Text(body),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: additional != null
                        ? additional
                        : canclose
                            ? Text('Close')
                            : null,
                    onPressed: () {
                      if (onDismiss != null) {
                        onDismiss();
                      }
                      if (canclose) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  if (addionalAction != null)
                    CupertinoDialogAction(
                      child: Text(addionalAction.label),
                      onPressed: addionalAction.onPressed,
                    )
                ],
              )
            : AlertDialog(
                title: new Text(
                  title,
                  textAlign: TextAlign.left,
                ),
                content: Text(body),
                actions: <Widget>[
                  TextButton(
                    child: additional != null
                        ? additional
                        : canclose
                            ? Text('Close')
                            : null,
                    onPressed: () {
                      if (onDismiss != null) {
                        onDismiss();
                      }
                      if (canclose) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  if (addionalAction != null)
                    TextButton(
                      child: Text(addionalAction.label),
                      onPressed: addionalAction.onPressed,
                    ),
                ],
              );
      },
    );
  }
}

class DialogAction {
  final Function onPressed;
  final String label;

  DialogAction({@required this.label, @required this.onPressed});
}

enum ToastType { INFO, ERROR, SUCCESS }
