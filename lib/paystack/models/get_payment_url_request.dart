class GetPaymentUrlRequest {
  int? amount;
  String? email;
  Metadata? metadata;

  GetPaymentUrlRequest({this.amount, this.email, this.metadata});

  GetPaymentUrlRequest.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    email = json['email'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['email'] = email;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Metadata {
  final int? roomId;
  final String? userId;
  final String? userEmail;

  Metadata({this.roomId, this.userId, this.userEmail});

  Metadata.fromJson(Map<String, dynamic> json)
      : roomId = json['roomId'],
        userId = json['userId'],
        userEmail = json['userEmail'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['userId'] = userId;
    data['userEmail'] = userEmail;
    return data;
  }
}
