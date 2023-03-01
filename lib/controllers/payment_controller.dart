import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  Razorpay? _razorpay;

  makepayment() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    
    log("set");
    // Handle payment success
  }

  void handlePaymentError( PaymentFailureResponse response) {
    log("eroor");
    // Handle payment error
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    log('externalWallet');
    // Handle external wallet
  }

  void openCheckout(int amount) {
    var options = {
      'key': 'rzp_test_e8HTosic93ZLDX',
      'amount': amount * 100,
      'name': 'Space class',
      'description': "let's pay",
      'prefill': {'contact': '', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _razorpay!.clear();
    super.dispose();
  }
}
