import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  initPaymentRequest();
  sendPaymentRequest();
  verifyPaymentRequest();
}

class ZarinPalPaymentHandler extends PaymentHandler {
  PaymentRequest paymentRequest = PaymentRequest();

  @override
  initPaymentRequest() {
    paymentRequest.setAmount(1);
    paymentRequest.setDescription('this is for testing ZarinPal');
    paymentRequest.setIsSandBox(true);
    paymentRequest.setCallbackURL('erfanshop://shop');
    paymentRequest.setMerchantID('I dont have any merchantId');
  }

  @override
  sendPaymentRequest() {
    ZarinPal().startPayment(paymentRequest, (status, paymentGatewayUri) {
      //if (status == 100) {
      //launchUrl(Uri.parse(paymentGatewayUri!),
      //  mode: LaunchMode.externalApplication);
      //}
    });
  }

  @override
  verifyPaymentRequest() {
    /*linkStream.listen(
      (deeplink) {
        if (deeplink!.toLowerCase().contains('authority')) {
          String? authority = deeplink.extractValueFromQuery('authority');
          String? status = deeplink.extractValueFromQuery('status');

          ZarinPal().verificationPayment(
            status!,
            authority!,
            paymentRequest,
            (isPaymentSuccess, refID, paymentRequest) {
              if (isPaymentSuccess) {
                print(refID);
              } else {
                print('error');
              }
            },
          );
        }
      },
    );*/
  }
}
