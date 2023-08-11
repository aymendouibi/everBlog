class User {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['name']??'';
    email = json['email']??'';
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id??0;
    data['name'] = name??'';
    data['email'] = email??'';
    data['created_at'] = createdAt??'';
    data['updated_at'] = updatedAt??'';
    return data;
  }
}