
import 'package:sugar_pros/core/utils/exports.dart';

extension DialogExtension on DialogService {

  Future<DialogResponse<T>?> showLoaderDialog<T, R>({
    required String title,
    Color? barrierColor,
  }) async{
    return await showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      title: title,
    );
  }
}