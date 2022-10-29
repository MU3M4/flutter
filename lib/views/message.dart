import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_progress/views/chats_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class MessageCenter extends StatefulWidget {
  final String garageUid;
  final String garageName;
  const MessageCenter(
      {super.key, required this.garageUid, required this.garageName});

  @override
  State<MessageCenter> createState() =>
      _MessageCenterState(garageName, garageUid);
}

class _MessageCenterState extends State<MessageCenter> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final String garageUid;
  final String garageName;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  var chatDocId;
  final _textController = TextEditingController();
  _MessageCenterState(this.garageUid, this.garageName);
  @override
  void initState() {
    checkUser();
    
    super.initState();
  }

  void checkUser() async {
    await chats
        .where('users', isEqualTo: {garageUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
              });
              print(chatDocId);
            } else {
              chats.add({
                'users': {currentUserId: null, garageUid: null},
                'names': {
                  currentUserId: FirebaseAuth.instance.currentUser?.displayName,
                  garageUid: garageName
                }
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'garageName': garageName,
      'msg': msg
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String user) {
    return user == currentUserId;
  }

  Alignment getAlignment(user) {
    if (user == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatDocId)
          .collection('messages')
          .orderBy('createdOn', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          var data;
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              previousPageTitle: "back",
              middle: Text(garageUid),
              trailing: CupertinoButton(
                child: const Icon(CupertinoIcons.phone),
                onPressed: () {},
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      reverse: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        data = document.data()!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ChatBubble(
                            clipper: ChatBubbleClipper6(
                              nipSize: 0,
                              radius: 0,
                              type: BubbleType.sendBubble,
                            ),
                            alignment: getAlignment(data['uid'].toString()),
                            margin: const EdgeInsets.only(top: 20),
                            backGroundColor: isSender(data['uid'].toString())
                                ? const Color(0xFF08C187)
                                : const Color(0xffE7E7ED),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['msg'],
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                isSender(data['uid'].toString())
                                                    ? Colors.white
                                                    : Colors.black),
                                        maxLines: 100,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        data['createdOn'] == null
                                            ? DateTime.now().toString()
                                            : data['createdOn']
                                                .toDate()
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                isSender(data['uid'].toString())
                                                    ? Colors.white
                                                    : Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: CupertinoTextField(
                        controller: _textController,
                      )),
                      CupertinoButton(
                          child: const Icon(Icons.send_sharp),
                          onPressed: () => sendMessage(_textController.text))
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }


  }

