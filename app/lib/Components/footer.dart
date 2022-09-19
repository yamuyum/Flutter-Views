import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterview/Views/Line/allMessagesView.dart';
import 'package:flutterview/Views/Line/messageView.dart';
import 'package:flutterview/Views/loadingView.dart';
import '../Views/homeView.dart';

class FooterListModel {
  final String label, nextPage;
  final Widget nextWidget;
  final Widget icon;

  FooterListModel(
      {required this.label,
      required this.nextWidget,
      required this.nextPage,
      required this.icon});
}

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

class LineFooter extends StatefulWidget {
  const LineFooter({Key? key}) : super(key: key);

  @override
  State<LineFooter> createState() => _LineFooterState();
}

class _LineFooterState extends State<LineFooter> {
  int _selectedIndex = 1;

  // 表示する Widget の一覧
  List<FooterListModel> _footerList = [
    FooterListModel(
        label: "ホーム",
        nextWidget: LineAllMessagesView(),
        nextPage: "home",
        icon: Badge(
          badgeContent: Text(
            '',
            style: TextStyle(
              fontSize: 1,
              color: Colors.white,
            ),
          ),
          badgeColor: Colors.red, //バッジの背景色
          child: Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
        )),
    FooterListModel(
        label: "トーク",
        nextWidget: LineAllMessagesView(),
        nextPage: "talk",
        icon: Badge(
          badgeContent: Text(
            '99+',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          badgeColor: Colors.red, //バッジの背景色
          child: Icon(
            Icons.insert_comment_outlined,
            color: Colors.black,
          ),
        )),
    FooterListModel(
        label: "VOOM",
        nextWidget: HomeView(),
        nextPage: "voom",
        icon: Icon(
          Icons.send_outlined,
          color: Colors.black,
        )),
    FooterListModel(
        label: "ニュース",
        nextWidget: HomeView(),
        nextPage: "news",
        icon: Icon(
          Icons.list_alt_outlined,
          color: Colors.black,
        )),
    FooterListModel(
        label: "ウォレット",
        nextWidget: HomeView(),
        nextPage: "wallet",
        icon: Icon(
          Icons.account_balance_wallet_outlined,
          color: Colors.black,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
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
