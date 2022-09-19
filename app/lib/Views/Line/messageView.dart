import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Components/footer.dart';
import '../../Constants/colors.dart';

class LineMessageView extends StatefulWidget {
  const LineMessageView({Key? key}) : super(key: key);

  @override
  State<LineMessageView> createState() => _LineMessageViewState();
}

class _LineMessageViewState extends State<LineMessageView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // drawer: SideMenu(),
        backgroundColor: bgColor,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: LineFooter(),
        body: Container(
          child: Center(),
        ),
      ),
    );
  }
}
