import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:small_talk/Model/ChatModel.dart';

class AvatarCard extends StatelessWidget{


  const AvatarCard({super.key, required this.contact});
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 23,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 11,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 18,
                ),
              )
            ),
          ]),
          Text(contact.name,style: TextStyle(fontSize: 13),)
        ],
      ),
    );
  }
  
}