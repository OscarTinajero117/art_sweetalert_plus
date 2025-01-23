# Art SweetAlert Plus

Based in [art_sweetalert](https://pub.dev/packages/art_sweetalert)

A beautiful, responsive, customizable, accessible replacement, easy use for flutter popup boxes. Both supported ios and android.

![Example message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/example.gif)

## A success message

![Success message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/success-message.gif)

```dart
ArtSweetAlertPlus.show(
  context: context,
  artDialogArgs: ArtDialogArgs(
    type: ArtSweetAlertPlusType.success,
    title: "A success message!",
    text: "Show a success message with an icon"
  )
);
```

## A message with title and text

![Question message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/question-message.gif)

```dart
ArtSweetAlertPlus.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertPlusType.question,
        title: "A question?",
        text: "Show a question message with an icon"
    )
);
```

## An error message

![Error message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/error-message.gif)

```dart
ArtSweetAlertPlus.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertPlusType.danger,
        title: "Oops...",
        text: "There is a problem :("
    )
);

```

## A dialog with three buttons

![Dialog message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/dialog-message.gif)

```dart
ArtDialogResponse response = await ArtSweetAlertPlus.show(
  barrierDismissible: false,
  context: context,
  artDialogArgs: ArtDialogArgs(
    showCancelBtn: true,
    denyButtonText: "Don't save",
    title: "Do you want to save the changes?",
    confirmButtonText: "Save",
  )
);

if(response==null) {
  return;
}

if(response.isTapConfirmButton) {
  ArtSweetAlertPlus.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertPlusType.success,
      title: "Saved!"
    )
  );
  return;
}

if(response.isTapDenyButton) {
  ArtSweetAlertPlus.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
      type: ArtSweetAlertPlusType.info,
      title: "Changes are not saved!"
    )
  );
  return;
}

```

## A confirm dialog

![Confirm message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/confirm-message.gif)

```dart
ArtDialogResponse response = await ArtSweetAlertPlus.show(
  barrierDismissible: false,
  context: context,
  artDialogArgs: ArtDialogArgs(
    denyButtonText: "Cancel",
    title: "Are you sure?",
    text: "You won't be able to revert this!",
    confirmButtonText: "Yes, delete it",
    type: ArtSweetAlertPlusType.warning
  )
);

if(response==null) {
  return;
}

if(response.isTapConfirmButton) {
  ArtSweetAlertPlus.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertPlusType.success,
          title: "Deleted!"
      )
  );
  return;
}

```

## A message with a custom image

![Image message](https://github.com/OscarTinajero117/art_sweetalert_plus/raw/main/images/image-message.gif)

```dart


ArtSweetAlertPlus.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
        title: "Sweet!",
        text: "Modal with a custom image.",
        customColumns: [
          Container(
            margin: EdgeInsets.only(
                bottom: 12.0
            ),
            child: Image.network(
              "https://unsplash.it/400/200",
            ),

          )
        ]
    )
);


```

## Submit your Github username

```dart
ArtDialogResponse response = await ArtSweetAlertPlus.show(
    artDialogKey: _artDialogKey,
    context: context,
    artDialogArgs: ArtDialogArgs(
        title: "Submit your Github username!",
        customColumns: [
            Container(
                margin: EdgeInsets.only( bottom: 20.0 ),
                child: CupertinoTextField(
                    controller: _textController,
                ),
            )
        ],
        onConfirm: () async  {
            _artDialogKey.currentState.showLoader();
            var response = await http.get(Uri.parse('https://api.github.com/users/'+_textController.text));
            if(response.statusCode!=200) {
                _artDialogKey.currentState.hideLoader();
                _artDialogKey.currentState.showErrors(["Request failed: Error"]);
                return;
            }
            var body = response.body;
            var bodyJson = json.decode(body);
            _artDialogKey.currentState.hideLoader();
            _artDialogKey.currentState.closeDialog( data: { "image": bodyJson["avatar_url"] } );
        },
        onDispose: () {
            _artDialogKey = GlobalKey<ArtDialogState>();
        },
    )
);

if (response == null) { return; }

if (response.isTapConfirmButton) {
    ArtSweetAlertPlus.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            customColumns: [
                Container(
                    margin: EdgeInsets.only(bottom: 12.0),
                    child: Image.network( response.data["image"]),
                )
            ]
        )
    );
    return;
}


```
