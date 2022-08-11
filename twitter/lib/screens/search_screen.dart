import 'package:flutter/material.dart';
import '../widgets/users_search_results_widget.dart';
import '../assets/user_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchcontroller = TextEditingController();
  @override
  void initState() {
    _searchcontroller = _searchcontroller;
    super.initState();
  }

  @override
  void dispose() {
    _searchcontroller = _searchcontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        leading: Padding(
          padding: const EdgeInsets.all(6),
          child: const CircleAvatar(
            foregroundImage: AssetImage('assets/images/avatar_1.jpg'),
            maxRadius: 10,
            //backgroundImage: Image('assets/images/avatar_1.jpg'),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          height: 38,
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search.."),
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.lightBlue,
              ))
        ],
      ),
      body: SafeArea(child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return UsersSearchResultsWidget(
            name: userList[index]['name'],
            imgUrl: userList[index]['imgUrl'],
            username: userList[index]['username'],
            bio: userList[index]['bio'],
            isVerified: userList[index]['isVerified'],
          );
        },
      )),
    );
  }
}