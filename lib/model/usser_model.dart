class UsserModel {
  String? name;
  String? phone;
  String? age;
  String? email;
  String? uid;

  UsserModel({this.name, this.phone, this.age, this.email, this.uid});

  factory UsserModel.formMap(map){
    return UsserModel(
      email: map['email'],
      age: map['age'],
      name: map['name'],
      phone: map['phone'],
      uid: map['uid'],
    );
  }

  Map<String, dynamic>toMap(){
    return{
      'email': email,
      'age': age,
      'name': name,
      'phone': phone,
      'uid': uid,
    };
  }

}
