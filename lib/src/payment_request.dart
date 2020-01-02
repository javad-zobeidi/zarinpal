import 'package:sprintf/sprintf.dart';

class PaymentRequest {
  static final String paymentGatewayUrl =
      "https://www.%szarinpal.com/pg/StartPay/%s/%s";
  static final String paymentRequestUrl =
      "https://www.%szarinpal.com/pg/rest/WebGate/PaymentRequest.json";
  static final String verificationPaymentUrl =
      "https://www.%szarinpal.com/pg/rest/WebGate/PaymentVerification.json";

  String merchantID;
  num amount;
  String mobile = "";
  String email = "";
  String description;
  String callBackURL;
  String authority;
  bool isSandBox = false;
  bool isZarinGateEnable = false;

  bool getIsZarinGateEnable() {
    return isZarinGateEnable;
  }

  setIsZarinGateEnable(bool zarinGateEnable) =>
      isZarinGateEnable = zarinGateEnable;

  setMerchantID(String merchantID) => this.merchantID = merchantID;

  setIsSandBox(bool isSandBox) => this.isSandBox = isSandBox;

  setCallbackURL(String callBackURL) => this.callBackURL = callBackURL;

  setAmount(num amount) => this.amount = amount;

  setDescription(String description) => this.description = description;

  setMobile(String mobile) => this.mobile = mobile;

  setEmail(String email) => this.email = email;

  String getCallBackURL() {
    return callBackURL;
  }

  void setAuthority(String authority) {
    this.authority = authority;
  }

  num getAmount() {
    return amount;
  }

  String getDescription() {
    return description;
  }

  String getMobile() {
    return mobile;
  }

  String getMerchantID() {
    return merchantID;
  }

  String getEmail() {
    return email;
  }

  String getAuthority() {
    return authority;
  }

  String getStartPaymentGatewayURL(String authority) {
    return sprintf(paymentGatewayUrl, [
      isSandBox ? "sandbox." : "",
      authority,
      isZarinGateEnable ? "ZarinGate" : ""
    ]).toString().replaceAll(isSandBox ? "www." : "", "");
  }

  String getPaymentRequestURL() {
    return sprintf(paymentRequestUrl, [isSandBox ? "sandbox." : ""])
        .toString()
        .replaceAll(isSandBox ? "www." : "", "");
  }

  String getVerificationPaymentURL() {
    return sprintf(verificationPaymentUrl, [isSandBox ? "sandbox." : ""])
        .toString()
        .replaceAll(isSandBox ? "www." : "", "");
  }

  Map<String, dynamic> toMap() {
    return {
      "MerchantID": merchantID,
      "Amount": amount,
      "Description": description,
      "CallbackURL": callBackURL,
      "mobile": mobile,
      "email": email,
    };
  }
}
