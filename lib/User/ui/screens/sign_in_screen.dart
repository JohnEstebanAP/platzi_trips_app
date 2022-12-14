import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return singInGoogleUi();
  }

  Widget singInGoogleUi() {
    return Scaffold(
      body: Stack(
        children: const [
          GradientBack(
            height: double.infinity,
          )
        ],
      ),
    );
  }
}
