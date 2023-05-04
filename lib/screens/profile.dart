import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/game_card.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isUnderAppBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 80,
        backgroundColor: isUnderAppBar ? Colors.black12 : Colors.transparent,
        notificationPredicate: (scrollNotification) {
          setState(() {
            isUnderAppBar = scrollNotification.metrics.extentBefore > 0 ? true : false;
          });
          return true;
        },
        title: const Text(
          'Profile',
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
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.0),
          image: const DecorationImage(
            image: AssetImage(
              'assets/3.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 125,
                      ),
                      const CircleAvatar(
                        backgroundColor: Color(0xffd73d40),
                        radius: 52,
                      ),
                      const CircleAvatar(
                        backgroundColor: Color(0xff0b0e19),
                        radius: 49,
                      ),
                      const CircleAvatar(
                        backgroundColor: Color(0xff2d64e2),
                        radius: 44,
                      ),
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(65),
                          child: Image.asset(
                            'assets/pic1.jpeg',
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 2,
                          child: Container(
                              height: 26,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: const Color(0xffe33639),
                                  borderRadius: BorderRadius.circular(20),
                                  border: const Border.fromBorderSide(BorderSide(color: Colors.black, width: 3))),
                              child: const Center(
                                child: Text(
                                  'Live',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              )))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: Text(
                      '@Awkirrun',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 0),
                    child: Text(
                      'I\'m back stream valorant',
                      style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 22),
                    child: Text(
                      'Watch me stream everyday',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              '123',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Following'),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.white,
                        ),
                        Column(
                          children: const [
                            Text(
                              '10M',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Followers'),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.white,
                        ),
                        Column(
                          children: const [
                            Text(
                              '109',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Videos'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                  backgroundColor: const MaterialStatePropertyAll(Color(0xff2a63e2)),
                                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                                  elevation: const MaterialStatePropertyAll(0),
                                  shadowColor: const MaterialStatePropertyAll(Colors.white),
                                  splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Follow',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 45,
                              child: OutlinedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                                  side: MaterialStateProperty.all(const BorderSide(color: Colors.white)),
                                  splashFactory: InkSparkle.splashFactory,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Add Friend',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: TabBar(
                                    labelStyle: TextStyle(color: Color(0xff737a85), fontSize: 14),
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    labelColor: Colors.white,
                                    dividerColor: Color(0xff36353a),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorColor: Color(0xff2a63e2),
                                    tabs: [Text('Home'), Text('About'), Text('Video'), Text('Likes')])),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).orientation == Orientation.portrait ? 275 : 410,
                            width: double.infinity,
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 14, bottom: 5, left: 20, right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Recent Streams',
                                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                                          ),
                                          Text(
                                            'See All',
                                            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey.shade400, fontSize: 11),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 15,
                                            ),
                                            GameCard(
                                              index: 2,
                                              watching: 5.2,
                                              title: 'Call of Duty',
                                            ),
                                            GameCard(
                                              index: 3,
                                              watching: 3.7,
                                              title: 'Call of Duty',
                                            ),
                                            GameCard(
                                              index: 1,
                                              watching: 4.2,
                                              title: 'Call of Duty',
                                            ),
                                            GameCard(
                                              index: 4,
                                              watching: 2.8,
                                              title: 'Call of Duty',
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Center(child: Text('About')),
                                const Center(child: Text('Video')),
                                const Center(child: Text('Likes')),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).orientation == Orientation.portrait ? 80 : 20,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
