class Chat {
  final String name, LastMessage, image, time;
  final bool isActive;

  Chat({
    required this.name,
    required this.LastMessage,
    required this.image,
    required this.time,
    required this.isActive,
  });
}

List chatData = [
  Chat(
    name: 'Parent',
    LastMessage: 'Hope you are ok?',
    image: "",
    time: '8m ago',
    isActive: true,

    ),

  Chat(
    name: 'kid',
    LastMessage: 'I am  ok?',
    image: "",
    time: '8m ago',
    isActive: true,

    ),
];