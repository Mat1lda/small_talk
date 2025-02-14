import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:small_talk/Model/ChatModel.dart';
import 'package:small_talk/Screen/IndividualPage.dart';


class customCard extends StatelessWidget {

  final ChatModel chatModel;
  final ChatModel sourcechat;

  const customCard({super.key, required this.chatModel, required this.sourcechat});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Individualpage(chatModel: chatModel,sourcechat: sourcechat,),));
        },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  chatModel.isGroup? "assets/groups.svg" : "assets/person.svg",
                  height: 30,
                  width: 30,
                ),
              ),
              title: Text(
                chatModel.name
                ,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.done_all),
                  SizedBox(
                    width: 3,
                  ),
                  Text(chatModel.currentMessage)
                ],
              ),
              trailing: Text(
                chatModel.time,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 20, left: 80), child: Divider()),
          ],
        ),
      ),
    );
  }
}
