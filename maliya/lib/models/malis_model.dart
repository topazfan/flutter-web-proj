class MalisModel {
  String? name;
  String? verb;
  String? description;

  MalisModel({this.name, this.verb, this.description});

  MalisModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    verb = json['verb'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['verb'] = this.verb;
    data['description'] = this.description;
    return data;
  }
}
