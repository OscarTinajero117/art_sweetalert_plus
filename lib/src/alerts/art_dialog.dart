import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/art_button.dart';
import '../libraries/icons_library.dart';
import '../libraries/models_library.dart';
import 'art_error.dart';
import 'enum/art_sweet_alert_type.dart';

/// A customizable dialog widget that can display different types of dialogs
/// with various components, including icons, titles, text, and buttons.
///
/// The [ArtDialog] widget uses [ArtDialogArgs] to pass configuration parameters
/// for customizing its appearance and behavior.
///
/// ### Parameters:
/// - [artDialogArgs]: The configuration arguments that define the dialog's appearance and behavior.
class ArtDialog extends StatefulWidget {
  final ArtDialogArgs artDialogArgs;

  const ArtDialog({super.key, required this.artDialogArgs});

  @override
  ArtDialogState createState() => ArtDialogState();
}

class ArtDialogState extends State<ArtDialog> {
  List<Widget> _customColumns = <Widget>[];

  final ArtDialogResponse _artDialogResponse = ArtDialogResponse();

  bool _isShowButtons = true;

  late ArtDialogArgs _artDialogArgs;

  Widget? _icon;
  Widget? _title;
  Widget? _text;
  Widget? _confirmButton;
  Widget? _denyButton;
  Widget? _cancelButton;

  List<Widget> _errors = <Widget>[];

  /// Retrieves the appropriate icon for the dialog based on its type.
  Widget getIcon() {
    if (_icon != null) {
      return _icon!;
    }

    Widget icon = SizedBox.shrink(); // Default icon if none is set.
    bool hasIcon =
        _artDialogArgs.type != null; // Check if the dialog has a type.
    if (hasIcon) {
      switch (_artDialogArgs.type!) {
        case ArtSweetAlertPlusType.success:
          icon = SuccessIcon(size: _artDialogArgs.sizeSuccessIcon);
          break;
        case ArtSweetAlertPlusType.question:
          icon = QuestionIcon(size: _artDialogArgs.sizeQuestionIcon);
          break;
        case ArtSweetAlertPlusType.danger:
          icon = ErrorIcon(size: _artDialogArgs.sizeErrorIcon);
          break;
        case ArtSweetAlertPlusType.info:
          icon = InfoIcon(size: _artDialogArgs.sizeInfoIcon);
          break;
        case ArtSweetAlertPlusType.warning:
          icon = WarningIcon(size: _artDialogArgs.sizeWarningIcon);
          break;
      }
    }

    icon = Container(
      margin: EdgeInsets.only(
          bottom: hasIcon ? 12.0 : 0.0), // Margin below icon if it exists.
      child: icon,
    );
    _icon = icon;
    return icon;
  }

  /// Retrieves the title widget for the dialog.
  Widget getTitle() {
    if (_title != null) {
      return _title!;
    }

    Widget text = SizedBox.shrink(); // Default empty widget if no title is set.

    if (_artDialogArgs.title != null) {
      text = Text(
        _artDialogArgs.title!,
        textAlign: _artDialogArgs.titleAlign,
        style: TextStyle(
            color: _artDialogArgs.titleColor,
            fontSize: _artDialogArgs.getTitleSize),
      );
    }

    text = Container(
      margin: EdgeInsets.only(bottom: 12.0), // Margin below the title.
      child: text,
    );

    _title = text;

    return text;
  }

  /// Retrieves the text content widget for the dialog.
  Widget getText() {
    if (_text != null) {
      return _text!;
    }
    Widget text = SizedBox.shrink(); // Default empty widget if no text is set.
    bool hasText = _artDialogArgs.text != null;
    if (hasText) {
      text = Text(
        _artDialogArgs.text!,
        textAlign: _artDialogArgs.textAlign,
        style: TextStyle(
          color: _artDialogArgs.textColor,
          fontSize: _artDialogArgs.getTextSize,
        ),
      );
    }

    text = Container(
      margin: EdgeInsets.only(bottom: hasText ? 12.0 : 0.0),
      child: text,
    );
    _text = text;
    return text;
  }

