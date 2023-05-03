import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final bool sendByYou;
  final String msg;
  final bool isFirst;
  final bool isLast;

  const MessageTile({Key? key, required this.sendByYou, required this.msg, required this.isFirst, required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: isLast ? 8 : 0),
        child: Container(
          decoration: BoxDecoration(
              color: sendByYou ? Color(0xff2a63e2) : Color(0xff2c2c2c),
              borderRadius: BorderRadius.only(
                  topLeft: sendByYou
                      ? Radius.circular(20)
                      : !isFirst && !isLast
                          ? Radius.circular(6)
                          : isLast
                              ? Radius.circular(0)
                              : Radius.circular(20),
                  bottomLeft: sendByYou
                      ? Radius.circular(20)
                      : !isFirst && !isLast
                          ? Radius.circular(6)
                          : isLast
                              ? Radius.circular(20)
                              : Radius.circular(0),
                  topRight: !sendByYou ? Radius.circular(20) : Radius.circular(20),
                  bottomRight: !sendByYou ? Radius.circular(20) : Radius.circular(0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
            child: Text(
              msg,
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
