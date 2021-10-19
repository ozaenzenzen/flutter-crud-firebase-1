class ProfileModel {
  var id;
  String? name;
  String? title;

  String? citizen;
  String? aboutMe;

  ProfileModel({
    this.id,
    this.name,
    this.title,
    this.citizen,
    this.aboutMe,
  });

  ProfileModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    title = json['title'].toString();
    citizen = json['citizen'].toString();
    aboutMe = json['aboutMe'].toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['citizen'] = this.citizen;
    data['aboutMe'] = this.aboutMe;
    return data;
  }
}
