import 'dart:ui';

import 'package:flutter/material.dart';
import '../Constants/colors.dart';
import '../Constants/constants.dart';
import '../Constants/responsive.dart';
import '../Views/homeView.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        // サイドメニューとかぶるからいらない
        // leading: IconButton(
        //   onPressed: () {
        //   },
        //   icon: Icon(Icons.menu),
        // ),
        title: Text('ホーム'),
        actions: [
          if (Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.android_outlined),
              onPressed: () {},
            ),
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
          ProfileCard(),
        ]);
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(DEFAULTPADDING / 4),
      padding: EdgeInsets.symmetric(
        horizontal: DEFAULTPADDING,
        // vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFfbfcff),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.all(DEFAULTPADDING * 0.75),
              margin: EdgeInsets.symmetric(horizontal: DEFAULTPADDING / 2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(Icons.search)
              // child: SvgPicture.asset("assets/icons/Search.svg"),
              ),
        ),
      ),
    );
  }
}

class LineHeader extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        // サイドメニューとかぶるからいらない
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        // ),
        backgroundColor: bgWhiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          'ホーム',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.playlist_add_check),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.crop_square_rounded),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.add_comment_outlined),
            onPressed: () {},
          ),
        ]);
  }
}
