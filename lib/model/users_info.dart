class UsersInfo {
  String name;
  String gender;
  String id;
  int height;
  int age;
  int weight;

  UsersInfo({
    required this.name,
    required this.gender,
    required this.height,
    required this.age,
    required this.weight,
    required this.id,
  });

   static UsersInfo fromJson(Map<String, dynamic> json) => UsersInfo(
        name: json['name'],
        gender: json['gender'],
        id: json['id'],
        height: json['height'],
        age: json['age'],
        weight: json['weight']
      );
    
    Map<String, dynamic> toJson() => {
        'name':name,
        'gender': gender,
        'id': id,
        'height': height,
        'age': age,
        'weight':weight,
      };
}
