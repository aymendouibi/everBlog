import 'package:everblog/model/user.dart';

class Blog {
  int? id;
  String? title;
  String? content;
  String? image;
  List<String>? category;
  int? userId;
  int? viewCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Blog(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.category,
      this.userId,
      this.viewCount,
      this.createdAt,
      this.updatedAt,
      this.user});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'] ?? "";
    category = json['category'].cast<String>();
    userId = json['user_id'];
    viewCount = json['view_count'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['category'] = category;
    data['user_id'] = userId;
    data['view_count'] = viewCount;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}