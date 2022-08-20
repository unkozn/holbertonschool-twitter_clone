class User {
  String key;
  String userID;
  String email;
  String userName;
  String displayName;
  String imageUrl;
  int followers;
  int following;
  List<String>? followersList;
  List<String>? followingList;

  User(

      this.key,
      this.userID,
      this.email,
      this.userName,
      this.displayName,
      this.imageUrl,
      this.followers,
      this.following,
      this.followersList,
      this.followingList,

  );

  User.fromJson(Map<dynamic, dynamic> map)
      : key = map['key'],
        userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        displayName = map['displayName'],
        imageUrl = map['imageUrl'],
        followers = map['followers'],
        following = map['following'],
        followersList = map['followersList'],
        followingList = map['followingList'];

  Map<String, dynamic> toJson() => {
    'key': key,
    'userID': userID,
    'email': email,
    'userName': userName,
    'displayName': displayName,
    'imageUrl': imageUrl,
    'followers': followers,
    'following': following,
    'followersList': followersList,
    'followingList': followingList,
  };
}

// factory User.fromJson(Map<dynamic, dynamic> map) {
//   return User(
//       key: map['key'],
//       userID: map['userID'],
//       email: map['email'],
//       userName: map['userName'],
//       displayName: map['displayName'],
//       imageUrl: map['imageUrl'],
//       followers: map['followers'],
//       following: map['following'],
//       followersList: map['followersList'],
//       followingList: map['followingList'],
//   );
// }