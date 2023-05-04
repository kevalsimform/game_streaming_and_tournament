import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/models/message.dart';

import '../components/message_tile.dart';

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

  void sendMessage() async {
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
                        ? math.Random().nextInt(3000)
                        : messagesSentIndex.indexOf(element) < messagesSentIndex.length / 2
                            ? math.Random().nextInt(2000)
                            : messagesSentIndex.indexOf(element) < messagesSentIndex.length / 1
                                ? math.Random().nextInt(1000)
                                : math.Random().nextInt(4000)))
            .then((value) {
          messages.add(Message(messages[element].msg, false, DateTime.now()));
          getMessageTiles();
        });
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
      int startingIndex = index;
      List<Widget> tiles = [];

      if (index == 0 || messages[index].isSentByMe != messages[index - 1].isSentByMe) {
        int containerIndex = index;

        for (int i = index; i < messages.length; i++) {
          if (index == 0) {
            index = i;
            tiles.add(MessageTile(
                sendByYou: messages[i].isSentByMe,
                msg: messages[i].msg,
                isFirst: true,
                isLast: i < messages.length - 1 ? messages[i].isSentByMe != messages[i + 1].isSentByMe : true));
          } else {
            if (messages[i].isSentByMe == messages[i - 1].isSentByMe) {
              index = i;
              tiles.add(MessageTile(
                  sendByYou: messages[i].isSentByMe,
                  msg: messages[i].msg,
                  isFirst: containerIndex == i,
                  isLast: i < messages.length - 1 ? messages[i].isSentByMe != messages[i + 1].isSentByMe : true));
            } else if (containerIndex == i) {
              index = i; // 2 2
              tiles.add(MessageTile(
                  sendByYou: messages[i].isSentByMe,
                  msg: messages[i].msg,
                  isFirst: containerIndex == i,
                  isLast: i < messages.length - 1 ? messages[i].isSentByMe != messages[i + 1].isSentByMe : true));
            } else {
              break;
            }
          }
        }
      } else {}
      setState(() {
        widgets.add(getContainerWithTiles(startingIndex, messages[startingIndex].isSentByMe, tiles));
      });
      index++;
    }
  }

  getContainerWithTiles(int startingIndex, bool isSentByMe, List<Widget> tiles) {
    return isSentByMe
        ? SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...tiles,
                ],
              ),
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 20, bottom: 0),
                child: SizedBox(
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
                              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('🔥'),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${DateTime.now().difference(messages[startingIndex].time).inMinutes}m ago',
                              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
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
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        leading: IconButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: SizedBox(
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
                                  width: 75,
                                  decoration: const BoxDecoration(
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
                      const SizedBox(
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
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(color: const Color(0xff222222), borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        crossAxisAlignment: controller.text.trim() != '' ? CrossAxisAlignment.center : CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18, bottom: 3, top: 3),
                              child: Center(
                                child: TextField(
                                  controller: controller,
                                  cursorColor: Colors.grey,
                                  autocorrect: false,
                                  maxLines: 4,
                                  minLines: 1,
                                  // cursorHeight: 10,
                                  style: const TextStyle(fontSize: 15),
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent, width: 0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                      hintText: 'Write Message',
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Color(0xff797c82), height: 0.8)),
                                  textInputAction: TextInputAction.newline,
                                  onTapOutside: (pointer) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      controller;
                                    });
                                  },
                                  onSubmitted: (value) {
                                    sendMessage();
                                  },
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
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff2a64e0))),
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
                    controller.text.trim() != ''
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 6),
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
                    controller.text.trim() != ''
                        ? Container()
                        : Padding(
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
    );
  }
}
