import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientSettingsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService _authService = locator<AuthService>();

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  PatAuthResponse? get patient => _authService.patAuthResponse;

  Future sendOtp() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.sendOtp(patient?.patUser?.email);

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        navigateToChangePassword();
      },
    );
  }

  Future sendEmailOtp() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.sendEmailOtp(patient?.patUser?.email);

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        navigateToChangeEmail();
      },
    );
  }

  void navigateToChangePassword() {
    _navigationService.navigateTo(Routes.changePassword);
  }

  void navigateToChangeEmail() {
    _navigationService.navigateTo(Routes.changeEmail);
  }
}
