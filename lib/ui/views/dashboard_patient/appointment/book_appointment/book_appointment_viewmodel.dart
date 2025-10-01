import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class BookAppointmentViewModel extends IndexTrackingViewModel {
  final DialogService _dialogService = locator<DialogService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  final PageController pageController = PageController();
  int activeIndex = 0;

  TextEditingController dobCtrl = TextEditingController();

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

  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) {
    _dob = val;
    notifyListeners();
  }

  String? _selectedPlan;
  String? get selectedPlan => _selectedPlan;
  set selectedPlan(String? val) {
    _selectedPlan = val;
    notifyListeners();
  }

  String? _time;
  String? get time => _time;
  set time(String? val) {
    _time = val;
    notifyListeners();
  }

  String? _selectPrice;
  String? get selectPrice => _selectPrice;
  set selectPrice(String? val) {
    _selectPrice = val;
    notifyListeners();
  }

  bool get hasSelectedPlan => _selectedPlan != null;

  bool get hasSelectedPrice => _selectPrice != null;

  Future initiatePayment() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _patientRemoteDataSource.initiate();

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        log('Stripe: ${r['data']['stripe_key']}');
        Stripe.instance.applySettings();
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
}
