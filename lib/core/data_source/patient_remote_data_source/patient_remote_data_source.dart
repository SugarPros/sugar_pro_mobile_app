import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/models/ai_chat_message_response.dart';
import 'package:sugar_pros/core/models/ai_reply_response.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/models/chat_messages_response.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/pro_appointments_response.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

abstract class PatientRemoteDataSource {
  Future<Either<AppError, ProAppointmentResponse>> patAppointments();

  Future<Either<AppError, PatientRecordResponse>> patientRecords();

  Future<Either<AppError, ChatListResponse>> getPatientChatHistory();

  Future<Either<AppError, ChatMessagesResponse>> getPatientChatsById(String? id);

  Future<Either<AppError, dynamic>> sendMessage({required String? id, required String? message});

  Future<Either<AppError, ProviderAIChatListResponse>> getAIChats();

  Future<Either<AppError, AIChatMessageResponse>> getProviderAIChatsById(String? id);

  Future<Either<AppError, AIReplyResponse>> sendMessageAI({
    required String? id,
    required String? message,
  });
}
