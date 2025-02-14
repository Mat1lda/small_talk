import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:small_talk/Model/ChatModel.dart';

import '../Screen/CreateGroup.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.name, required this.iconData});

  final String name;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroup()));
      // },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          radius: 23,
          child: Icon(iconData, color: Colors.white, size: 26,),
        ),
        title: Text(
          name ,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
    );
  }
}
