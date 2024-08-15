// import 'package:bloom_project/ChatScreen/GetMessages/messages_controller.dart';
// import 'package:bloom_project/Components/TextField.dart';
// import 'package:bloom_project/Style/constant.dart';
// import 'package:bloom_project/service/info.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
//
// import 'GetMessages/messages_model.dart';
// import 'SendMessges/chat_controller.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   ChatController controller = Get.put(ChatController());
//   GetMessagesController messagesController = Get.put(GetMessagesController());
//
//   late PusherChannelsFlutter pusher;
//   late PusherChannel channel;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize Pusher
//     pusher = PusherChannelsFlutter.getInstance();
//
//     pusher.init(
//       apiKey: '70daea949684097ebed4',
//       cluster: 'eu',
//       onConnectionStateChange: (state, _) {
//         print("Connection state: $state");
//       },
//       onError: (error, code, _) {
//         print("Connection error: $error, code: $code");
//       },
//     );
//
//     _connectToPusher();
//   }
//
//   //
//   // void _connectToPusher() async {
//   //   // Subscribe to a channel
//   //   channel = await pusher.subscribe(channelName: 'chatLaravel');
//   //   print("Subscribed to channel: ${channel.me}");
//   //
//   //   // Listen to events on the channel
//   //   channel.onEvent?.call((event) {
//   //     print("Event received: ${event.eventName}");
//   //     if (event.eventName == 'message_sent') {
//   //       final messageData = event.data;
//   //       setState(() {
//   //         final message = MessagesModel.fromJson(messageData);
//   //         messagesController.models.add(message);
//   //       });
//   //     }
//   //   });
//   // }
//   void _connectToPusher() async {
//     try {
//       // Subscribe to a channel
//       channel = await pusher.subscribe(
//           channelName: 'private_chat.${UserInformation.profileType}');
//
//       if (channel != null) {
//         print(channel);
//         print("Subscribed to channel: ${channel.channelName}");
//
//         // Listen to events on the channel
//         channel.onEvent?.call((event) {
//           print("Event received: ${event.eventName}");
//           final messageData = event.data;
//           setState(() {
//             final message = MessagesModel.fromJson(messageData);
//             messagesController.models.add(message);
//             print("Received message: ${message.content}");
//           });
//         });
//       } else {
//         print("Failed to subscribe to channel. Channel is null.");
//       }
//     } catch (e, stackTrace) {
//       print("Error connecting to Pusher: $e");
//       print("Stack trace: $stackTrace");
//     }
//   }
//
//   void _sendMessage() async {
//     controller.onClickSendMessage();
//     await messagesController.getdata();
//     if (_controller.text.isNotEmpty) {
//       setState(() {
//         _controller.clear();
//         _getMessage();
//       });
//     }
//   }
//
//   void _getMessage() {
//     if (_controller.text.isNotEmpty) {
//       setState(() async {
//         await messagesController.getdata();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'الدردشة',
//           style: TextStyle(color: textColor, fontFamily: 'font1', fontSize: 34),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               var reversedMessages =
//               messagesController.models.reversed.toList();
//               return ListView.builder(
//                 itemCount: reversedMessages.length,
//                 itemBuilder: (context, index) {
//                   MessagesModel message = reversedMessages[index];
//                   bool isAdmin = message.senderType == "admin";
//
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Align(
//                       alignment: isAdmin
//                           ? Alignment.centerLeft
//                           : Alignment.centerRight,
//                       child: Container(
//                         padding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                         decoration: BoxDecoration(
//                           color: isAdmin ? Colors.grey[300] : buttonColorOpa,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(message.content),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Form(
//               key: controller.formstate,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: MyTextField(
//                       control: _controller,
//                       label: 'Message',
//                       hint: 'أكتب رسالتك...',
//                       textInputAction: TextInputAction.done,
//                       onsave: (value) {
//                         controller.content = value!;
//                       },
//                       keyboardType: TextInputType.text,
//                       blurRadius: 0,
//                       offset: 0,
//                       width: screenSize.width * 0.9,
//                       height: screenSize.height * 0.05,
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   IconButton(
//                     icon: Icon(Icons.send),
//                     onPressed: _sendMessage,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
