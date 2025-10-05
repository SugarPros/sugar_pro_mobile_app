import 'package:image_picker/image_picker.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class SelfPaymentViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController signDateCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();

  File? _signatureFile;
  File? get signatureFile => _signatureFile;
  set signatureFile(File? val) {
    _signatureFile = val;
    notifyListeners();
  }
  
  DateTime? _signDate;
  DateTime? get signDate => _signDate;
  set signDate(DateTime? val) {
    _signDate = val;
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

  void navigateToDashboard() {
    _navigationService.navigateTo(Routes.patientDashboard);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
