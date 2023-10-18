import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fchat/components/my_text_field.dart';
import 'package:fchat/services/chat/chatservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // initialize controller, chatservice and firebase instances

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // TODO: implement build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // Set message alignment
    var alignment = (data['receiverId'] == _firebaseAuth.currentUser!.uid
        ? Alignment.centerLeft
        : Alignment.centerRight);

    return Container(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Text(data['senderEmail'],
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(data['message'], style: const TextStyle(color: Colors.black)),
          ]),
        ),
      ),
    );
  }

  // TODO: implement build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('error ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading messages...');
          }

          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  // // TODO: build message input area
  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
              controller: _messageController,
              hintText: 'Enter Message',
              obscureText: false),
        ),
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserId, _messageController.text);
      // reset text Controller after sending operation successful
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.receiverUserEmail)),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            // Messages
            Expanded(child: _buildMessageList()),

            // User input
            _buildMessageInput()
          ],
        ),
      ),
    );
  }
}
