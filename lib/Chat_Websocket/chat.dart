import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherChat extends StatefulWidget {
  @override
  _PusherChatState createState() => _PusherChatState();
}

class _PusherChatState extends State<PusherChat> {
  final _formKey = GlobalKey<FormState>();
  final _apiKeyController = TextEditingController();
  final _clusterController = TextEditingController();
  final _channelNameController = TextEditingController();
  final _eventNameController = TextEditingController();

  late PusherChannelsFlutter _pusher;
  String _log = 'output:\n';

  @override
  void initState() {
    super.initState();
    _pusher = PusherChannelsFlutter.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusher Chat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _apiKeyController,
                  decoration: InputDecoration(labelText: 'API Key'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter API key';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _clusterController,
                  decoration: InputDecoration(labelText: 'Cluster'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter cluster';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _channelNameController,
                  decoration: InputDecoration(labelText: 'Channel Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter channel name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _eventNameController,
                  decoration: InputDecoration(labelText: 'Event Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter event name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _connectToPusher,
                  child: Text('Connect to Pusher'),
                ),
                SizedBox(height: 20),
                Text(_log),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _connectToPusher() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await _pusher.init(
        apiKey: _apiKeyController.text,
        cluster: _clusterController.text,
        onConnectionStateChange: _onConnectionStateChange,
        // onError: _onError,
        // onSubscriptionSucceeded: _onSubscriptionSucceeded,
        onEvent: _onEvent,
        // onSubscriptionError: _onSubscriptionError,
        onDecryptionFailure: _onDecryptionFailure,
        onMemberAdded: _onMemberAdded,
        onMemberRemoved: _onMemberRemoved,
      );

      await _pusher.subscribe(channelName: _channelNameController.text.trim());
      await _pusher.connect();
    } catch (e) {
      _log1("ERROR: $e");
    }
  }

  void _onEvent(PusherEvent event) {
    _log1("Received event: ${event.eventName} with data: ${event.data}");
    // Handle incoming message here
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
