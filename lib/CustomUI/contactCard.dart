import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:small_talk/Model/ChatModel.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({super.key, required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(children: [
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
            bottom: 4,
            right: 5,
            child: contact.selected
                ? CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 11,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                : Container(),
          ),
        ]),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
