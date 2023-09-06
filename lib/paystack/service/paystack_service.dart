import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hostels/paystack/client/paystack_client.dart';
import 'package:hostels/paystack/models/get_payment_url_request.dart';
import 'package:hostels/paystack/modal/show_paystack_modal.dart';

class PaystackService {
  //...

  // ignore: unused_field
  static const String _pk = "pk_test_cd448417e8366fc543bc92ddd9e0903e01ec95bf";

  // ignore: unused_field
  static const String _sk = "sk_test_664903877166e55bd8a956aef88d3d58fd795d22";

  static init() async {}

  static Future<String> paystackurl(String email, double amount) async {
    final headers = {"Authorization": "Bearer $_sk"};

    final dio = Dio(BaseOptions(headers: headers));

    final req = GetPaymentUrlRequest(
      email: email,
      amount: (amount * 100).toInt(),
    );

    final resp = await PaystackClient(dio).getPaymentUrl(req);

    return resp.data?.authorizationUrl ?? "";
  }

  static Future showModal(
    BuildContext context,
    String email,
    double amount,
  ) async {
    // ...
    return showPaystackModal(
      context,
      paystackurl(email, amount),
    );
  }
}
