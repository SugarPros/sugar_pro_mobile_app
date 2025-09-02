class ChatListResponse {
  String? type;
  List<ChatHistoryList>? chatHistoryList;
  String? podName;
  int? totalUnread;

  ChatListResponse(
      {this.type, this.chatHistoryList, this.podName, this.totalUnread});

  ChatListResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['chat_history'] != null) {
      chatHistoryList = <ChatHistoryList>[];
      json['chat_history'].forEach((v) {
        chatHistoryList!.add(ChatHistoryList.fromJson(v));
      });
    }
    podName = json['pod_name'];
    totalUnread = json['total_unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (chatHistoryList != null) {
      data['chat_history'] = chatHistoryList!.map((v) => v.toJson()).toList();
    }
    data['pod_name'] = podName;
    data['total_unread'] = totalUnread;
    return data;
  }
}

class ChatHistoryList {
  int? id;
  String? sentBy;
  String? senderType;
  String? receivedBy;
  String? receiverType;
  String? mainMessage;
  String? messageType;
  String? status;
  String? createdAt;
  String? senderName;
  String? senderImage;
  String? receiverName;
  String? receiverImage;
  bool? isMe;

  ChatHistoryList(
      {this.id,
      this.sentBy,
      this.senderType,
      this.receivedBy,
      this.receiverType,
      this.mainMessage,
      this.messageType,
      this.status,
      this.createdAt,
      this.senderName,
      this.senderImage,
      this.receiverName,
      this.receiverImage,
      this.isMe});

  ChatHistoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentBy = json['sent_by'];
    senderType = json['sender_type'];
    receivedBy = json['received_by'];
    receiverType = json['receiver_type'];
    mainMessage = json['main_message'];
    messageType = json['message_type'];
    status = json['status'];
    createdAt = json['created_at'];
    senderName = json['sender_name'];
    senderImage = json['sender_image'];
    receiverName = json['receiver_name'];
    receiverImage = json['receiver_image'];
    isMe = json['is_me'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sent_by'] = sentBy;
    data['sender_type'] = senderType;
    data['received_by'] = receivedBy;
    data['receiver_type'] = receiverType;
    data['main_message'] = mainMessage;
    data['message_type'] = messageType;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['sender_name'] = senderName;
    data['sender_image'] = senderImage;
    data['receiver_name'] = receiverName;
    data['receiver_image'] = receiverImage;
    data['is_me'] = isMe;
    return data;
  }
}
