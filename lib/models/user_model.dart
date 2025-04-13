class UserModel {
  late String id;
  late String fristName;
  late String lastName;
  late String email;
  late String phone;

  UserModel({
    required this.id,
    required this.fristName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String , dynamic> json){
    return UserModel(
      id: json["id"] ?? "",
      fristName: json["fristName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],

    );
  }


  Map<String , dynamic> toJson(){
    return{
      "id" : id,
      "fristName" : fristName,
      "lastName" : lastName,
      "email" : email,
      "phone" : phone,

    };
  }
}