class AIChatMessageResponse {
  String? type;
  List<AIChatMessage>? aiChatMessage;

  AIChatMessageResponse({this.type, this.aiChatMessage});

  AIChatMessageResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      aiChatMessage = <AIChatMessage>[];
      json['data'].forEach((v) {
        aiChatMessage!.add(AIChatMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (aiChatMessage != null) {
      data['data'] = aiChatMessage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AIChatMessage {
  int? id;
  String? chatuid;
  String? requestedBy;
  String? requestedTo;
  String? messageOfUid;
  String? message;
  String? createdAt;
  String? updatedAt;

  AIChatMessage(
      {this.id,
      this.chatuid,
      this.requestedBy,
      this.requestedTo,
      this.messageOfUid,
      this.message,
      this.createdAt,
      this.updatedAt});

  AIChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatuid = json['chatuid'];
    requestedBy = json['requested_by'];
    requestedTo = json['requested_to'];
    messageOfUid = json['message_of_uid'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chatuid'] = chatuid;
    data['requested_by'] = requestedBy;
    data['requested_to'] = requestedTo;
    data['message_of_uid'] = messageOfUid;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
