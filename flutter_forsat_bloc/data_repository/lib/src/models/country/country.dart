class Country {
  int id;
  String name;
  String phoneCode;
  String countryCode;

  Country({this.id, this.name, this.phoneCode, this.countryCode});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneCode = json['phoneCode'];
    countryCode = json['CountryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneCode'] = this.phoneCode;
    data['CountryCode'] = this.countryCode;
    return data;
  }
}