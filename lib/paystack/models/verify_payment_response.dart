class VerifyPaymentResponse {
  bool? status;
  String? message;
  Data? data;

  VerifyPaymentResponse({this.status, this.message, this.data});

  VerifyPaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? domain;
  String? status;
  String? reference;
  String? receiptNumber;
  int? amount;
  String? message;
  String? gatewayResponse;
  String? paidAt;
  String? createdAt;
  String? channel;
  String? currency;
  String? ipAddress;
  int? metadata;
  String? log;
  String? fees;
  String? feesSplit;
  Authorization? authorization;
  Customer? customer;
  String? plan;
  Authorization? split;
  String? orderId;
  int? requestedAmount;
  String? posTransactionData;
  String? source;
  String? feesBreakdown;
  String? transactionDate;
  Authorization? planObject;
  Authorization? subaccount;

  Data({
    this.id,
    this.domain,
    this.status,
    this.reference,
    this.receiptNumber,
    this.amount,
    this.message,
    this.gatewayResponse,
    this.paidAt,
    this.createdAt,
    this.channel,
    this.currency,
    this.ipAddress,
    this.metadata,
    this.log,
    this.fees,
    this.feesSplit,
    this.authorization,
    this.customer,
    this.plan,
    this.split,
    this.orderId,
    this.requestedAmount,
    this.posTransactionData,
    this.source,
    this.feesBreakdown,
    this.transactionDate,
    this.planObject,
    this.subaccount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    status = json['status'];
    reference = json['reference'];
    receiptNumber = json['receipt_number'];
    amount = json['amount'];
    message = json['message'];
    gatewayResponse = json['gateway_response'];
    paidAt = json['paid_at'];
    createdAt = json['created_at'];
    channel = json['channel'];
    currency = json['currency'];
    ipAddress = json['ip_address'];
    metadata = json['metadata'];
    log = json['log'];
    fees = json['fees'];
    feesSplit = json['fees_split'];
    authorization = json['authorization'] != null
        ? Authorization.fromJson(json['authorization'])
        : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    plan = json['plan'];
    split =
        json['split'] != null ? Authorization.fromJson(json['split']) : null;
    orderId = json['order_id'];
    paidAt = json['paidAt'];
    createdAt = json['createdAt'];
    requestedAmount = json['requested_amount'];
    posTransactionData = json['pos_transaction_data'];
    source = json['source'];
    feesBreakdown = json['fees_breakdown'];
    transactionDate = json['transaction_date'];
    planObject = json['plan_object'] != null
        ? Authorization.fromJson(json['plan_object'])
        : null;
    subaccount = json['subaccount'] != null
        ? Authorization.fromJson(json['subaccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['domain'] = domain;
    data['status'] = status;
    data['reference'] = reference;
    data['receipt_number'] = receiptNumber;
    data['amount'] = amount;
    data['message'] = message;
    data['gateway_response'] = gatewayResponse;
    data['paid_at'] = paidAt;
    data['created_at'] = createdAt;
    data['channel'] = channel;
    data['currency'] = currency;
    data['ip_address'] = ipAddress;
    data['metadata'] = metadata;
    data['log'] = log;
    data['fees'] = fees;
    data['fees_split'] = feesSplit;
    if (authorization != null) {
      data['authorization'] = authorization!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['plan'] = plan;
    if (split != null) {
      data['split'] = split!.toJson();
    }
    data['order_id'] = orderId;
    data['paidAt'] = paidAt;
    data['createdAt'] = createdAt;
    data['requested_amount'] = requestedAmount;
    data['pos_transaction_data'] = posTransactionData;
    data['source'] = source;
    data['fees_breakdown'] = feesBreakdown;
    data['transaction_date'] = transactionDate;
    if (planObject != null) {
      data['plan_object'] = planObject!.toJson();
    }
    if (subaccount != null) {
      data['subaccount'] = subaccount!.toJson();
    }
    return data;
  }
}

class Authorization {
  Authorization();

  Authorization.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? customerCode;
  String? phone;
  String? metadata;
  String? riskAction;
  String? internationalFormatPhone;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.customerCode,
    this.phone,
    this.metadata,
    this.riskAction,
    this.internationalFormatPhone,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    customerCode = json['customer_code'];
    phone = json['phone'];
    metadata = json['metadata'];
    riskAction = json['risk_action'];
    internationalFormatPhone = json['international_format_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['customer_code'] = customerCode;
    data['phone'] = phone;
    data['metadata'] = metadata;
    data['risk_action'] = riskAction;
    data['international_format_phone'] = internationalFormatPhone;
    return data;
  }
}

class Data2 {
  int? id;
  String? domain;
  String? status;
  String? reference;
  String? receiptNumber;
  int? amount;
  String? message;
  String? gatewayResponse;
  String? paidAt;
  String? createdAt;
  String? channel;
  String? currency;
  String? ipAddress;
  int? metadata;
  String? log;
  String? fees;
  String? feesSplit;
  Authorization? authorization;
  Customer? customer;
  String? plan;
  Authorization? split;
  String? orderId;
  int? requestedAmount;
  String? posTransactionData;
  String? source;
  String? feesBreakdown;
  String? transactionDate;
  Authorization? planObject;
  Authorization? subaccount;

  Data2(
      {this.id,
      this.domain,
      this.status,
      this.reference,
      this.receiptNumber,
      this.amount,
      this.message,
      this.gatewayResponse,
      this.paidAt,
      this.createdAt,
      this.channel,
      this.currency,
      this.ipAddress,
      this.metadata,
      this.log,
      this.fees,
      this.feesSplit,
      this.authorization,
      this.customer,
      this.plan,
      this.split,
      this.orderId,
      this.requestedAmount,
      this.posTransactionData,
      this.source,
      this.feesBreakdown,
      this.transactionDate,
      this.planObject,
      this.subaccount});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    status = json['status'];
    reference = json['reference'];
    receiptNumber = json['receipt_number'];
    amount = json['amount'];
    message = json['message'];
    gatewayResponse = json['gateway_response'];
    paidAt = json['paid_at'];
    createdAt = json['created_at'];
    channel = json['channel'];
    currency = json['currency'];
    ipAddress = json['ip_address'];
    metadata = json['metadata'];
    log = json['log'];
    fees = json['fees'];
    feesSplit = json['fees_split'];
    authorization = json['authorization'] != null
        ? Authorization.fromJson(json['authorization'])
        : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    plan = json['plan'];
    split =
        json['split'] != null ? Authorization.fromJson(json['split']) : null;
    orderId = json['order_id'];
    paidAt = json['paidAt'];
    createdAt = json['createdAt'];
    requestedAmount = json['requested_amount'];
    posTransactionData = json['pos_transaction_data'];
    source = json['source'];
    feesBreakdown = json['fees_breakdown'];
    transactionDate = json['transaction_date'];
    planObject = json['plan_object'] != null
        ? Authorization.fromJson(json['plan_object'])
        : null;
    subaccount = json['subaccount'] != null
        ? Authorization.fromJson(json['subaccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['domain'] = domain;
    data['status'] = status;
    data['reference'] = reference;
    data['receipt_number'] = receiptNumber;
    data['amount'] = amount;
    data['message'] = message;
    data['gateway_response'] = gatewayResponse;
    data['paid_at'] = paidAt;
    data['created_at'] = createdAt;
    data['channel'] = channel;
    data['currency'] = currency;
    data['ip_address'] = ipAddress;
    data['metadata'] = metadata;
    data['log'] = log;
    data['fees'] = fees;
    data['fees_split'] = feesSplit;
    if (authorization != null) {
      data['authorization'] = authorization!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['plan'] = plan;
    if (split != null) {
      data['split'] = split!.toJson();
    }
    data['order_id'] = orderId;
    data['paidAt'] = paidAt;
    data['createdAt'] = createdAt;
    data['requested_amount'] = requestedAmount;
    data['pos_transaction_data'] = posTransactionData;
    data['source'] = source;
    data['fees_breakdown'] = feesBreakdown;
    data['transaction_date'] = transactionDate;
    if (planObject != null) {
      data['plan_object'] = planObject!.toJson();
    }
    if (subaccount != null) {
      data['subaccount'] = subaccount!.toJson();
    }
    return data;
  }
}
