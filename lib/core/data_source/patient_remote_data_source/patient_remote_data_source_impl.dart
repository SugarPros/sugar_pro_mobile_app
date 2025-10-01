import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/enums/http_method.dart';
import 'package:sugar_pros/core/models/ai_reply_response.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/models/nutrition_tracker_response.dart';
import 'package:sugar_pros/core/models/pat_appointment_respons.dart';
import 'package:sugar_pros/core/models/patient_ai_chatlist_response.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/related_chat_repsonse.dart';
import 'package:sugar_pros/core/services/api/api_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientRemoteDataSourceImpl extends PatientRemoteDataSource {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<Either<AppError, PatAppointmentResponse>> patAppointments() {
    return _apiService.makeRequest(
      url: 'appointments',
      method: HttpMethod.get,
      fromJson: (json) => PatAppointmentResponse.fromJson(json),
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
  Future<Either<AppError, ChatListResponse>> getPatientChatHistory() {
    return _apiService.makeRequest(
      url: 'chat-history',
      method: HttpMethod.get,
      fromJson: (json) => ChatListResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, dynamic>> sendMessage({required String? id, required String? message}) {
    return _apiService.makeRequest(
      url: 'add-new-message',
      method: HttpMethod.post,
      data: {'send_text_to': id, 'message': message},
      isFormData: true,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, PatientAIChatListResponse>> getAIChats() {
    return _apiService.makeRequest(
      url: 'sugarpro-ai',
      method: HttpMethod.get,
      fromJson: (json) => PatientAIChatListResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, PatientAIChatListResponse>> getPatientAIChatsById(String? id) {
    return _apiService.makeRequest(
      url: 'sugarpro-ai?chatuid=$id',
      method: HttpMethod.get,
      fromJson: (json) => PatientAIChatListResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, AIReplyResponse>> sendMessageAI({
    required String? id,
    required String? message,
  }) {
    return _apiService.makeRequest(
      url: 'chatgpt-response',
      method: HttpMethod.post,
      isFormData: true,
      data: {'chatuid': id, 'message': message},
      fromJson: (json) => AIReplyResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, RelatedChatResponse>> getRelatedChats(String? messageWith) {
    return _apiService.makeRequest(
      url: 'fetch-related-chats',
      method: HttpMethod.post,
      data: {'message_with': messageWith},
      isFormData: true,
      fromJson: (json) => RelatedChatResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, dynamic>> clearChat() {
    return _apiService.makeRequest(
      url: 'clear-chat-session',
      method: HttpMethod.post,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, dynamic>> dexcom() {
    return _apiService.makeRequest(url: 'dexcom', method: HttpMethod.get, fromJson: (json) => json);
  }

  @override
  Future<Either<AppError, NutritionTrackerResponse>> nutritionTracker() {
    return _apiService.makeRequest(
      url: 'nutrition-tracker',
      method: HttpMethod.get,
      fromJson: (json) => NutritionTrackerResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, dynamic>> joinMeeting(String? appointmentId) {
    return _apiService.makeRequest(
      url: 'join-meeting/$appointmentId',
      method: HttpMethod.get,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, dynamic>> initiate({DateTime? date, String? time}) {
    return _apiService.makeRequest(
      url: 'appointments/initiate',
      method: HttpMethod.post,
      data: {'date': '2025-10-12', 'time': '12:00'},
      // isFormData: true,
      fromJson: (json) => json,
    );
  }
}
