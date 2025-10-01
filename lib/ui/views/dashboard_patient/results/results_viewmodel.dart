import 'package:sugar_pros/core/utils/exports.dart';

class ResultsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToDexcom() {
    _navigationService.navigateTo(Routes.dexcom);
  }

  void navigateToNutritionTracker() {
    _navigationService.navigateTo(Routes.nutritionTracker);
  }
}
