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
  int? roomId;

  Metadata({this.roomId});

  Metadata.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    return data;
  }
}
