import 'dart:io';

enum MessageType { audio, text, photo, gif }

class MessageModel
 {
  String id;
  bool isSender;
  MessageType type;
  File? photo;
  File? gif;
  File? audio;
  String? message;
  MessageModel
({
    required this.id,
    required this.isSender,
    required this.type,
    this.photo,
    this.gif,
    this.audio,
    this.message,
  });
}

List<MessageModel
> messages = [
  MessageModel
(
    id: '1',
    isSender: true,
    type: MessageType.text,
    message: 'Hello, how are you?',
  ),
  MessageModel
(
    id: '2',
    isSender: false,
    type: MessageType.photo,
    photo: File('path_to_photo_file.jpg'),
  ),
  MessageModel
(
    id: '3',
    isSender: true,
    type: MessageType.gif,
    gif: File('path_to_gif_file.gif'),
  ),
  MessageModel
(
    id: '4',
    isSender: false,
    type: MessageType.audio,
    audio: File('path_to_audio_file.mp3'),
  ),
];