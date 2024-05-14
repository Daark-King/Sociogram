import 'package:flutter/foundation.dart' show immutable;
import 'package:sociogram/views/components/constants/string.dart';
import 'package:sociogram/views/components/dialogs/alert_dialog_model.dart';

@immutable
class DeleteDialog extends AlertDialogModel<bool> {
  const DeleteDialog({
    required String titleOfObjectToDelete,
  }) : super(
            title: '${Strings.delete} $titleOfObjectToDelete?',
            message:
                '${Strings.areYouSureYouWantToDeleteThis} $titleOfObjectToDelete?',
            buttons: const {
              'Cancel': false,
              'Delete': true,
            });
}
