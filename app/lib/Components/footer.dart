import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterview/Views/loadingView.dart';

import '../Views/homeView.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // 表示する Widget の一覧
    List<FooterListModel> _footerList = [
      FooterListModel(
          label: "home",
          nextWidget: HomeView(),
          nextPage: "home",
          icon: Icon(Icons.home)),
      FooterListModel(
          label: "loading",
          nextWidget: LoadingView(),
          nextPage: "loading",
          icon: Icon(Icons.downloading)),
      FooterListModel(
          label: "chat",
          nextWidget: HomeView(),
          nextPage: "chat",
          icon: Icon(Icons.chat))
    ];
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: [
        for (var footerItem in _footerList)
          BottomNavigationBarItem(
              icon: footerItem.icon, label: footerItem.label),
      ],
      onTap: (int index) {
        if (_selectedIndex != index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _footerList[index].nextWidget,
              ));
        } else {
          print("同じページ");
        }
      },
    );
  }
}

class FooterListModel {
  final String label, nextPage;
  final Widget nextWidget;
  final Icon icon;

  FooterListModel(
      {required this.label,
      required this.nextWidget,
      required this.nextPage,
      required this.icon});
}
