class RelatedChatResponse {
  String? type;
  List<RelatedChats>? relatedChats;

  RelatedChatResponse({this.type, this.relatedChats});

  RelatedChatResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      relatedChats = <RelatedChats>[];
      json['data'].forEach((v) {
        relatedChats!.add(RelatedChats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (relatedChats != null) {
      data['data'] = relatedChats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelatedChats {
  int? id;
  String? sentBy;
  String? receivedBy;
  String? mainMessage;
  String? messageType;
  String? status;
  String? createdAt;

  RelatedChats(
      {this.id,
      this.sentBy,
      this.receivedBy,
      this.mainMessage,
      this.messageType,
      this.status,
      this.createdAt});

  RelatedChats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentBy = json['sent_by'];
    receivedBy = json['received_by'];
    mainMessage = json['main_message'];
    messageType = json['message_type'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sent_by'] = sentBy;
    data['received_by'] = receivedBy;
    data['main_message'] = mainMessage;
    data['message_type'] = messageType;
    data['status'] = status;
    data['created_at'] = createdAt;
    return data;
  }
}
