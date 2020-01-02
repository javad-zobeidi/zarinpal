library zarinpal;

import 'package:dio/dio.dart';
import 'package:zarinpal/src/verification_payment.dart';

import 'call_backs.dart';
import 'payment_request.dart';

class ZarinPal {
  static final ZarinPal _zarinpal = ZarinPal._internal();

  ZarinPal._internal();

  factory ZarinPal() {
    return _zarinpal;
  }

  static BaseOptions _options = BaseOptions(
    connectTimeout: 4000,
    headers: {
      "Content-Type": "application/json",
    },
  );

  Dio _dio = Dio(_options);

  void startPayment(final PaymentRequest paymentRequest,
      OnCallbackRequestPaymentListener listener) async {
    try {
      Response response = await _dio.post(paymentRequest.getPaymentRequestURL(),
          data: paymentRequest.toMap());
      final Map<String, dynamic> result = response.data;
      if (result["Status"] == 100) {
        paymentRequest.setAuthority(result["Authority"]);
        listener(int.parse(result["Status"].toString()),
            paymentRequest.getStartPaymentGatewayURL(result["Authority"]));
      } else {
        listener(result["status"], null);
      }
    } on DioError catch (e) {
      print(e);
      listener(0, null);
    }
  }

  void verificationPayment(
      String status,
      String authority,
      PaymentRequest paymentRequest,
      OnCallbackVerificationPaymentListener listener) async {
    if (paymentRequest.getAuthority() != authority) {
      listener(false, null, paymentRequest);
      return;
    }
    if (status != "OK") {
      listener(false, null, paymentRequest);
      return;
    }
    VerificationPayment verificationPayment = VerificationPayment()
      ..setAuthority(authority)
      ..setMerchantID(paymentRequest.getMerchantID())
      ..setAmount(paymentRequest.getAmount());

    print(verificationPayment.toMap());

    try {
      Response response = await _dio.post(
          paymentRequest.getVerificationPaymentURL(),
          data: verificationPayment.toMap());
      final Map<String, dynamic> result = response.data;
      if (result["Status"] == 100) {
        listener(true, result["RefID"].toString(), paymentRequest);
      } else {
        listener(false, null, paymentRequest);
      }
    } on DioError catch (e) {
      print(e.toString());
      listener(false, null, paymentRequest);
    }
  }
}
