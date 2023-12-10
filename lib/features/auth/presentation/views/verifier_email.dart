import 'package:flutter/material.dart';

class VerifierEmailView extends StatelessWidget {
  const VerifierEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerifierEmailBody(),
    );
  }
}

class VerifierEmailBody extends StatefulWidget {
  const VerifierEmailBody({super.key});

  @override
  State<VerifierEmailBody> createState() => _VerifierEmailBodyState();
}

class _VerifierEmailBodyState extends State<VerifierEmailBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
