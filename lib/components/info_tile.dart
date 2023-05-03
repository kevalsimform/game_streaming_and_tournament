import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/chat.dart';

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
