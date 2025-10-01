import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/models/ai_reply_response.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/models/nutrition_tracker_response.dart';
import 'package:sugar_pros/core/models/pat_appointment_respons.dart';
import 'package:sugar_pros/core/models/patient_ai_chatlist_response.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/related_chat_repsonse.dart';
import 'package:sugar_pros/core/utils/exports.dart';

abstract class PatientRemoteDataSource {
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

  Future<Either<AppError, NutritionTrackerResponse>> nutritionTracker();

  Future<Either<AppError, dynamic>> joinMeeting(String? appointmentId);

  Future<Either<AppError, dynamic>> initiate({DateTime? date, String? time});
}
