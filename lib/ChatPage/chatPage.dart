import 'package:small_talk/CustomUI/customCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_talk/Model/ChatModel.dart';
import 'package:small_talk/Screen/selectContact.dart';



class chatPage extends StatefulWidget {
  const chatPage({super.key, required this.chatmodels, required this.sourcechat});
  final List<ChatModel> chatmodels;
  final ChatModel sourcechat;
  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Matilda",
        icon: "person.svg",
        isGroup: false,
        time: "4:05",
        currentMessage: "1", status: '', id: 1, ),
    ChatModel(
        name: "Matilda2",
        icon: "groups.svg",
        isGroup: true,
        time: "5:05",
        currentMessage: "2", status: '', id: 2, ),
    ChatModel(
        name: "Matilda3",
        icon: "groups.svg",
        isGroup: true,
        time: "6:05",
        currentMessage: "3", status: '', id: 3, ),
    ChatModel(
        name: "Matilda4",
        icon: "person.svg",
        isGroup: false,
        time: "7:05",
        currentMessage: "4", status: '', id: 4, ),
    ChatModel(
        name: "Matilda5",
        icon: "person.svg",
        isGroup: false,
        time: "8:05",
        currentMessage: "5", status: '', id: 5, ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectContact(),));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
          itemBuilder: (context, index) => customCard(
            chatModel: widget.chatmodels[index], sourcechat: widget.sourcechat,
          ),
      )
    );
  }
}
