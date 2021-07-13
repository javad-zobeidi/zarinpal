import 'package:zarinpal/zarinpal.dart';

main() {

// Initialize payment request
// For scheme you can use uni_links flutter Package
  PaymentRequest _paymentRequest = PaymentRequest();

  _paymentRequest.setIsSandBox(true);
  _paymentRequest.setMerchantID("Zarinpal MerchantID");
  _paymentRequest.setAmount(1000);//integar Amount
  _paymentRequest.setCallbackURL("Verfication Url callbacl"); //The callback can be an android scheme or a website URL, you and can pass any data with The callback for both scheme and  URL
  _paymentRequest.setDescription("Payment Description");


  String? _paymentUrl;


// Call Start payment
  ZarinPal().startPayment(_paymentRequest, (int? status, String? paymentGatewayUri){
    if(status == 100)
      _paymentUrl = paymentGatewayUri; // launch URL in browser
  });


// Vefrication Payment
// if you set the scheme in your application, You can get the Status and Authority from scheme callback
// if your callback is a website URL like htt://mydomain.com you don't need verificationPayment function

  ZarinPal().verificationPayment("Status", "Authority Call back", _paymentRequest, (isPaymentSuccess,refID, paymentRequest){
    if(isPaymentSuccess){
      // Payment Is Success
      print("Success");
    }else{
      // Error Print Status
      print("Error");
    }
  });



}