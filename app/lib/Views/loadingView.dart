import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/footer.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    // スワイプ戻しを無効化
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Footer(),
        body: Center(
            child: Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Colors.green,
                ))),
      ),
    );
  }
}
