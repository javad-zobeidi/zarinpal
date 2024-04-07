پکیج زرین پال برای فلاتر



[وب سایت زرین پال](https://www.zarinpal.com/)

## نحویه استفاده از پکیج 


برای استفاده از پکیج زرین پال ابتدا یک Object از کلاس درخواست پرداخت (PaymentRequest) ایجاد میکنیم و مقادیر ثابت را در آن قرار میدهیم

```dart
 PaymentRequest _paymentRequest = PaymentRequest()
  ..setIsSandBox(true) // if your application is in developer mode, then set the sandBox as True otherwise set sandBox as false
    ..setMerchantID("Zarinpal MerchantID")
    ..setCallbackURL("Verfication Url callbacl");
```
# Zarinpal MerchantID => 
کد درگاهی هستش که از زرین پال دریافت میکنید

# SandBox => 
 برای تست درگاه SandBox را برابر True قرار میدهیم در صورتی که میخواهید نرم افزار را منتشر کنیید حتما آن را برابر False قرار دهید.
# Verfication Url callbacl => 
آدرس باز گشتی از درگاه  
آدرس بازگشتی از درگاه میتواند به سایت خود نرم افزار باشد و در مروگر اجرا شود یا از Deep Links ها برای بازگشت به نرم افزار استفاده نمایید
برای استفاده از Deep Links ها میتوانید از پکیج زیر استفاده کنیید. و لینک بازگشتی را در بخش آدرس بازگشتی قرار دهید
[uni_links](https://pub.dev/packages/uni_links)
 
برای ایجاد پرداخت میتوانید از کلاس Singleton زرین پال استفاده نمایید.
کد زیر ادرس پرداخت را ایجاد کرده و کاربر را به سمت درگاه هدایت میکند
در کد زیر مبلغی که کاربر باید پرداخت کند و توضیحات را در Objectی که بالا ساختیم قرار میدهیم 
توجه کنیید که مبلغ به تومان می باشد
```dart
_paymentRequest.setAmount('Amount');
_paymentRequest.setDescription("Payment Description");

ZarinPal().startPayment(_paymentRequest, (int? status, String? paymentGatewayUri){
    if(status == 100)
      _paymentUrl = paymentGatewayUri; // launch URL in browser
  });

```
# _paymentRequest =>
الزامی است Object

# status =>
 وضعیتی که از سمت زرین پال برگشت داده میشود اگر برابر 100 باشد یعنی درخواست به درستی ارسال شده و امکان پرداخت وجود دارد
# paymentGatewayUri =>
 اگر وضعیت برابر 100 بود یک ادرسی توسط زرین پال جهت پرداخت برگشت داده میشود که میتوانید ان را  در مروگر باز کنید و کاربر را به صفحه پرداخت هدایت کنید.
 
 
 زمانی که شما از Deep link ها اسیتفاده میکنید کاربر به نرم افزار برگشت داده میشود جهت اعتبار سنجی پرداخت میتوانید از کد زیر استفاده نمایید.
اگر از وب سایت جهت اعتبار سنجی پرداخت استفاده میکنید لازم نیست از کد زیر استفاده کنید
```dart
  ZarinPal().verificationPayment("Status", "Authority Call back", _paymentRequest, (isPaymentSuccess,refID, paymentRequest){
    if(isPaymentSuccess){
      // Payment Is Success
      print("Success");
    }else{
      // Error Print Status
      print("Error");
    }
  });
```
زمانی که کاربر از به نرم افزار بر میگردد جند مورد به صورت QueryS STring در ادرس وجود دارند که باید در کد بالا قرار بگیرند
# Status => 
وضعیت پرداخت به صورت OK یا NOK
# Authority Call back =>
شناسه پرداخت که در متقیر Authority قرار داد و باید بجای متن بالا قرار بگیر

# refID => 
در کد بالا شناسه پرداخت می باشد،  شناسه پرداخت یک عدد می باشد که جهت پیگیری پرداخت می باشد.


نمونه کد
```dart
import 'package:zarinpal/zarinpal.dart';

main() {
  
// Initialize payment request 
 PaymentRequest _paymentRequest = PaymentRequest()
  ..setIsSandBox(true) // if your application is in developer mode, then set the sandBox as True otherwise set sandBox as false
    ..setMerchantID("Zarinpal MerchantID")
    ..setCallbackURL("Verfication Url callbacl"); //The callback can be an android scheme or a website URL, you and can pass any data with The callback for both scheme and  URL
 

String _paymentUrl = null;

_paymentRequest.setAmount("integar Amount");
_paymentRequest.setDescription("Payment Description");
// Call Start payment
ZarinPal().startPayment(_paymentRequest, (int status, String paymentGatewayUri){
     if(status == 100)
         _paymentUrl  = paymentGatewayUri;  // launch URL in browser
});


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

 [گزارش خطا](https://github.com/javad-zobeidi/zarinpal/issues)

[mailto]: j.zobeidi89@gmail.com
