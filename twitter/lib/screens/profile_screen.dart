import 'package:flutter/material.dart';
import 'package:twitter/models/post.dart';
import '../models/user.dart';
import '../providers/auth_state.dart';
import '../assets/user_list.dart';
import '../widgets/post_widget.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String userID;
  const ProfileScreen({Key? key, required this.userID}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    getAsync();
  }

  var user;
  var auth;
  var postsList;

  Future<void> getAsync() async {
    try {
      user = await User().getUserByID(widget.userID);
      auth = await Auth().getCurrentUserModel();
      postsList =  await Post().getCurrentUserPosts(user.userID);
    } catch (e) {
      print(e);
    }
    if (mounted) setState(() {});
  }
  String buttonText = 'None';

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: User().getUserByID(widget.userID),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Scaffold(
            backgroundColor: Color.fromARGB(255, 247, 246, 246),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (User == null || auth == null) {
          return const Scaffold(
            backgroundColor: Color.fromARGB(255, 247, 246, 246),
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          User data = snapshot.data as User;


          var size = MediaQuery.of(context).size;

          if (data.userID == auth.userID) {
            buttonText = 'Edit profile';
          } else if (data.followersList.contains(auth.userID)) {
            buttonText = 'Unfollow';
          } else {
            buttonText = 'Follow';
          }

          return Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                // ************* C O V E R   I M A G E *************
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage(data.coverImgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // ************* P R O F I L E   I N F O *************
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            child: CircleAvatar(
                              radius: 43,
                              backgroundImage: NetworkImage(data.imageUrl),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                switch (buttonText) {
                                  case 'Follow':
                                    User().setFollow(auth, data).then((_) {
                                      setState(() {
                                        //setstate
                                      });
                                    });
                                    buttonText = 'Unfollow';
                                    print('Pressed Follow');
                                    break;
                                  case 'Unfollow':
                                    User().delFollow(auth, data).then((_) {
                                      setState(() {
                                        //setstate
                                      });
                                    });
                                    buttonText = 'Follow';
                                    print('Pressed Unfollow');
                                    break;
                                  case 'Edit profile':
                                    print('Pressed Edit Profile');
                                    editProfile(auth.userID);
                                    break;
                                  default:
                                    buttonText = 'None';
                                }
                              });
                            },  //
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ))),
                            child: Text(
                              buttonText,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data.displayName,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '@${data.userName}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data.bio,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_rounded, size: 15),
                          Text(
                            ' Joined August 2022',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            data.following.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Following',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            data.followers.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Followers',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                      // ************* T A B S *************
                      SizedBox(
                        width: 400.0,
                        height: 300.0,
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          home: DefaultTabController(
                            length: 4,
                            child: Scaffold(
                              appBar: PreferredSize(
                                preferredSize: size * 0.05,
                                child: Container(
                                  child: SafeArea(
                                    child: Column(
                                      children: const [
                                        TabBar(
                                          unselectedLabelColor: Colors.black,
                                          indicatorColor: Colors.blue,
                                          labelColor: Colors.blue,
                                          isScrollable: true,
                                          tabs: [
                                            Text('Tweets'),
                                            Text('Tweets & replies'),
                                            Text('Media'),
                                            Text('Likes'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              body: TabBarView(
                                children: [
                                  Column(
                                    children: [
                                      postsList == null ? Text('Tweets Page') :
                                      Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          //   physics: const BouncingScrollPhysics(
                                          //   parent: AlwaysScrollableScrollPhysics(),
                                          // ),
                                          itemCount: postsList.length,
                                          itemBuilder: (context, index) {
                                          return PostWidget(post: postsList[index]);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: const [ Text('Tweets & replies Page')],
                                  ),
                                  Column(
                                    children: const [ Text('Media Page')],
                                  ),
                                  Column(
                                    children: const [ Text('Likes Page')],
                                  ),
                                ],
                              ),
                            ) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  editProfile(userID) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditProfileScreen(userID: userID)),
  );
}


