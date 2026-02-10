class Country {
  final String name;
  final String dialCode;
  final String flag;

  Country({required this.name, required this.dialCode, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    final idd = json['idd'];
    final root = idd?['root'] ?? '';
    final suffix = (idd?['suffixes'] != null && idd['suffixes'].isNotEmpty)
        ? idd['suffixes'][0]
        : '';

    return Country(
      name: json['name']['common'] ?? '',
      dialCode: '$root$suffix',
      flag: json['flags']['png'],
    );
  }
}
