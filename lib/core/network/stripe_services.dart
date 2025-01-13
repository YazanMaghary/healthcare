
//enough for today payment sheet show up now next stip is to customize it and make it clean code
class StripeServices {
  StripeServices._();
  static final StripeServices instance = StripeServices._();
  Future<void> initPayment() async {
   
}}

// payment as BottomSheet

//  try {
//       final data = await Dio().post(StripeConstances.stripeUrl,
//           data: {
//             "amount": 2000,
//             "currency": 'usd',
//             "payment_method_types[]": "card"
//           },
//           options: Options(headers: {
//             'Authorization': "Bearer ${StripeConstances.stripeSecretKey}"
//           }, contentType: "application/x-www-form-urlencoded"));

//       // Log the response data for debugging
//       print("Stripe API Response: ${data.data}");
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           // Set to true for custom flow
//           customFlow: false,
//           // Main params
//           merchantDisplayName: 'Flutter Stripe Store Demo',
//           paymentIntentClientSecret: data.data['client_secret'],
//           // Customer keys
//           customerEphemeralKeySecret: data.data['ephemeralKey'],
//           customerId: data.data['customer'],
//           // Extra options

//           googlePay: const PaymentSheetGooglePay(
//             merchantCountryCode: 'US',
//             testEnv: true,
//           ),
//           style: ThemeMode.dark,
//         ),
//       );
//       await Stripe.instance.presentPaymentSheet();
//     } catch (e) {
//       failureWidget("Error", e.toString());
//       rethrow;
//     }
  

//   _createTestPaymentSheet() {}
