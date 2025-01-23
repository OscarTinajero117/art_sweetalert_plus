import 'package:flutter/material.dart';

import '../models/art_dialog_args.dart';
import 'art_dialog.dart';

class ArtSweetAlertPlus {
  static show({
    required BuildContext context,
    required ArtDialogArgs artDialogArgs,
    bool barrierDismissible = true,
    bool? canPop,
    GlobalKey? artDialogKey,
  }) {
    final cnP = canPop ?? barrierDismissible;
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return PopScope(
          canPop: cnP,
          child: ArtDialog(
            key: artDialogKey,
            artDialogArgs: artDialogArgs,
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierColor: artDialogArgs.barrierColor,
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return ScaleTransition(
          alignment: Alignment.center,
          scale: CurvedAnimation(
            parent: animation,
            curve: Interval(
              0.00,
              1.0,
              curve: Curves.easeInOutBack,
            ),
          ),
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
            child: child,
          ),
        );
      },
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );
  }
}
