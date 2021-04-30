class UserModel {
  int? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  // UserModel copyWith({
  //   int id,
  //   String name,
  //   String email,
  // }) {
  //   return UserModel(
  //     id ?? this.id,
  //     name ?? this.name,
  //     email ?? this.email,
  //   );
  // }

  // factory MuaModel.fromJson(Map<String, dynamic> json) =>
  //     _$MuaModelFromJson(json);
  // Map<String, dynamic> toJson() => _$MuaModelToJson(this);

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
