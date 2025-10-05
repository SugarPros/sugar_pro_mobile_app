import 'package:image_picker/image_picker.dart';
import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class BasicDetailsViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService _authService = locator<AuthService>();

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  final PageController pageController = PageController();
  int activeIndex = 0;

  final Map<String, String> genderList = {"Male": "male", "Female": "female", "Other": "other"};

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController middleNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController streetCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController zipCodeCtrl = TextEditingController();
  TextEditingController medicareNumberCtrl = TextEditingController();
  TextEditingController groupNumberCtrl = TextEditingController();
  TextEditingController ssnCtrl = TextEditingController();

  String? _selectedGender;
  String? get selectedGender => _selectedGender;
  set selectedGender(String? val) {
    _selectedGender = val;
    notifyListeners();
  }

  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) {
    _dob = val;
    notifyListeners();
  }

  String? _selectedNotification;
  String? get selectedNotification => _selectedNotification;
  set selectedNotification(String? val) {
    _selectedNotification = val;
    notifyListeners();
  }

   bool get hasSelectedNotification => _selectedNotification != null;

  File? _licenseFile;
  File? get licenseFile => _licenseFile;
  set licenseFile(File? val) {
    _licenseFile = val;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool val) {
    _obscurePassword = val;
    notifyListeners();
  }

  bool _obscureConfirmPassword = true;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  set obscureConfirmPassword(bool val) {
    _obscureConfirmPassword = val;
    notifyListeners();
  }

  String? _otp;
  String? get otp => _otp;
  set otp(String? val) {
    _otp = val;
    notifyListeners();
  }

  bool isAgree = false;
  void toggleAggrement() {
    isAgree = !isAgree;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();
  Future uploadLicense(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      licenseFile = file;
    }
    notifyListeners();
  }

  Future fetchPatientBasicDetails() async {
    setBusy(true);
    final data = await _authRemoteDataSource.getPatBasicDetails();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patBasicData = r.data;
      },
    );
  }

  Future basicDetails() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.patBasicDetails(
      fname: firstNameCtrl.text,
      mname: middleNameCtrl.text,
      lname: lastNameCtrl.text,
      dob: dobCtrl.text,
      gender: selectedGender,
      email: emailCtrl.text,
      phone: phoneCtrl.text,
      street: streetCtrl.text,
      city: cityCtrl.text,
      state: stateCtrl.text,
      zipCode: zipCodeCtrl.text,
      medicareNumber: medicareNumberCtrl.text,
      groupNumber: groupNumberCtrl.text,
      license: licenseFile,
      ssn: ssnCtrl.text,
      notificationType: selectedNotification,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        await Future.wait([fetchPatientBasicDetails()]);
        flusher('Your details have been added successfully!', color: Colors.green);
        _navigationService.clearStackAndShow(Routes.privacyFrom);
      },
    );
  }

  void navigateToPatientLogin() {
    _navigationService.navigateTo(Routes.patientLogin);
  }

  void cancel() {
    _navigationService.clearStackAndShow(Routes.patientLogin);
  }

  void forward() {
    pageController.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
  }

  void backward() {
    pageController.previousPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
  }

  void jumpTo(int val) {
    pageController.jumpToPage(val);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
