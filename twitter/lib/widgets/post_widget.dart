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

          Container(
            width: (MediaQuery.of(context).size.width) * 0.35,
            margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
            alignment: AlignmentDirectional.topEnd,
            child:
            const Icon(
              Icons.more_horiz_outlined,
              size: 15,
              color: Colors.black,
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
                width: 175,
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
                //height: 10,
              ),
            ],
          )
        ],
      ),
    );

    // return Container(
    //   height: 200,
    //   child: Row(
    //     children: [
    //       Align(
    //         alignment: Alignment.topRight,
    //         child: CircleAvatar(
    //           radius: 20,
    //           backgroundImage: NetworkImage(imgUrl),
    //         ),
    //       ),
    //       // ignore: prefer_const_constructors
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Text(
    //                 name,
    //                 style: GoogleFonts.mulish(
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.black),
    //               ),
    //               SizedBox(
    //                 width: 10,
    //               ),
    //               Text(
    //                 username,
    //                 style: GoogleFonts.mulish(
    //                     fontSize: 12,
    //                     fontWeight: FontWeight.w800,
    //                     color: Colors.grey.shade400),
    //               ),
    //               SizedBox(
    //                 width: 100,
    //               ),
    //               IconButton(
    //                   onPressed: () {}, icon: const Icon(Icons.arrow_drop_down))
    //             ],
    //           ),
    //           Expanded(
    //             child: SizedBox(
    //               width: 300,
    //               height: 300,
    //               child: Text(post),
    //             ),
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 "#$tag",
    //                 style: GoogleFonts.mulish(
    //                   fontSize: 12,
    //                   color: Colors.blue,
    //                 ),
    //               ),
    //               // ignore: prefer_const_constructors
    //               SizedBox(
    //                 width: 210,
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}