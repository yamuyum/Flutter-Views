import 'package:flutter/material.dart';

import '../Components/footer.dart';
import '../Components/header.dart';
import '../Components/sideMenu.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // スワイプ戻しを無効化
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: Header(),
        drawer: SideMenu(),
        // これやると透ける
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Footer(),
        body: Center(
          child: Text(
            'Hello World!',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
