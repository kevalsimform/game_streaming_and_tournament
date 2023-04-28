import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/gameCard.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
        actions: [
          IconButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade100.withOpacity(0.1))),
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_rounded,
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.0),
          image: DecorationImage(
            image: AssetImage(
              'assets/3.jpeg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 150,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.redAccent,
                              radius: 70,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              radius: 65,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 60,
                            ),
                            Container(
                              height: 110,
                              width: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(65),
                                child: Image.asset(
                                  'assets/pic1.jpeg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 3))),
                              child: Center(
                                child: Text(
                                  'Live',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              )))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      '@Awkirrun',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 0),
                    child: Text(
                      'I\'m back stream valorant',
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 20),
                    child: Text(
                      'Watch me stream everyday',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              '123',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text('Following'),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 2,
                          color: Colors.white,
                        ),
                        Column(
                          children: [
                            Text(
                              '10M',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text('Followers'),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 2,
                          color: Colors.white,
                        ),
                        Column(
                          children: [
                            Text(
                              '109',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text('Videos'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                  backgroundColor: MaterialStatePropertyAll(Colors.indigoAccent.shade400),
                                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Follow',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 50,
                              child: OutlinedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                                    side: MaterialStateProperty.all(BorderSide(color: Colors.white))),
                                onPressed: () {},
                                child: Text(
                                  'Add Friend',
                                  style: TextStyle(fontSize: 16),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                child: TabBar(
                                    labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    labelColor: Colors.white,
                                    dividerColor: Colors.grey,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    tabs: [Text('Home'), Text('About'), Text('Video'), Text('Likes')])),
                          ),
                          Container(
                            height: 275,
                            width: double.infinity,
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18, bottom: 10, left: 20, right: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Recent Streams',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Text(
                                            'See All',
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        child: Row(
                                          children: [
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
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(),
                                Container(),
                                Container()
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
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
