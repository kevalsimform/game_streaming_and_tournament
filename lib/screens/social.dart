import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
              onPressed: () {},
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
          bottom: TabBar(
              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 17),
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.indigo,
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
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'People',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
                infoTile(
                  index: 1,
                  name: 'Valorant BoYz',
                  isTick: true,
                  isStreaming: false,
                ),
                infoTile(
                  index: 2,
                  name: 'vALO bUY',
                  isTick: false,
                  isStreaming: false,
                ),
                infoTile(
                  index: 1,
                  name: 'dAVID vALO',
                  isTick: true,
                  isStreaming: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'On Streaming',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ),
                infoTile(
                  index: 1,
                  name: 'Ahmad Curtiz',
                  isTick: true,
                  isStreaming: true,
                ),
                infoTile(
                  index: 2,
                  name: 'Justing  Schindler ',
                  isTick: true,
                  isStreaming: true,
                ),
                infoTile(
                  index: 1,
                  name: 'Marcuz Kenter',
                  isTick: true,
                  isStreaming: true,
                ),
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
  final int index;
  final String name;
  final bool isTick;
  final bool isStreaming;

  const infoTile({
    super.key,
    required this.index,
    required this.name,
    required this.isTick,
    required this.isStreaming,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
                                'assets/pic$index.jpeg',
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
                                    color: Colors.green, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white, width: 2)),
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
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          isTick
                              ? CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  radius: 9,
                                  child: Icon(
                                    CupertinoIcons.check_mark,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Text(
                        '636 Follower',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                )
              ],
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
