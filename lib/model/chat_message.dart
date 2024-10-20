class ChatMessage {
  final String text;
  final String? mediaUrl;
  final bool? isUser;

  ChatMessage({
    required this.text,
    this.mediaUrl,
    this.isUser,
  });
}
