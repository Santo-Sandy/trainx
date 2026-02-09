class Countrys {
  final String name;
  final String dialCode;
  final String flag;

  Countrys({required this.name, required this.dialCode, required this.flag});

  factory Countrys.fromJson(Map<String, dynamic> json) {
    final idd = json['idd'];
    final root = idd?['root'] ?? '';
    final suffix = (idd?['suffixes'] != null && idd['suffixes'].isNotEmpty)
        ? idd['suffixes'][0]
        : '';

    return Countrys(
      name: json['name']['common'] ?? '',
      dialCode: '$root$suffix',
      flag: json['flags']['png'],
    );
  }
}
