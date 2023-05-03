import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/constants.dart';
import 'package:game_streaming_and_tournament/screens/chat.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 80,
          title: Text(
            'Social',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          leading: IconButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 18,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.white,
                    size: 22,
                  )),
            ),
          ],
          bottom: TabBar(
              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Color(0xff3f66bd),
              tabs: [
                Tab(text: 'Friends'),
                Tab(
                  text: 'Chats',
                ),
              ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
                  child: Text(
                    'People',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                  ),
                ),
                ...peoples.map((e) => infoTile(name: e.name, isTick: e.isVerified, isStreaming: e.isStreaming, imageUrl: e.imagePath)),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 12),
                  child: Text(
                    'On Streaming',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                  ),
                ),
                ...onStreaming.map((e) => infoTile(name: e.name, isTick: e.isVerified, isStreaming: e.isStreaming, imageUrl: e.imagePath)),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
          Container()
        ]),
      ),
    );
  }
}

class infoTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isTick;
  final bool isStreaming;

  const infoTile({super.key, required this.name, required this.isTick, required this.isStreaming, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chat(chatWith: name, imageUrl: imageUrl)));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                        ),
                        Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  imageUrl,
                                  height: 40,
                                  width: 40,
                                )),
                          ),
                        ),
                        isStreaming
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white, width: 2)),
                                  child: Icon(
                                    Icons.rocket_launch_outlined,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ))
                            : Container(
                                height: 20,
                                width: 20,
                              )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              '$name',
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            isTick
                                ? CircleAvatar(
                                    backgroundColor: Colors.blueAccent,
                                    radius: 8,
                                    child: Icon(
                                      CupertinoIcons.check_mark,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                        Text(
                          '636 Follower',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),
        )
      ],
    );
  }
}
