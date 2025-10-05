import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/models/ai_reply_response.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/models/nutrition_tracker_response.dart';
import 'package:sugar_pros/core/models/pat_appointment_respons.dart';
import 'package:sugar_pros/core/models/patient_ai_chatlist_response.dart';
import 'package:sugar_pros/core/models/patient_notification_response.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/quest_lab_response.dart';
import 'package:sugar_pros/core/models/related_chat_repsonse.dart';
import 'package:sugar_pros/core/utils/exports.dart';

abstract class PatientRemoteDataSource {
  Future<Either<AppError, PatientNotificationResponse>> patNotifications();

  Future<Either<AppError, PatAppointmentResponse>> patAppointments();

  Future<Either<AppError, PatientRecordResponse>> patientRecords();

  Future<Either<AppError, RelatedChatResponse>> getRelatedChats(String? messageWith);

  Future<Either<AppError, ChatListResponse>> getPatientChatHistory();

  Future<Either<AppError, dynamic>> sendMessage({required String? id, required String? message});

  Future<Either<AppError, PatientAIChatListResponse>> getAIChats();

  Future<Either<AppError, PatientAIChatListResponse>> getPatientAIChatsById(String? id);

  Future<Either<AppError, AIReplyResponse>> sendMessageAI({
    required String? id,
    required String? message,
  });

  Future<Either<AppError, dynamic>> clearChat();

  Future<Either<AppError, dynamic>> dexcom();

  Future<Either<AppError, dynamic>> connectDexcom();

  Future<Either<AppError, dynamic>> ePrescriptions();

  Future<Either<AppError, QuestLabResponse>> questLab();

  Future<Either<AppError, dynamic>> clinicalNotes();

  Future<Either<AppError, NutritionTrackerResponse>> nutritionTracker();

  Future<Either<AppError, dynamic>> joinMeeting(String? appointmentId);

  Future<Either<AppError, dynamic>> initiate({required String? date, required String? time});

  Future<Either<AppError, dynamic>> complete({
    required String? fullname,
    required String? email,
    required String phone,
    required String? address,
    required String? countryCode,
    required String? date,
    required String? time,
    required String? stripeToken,
  });
}
