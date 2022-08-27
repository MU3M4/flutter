import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/ItemDetails.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({Key? key}) : super(key: key) {
    _stream = reference.snapshots();
  }

  CollectionReference reference =
      FirebaseFirestore.instance.collection('users');
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Details'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error has occurred ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;
              List<Map> accountDetails = documents.map((e) => {
                'id': e.id,
                'name': e['name'],
                'email': e['email'],

              }).toList();
              return ListView.builder(
                itemCount: accountDetails.length,
                  itemBuilder: (BuildContext context, int index){
                  Map thisItem = accountDetails[index];
                  return ListTile(
                    title: Text('${thisItem['name']}'),
                    subtitle: Text('${thisItem['email']}'),
                    onTap: (){
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemDetails(thisItem['id'],)));
                    },
                  );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
