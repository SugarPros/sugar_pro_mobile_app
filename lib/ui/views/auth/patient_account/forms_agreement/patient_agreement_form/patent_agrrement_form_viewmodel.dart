import 'package:image_picker/image_picker.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientAgreementFormViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController signDate = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController relationshipCtrl = TextEditingController();

  File? _signatureFile;
  File? get signatureFile => _signatureFile;
  set signatureFile(File? val) {
    _signatureFile = val;
    notifyListeners();
  }

  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) {
    _dob = val;
    notifyListeners();
  }

  bool isAgree = false;
  void toggleAggrement() {
    isAgree = !isAgree;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  Future uploadSignature(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      signatureFile = file;
    }
    notifyListeners();
  }

  void navigateToSelfPaymentForm() {
    _navigationService.navigateTo(Routes.selfPaymentForm);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
