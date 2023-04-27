

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    this.text = " HI",
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

List demoChatMeesage = [
  ChatMessage(
    text: 'Hi Son',
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    ),

  ChatMessage(
    text: 'Hi Mom ',
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
    ),
];
