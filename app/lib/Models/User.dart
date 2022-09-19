class User {
  String _name, _thumbnail;

  User(this._name, this._thumbnail);

  // Getter
  String get name => _name;
  String get thumbnail => _thumbnail;

  // Setter
  set name(String s) {
    _name = s;
  }

  set thumbnail(String s) {
    _thumbnail = s;
  }
}
