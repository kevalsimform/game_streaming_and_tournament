// import 'package:flutter/material.dart';
//
// import '../models/message.dart';
//
// class MessageContainer extends StatelessWidget {
//   final int startingIndex;
//   final bool isSendByMe;
//   final List<Widget> tiles = [];
//   final String imageUrl;
//   final String name;
//
//   MessageContainer({super.key, required this.startingIndex, required this.isSendByMe, required this.imageUrl, required this.name, required tiles});
//
//   @override
//   Widget build(BuildContext context) {
//     return isSendByMe
//         ? Container(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 60),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   ...tiles,
//                 ],
//               ),
//             ),
//           )
//         : Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 12, top: 20, bottom: 0),
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(40),
//                       child: Image.asset(
//                         imageUrl,
//                         height: 40,
//                         width: 40,
//                       )),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 40),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, bottom: 0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.baseline,
//                         textBaseline: TextBaseline.alphabetic,
//                         children: [
//                           Text(
//                             !messages[startingIndex].isSentByMe ? name : '',
//                             style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 12),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Text('🔥'),
//                           SizedBox(
//                             width: 4,
//                           ),
//                           Text(
//                             '${DateTime.now().difference(messages[startingIndex].time).inMinutes}m ago',
//                             style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12),
//                           )
//                         ],
//                       ),
//                     ),
//                     ...tiles,
//                   ],
//                 ),
//               ),
//             ],
//           );
//   }
// }
