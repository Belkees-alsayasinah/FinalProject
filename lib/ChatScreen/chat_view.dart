import 'package:bloom_project/ChatScreen/GetMessages/messages_controller.dart';
import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/Config/server_config.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'dart:convert'; // لعملية الترميز والفك
import 'package:http/http.dart' as http; // لإرسال طلبات HTTP
import 'GetMessages/messages_model.dart';
import 'SendMessges/chat_controller.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  ChatController controller = Get.put(ChatController());
  GetMessagesController messagesController = Get.put(GetMessagesController());

  late PusherChannelsFlutter _pusher;
  String _log = 'output:\n';
  late PusherChannel channel;

  @override
  void initState() {
    super.initState();
    _initializePusher();
  }

  void _initializePusher() {
    _pusher = PusherChannelsFlutter.getInstance();
    _connectToPusher();
  }

  void _sendMessage() async {
    controller.onClickSendMessage();
    await messagesController.getdata();
    if (_controller.text.isNotEmpty) {
      setState(() {
        _controller.clear();
        _getMessage();
      });
    }
  }

  void _getMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() async {
        await messagesController.getdata();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الدردشة',
          style: TextStyle(color: textColor, fontFamily: 'font1', fontSize: 34),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              var reversedMessages =
                  messagesController.models.reversed.toList();
              return ListView.builder(
                itemCount: reversedMessages.length,
                itemBuilder: (context, index) {
                  MessagesModel message = reversedMessages[index];
                  bool isAdmin = message.senderType == "admin";

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: isAdmin
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: isAdmin ? Colors.grey[300] : buttonColorOpa,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(message.content),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.formstate,
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      control: _controller,
                      label: 'Message',
                      hint: 'أكتب رسالتك...',
                      textInputAction: TextInputAction.done,
                      onsave: (value) {
                        controller.content = value!;
                      },
                      keyboardType: TextInputType.text,
                      blurRadius: 0,
                      offset: 0,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.05,
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _connectToPusher() async {
    try {
      await _pusher.init(
        apiKey: '70daea949684097ebed4',
        cluster: 'eu',
        onConnectionStateChange: _onConnectionStateChange,
        //onError: _onError,
        // onSubscriptionSucceeded: _onSubscriptionSucceeded,
        onEvent: _onEvent,
        // onSubscriptionError: _onSubscriptionError,
        onDecryptionFailure: _onDecryptionFailure,
        onMemberAdded: _onMemberAdded,
        onMemberRemoved: _onMemberRemoved,
        onAuthorizer: (channelName, socketId, options) async {
          print("channelName: $channelName     SocketID: $socketId");

          final response = await http.post(
            Uri.parse(
                ServerConfig.domainNameServer + ServerConfig().onAuthorizer),
            headers: {
              'Authorization': 'Bearer ${UserInformation.user_token}',
              'Accept': 'application/json',
            },
            body: {
              'channel_name': channelName,
              'socket_id': socketId,
            },
          );
          print(response.statusCode);
          if (response.statusCode == 200) {
            print('تمت المصادقة');
            return jsonDecode(response.body);
          } else {
            print('error');
            print(response.body);

            throw Exception('Failed to authorize Pusher channel');
          }
        },
      );

      await _pusher.subscribe(
          channelName: 'private-chat.user.${UserInformation.profileType}');
      await _pusher.connect();
    } catch (e) {
      _log1("ERROR: $e");
    }
  }

  void _onEvent(PusherEvent event) async {
    _log1("Received event: ${event.eventName} with data: ${event.data}");
    await messagesController.getdata();
  }

  void _log1(String text) {
    print("LOG: $text");
    setState(() {
      _log += text + "\n";
    });
  }

  // Other methods...

  void _onConnectionStateChange(String state, String message) {
    _log1("Connection state changed to $state with message: $message");
  }

  void _onError(String message, String errorCode) {
    _log1("Error: $message with code: $errorCode");
  }

  void _onSubscriptionSucceeded(String channelName, String status) {
    _log1("Subscribed to $channelName with status: $status");
  }

  void _onSubscriptionError(String message, String channelName) {
    _log1("Subscription error: $message on $channelName");
  }

  void _onDecryptionFailure(String message, String channelName) {
    _log1("Decryption failure: $message on $channelName");
  }

  void _onMemberAdded(String channelName, PusherMember member) {
    _log1("Member added: $member on $channelName");
  }

  void _onMemberRemoved(String channelName, PusherMember member) {
    _log1("Member removed: $member on $channelName");
  }
}
