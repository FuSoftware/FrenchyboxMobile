class User {
  int uid;
  String username;
  String color;
  String avatarUrl;
  String avatar;
  bool isActive;
  Map<String, bool> rights;

  User.fromJson(dynamic oJson){
    this.uid = oJson['uid'];
    this.username = oJson['username'];
    this.color = oJson['color'];
    this.avatar = oJson['avatar'];
    this.avatarUrl = "http://frenchy-ponies.fr/download/file.php?avatar=$avatar";

    this.isActive = oJson['isActive'];
    this.rights = oJson['rights'];
  }
}