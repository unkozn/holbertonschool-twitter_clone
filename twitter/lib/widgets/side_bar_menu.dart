import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(20),
                child: Align(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://external-preview.redd.it/h_bEzTX4zcSf5IWJtLMk5OQWRxZ2mhVCMdLfN7AcTLQ.jpg?auto=webp&s=41ec412012b9b51203c15025cc9ef49872bc9287'),
                            radius: 30.0,
                          ),
                          SizedBox(
                            width: 200,
                          )
                        ],
                      ),
                      const Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 5),
                          title: Text(
                            "User Name",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: const Text("0 Followers"),
                          ),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: const Text("0 Following")),
                        ],
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
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
