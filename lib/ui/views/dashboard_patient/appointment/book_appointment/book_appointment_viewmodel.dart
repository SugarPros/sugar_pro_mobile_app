import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class BookAppointmentViewModel extends IndexTrackingViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final PatientService _patientService = locator<PatientService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  final PageController pageController = PageController();
  int activeIndex = 0;

  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController countryCodeCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  List<String> timeList = [
    '12:00 AM',
    '1:00 AM',
    '2:00 AM',
    '3:00 AM',
    '4:00 AM',
    '5:00 AM',
    '6:00 AM',
    '7:00 AM',
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '5:00 PM',
    '7:00 PM',
    '8:00 PM',
    '9:00 PM',
    '10:00 PM',
    '11:00 PM',
  ];

  List<String> insurencePlanList = ['HMO', 'PPO', 'Medicare', 'Medicaid', 'Other'];

  String? _insurancePlan;
  String? get insurancePlan => _insurancePlan;
  set insurancePlan(String? val) {
    _insurancePlan = val;
    notifyListeners();
  }

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) {
    _date = val;
    notifyListeners();
  }

  String? _selectedPlan;
  String? get selectedPlan => _selectedPlan;
  set selectedPlan(String? val) {
    _selectedPlan = val;
    notifyListeners();
  }

  String? _selectedTime;
  String? get selectedTime => _selectedTime;
  set selectedTime(String? val) {
    _selectedTime = val;
    notifyListeners();
  }

  String _billingCycle = 'monthly';
  String get billingCycle => _billingCycle;
  set billingCycle(String val) {
    _billingCycle = val;
    notifyListeners();
  }

  String? _selectPrice;
  String? get selectPrice => _selectPrice;
  set selectPrice(String? val) {
    _selectPrice = val;
    notifyListeners();
  }

  String? _stripeToken;
  String? get stripeToken => _stripeToken;
  set stripeToken(String? val) {
    _stripeToken = val;
    notifyListeners();
  }

  bool get hasSelectedPlan => _selectedPlan != null;

  bool get hasSelectedPrice => _selectPrice != null;

  Future fetchPatientAppointments() async {
    final data = await _patientRemoteDataSource.patAppointments();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.patientAppointments = r.patAppointments;
      },
    );
  }

  Future initiatePayment() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _patientRemoteDataSource.initiate(
      date: dateCtrl.text,
      time: selectedTime?.stripAmPm(),
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        log('Stripe: ${r['data']['stripe_key']}');
        stripeToken = r['data']['stripe_key'];
        completePayment();
      },
    );
  }

  Future completePayment() async {
    final data = await _patientRemoteDataSource.complete(
      fullname: fullNameCtrl.text,
      email: emailCtrl.text,
      phone: phoneCtrl.text,
      address: addressCtrl.text,
      countryCode: countryCodeCtrl.text,
      date: dateCtrl.text,
      time: selectedTime?.stripAmPm(),
      stripeToken: stripeToken,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        await Future.wait([fetchPatientAppointments()]);
        _dialogService.completeDialog(DialogResponse());
        _navigationService.back();
        _navigationService.back();
        flusher('Payment completed successfully', color: Colors.green);
      },
    );
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
  List<ListenableServiceMixin> get listenableServices => [_patientService];
}
