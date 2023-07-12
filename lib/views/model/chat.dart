class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;
  Chat({
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.time,
    required this.isActive,
  });
}

List chatsData = [
  Chat(
    image: 'lib/assets/images/send.png',
    name: 'Mash Auto',
    lastMessage: 'garage',
    time: "3mins ago",
    isActive: false,
  ),
  Chat(
    image: 'lib/assets/images/google.png',
    name: 'Mash Auto',
    lastMessage: 'garage',
    time: "3mins ago",
    isActive: false,
  ),
  Chat(
    image: 'lib/assets/images/cash-flow.png',
    name: 'Mash Auto',
    lastMessage: 'garage',
    time: "3mins ago",
    isActive: false,
  ),
  Chat(
    image: 'lib/assets/images/statistics.png',
    name: 'Mash Auto',
    lastMessage: 'garage',
    time: "3mins ago",
    isActive: false,
  ),
  Chat(
    image: 'lib/assets/images/credit-cards.png',
    name: 'Mash Auto',
    lastMessage: 'garage',
    time: "3mins ago",
    isActive: false,
  ),
];
