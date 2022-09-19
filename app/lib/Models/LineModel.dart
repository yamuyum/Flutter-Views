import 'User.dart';

/**
 * Line-メッセージ用モデル <br>
 * ・_content :内容 <br>
 * ・_sendUser:送信者 <br>
 * ・_sendAt:送信日時 <br>
 * ・_isRead:既読チェック<br>
 *
 * ※
 */
class LineMessageModel {
  String _content;
  User _sendUser;
  DateTime _sendAt;
  // // firestoreとの互換
  // Timestamp createdAtTimestamp = Timestamp.fromDate(createdAt);
  bool _isRead;

  LineMessageModel(
    this._content,
    this._sendUser,
    this._sendAt,
    this._isRead,
  );

  // Getter
  String get content => _content;
  User get sendUser => _sendUser;
  DateTime get sendAt => _sendAt;
  bool get isRead => _isRead;

  // Setter
  set content(String s) {
    _content = s;
  }

  set sendUser(User s) {
    _sendUser = s;
  }

  set sendAt(DateTime s) {
    _sendAt = s;
  }

  set isRead(bool s) {
    _isRead = s;
  }
}

/**
 * Line-トークルーム用モデル <br>
 * ・_title :タイトル <br>
 * ・_thumbnail:サムネ <br>
 * ・_latestContent :タイトル <br>
 * ・_latestDate:最終受信日時 <br>
 * ・_unReadCount:未読数 <br>
 */
class LineTalkRoomModel {
  String _title, _thumbnail;
  String _latestContent = "";
  DateTime _latestDate = DateTime.now();
  int _unReadCount = 0;
  // User _user;
  List<LineMessageModel> _talkMessages = [];

  LineTalkRoomModel(
    this._title,
    this._thumbnail,
  );

  // Getter
  String get title => _title;
  String get latestContent => _latestContent;
  String get thumbnail => _thumbnail;
  DateTime get latestDate => _latestDate;
  int get unReadCount => _unReadCount;

  // Setter
  set title(String s) {
    _title = s;
  }

  set latestContent(String s) {
    _latestContent = s;
  }

  set thumbnail(String s) {
    _thumbnail = s;
  }

  set latestDate(DateTime s) {
    _latestDate = s;
  }

  set unReadCount(int s) {
    _unReadCount = s;
  }
}
