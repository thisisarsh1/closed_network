

import '../models/MessageScreenModel.dart';

List<MessageModel> messageList = [
  MessageModel(
    name: 'Zara Ahmed',
    handle: '@z4ra',
    imageUrl: 'https://randomuser.me/api/portraits/women/72.jpg',
    lastMessage: 'Are you joining the hackathon tomorrow? 🤖',
    time: '2m ago',
    isUnread: true,
  ),
  MessageModel(
    name: 'Kunal Mehta',
    handle: '@kunal.codes',
    imageUrl: 'https://randomuser.me/api/portraits/men/64.jpg',
    lastMessage: 'Sent you the Figma file! Check it out.',
    time: '10m ago',
    isUnread: false,
  ),
  MessageModel(
    name: 'Meher',
    handle: '@m3h3r',
    imageUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
    lastMessage: 'Bro we need to fix that API bug asap.',
    time: '1h ago',
    isUnread: true,
  ),
  MessageModel(
    name: 'Rishabh Singh',
    handle: '@rishx',
    imageUrl: 'https://randomuser.me/api/portraits/men/52.jpg',
    lastMessage: 'Okay got it. Thanks for the update.',
    time: '3h ago',
    isUnread: false,
  ),
];