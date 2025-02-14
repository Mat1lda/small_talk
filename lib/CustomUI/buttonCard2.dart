import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_talk/Screen/homePage.dart';

import '../Model/ChatModel.dart';
import '../Screen/CreateGroup.dart';

class ButtonCard2 extends StatelessWidget{
  const ButtonCard2({super.key, required this.name, required this.iconData});
  final String name;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    late ChatModel sourceChat;
    List<ChatModel> chatmodels = [
      ChatModel(
        name: "Dev Stack",
        isGroup: false,
        currentMessage: "Hi Everyone",
        time: "4:00",
        icon: "person.svg",
        id: 1,
        status: '',
      ),
      ChatModel(
        name: "Kishor",
        isGroup: false,
        currentMessage: "Hi Kishor",
        time: "13:00",
        icon: "person.svg",
        id: 2,
        status: '',
      ),
      ChatModel(
        name: "Collins",
        isGroup: false,
        currentMessage: "Hi Dev Stack",
        time: "8:00",
        icon: "person.svg",
        id: 3,
        status: '',
      ),
      ChatModel(
        name: "Balram Rathore",
        isGroup: false,
        currentMessage: "Hi Dev Stack",
        time: "2:00",
        icon: "person.svg",
        id: 4,
        status: '',
      ),
    ];
    return InkWell(
      onTap: (){
        //sourceChat = chatmodels.removeAt(index);
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(chatmodels: chatmodels),));
      },
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
    ); ;
  }

}