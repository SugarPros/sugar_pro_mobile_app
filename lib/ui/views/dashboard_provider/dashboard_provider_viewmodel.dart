
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderDashboardViewModel extends IndexTrackingViewModel {
  final UtilityService _utilityService = locator<UtilityService>();



  bool _showMenu = false;
  bool get showMenu => _showMenu;
  bool get showNav => _utilityService.showNav;

  set showMenu(bool val) {
    _showMenu = val;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_utilityService];
}
