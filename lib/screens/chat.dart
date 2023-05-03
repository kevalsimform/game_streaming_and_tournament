import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/models/message.dart';

class Chat extends StatefulWidget {
  final String chatWith;
  final String imageUrl;

  const Chat({Key? key, required this.chatWith, required this.imageUrl}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController controller = TextEditingController();

  bool isTyping = false;

  List widgets = [];

  @override
  void initState() {
    super.initState();
    getMessageTiles();
  }

  sendMessage() async {
    if (controller.text.trim() != '') {
      DateTime time = DateTime.now();
      messages.add(Message(controller.text, true, time));
      getMessageTiles();

      setState(() {
        isTyping = true;
      });

      messagesSentIndex.add(messages.indexWhere((element) => element.msg == controller.text && element.time == time && element.isSentByMe == true));

      controller.clear();

      for (int element in messagesSentIndex) {
        await Future.delayed(Duration(
                milliseconds: messagesSentIndex.indexOf(element) < messagesSentIndex.length / 4
                    ? math.Random().nextInt(6000)
                    : messagesSentIndex.indexOf(element) < messagesSentIndex.length / 3
                        ? math.Random().nextInt(4000)
                        : messagesSentIndex.indexOf(element) < messagesSentIndex.length / 2
                            ? math.Random().nextInt(3000)
                            : messagesSentIndex.indexOf(element) < messagesSentIndex.length / 1
                                ? math.Random().nextInt(2000)
                                : math.Random().nextInt(1000)))
            .then((value) {
          messages.add(Message(messages[element].msg, false, DateTime.now()));
          getMessageTiles();
          print('insede then');
        });
        print('agter then');
      }
      setState(() {
        isTyping = false;
      });
    }
  }

  void getMessageTiles() {
    int index = 0;
    setState(() {
      widgets = [];
    });

    while (index < messages.length) {
      print(index);
      int startingIndex = index;
      List<Widget> tiles = [];

      if (index == 0 || messages[index].isSentByMe != messages[index - 1].isSentByMe) {
        int containerIndex = index;

        print('make a container at index $index');

        for (int i = index; i < messages.length; i++) {
          if (index == 0) {
            index = i;
            tiles.add(MessageTile(
                sendByYou: messages[i].isSentByMe,
                msg: messages[i].msg,
                isFirst: true,
                isLast: i < messages.length - 1 ? messages[i].isSentByMe != messages[i + 1].isSentByMe : true));
            print('       add a tile for $index : inside index == 0');
          } else {
            if (messages[i].isSentByMe == messages[i - 1].isSentByMe) {
              print('       message sent by same person index $i and ${i - 1}');
              index = i;
              tiles.add(MessageTile(
                  sendByYou: messages[i].isSentByMe,
                  msg: messages[i].msg,
                  isFirst: containerIndex == i,
                  isLast: i < messages.length - 1 ? messages[i].isSentByMe != messages[i + 1].isSentByMe : true));
              print('       add a tile for $index');
            } else if (containerIndex == i) {
              index = i; // 2 2
              tiles.add(MessageTile(
                  sendByYou: messages[i].isSentByMe,
                  msg: messages[i].msg,
                  isFirst: containerIndex == i,
                  isLast: i < messages.length - 1 ? messages[i].isSentByMe != messages[i + 1].isSentByMe : true));
              print('       add a tile for $index');
            } else {
              break;
            }
          }
        }
      } else {
        print('       add a tile for $index');
      }
      setState(() {
        widgets.add(getContainerWithTiles(startingIndex, messages[startingIndex].isSentByMe, tiles));
      });
      index++;
    }
  }

  getContainerWithTiles(int startingIndex, bool isSentByMe, List<Widget> tiles) {
    return isSentByMe
        ? Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...tiles,
                  ],
                ),
              ),
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 20, bottom: 0),
                child: Container(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        widget.imageUrl,
                        height: 40,
                        width: 40,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              !messages[startingIndex].isSentByMe ? widget.chatWith : '',
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('🔥'),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${DateTime.now().difference(messages[startingIndex].time).inMinutes}m ago',
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      ...tiles,
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        title: Text(
          widget.chatWith,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        leading: IconButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...widgets,
                          isTyping
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 52, top: 2, bottom: 2),
                                  child: Container(
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Color(0xff2c2c2c),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: Image.asset(
                                        'assets/typing.gif',
                                        height: 20,
                                      )),
                                )
                              : Container(),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(color: Color(0xff222222), borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: SizedBox(
                                    height: 40,
                                    child: Center(
                                      child: TextField(
                                        controller: controller,
                                        cursorColor: Colors.grey,
                                        autocorrect: false,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                              borderSide: BorderSide(color: Colors.transparent, width: 2),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                              borderSide: BorderSide(color: Colors.transparent),
                                            ),
                                            hintText: 'Write Message',
                                            contentPadding: EdgeInsets.all(0),
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Color(0xff797c82), height: 0.8)),
                                        textInputAction: TextInputAction.send,
                                        onTapOutside: (pointer) {
                                          FocusScope.of(context).unfocus();
                                        },
                                        onSubmitted: (value) {
                                          sendMessage();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff2a64e0))),
                                    onPressed: () {
                                      sendMessage();
                                    },
                                    icon: Image.asset(
                                      'assets/icons/send1.png',
                                      height: 22,
                                      width: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: IconButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/file.png',
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: IconButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/camera.png',
                                  height: 16,
                                  width: 16,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final bool sendByYou;
  final String msg;
  final bool isFirst;
  final bool isLast;

  const MessageTile({Key? key, required this.sendByYou, required this.msg, required this.isFirst, required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: isLast ? 8 : 0),
        child: Container(
          decoration: BoxDecoration(
              color: sendByYou ? Color(0xff2a63e2) : Color(0xff2c2c2c),
              borderRadius: BorderRadius.only(
                  topLeft: sendByYou
                      ? Radius.circular(20)
                      : !isFirst && !isLast
                          ? Radius.circular(6)
                          : isLast
                              ? Radius.circular(0)
                              : Radius.circular(20),
                  bottomLeft: sendByYou
                      ? Radius.circular(20)
                      : !isFirst && !isLast
                          ? Radius.circular(6)
                          : isLast
                              ? Radius.circular(20)
                              : Radius.circular(0),
                  topRight: !sendByYou ? Radius.circular(20) : Radius.circular(20),
                  bottomRight: !sendByYou ? Radius.circular(20) : Radius.circular(0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
            child: Text(
              msg,
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
