class Countrys {
  String name;
  String flag;
  String code;
  String dialcode;

  Countrys({
    required this.name,
    required this.flag,
    required this.code,
    required this.dialcode,
  });

  factory Countrys.fromJson(Map<String, dynamic> json) {
    return Countrys(
      name: json['name'],
      flag: json['flag'],
      code: json['code'],
      dialcode: json['dial_code'],
    );
  }
}
