class PatientAIChatListResponse {
  String? type;
  PatientAiChat? patientAiChat;

  PatientAIChatListResponse({this.type, this.patientAiChat});

  PatientAIChatListResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    patientAiChat = json['data'] != null ? PatientAiChat.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (patientAiChat != null) {
      data['data'] = patientAiChat!.toJson();
    }
    return data;
  }
}

class PatientAiChat {
  List<ChatSessions>? chatSessions;
  List<PaAiChatMessages>? chats;
  List<PatientAIChatList>? allChats;
  String? currentChatUid;

  PatientAiChat({this.chatSessions, this.chats, this.allChats, this.currentChatUid});

  PatientAiChat.fromJson(Map<String, dynamic> json) {
    if (json['chatSessions'] != null) {
      chatSessions = <ChatSessions>[];
      json['chatSessions'].forEach((v) {
        chatSessions!.add(ChatSessions.fromJson(v));
      });
    }
    if (json['chats'] != null) {
      chats = <PaAiChatMessages>[];
      json['chats'].forEach((v) {
        chats!.add(PaAiChatMessages.fromJson(v));
      });
    }
    if (json['allChats'] != null) {
      allChats = <PatientAIChatList>[];
      json['allChats'].forEach((v) {
        allChats!.add(PatientAIChatList.fromJson(v));
      });
    }
    currentChatUid = json['currentChatUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chatSessions != null) {
      data['chatSessions'] = chatSessions!.map((v) => v.toJson()).toList();
    }
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    if (allChats != null) {
      data['allChats'] = allChats!.map((v) => v.toJson()).toList();
    }
    data['currentChatUid'] = currentChatUid;
    return data;
  }
}

class ChatSessions {
  String? chatuid;
  FirstMessage? firstMessage;

  ChatSessions({this.chatuid, this.firstMessage});

  ChatSessions.fromJson(Map<String, dynamic> json) {
    chatuid = json['chatuid'];
    firstMessage = json['first_message'] != null
        ? FirstMessage.fromJson(json['first_message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatuid'] = chatuid;
    if (firstMessage != null) {
      data['first_message'] = firstMessage!.toJson();
    }
    return data;
  }
}

class FirstMessage {
  int? id;
  String? chatuid;
  String? requestedBy;
  String? requestedTo;
  String? messageOfUid;
  String? message;
  String? createdAt;
  String? updatedAt;

  FirstMessage(
      {this.id,
      this.chatuid,
      this.requestedBy,
      this.requestedTo,
      this.messageOfUid,
      this.message,
      this.createdAt,
      this.updatedAt});

  FirstMessage.fromJson(Map<String, dynamic> json) {
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

class PaAiChatMessages {
  int? id;
  String? chatuid;
  String? requestedBy;
  String? requestedTo;
  String? messageOfUid;
  String? message;
  String? createdAt;
  String? updatedAt;

  PaAiChatMessages(
      {this.id,
      this.chatuid,
      this.requestedBy,
      this.requestedTo,
      this.messageOfUid,
      this.message,
      this.createdAt,
      this.updatedAt});

  PaAiChatMessages.fromJson(Map<String, dynamic> json) {
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

class PatientAIChatList {
  int? id;
  String? chatuid;
  String? requestedBy;
  String? requestedTo;
  String? messageOfUid;
  String? message;
  String? createdAt;
  String? updatedAt;

  PatientAIChatList(
      {this.id,
      this.chatuid,
      this.requestedBy,
      this.requestedTo,
      this.messageOfUid,
      this.message,
      this.createdAt,
      this.updatedAt});

  PatientAIChatList.fromJson(Map<String, dynamic> json) {
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