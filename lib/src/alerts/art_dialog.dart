import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/art_button.dart';
import '../libraries/icons_library.dart';
import '../libraries/models_library.dart';
import 'art_error.dart';
import 'enum/art_sweet_alert_type.dart';

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

  Widget getIcon() {
    if (_icon != null) {
      return _icon!;
    }

    Widget icon = SizedBox.shrink();
    bool hasIcon = _artDialogArgs.type != null;
    if (hasIcon) {
      switch (_artDialogArgs.type!) {
        case ArtSweetAlertPlusType.success:
          icon = SuccessIcon(
            size: _artDialogArgs.sizeSuccessIcon,
          );
          break;

        case ArtSweetAlertPlusType.question:
          icon = QuestionIcon(
            size: _artDialogArgs.sizeQuestionIcon,
          );
          break;

        case ArtSweetAlertPlusType.danger:
          icon = ErrorIcon(
            size: _artDialogArgs.sizeErrorIcon,
          );
          break;

        case ArtSweetAlertPlusType.info:
          icon = InfoIcon(
            size: _artDialogArgs.sizeInfoIcon,
          );
          break;

        case ArtSweetAlertPlusType.warning:
          icon = WarningIcon(size: _artDialogArgs.sizeWarningIcon);
          break;
      }
    }

    icon = Container(
      margin: EdgeInsets.only(bottom: hasIcon ? 12.0 : 0.0),
      child: icon,
    );
    _icon = icon;
    return icon;
  }

  Widget getTitle() {
    if (_title != null) {
      return _title!;
    }

    Widget text = SizedBox.shrink();

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
      margin: EdgeInsets.only(bottom: 12.0),
      child: text,
    );

    _title = text;

    return text;
  }

  Widget getText() {
    if (_text != null) {
      return _text!;
    }
    Widget text = SizedBox.shrink();
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

  void _initCustomColumns() {
    _customColumns = [];

    if (_artDialogArgs.customColumns != null) {
      for (var element in _artDialogArgs.customColumns!) {
        _customColumns.add(element);
      }
    }
  }

  void showLoader() {
    setState(() {
      _isShowButtons = false;
    });
  }

  void hideLoader() {
    setState(() {
      _isShowButtons = true;
    });
  }

  void showErrors(List<String> errors) {
    _errors = <Widget>[];
    for (var element in errors) {
      _errors.add(ArtError(
        title: element,
      ));
    }
    setState(() {});
  }

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
              ..._customColumns,
              if (_errors.isNotEmpty) ...[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [..._errors]),
                )
              ],
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
                      ])),
              Visibility(
                visible: !_isShowButtons,
                child: CupertinoActivityIndicator(
                  animating: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
