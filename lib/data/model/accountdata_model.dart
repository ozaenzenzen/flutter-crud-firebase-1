class AccountModel {
  var id;
  String? name;
  String? title;
  String? email;
  String? citizen;
  String? aboutMe;

  AccountModel({
    this.id,
    this.name,
    this.title,
    this.email,
    this.citizen,
    this.aboutMe,
  });

  AccountModel.fromJson(Map<dynamic, dynamic> json) {
  // AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    title = json['title'].toString();
    email = json['email'].toString();
    citizen = json['citizen'].toString();
    aboutMe = json['aboutMe'].toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['email'] = this.email;
    data['citizen'] = this.citizen;
    data['aboutMe'] = this.aboutMe;
    return data;
  }
}
