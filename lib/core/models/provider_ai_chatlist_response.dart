class ProviderAIChatListResponse {
  String? type;
  List<ProviderAIChatList>? data;

  ProviderAIChatListResponse({this.type, this.data});

  ProviderAIChatListResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      data = <ProviderAIChatList>[];
      json['data'].forEach((v) {
        data!.add(ProviderAIChatList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProviderAIChatList {
  int? id;
  String? chatuid;
  String? requestedBy;
  String? requestedTo;
  String? messageOfUid;
  String? message;
  String? createdAt;
  String? updatedAt;

  ProviderAIChatList(
      {this.id,
      this.chatuid,
      this.requestedBy,
      this.requestedTo,
      this.messageOfUid,
      this.message,
      this.createdAt,
      this.updatedAt});

  ProviderAIChatList.fromJson(Map<String, dynamic> json) {
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
