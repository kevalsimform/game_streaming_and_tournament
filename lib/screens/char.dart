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
  List<Message> messages = [];

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    messages = [
      Message(
        'Thank you, I have installed theplugin, I just need to Wait until the file finishes downloading.',
        false,
        DateTime.now().copyWith(minute: DateTime.now().minute - 3),
      ),
      Message(
        'i will get back to work now',
        false,
        DateTime.now().copyWith(minute: DateTime.now().minute - 3),
      ),
      Message(
        'Sure, Just call me you are done',
        true,
        DateTime.now().copyWith(minute: DateTime.now().minute - 3),
      ),
      Message('ok', false, DateTime.now().copyWith(minute: DateTime.now().minute - 1)),
    ];
  }

  // getWidgets() {
  //   List<Widget> widgets = [];
  //
  //   int index = 0;
  //
  //   while (index < messages.length) {
  //     widgets.add(Row(
  //       children: [
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.only(left: messages[index].isSentByMe ? 40 : 0, right: !messages[index].isSentByMe ? 40 : 0),
  //             child: msgTile(
  //               sendByYou: messages[index].isSentByMe,
  //               isFirst: false,
  //               msg: messages[index].msg,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ));
  //
  //     index++;
  //   }
  //
  //   return widgets;
  // }

  getWidgets() {
    List<Widget> widgets = [];

    int index = 0;

    while (index < messages.length) {
      if (index == 0) {
        List tiles = [];

        for (int i = 0; i < messages.length; i++) {
          if (index == 0) {
            tiles.add(msgTile(
              sendByYou: messages[i].isSentByMe,
              isFirst: false,
              msg: messages[i].msg,
            ));
          } else {
            if (messages[i].isSentByMe == messages[i - 1].isSentByMe) {
              tiles.add(msgTile(
                sendByYou: messages[i].isSentByMe,
                isFirst: false,
                msg: messages[i].msg,
              ));
              index++;
            } else {
              break;
            }
          }

          index = i;
        }
        widgets.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          !messages[index].isSentByMe ? widget.chatWith : '',
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('🔥'),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${DateTime.now().difference(messages[index].time).inMinutes}m ago',
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  ...tiles
                ],
              ),
            ),
          ],
        ));
      } else {
        List<Widget> tiles = [];

        for (int i = index; i < messages.length; i++) {
          if (messages[index].isSentByMe) {
            widgets.add(msgTile(
              sendByYou: messages[i].isSentByMe,
              isFirst: false,
              msg: messages[i].msg,
            ));
            index = i;
          } else {
            tiles.add(msgTile(
              sendByYou: messages[i].isSentByMe,
              isFirst: false,
              msg: messages[i].msg,
            ));
            index = i;
          }
        }
        widgets.add(Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          !messages[index].isSentByMe ? widget.chatWith : '',
                          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('🔥'),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${DateTime.now().difference(messages[index].time).inMinutes}m ago',
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  ...tiles
                ],
              ),
            ),
          ],
        ));
      }
      index++;
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        title: Text(
          widget.chatWith,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ...getWidgets(),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(color: Colors.grey.shade800, borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: TextField(
                                controller: controller,
                                decoration: InputDecoration(hintText: 'Write Message', border: InputBorder.none),
                                textInputAction: TextInputAction.send,
                                onTapOutside: (pointer) {
                                  FocusScope.of(context).unfocus();
                                },
                                onSubmitted: (value) {
                                  if (controller.text.trim() != '') {
                                    messages.add(Message(controller.text, true, DateTime.now()));
                                    controller.clear();
                                  }
                                },
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: IconButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigoAccent.shade400)),
                                  onPressed: () {
                                    setState(() {
                                      if (controller.text.trim() != '') {
                                        messages.add(Message(controller.text, true, DateTime.now()));
                                        controller.clear();
                                      }
                                    });
                                  },
                                  icon: Image.asset(
                                    'assets/icons/send.png',
                                    height: 18,
                                    width: 18,
                                    color: Colors.pink,
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
                          height: 50,
                          width: 50,
                          child: IconButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icons/file.png',
                                height: 20,
                                width: 20,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: IconButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icons/camera.png',
                                height: 20,
                                width: 20,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class msgTile extends StatelessWidget {
  final bool sendByYou;
  final String msg;
  final bool? isFirst;

  const msgTile({Key? key, required this.sendByYou, required this.msg, required this.isFirst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: isFirst != null
              ? isFirst!
                  ? 8
                  : 5
              : 0,
          bottom: isFirst != null
              ? !isFirst!
                  ? 8
                  : 5
              : 0),
      child: Container(
        decoration: BoxDecoration(
            color: sendByYou ? Colors.indigoAccent.shade400 : Colors.grey.shade800,
            borderRadius: BorderRadius.only(
              topLeft: sendByYou
                  ? Radius.circular(20)
                  : isFirst != null
                      ? isFirst!
                          ? Radius.circular(20)
                          : Radius.circular(0)
                      : Radius.circular(0),
              bottomLeft: sendByYou
                  ? Radius.circular(20)
                  : isFirst != null
                      ? isFirst!
                          ? Radius.circular(0)
                          : Radius.circular(20)
                      : Radius.circular(0),
              topRight: !sendByYou
                  ? Radius.circular(20)
                  : isFirst != null
                      ? isFirst!
                          ? Radius.circular(20)
                          : Radius.circular(0)
                      : Radius.circular(0),
              bottomRight: !sendByYou
                  ? Radius.circular(20)
                  : isFirst != null
                      ? isFirst!
                          ? Radius.circular(20)
                          : Radius.circular(20)
                      : Radius.circular(0),
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
          child: Text(
            msg,
            maxLines: 5,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
