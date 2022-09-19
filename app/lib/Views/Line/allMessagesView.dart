import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterview/Components/footer.dart';
import 'package:flutterview/Models/User.dart';
import 'package:intl/intl.dart';
import '../../Components/header.dart';
import '../../Constants/colors.dart';
import '../../Constants/constants.dart';
import '../../Models/LineModel.dart';

class LineAllMessagesView extends StatefulWidget {
  const LineAllMessagesView({Key? key}) : super(key: key);

  @override
  State<LineAllMessagesView> createState() => _LineAllMessagesViewState();
}

class _LineAllMessagesViewState extends State<LineAllMessagesView> {
  @override
  void initState() {
    // 画面構成時実行
    super.initState();
    print("initState");
    initializeMyTalk();
  }

  List<LineTalkRoomModel> _myTalkRoomList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: LineHeader(),
        // drawer: SideMenu(),
        // backgroundColor: bgBlackColor,
        // extendBodyBehindAppBar: true,
        bottomNavigationBar: LineFooter(),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // 検索フォーム
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      fillColor: Color(0xFFF3F3F3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(DEFAULTPADDING * 0.75),
                          margin: EdgeInsets.symmetric(
                              horizontal: DEFAULTPADDING / 2),
                          // decoration: BoxDecoration(
                          //   color: primaryColor,
                          //   borderRadius:
                          //       const BorderRadius.all(Radius.circular(10)),
                          // ),
                          child: Icon(
                            Icons.qr_code_scanner_outlined,
                            color: Color(0xFF9E9E9E),
                          ),
                          // child: SvgPicture.asset("assets/icons/Search.svg"),
                        ),
                      ),
                    ),
                  ),
                  // 広告
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 85,
                      child: Row(
                        children: [
                          Container(
                            // alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'タイトル',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  '広告説明',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Container(
                            // width: 65,
                            height: 75,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              // BoxShapeをcircleにしているので丸型になってほしい
                              // shape: BoxShape.circle,
                              color: bgWhiteColor,
                            ),
                            child:
                                // ネットにある場合はこれ
                                // Image.network(src),
                                Image.asset(
                                    "assets/icons/Google_login_pressed.png"),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.block_flipped,
                                  size: 15,
                                  color: Color(0xFF9E9E9E),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                // Expanded(child: SizedBox()),
                                Icon(
                                  Icons.menu_outlined,
                                  size: 15,
                                  color: Color(0xFF9E9E9E),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // メッセ内容
                  for (var talkRoom in _myTalkRoomList)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 0.5,
                      ),
                      child: LineMessageCard(
                        name: talkRoom.title,
                        lastMessage: talkRoom.latestContent,
                        thumbnail: talkRoom.thumbnail,
                        latestDate: talkRoom.latestDate,
                        unRead: talkRoom.unReadCount,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initializeMyTalk() async {
    _myTalkRoomList = [
      LineTalkRoomModel("名前", "assets/images/freeicon_1.jpg"),
      LineTalkRoomModel("名前2", "assets/images/freeicon_2.jpg"),
      LineTalkRoomModel("名前aaaa", "assets/images/freeicon_3.jpg"),
      LineTalkRoomModel("おなまえです", "assets/images/freeicon_4.jpg"),
    ];

    // 本来ならメッセージ内容取得
    // 本来はtalkRoomの「_talkMessages」にいれる
    // →最新のもののみRoomに入れる
    _myTalkRoomList[0].latestContent = "こんにちは！！！";
    _myTalkRoomList[0].latestDate = DateTime(2022, 9, 8, 12, 12);
    _myTalkRoomList[0].unReadCount = 3;

    _myTalkRoomList[1].latestContent = "やっほぉぉぉぉぉぉぉぉぉぉぉぉ";
    _myTalkRoomList[1].latestDate = DateTime(2022, 9, 1, 16, 10);
    _myTalkRoomList[1].unReadCount = 108;

    _myTalkRoomList[2].latestContent = "今日ひま？";
    _myTalkRoomList[2].latestDate = DateTime(2021, 1, 1, 12, 12);
    _myTalkRoomList[2].unReadCount = 37;

    _myTalkRoomList[3].latestContent = "初めまして。昨日はありがとうございました。よろしくお願いいたします。";
    _myTalkRoomList[3].latestDate = DateTime(2020, 10, 12, 12, 12);
    _myTalkRoomList[3].unReadCount = 0;

    // →状態保存かローカル保存がよき
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
}

class LineMessageCard extends StatelessWidget {
  final name, lastMessage, thumbnail, latestDate;
  final int unRead;

  const LineMessageCard({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.thumbnail,
    required this.latestDate,
    required this.unRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 65,
          height: 65,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            // BoxShapeをcircleにしているので丸型になってほしい
            shape: BoxShape.circle,
            color: bgWhiteColor,
          ),
          child:
              // ネットにある場合はこれ
              // Image.network(src),
              Image.asset(thumbnail),
        ),
        Container(
          width: 170,
          // alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              Text(
                lastMessage,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Color(0xFF9E9E9E),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox()),
        Container(
          child: Column(
            children: [
              Text(
                // latestDate.toString(),
                DateFormat('yyyy-MM-dd').format(latestDate),
                style: TextStyle(fontSize: 10),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.antiAlias,
                  decoration: desideDesignUnReadCount(unRead),
                  child: countUnReadCount(unRead),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration desideDesignUnReadCount(int unRead) {
    if (unRead == 0) {
      return BoxDecoration(
        // BoxShapeをcircleにしているので丸型になってほしい
        shape: BoxShape.circle,
        // color: Color(0xFF74FC72),
      );
    } else {
      return BoxDecoration(
        // BoxShapeをcircleにしているので丸型になってほしい
        shape: BoxShape.circle,
        color: Color(0xFF74FC72),
      );
    }
  }

  Text countUnReadCount(int unRead) {
    if (unRead == 0) {
      return Text('');
    } else if (99 < unRead) {
      return Text(
        '99+',
        style: TextStyle(
          color: Color(0xFFfbfcff),
        ),
      );
    } else {
      return Text(
        '${unRead}',
        style: TextStyle(
          color: Color(0xFFfbfcff),
        ),
      );
    }
  }
}
