import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/profile_screen.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String imgUrl;
  final bool isVerified;
  final String userID;
  const UsersSearchResultsWidget(
      {Key? key,
        required this.name,
        required this.username,
        required this.bio,
        required this.imgUrl,
        required this.isVerified,
        required this.userID,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen(userID: userID)),
        );
      },
      leading: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
          ),
        ],
      ),
      title: Text(
        name,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w800,
          fontSize: 14,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bio,
            style: GoogleFonts.mulish(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            username,
            style: GoogleFonts.mulish(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      trailing: Column(
        children: [
          Icon(
            Icons.verified_rounded,
            size: 15,
            color: isVerified ? Colors.lightBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
