import 'package:dio/dio.dart';
import 'package:hostels/paystack/models/get_payment_url_request.dart';
import 'package:hostels/paystack/models/get_payment_url_response.dart';
import 'package:retrofit/retrofit.dart';

part 'paystack_client.g.dart';

@RestApi(baseUrl: "https://api.paystack.co")
abstract class PaystackClient {
  factory PaystackClient(Dio dio, {String baseUrl}) = _PaystackClient;

  @POST("/transaction/initialize")
  Future<GetPaymentUrlResponse> getPaymentUrl(
    @Body() GetPaymentUrlRequest req,
  );
}
