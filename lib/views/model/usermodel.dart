class UserModel {
  late final String name;
  late final String phone;
  late final String cartype;
  UserModel({required this.name, required this.phone, required this.cartype});
  UserModel.fromJson(
      Map<String, dynamic> json, this.name, this.phone, this.cartype) {
    name = json['name'];
    phone = json['phone'];
    cartype = json['cartype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messageroomid'] = name;
    data['participants'] = phone;
    data['cartype'] = cartype;

    return data;
  }
}
