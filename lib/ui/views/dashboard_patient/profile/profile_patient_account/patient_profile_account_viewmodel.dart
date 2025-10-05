import 'package:image_picker/image_picker.dart';
import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/patient_account_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientProfileAccountViewModel extends ReactiveViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  PatientAccountResponse? get patientAccountDetails => _authService.patAccountDetails;
  AccountDetail? get accountDetail => _authService.accountDetail?.first;

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController middleNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController emergencyNameCtrl = TextEditingController();
  TextEditingController emergencyRelationshipCtrl = TextEditingController();
  TextEditingController emergencyPhoneCtrl = TextEditingController();
  TextEditingController insuranceProviderCtrl = TextEditingController();
  TextEditingController planNumberCtrl = TextEditingController();
  TextEditingController groupNumberCtrl = TextEditingController();
  TextEditingController ssnCtrl = TextEditingController();
  TextEditingController streetCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController zipCodeCtrl = TextEditingController();
  File? license;

  final Map<String, String> genderList = {"Male": "male", "Female": "female", "Other": "other"};

  final Map<String, String> notificationList = {"Email": "email", "SMS": "sms", "App": "app"};

  final ImagePicker _picker = ImagePicker();

  Future setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      firstNameCtrl.text = accountDetail?.fname ?? '';
      lastNameCtrl.text = accountDetail?.lname ?? '';
      middleNameCtrl.text = accountDetail?.mname ?? '';
      phoneCtrl.text = accountDetail?.phone ?? '';
      dobCtrl.text = accountDetail?.dob ?? '';
      emergencyNameCtrl.text = accountDetail?.emmergencyName ?? '';
      emergencyPhoneCtrl.text = accountDetail?.emmergencyPhone ?? '';
      emergencyRelationshipCtrl.text = accountDetail?.emmergencyRelationship ?? '';
      streetCtrl.text = patientAccountDetails?.streets.first ?? '';
      stateCtrl.text = patientAccountDetails?.states.first ?? '';
      cityCtrl.text = patientAccountDetails?.cities.first ?? '';
      zipCodeCtrl.text = patientAccountDetails?.zipCodes.first ?? '';
      insuranceProviderCtrl.text = accountDetail?.insuranceProvider ?? '';
      planNumberCtrl.text = accountDetail?.insurancePlanNumber ?? '';
      groupNumberCtrl.text = accountDetail?.groupNumber ?? '';
      ssnCtrl.text = accountDetail?.ssn ?? '';
      selectedNotification = accountDetail?.notificationType.toLowerCase();
      selectedGender = accountDetail?.gender.toLowerCase();
      licensePic = accountDetail?.license;
      profilePic = patientAccountDetails?.profilePicture;
    });
  }

  String? _licensePic;
  String? get licensePic => _licensePic;
  set licensePic(String? val) {
    _licensePic = val;
    notifyListeners();
  }

  String? _profilePic;
  String? get profilePic => _profilePic;
  set profilePic(String? val) {
    _profilePic = val;
    notifyListeners();
  }

  String? _selectedGender;
  String? get selectedGender => _selectedGender;
  set selectedGender(String? val) {
    _selectedGender = val;
    notifyListeners();
  }

  String? _selectedNotification;
  String? get selectedNotification => _selectedNotification;
  set selectedNotification(String? val) {
    _selectedNotification = val;
    notifyListeners();
  }

  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) {
    _dob = val;
    notifyListeners();
  }

  Future uploadLicense(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      license = file;
    }
    notifyListeners();
  }

  Future getPatientAccount() async {
    final data = await _authRemoteDataSource.getPatientAccount();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patAccountDetails = r;
        _authService.accountDetail = r.accountDetails;
        notifyListeners();
      },
    );
  }

  Future updatePatientInfo() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.updatePaientDetails(
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      middlename: middleNameCtrl.text,
      phone: phoneCtrl.text,
      dob: dobCtrl.text,
      gender: selectedGender,
      emergencyName: emergencyNameCtrl.text,
      emergencyPhone: emergencyPhoneCtrl.text,
      emergencyRelationship: emergencyRelationshipCtrl.text,
      street: streetCtrl.text,
      city: cityCtrl.text,
      zipCode: zipCodeCtrl.text,
      state: stateCtrl.text,
      insuranceProvider: insuranceProviderCtrl.text,
      insurancePlanNumber: planNumberCtrl.text,
      insuranceGroupNumber: groupNumberCtrl.text,
      licenseFile: licensePic ?? license?.path,
      ssn: ssnCtrl.text,
      notificationType: 'app' //selectedNotification?.toLowerCase(),
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        await Future.wait([getPatientAccount()]);
        _navigationService.back();
        flusher('Account details updated successfully', color: Colors.green);
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
