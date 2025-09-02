import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/data_source/provider_remote_data_source/provider_remote_data_source.dart';
import 'package:sugar_pros/core/enums/http_method.dart';
import 'package:sugar_pros/core/models/ai_chat_message_response.dart';
import 'package:sugar_pros/core/models/ai_reply_response.dart';
import 'package:sugar_pros/core/models/chat_messages_response.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/patients_chat_respose.dart';
import 'package:sugar_pros/core/models/pro_appointments_response.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/services/api/api_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderRemoteDataSourceImpl extends ProviderRemoteDataSource {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<Either<AppError, ProAppointmentResponse>> proAppointments() {
   return _apiService.makeRequest(
      url: 'provider/appointments',
      method: HttpMethod.get,
      fromJson: (json) => ProAppointmentResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, PatientRecordResponse>> patientRecords() {
   return _apiService.makeRequest(
      url: 'provider/patients',
      method: HttpMethod.get,
      fromJson: (json) => PatientRecordResponse.fromJson(json),
    );
  }
  
  @override
  Future<Either<AppError, PatientChatListResponse>> getProviderChatHistory() {
    return _apiService.makeRequest(
      url: 'provider/chats',
      method: HttpMethod.get,
      fromJson: (json) => PatientChatListResponse.fromJson(json),
    );
  }
  
  @override
  Future<Either<AppError, ChatMessagesResponse>> getPatientChatsById(String? id) {
    return _apiService.makeRequest(
      url: 'provider/chats/$id',
      method: HttpMethod.get,
      fromJson: (json) => ChatMessagesResponse.fromJson(json),
    );
  }
  
  @override
  Future<Either<AppError, dynamic>> sendMessage({required String? id, required String? message}) {
    return _apiService.makeRequest(
      url: 'provider/chats/$id',
      method: HttpMethod.post,
      data: {'message': message},
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, ProviderAIChatListResponse>> getAIChats() {
    return _apiService.makeRequest(
      url: 'provider/ai-chat',
      method: HttpMethod.get,
      fromJson: (json) => ProviderAIChatListResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, AIChatMessageResponse>> getProviderAIChatsById(String? id) {
    return _apiService.makeRequest(
      url: 'provider/ai-chat/$id',
      method: HttpMethod.get,
      fromJson: (json) => AIChatMessageResponse.fromJson(json),
    );
  }
  
  @override
  Future<Either<AppError, AIReplyResponse>> sendMessageAI({required String? id, required String? message}) {
    return _apiService.makeRequest(
      url: 'provider/ai-chat/$id',
      method: HttpMethod.post,
      data: {'message': message},
      fromJson: (json) => AIReplyResponse.fromJson(json),
    );
  }
}
