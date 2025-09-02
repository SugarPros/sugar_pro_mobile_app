class ChatMessagesResponse {
  String? type;
  List<ChatMessage>? chatMessage;

  ChatMessagesResponse({this.type, this.chatMessage});

  ChatMessagesResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      chatMessage = <ChatMessage>[];
      json['data'].forEach((v) {
        chatMessage!.add(ChatMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (chatMessage != null) {
      data['data'] = chatMessage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatMessage {
  int? id;
  String? sentBy;
  String? senderType;
  String? receivedBy;
  String? receiverType;
  String? status;
  String? messageType;
  String? mainMessage;
  String? createdAt;
  String? updatedAt;

  ChatMessage(
      {this.id,
      this.sentBy,
      this.senderType,
      this.receivedBy,
      this.receiverType,
      this.status,
      this.messageType,
      this.mainMessage,
      this.createdAt,
      this.updatedAt});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentBy = json['sent_by'];
    senderType = json['sender_type'];
    receivedBy = json['received_by'];
    receiverType = json['receiver_type'];
    status = json['status'];
    messageType = json['message_type'];
    mainMessage = json['main_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sent_by'] = sentBy;
    data['sender_type'] = senderType;
    data['received_by'] = receivedBy;
    data['receiver_type'] = receiverType;
    data['status'] = status;
    data['message_type'] = messageType;
    data['main_message'] = mainMessage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
