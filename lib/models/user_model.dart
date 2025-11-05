class UserModel {
  static UserModel? currentUser;
  String id;
  String email;
  String name;
  List<String> favouritesIds;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.favouritesIds,
  });
  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        favouritesIds: (json["favouritesIds"] as List<dynamic>)
            .map(
              (obj) => obj.toString(),
            )
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "favouritesIds": favouritesIds,
  };
}
