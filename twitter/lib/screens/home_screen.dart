import 'package:flutter/material.dart';
import 'package:twitter/widgets/side_bar_menu.dart';
import 'package:twitter/widgets/bottom_bar_menu.dart';
import 'package:twitter/widgets/post_widget.dart';
import '../assets/post_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const SideBarMenu(),
      body: SafeArea(child: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          return PostWidget(
            name: postList[index]['name'],
            imgUrl: postList[index]['imgUrl'],
            username: postList[index]['username'],
            post: postList[index]['post'],
            isVerified: postList[index]['isVerified'],
          );
        },
      ),
      ),
    );
  }
}