  /// Retrieves the confirm button widget for the dialog.
  Widget getConfirmButton() {
    if (_confirmButton != null) {
      return _confirmButton!;
    }

    _confirmButton = ArtButton(
      btnText: _artDialogArgs.confirmButtonText,
      bgColor: _artDialogArgs.confirmButtonColor,
      onTab: () {
        _artDialogResponse.isTapConfirmButton = true;

        if (_artDialogArgs.onConfirm != null) {
          _artDialogArgs.onConfirm!();
          return;
        }

        Navigator.pop(context, _artDialogResponse);
      },
    );

    return _confirmButton!;
  }

  /// Retrieves the deny button widget for the dialog.
  Widget getDenyButton() {
    if (_denyButton != null) {
      return _denyButton!;
    }

    _denyButton = Container(
      margin: EdgeInsets.only(left: 8.0),
      child: ArtButton(
          btnText: _artDialogArgs.denyButtonText!,
          bgColor: _artDialogArgs.denyButtonColor,
          onTab: () {
            if (_artDialogArgs.onDeny == null) {
              _artDialogResponse.isTapDenyButton = true;
              Navigator.pop(context, _artDialogResponse);
              return;
            }

            _artDialogArgs.onDeny!();
          }),
    );

    return _denyButton!;
  }

  /// Retrieves the cancel button widget for the dialog.
  Widget getCancelButton() {
    if (_cancelButton != null) {
      return _cancelButton!;
    }

    _cancelButton = Container(
      margin: EdgeInsets.only(left: 8.0),
      child: ArtButton(
          bgColor: _artDialogArgs.cancelButtonColor,
          btnText: _artDialogArgs.cancelButtonText,
          onTab: () {
            if (_artDialogArgs.onCancel == null) {
              _artDialogResponse.isTapCancelButton = true;
              Navigator.pop(context, _artDialogResponse);
              return;
            }

            _artDialogArgs.onCancel!();
          }),
    );

    return _cancelButton!;
  }

  /// Initializes custom columns for the dialog, if any are provided in [artDialogArgs].
  void _initCustomColumns() {
    _customColumns = [];

    if (_artDialogArgs.customColumns != null) {
      for (var element in _artDialogArgs.customColumns!) {
        _customColumns.add(element);
      }
    }
  }

  /// Displays a loader by hiding the buttons and showing an activity indicator.
  void showLoader() {
    setState(() {
      _isShowButtons = false;
    });
  }

  /// Hides the loader and shows the buttons again.
  void hideLoader() {
    setState(() {
      _isShowButtons = true;
    });
  }

  /// Displays errors in the dialog.
  void showErrors(List<String> errors) {
    _errors = <Widget>[];
    for (var element in errors) {
      _errors.add(ArtError(title: element));
    }
    setState(() {});
  }

  /// Closes the dialog, optionally passing additional data.
  void closeDialog({Map<String, dynamic>? data}) {
    if (data != null) {
      _artDialogResponse.data = data;
    }

    Navigator.pop(context, _artDialogResponse);
  }

  @override
  void initState() {
    _artDialogArgs = widget.artDialogArgs;
    _initCustomColumns();
    super.initState();
  }

  @override
  void dispose() {
    if (_artDialogArgs.onDispose != null) {
      _artDialogArgs.onDispose!();
    }
    super.dispose();
  }

  /// Builds the dialog widget tree.
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: _artDialogArgs.dialogElevation,
      child: SingleChildScrollView(
        child: Container(
          padding: _artDialogArgs.dialogPadding,
          decoration: _artDialogArgs.getDialogDecoration(),
          child: Column(
            mainAxisSize: _artDialogArgs.dialogMainAxisSize,
            children: [
              getIcon(),
              getTitle(),
              getText(),
              ..._customColumns, // Add any custom columns here.
              if (_errors.isNotEmpty) ...[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [..._errors],
                  ),
                )
              ],
              // Show buttons or activity indicator depending on state.
              Visibility(
                visible: _isShowButtons,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getConfirmButton(),
                    if (_artDialogArgs.denyButtonText != null) ...[
                      getDenyButton()
                    ],
                    if (_artDialogArgs.showCancelBtn) ...[getCancelButton()]
                  ],
                ),
              ),
              Visibility(
                visible: !_isShowButtons,
                child: CupertinoActivityIndicator(animating: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
