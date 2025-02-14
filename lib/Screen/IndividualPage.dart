import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:small_talk/CustomUI/OwnMessageCard.dart';
import 'package:small_talk/CustomUI/ReplyCard.dart';
import 'package:small_talk/Model/ChatModel.dart';
import "package:socket_io_client/socket_io_client.dart" as IO;

import '../Model/MessageModel.dart';

class Individualpage extends StatefulWidget {
  const Individualpage(
      {super.key, required this.chatModel, required this.sourcechat});

  final ChatModel chatModel;
  final ChatModel sourcechat;

  @override
  State<Individualpage> createState() => _IndividualpageState();
}

class _IndividualpageState extends State<Individualpage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  final _mycontroller = TextEditingController();
  late IO.Socket socket;

  bool sendButton = false;
  List<MessageModel> messages = [];
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show = false;
      }
    });
  }

  //192.168.0.103
  void connect() {
    socket = IO.io("http://192.168.0.103:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourcechat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message, time: DateTime.now().toString().substring(10, 16));
    print(messages);
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(
          "assets/bg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            backgroundColor: Color(0xFF075E54),
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Last seen today 18:03",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  )
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: const Text("View Contact"),
                        value: "View Contact",
                      ),
                      PopupMenuItem(
                        child: const Text("Mute Notification"),
                        value: "Mute Notification",
                      )
                    ];
                  })
            ],
          ),
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WillPopScope(
                onWillPop: () {
                  // dung de quay lai ma kh thoat han ra ngoai
                  if (show) {
                    setState(() {
                      show = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                },
                child: Column(
                  children: [
                    Expanded(
                      //height: MediaQuery.of(context).size.height - 140,
                      child: ListView.builder(
                        itemCount: messages.length + 1,
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if(index == messages.length){
                            return Container(
                              height: 70,
                            );
                          }
                          if (messages[index].type == 'source') {
                            return OwnMessageCard(
                              messages: messages[index].message,
                              time: messages[index].time
                            );
                          } else {
                            return ReplyCard(
                              messages: messages[index].message,
                                time: messages[index].time
                            );
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      //alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 70,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width - 55,
                                    child: Card(
                                        margin: EdgeInsets.only(
                                            left: 2, right: 2, bottom: 8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: TextFormField(
                                          onChanged: (value) {
                                            if (value.length > 0) {
                                              setState(() {
                                                sendButton = true;
                                              });
                                            } else {
                                              setState(() {
                                                sendButton = false;
                                              });
                                            }
                                          },
                                          controller: _mycontroller,
                                          focusNode: focusNode,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          keyboardType: TextInputType.multiline,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(10),
                                              // prefixIcon: IconButton(
                                              //     onPressed: () {
                                              //       focusNode.unfocus();
                                              //       focusNode.canRequestFocus =
                                              //           false;
                                              //       setState(() {
                                              //         show = true;
                                              //       });
                                              //     },
                                              //     icon:
                                              //         Icon(Icons.emoji_emotions)),
                                              hintText: "Type a message",
                                              suffixIcon: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                          backgroundColor:
                                                              Colors.transparent,
                                                          context: context,
                                                          builder: (context) =>
                                                              bottomSheet(),
                                                        );
                                                      },
                                                      icon: const Icon(
                                                          Icons.attach_file)),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                          Icons.camera_alt)),
                                                ],
                                              )),
                                        )),
                                  ),
                                  // Padding(padding: EdgeInsets.only(bottom: 8),
                                  //   child: ElevatedButton(onPressed: (){}, child: Icon(Icons.mic), style: ,),
                                  // )
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xFF128C7E),
                                      radius: 25,
                                      child: IconButton(
                                        icon: Icon(
                                          sendButton ? Icons.send : Icons.mic,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          if (sendButton) {
                                            _scrollController.animateTo(
                                                _scrollController
                                                    .position.maxScrollExtent,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.easeOut);
                                            sendMessage(
                                                _mycontroller.text,
                                                widget.sourcechat.id,
                                                widget.chatModel.id
                                            );
                                            _mycontroller.clear();
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              show
                                  ? EmojiPicker(
                                      onEmojiSelected: (category, emoji) {
                                        _mycontroller.text =
                                            _mycontroller.text + emoji.emoji;
                                        print(emoji);
                                      },
                                      config: Config(
                                          searchViewConfig: SearchViewConfig(
                                              backgroundColor:
                                                  Color(0xFF075E54))),
                                    )
                                  : Container()
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.pink, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              color: Colors.white,
              icon,
              size: 29,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(text)
      ],
    );
  }
}

// Widget emojiselect() {
//   return EmojiPicker(
//       onEmojiSelected: (emoji, category) {
//         _mycontroller.text = _mycontroller.text + emoji.emoji;
//     print(emoji);
//   });
// }
