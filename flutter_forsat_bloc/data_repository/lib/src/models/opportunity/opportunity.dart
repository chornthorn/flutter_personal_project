import 'package:data_repository/src/models/category/category.dart';
import 'package:data_repository/src/models/country/country.dart';
import 'package:data_repository/src/models/user/user.dart';

class Opportunity {
  int id;
  String title;
  Category category;
  Country country;
  String deadline;
  String organizer;
  User createdBy;
  String createdAt;
  String updatedAt;

  Opportunity(
      {this.id,
        this.title,
        this.category,
        this.country,
        this.deadline,
        this.organizer,
        this.createdBy,
        this.createdAt,
        this.updatedAt});

  Opportunity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    deadline = json['deadline'];
    organizer = json['organizer'];
    createdBy = json['createdBy'] != null
        ? new User.fromJson(json['createdBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    data['deadline'] = this.deadline;
    data['organizer'] = this.organizer;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
