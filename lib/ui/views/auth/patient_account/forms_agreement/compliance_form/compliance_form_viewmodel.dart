import 'package:image_picker/image_picker.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ComplianceFormViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController dobCtrl = TextEditingController();
  TextEditingController repDobCtrl = TextEditingController();
  TextEditingController natureWithPatientCtrl = TextEditingController();
  TextEditingController patientNameCtrl = TextEditingController();
  
  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) {
    _dob = val;
    notifyListeners();
  }

  DateTime? _repDob;
  DateTime? get repDob => _repDob;
  set repDob(DateTime? val) {
    _repDob = val;
    notifyListeners();
  }

  File? _signatureFile;
  File? get signatureFile => _signatureFile;
  set signatureFile(File? val) {
    _signatureFile = val;
    notifyListeners();
  }

  File? _repSignatureFile;
  File? get repSignatureFile => _repSignatureFile;
  set repSignatureFile(File? val) {
    _repSignatureFile = val;
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

  Future uploadRepSignature(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      repSignatureFile = file;
    }
    notifyListeners();
  }

  void navigateToPatentForm() {
    _navigationService.navigateTo(Routes.patentAgreementForm);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
