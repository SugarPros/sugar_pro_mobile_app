// ignore_for_file: unused_local_variable
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/models/pat_appointment_respons.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/patients_chat_respose.dart';
import 'package:sugar_pros/core/models/pro_appointments_response.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:sugar_pros/ui/views/auth/auth_view.dart';
import 'package:sugar_pros/ui/views/auth/login/patient_login/patient_login_view.dart';
import 'package:sugar_pros/ui/views/auth/login/provider_login/provider_login_view.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/forms_agreement/forms_agreement_view.dart';
import 'package:sugar_pros/ui/views/auth/patient_account/patient_account_view.dart';
import 'package:sugar_pros/ui/views/auth/provider_account/provider_account_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/book_appointment/book_appointment_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/appointment/patient_appointment_details/pat_apointment_detail_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/dashboard_patient_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_chat_history/patient_chat/pa_ai_chat/pa_ai_chat_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_chat_history/patient_chat/pa_ai_chat_history/pa_ai_chat_history_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_chat_history/patient_chat/patient_chats_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_dexcom/patient_dexcom_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_nutrition_tracker/patient_nutrition_tracker_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/notification/notification_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_email/change_email_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/change_password/change_password_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/patient_settings/patient_settings_view.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/profile/profile_patient_account/patient_profile_account_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/dashboard_provider_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_appointment/provider_appointment_details/pd_apointment_detail_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_chat_history/provider_chats/pd_ai_chat/pd_ai_chat_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_chat_history/provider_chats/pd_ai_chat_history/pd_ai_chat_history_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_chat_history/provider_chats/provider_chats_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_profile/provider_profile_account_info_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_profile/provider_profile_account_view.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_records/provider_records_detail/pd_records_detail_view.dart';
import 'package:sugar_pros/ui/views/splash/splash_view.dart';

abstract class Routes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const auth = '/auth';
  static const patientAccount = '/patientAccount';
  static const patientLogin = '/patientLogin';
  static const providerAccount = '/providerAccount';
  static const formsAgreement = '/formsAgreement';
  static const providerLogin = '/providerLogin';
  static const patientDashboard = '/patientDashboard';
  static const providerDashboard = '/providerDashboard';
  static const providerProfileAccountView = '/providerAccountView';
  static const providerProfileAccountInfoView = '/providerAccountInfoView';
  static const providerChats = '/providerChats';
  static const patientChats = '/patientChats';
  static const pdAppointmentDetails = '/pdAppointmentDetails';
  static const patAppointmentDetails = '/patAppointmentDetails';
  static const pdRecordDetails = '/pdRecordDetails';
  static const pdAiChatHstory = '/pdAiChatHstory';
  static const pdAiChatView = '/pdAiChatView';
  static const paAiChatHstory = '/paAiChatHstory';
  static const paAiChatView = '/paAiChatView';
  static const dexcom = '/dexcom';
  static const nutritionTracker = '/nutritionTrancer';
  static const bookAppointment = '/bookAppointment';
  static const patientAccountDetails = '/patientAccountDetails';
  static const patientSettings = '/patientSettings';
  static const changePassword = '/changePassword';
  static const changeEmail = '/changeEmail';
  static const notifcations = '/notifcations';
}

class Routers {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final dynamic args =
        settings.arguments is Map<String, dynamic> &&
                (settings.arguments as Map<String, dynamic>).containsKey('arguments')
            ? (settings.arguments as Map<String, dynamic>)['arguments']
            : settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case Routes.auth:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const AuthView(),
          settings: settings,
        );
      case Routes.patientAccount:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PatientAccountView(),
          settings: settings,
        );
      case Routes.providerAccount:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const ProviderAccountView(),
          settings: settings,
        );
      case Routes.providerLogin:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const ProviderLoginView(),
          settings: settings,
        );
      case Routes.formsAgreement:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const FormsAgreementView(),
          settings: settings,
        );
      case Routes.patientDashboard:
        final int? index = args;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => DashboardPatientView(index: index),
          settings: settings,
        );
      case Routes.providerDashboard:
        final int? index = args;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ProviderDashboardView(index: index),
          settings: settings,
        );
      case Routes.providerProfileAccountView:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const ProviderProfileAccountView(),
          settings: settings,
        );
      case Routes.providerProfileAccountInfoView:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const ProviderProfileAccountInfoView(),
          settings: settings,
        );
      case Routes.providerChats:
        final chatItem = args as PatientsChatItem;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => ProviderChatsView(chatItem: chatItem),
          settings: settings,
        );
      case Routes.pdAppointmentDetails:
        final app = args as ProAppointments;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => PdAppointmentDetailView(app: app),
          settings: settings,
        );
      case Routes.patAppointmentDetails:
        final app = args as PatientAppointments;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => PatAppointmentDetailView(app: app),
          settings: settings,
        );
      case Routes.pdRecordDetails:
        final rec = args as Map<String, dynamic>;
        final patient = rec['patient'] as PatientsList;
        final record = args['record'] as UserDetails;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => PdRecordsDetailView(patient: patient, record: record),
          settings: settings,
        );
      case Routes.pdAiChatHstory:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PdAiChatHistoryView(),
          settings: settings,
        );
      case Routes.pdAiChatView:
        final chatItem = args as ProviderAIChatList;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => PdAiChatView(chatItem: chatItem),
          settings: settings,
        );
      case Routes.paAiChatHstory:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PaAiChatHistoryView(),
          settings: settings,
        );
      case Routes.paAiChatView:
        final chatId = args as String;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => PaAiChatView(chatId: chatId),
          settings: settings,
        );
      case Routes.patientLogin:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PatientLoginView(),
          settings: settings,
        );
      case Routes.patientChats:
        final chatItem = args as ChatHistoryList;
        return CupertinoPageRoute<dynamic>(
          builder: (context) => PatientChatsView(chatItem: chatItem),
          settings: settings,
        );
      case Routes.dexcom:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PatientDexcomView(),
          settings: settings,
        );
      case Routes.nutritionTracker:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PatientNutritionTrackerView(),
          settings: settings,
        );
      case Routes.bookAppointment:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const BookAppointmentView(),
          settings: settings,
        );
      case Routes.patientAccountDetails:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PatientProfileAccountView(),
          settings: settings,
        );
      case Routes.patientSettings:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const PatientSettingsView(),
          settings: settings,
        );
      case Routes.changePassword:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const ChangePasswordView(),
          settings: settings,
        );
      case Routes.changeEmail:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const ChangeEmailView(),
          settings: settings,
        );
      case Routes.notifcations:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const NotificationView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
  builder:
      (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == '/'
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton.icon(
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
            ],
          ),
        ),
      ),
);
