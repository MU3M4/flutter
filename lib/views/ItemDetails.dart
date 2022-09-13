import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class itemDetails extends StatelessWidget {
  itemDetails({Key? key, required this.itemId, required this.reference})
      : super(key: key) {
    reference = FirebaseFirestore.instance.collection('users').doc(itemId);
    _futureData = reference.get();
  }
  String itemId;
  late DocumentReference reference;
  late Future<DocumentSnapshot> _futureData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Some error has occurred ${snapshot.error}'));
          }
          if(snapshot.hasData){
            DocumentSnapshot documentSnapshot = snapshot.data;
            Map data = documentSnapshot.data() as Map;
            return Column(
              children: [
                Text('${data["name"]}'),
              Text('${data['email']}'),
              ],
            );
            }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
