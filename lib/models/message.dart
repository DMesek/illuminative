class Message {
  final String content;
  final String sender;
  late int timestamp;

  Message({
    required this.content,
    required this.sender,
  }) {
    timestamp = DateTime.now().microsecondsSinceEpoch;
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'sender': sender,
        'timestamp': timestamp,
      };
}
