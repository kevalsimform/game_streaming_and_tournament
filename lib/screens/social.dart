import 'package:flutter/material.dart';
import 'package:game_streaming_and_tournament/constants.dart';

import '../components/info_tile.dart';

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
