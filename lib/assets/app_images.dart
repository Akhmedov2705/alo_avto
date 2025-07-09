class AppImages {
  String _base(String value) => "assets/images/$value.png";

  String get on1 => _base("on1");
  String get on2 => _base("on2");
  String get logoBlack => _base("logo_black");
  String get logoWhite => _base("logo_white");
}
