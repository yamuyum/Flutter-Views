import 'package:flutter/material.dart';
import 'package:flutterview/Views/Line/allMessagesView.dart';
import 'package:flutterview/Views/Starbucks/homeView.dart';
import 'package:flutterview/Views/homeView.dart';
import 'package:flutterview/Views/loginView.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.home),
//              画像でもOK
              // child: Image.asset("assets/images/●●"),
            ),
            DrawerListTile(
              title: "Home",
              icon: Icons.home,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(),
                    ));
              },
            ),
            DrawerListTile(
              title: "Login",
              icon: Icons.login,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ));
              },
            ),
            DrawerListTile(
              title: "Line",
              icon: Icons.message,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LineAllMessagesView(),
                    ));
              },
            ),
            DrawerListTile(
              title: "StarBucks",
              icon: Icons.local_drink,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StarbucksHomeView(),
                    ));
              },
            ),
            // svgでもいける
            // DrawerListTile(
            //   title: "Store",
            //   svgSrc: "assets/icons/menu_store.svg",
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
