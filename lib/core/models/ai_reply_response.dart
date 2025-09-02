class AIReplyResponse {
  String? type;
  String? message;
  AiReplyData? aiReplyData;

  AIReplyResponse({this.type, this.message, this.aiReplyData});

  AIReplyResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    aiReplyData = json['data'] != null ? AiReplyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (aiReplyData != null) {
      data['data'] = aiReplyData!.toJson();
    }
    return data;
  }
}

class AiReplyData {
  String? reply;

  AiReplyData({this.reply});

  AiReplyData.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reply'] = reply;
    return data;
  }
}
