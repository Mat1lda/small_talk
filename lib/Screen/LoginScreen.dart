import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_talk/CustomUI/buttonCard.dart';
import 'package:small_talk/CustomUI/buttonCard2.dart';
import 'package:small_talk/Model/ChatModel.dart';
import 'package:small_talk/Screen/homePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Matilda1",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
      status: '',
    ),
    ChatModel(
      name: "Matilda2",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "person.svg",
      id: 2,
      status: '',
    ),
    ChatModel(
      name: "Matilda3",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
      id: 3,
      status: '',
    ),
    ChatModel(
      name: "Matilda4",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
      id: 4,
      status: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            sourceChat = chatmodels.removeAt(index);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(chatmodels: chatmodels, sourcechat: sourceChat,),));
          },
          child: ButtonCard(
              name: chatmodels[index].name, iconData: Icons.person),
        ),
      ),
    );
  }
}
