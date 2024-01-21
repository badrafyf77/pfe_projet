import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/otp_custom_textfield.dart';

class OTPNumBlurContainerBody extends StatefulWidget {
  const OTPNumBlurContainerBody({super.key});

  @override
  State<OTPNumBlurContainerBody> createState() =>
      _OTPNumBlurContainerBodyState();
}

class _OTPNumBlurContainerBodyState extends State<OTPNumBlurContainerBody> {
  String codeVerification = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        children: [
          Text(
            'Code de vérification',
            style: Styles.normal27,
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              text: 'veuillez entrer le code de vérification envoyer à ',
              style: Styles.normal16,
              children: const <TextSpan>[
                TextSpan(
                  text: '+212707314877',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
              OTPTextField(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                onpressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+2120707314877',
                    verificationCompleted:
                        (PhoneAuthCredential credential) async {
                      // ANDROID ONLY!
                      myShowToast(
                          context, 'verificationCompleted', Colors.green);
                      // await auth.currentUser?.updatePhoneNumber(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        myShowToast(
                            context,
                            'The provided phone number is not valid.',
                            Colors.red);
                      } else {
                        myShowToast(context, e.message!, Colors.red);
                      }
                    },
                    codeSent: (String verificationId, int? resendToken) async {
                      // Update the UI - wait for the user to enter the SMS code
                      // String smsCode = '123456';

                      // // Create a PhoneAuthCredential with the code
                      // PhoneAuthCredential credential =
                      //     PhoneAuthProvider.credential(
                      //         verificationId: verificationId, smsCode: smsCode);
                      codeVerification = verificationId;
                      myShowToast(context, 'codeSent', Colors.green);
                      // Sign the user in (or link) with the credential
                      // await auth.currentUser?.updatePhoneNumber(credential);
                    },
                    // timeout: const Duration(seconds: 60),
                    codeAutoRetrievalTimeout: (String verificationId) {
                      // Auto-resolution timed out...
                      codeVerification = verificationId;
                      myShowToast(
                          context, 'codeAutoRetrievalTimeout', Colors.green);
                    },
                  );
                },
                text: 'Renvoyer le code',
              )),
        ],
      ),
    );
  }
}
