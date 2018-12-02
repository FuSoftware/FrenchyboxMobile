class User {
  int uid;
  String username;
  String colorCode;
  int color;
  String avatarUrl;
  String avatar;
  bool isActive;
  Map<String, bool> rights;

  User.fromJson(dynamic oJson){
    this.uid = int.parse(oJson['uid']);
    this.username = oJson['username'];
    this.colorCode = oJson['color'];
    this.color = int.parse('FF${this.colorCode}', radix: 16);
    this.avatar = oJson['avatar'];
    
    if(avatar != ''){
      this.avatarUrl = "http://frenchy-ponies.fr/download/file.php?avatar=$avatar";
    }else{
      this.avatarUrl = '';
    }

    this.isActive = oJson['isActive'];
    this.rights = Map.from(oJson['rights']);
  }
}