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
          title: const Text(
            'Social',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          leading: IconButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
              onPressed: () {},
              icon: const Icon(
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
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.white,
                    size: 22,
                  )),
            ),
          ],
          bottom: const TabBar(
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
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                  child: Text(
                    'People',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                  ),
                ),
                ...peoples.map((e) => InfoTile(name: e.name, isTick: e.isVerified, isStreaming: e.isStreaming, imageUrl: e.imagePath)),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, bottom: 12),
                  child: Text(
                    'On Streaming',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                  ),
                ),
                ...onStreaming.map((e) => InfoTile(name: e.name, isTick: e.isVerified, isStreaming: e.isStreaming, imageUrl: e.imagePath)),
                const SizedBox(
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
