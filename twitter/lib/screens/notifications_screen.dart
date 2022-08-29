import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/auth_state.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  void initState() {

    super.initState();
    getAsync();
  }

  var user;

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
    if (user == null) return const Center(child: CircularProgressIndicator());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        leading: Padding(
          padding: const EdgeInsets.all(6),
          // ignore: prefer_const_constructors
          child: CircleAvatar(
            maxRadius: 10,
            // ignore: prefer_const_constructors
            backgroundImage: NetworkImage(user.imageUrl),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        title: Text(
          'Notifications',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
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
      body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 200,
                  ),
                  // ignore: prefer_const_constructors
                  Center(
                    child: Text(
                      "No Notifications Yet",
                      style: GoogleFonts.mulish(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}