import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final int index;
  final double watching;
  final String title;

  const GameCard({
    super.key,
    required this.index,
    required this.watching,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).orientation == Orientation.portrait ? 200 : 260,
        constraints: BoxConstraints(minWidth: 200),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).orientation == Orientation.portrait ? 160 : 225,
                constraints: BoxConstraints(minWidth: 200),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/games/s$index.jpeg',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' $title',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Positioned(
              top: 15,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.black54.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text(
                            '${watching}k Watching',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Color(0xffe33639), borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Row(
                            children: [
                              Icon(
                                Icons.wifi,
                                size: 14,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Live',
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
