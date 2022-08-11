import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostWidget extends StatelessWidget {
  final String name;
  final String username;
  final String post;
  final String imgUrl;
  final bool isVerified;

  const PostWidget({
    super.key,
    required this.name,
    required this.username,
    required this.post,
    required this.imgUrl,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
          ),
        ],
      ),
      title: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
            child:
              Text(
                name,
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
            child:
            Icon(
              Icons.verified_rounded,
              size: 15,
              color: isVerified ? Colors.lightBlue : Colors.transparent,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
            child: Text(
              username,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        children: [
          Text(
            post,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child:
                Icon(
                  Icons.mode_comment_outlined,
                  size: 18,
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                child:
                const Text('2'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                child:
                Icon(
                  Icons.loop_outlined,
                  size: 18,
                  color: Colors.grey.shade400,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                child:
                const Text('2'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                child:
                  Icon(
                    Icons.heart_broken_rounded,
                    size: 18,
                    color: Colors.grey.shade400,
                  ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
                child:
                  const Text('2'),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: AlignmentDirectional.topEnd,
                child: Icon(
                  Icons.share,
                  size: 18                                                           ,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          )
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.more_horiz_outlined,
            size: 20,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}