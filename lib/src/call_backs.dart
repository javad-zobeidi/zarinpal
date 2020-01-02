import 'dart:async';

import '../zarinpal.dart';

typedef OnCallbackRequestPaymentListener = FutureOr<void> Function(
    int status, String paymentGatewayUri);

typedef OnCallbackVerificationPaymentListener = FutureOr<void> Function(
    bool isPaymentSuccess, String refID, PaymentRequest paymentRequest);
