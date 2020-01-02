Zarinpal Package  for dar & flutter, support android and ios

[Zarinpal WebSite](https://www.zarinpal.com/)

## Usage

A simple usage example:

```dart
import 'package:zarinpal/zarinpal.dart';

main() {
  
// Initialize payment request 
 PaymentRequest _paymentRequest = PaymentRequest()
  ..setIsSandBox(true) // if your application is in developer mode, then set the sandBox as True otherwise set sandBox as false
    ..setMerchantID("Zarinpal MerchantID")
    ..setAmount("integar Amount")
    ..setCallbackURL("Verfication Url callbacl") //The callback can be an android scheme or a website URL, you and can pass any data with The callback for both scheme and  URL
    ..setDescription("Payment Description");

// For scheme you can use uni_links dart Package 


String _paymentUrl = null;


// Call Start payment
ZarinPal().startPayment(_paymentRequest, (int status, String paymentGatewayUri){
     if(status == 100)
         _paymentUrl  = paymentGatewayUri;  // launch URL in browser
});


// Vefrication Payment
// if you set the scheme in your application, You can get the Status and Authority from scheme callback
// if your callback is a website URL like htt://mydomain.com you don't need verificationPayment function

ZarinPal().verificationPayment("Status", "Authority Call back", _paymentRequest, (isPaymentSuccess,refID, paymentRequest){
     if(isPaymentSuccess){
       // Payment Is Success
     }else{
       // Error Print Status
     }
   });



}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][mailto].

[mailto]: j.zobeidi89@gmail.com
