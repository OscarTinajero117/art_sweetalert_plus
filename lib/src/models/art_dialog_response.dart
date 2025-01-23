/// ArtDialogResponse is a model class that contains the response of the dialog.
class ArtDialogResponse {
  /// The title of the dialog
  bool isTapConfirmButton = false;

  /// The text of the dialog
  bool isTapDenyButton = false;

  /// The color of the title
  bool isTapCancelButton = false;

  /// The color of the text
  Map<String, dynamic> data = {};
}
