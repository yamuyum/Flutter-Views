import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/header.dart';
import '../Constants/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: bgColor,
        // これやると透ける
        extendBodyBehindAppBar: true,
        body: Center(
          child: Text(
            'Hello ssss!',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
