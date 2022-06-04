import 'package:flutter/material.dart';

class ProblemDescription extends StatefulWidget {
  const ProblemDescription({Key? key}) : super(key: key);

  @override
  State<ProblemDescription> createState() => _ProblemDescriptionState();
}

class _ProblemDescriptionState extends State<ProblemDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text('Enter Problem Description'),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                  hintText: ('Problem Description'),
                )
                )
              ]
            )
          )

        )
        
      ),
    );
  }
}
