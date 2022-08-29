import 'package:flutter/material.dart';
import 'package:twitter/main.dart';
import 'package:twitter/screens/signin_screen.dart';
import '../models/user.dart';
import '../providers/auth_state.dart';
import '../screens/profile_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {

  @override
  void initState() {
    super.initState();
    getAsync();
  }

  User? user;

  Future<void> getAsync() async {
    try {
      user = await Auth().getCurrentUserModel();
    } catch (e) {
      print(e);
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Drawer(
        child: ListView(
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Align(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  user!.imageUrl
                              ),
                              radius: 30.0,
                            ),

                        ),
                         Container(
                           margin: EdgeInsets.only(top: 5),
                           alignment: AlignmentDirectional.topStart,
                           child: Text(
                             user!.displayName,
                             style: TextStyle(
                               color: Colors.grey.shade400,
                               fontSize: 17,
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                         ),
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            '@${user!.userName}',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.topStart,
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                '${user!.followers} Followers  ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${user!.following} Following  ',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen(userID: user!.userID)),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Lists',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Bookmark',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.flash_on),
              title: const Text('Moments',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Settings and privacy',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Help Center',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
              onTap: () {
                Auth().logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              }
            ),
          ],
        ),
      );
    }

  }
}
