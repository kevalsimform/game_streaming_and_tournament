class Message {
  String msg;
  bool isSentByMe;
  DateTime time;

  Message(this.msg, this.isSentByMe, this.time);
}

List<Message> messages = [
  Message(
    'Thank you, I have installed the plugin, I just need to Wait until the file finishes downloading.',
    false,
    DateTime.now().copyWith(minute: DateTime.now().minute - 3),
  ),
  Message(
    'i will get back to work now',
    false,
    DateTime.now().copyWith(minute: DateTime.now().minute - 2),
  ),
  Message(
    'Sure, Just call me you are done',
    true,
    DateTime.now().copyWith(minute: DateTime.now().minute - 1),
  ),
  Message('OK', false, DateTime.now().copyWith(minute: DateTime.now().minute - 1)),
];

List<int> messagesSentIndex = [];
