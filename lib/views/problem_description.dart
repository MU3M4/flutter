import 'package:flutter/material.dart';

class ProblemDescription extends StatefulWidget {
  const ProblemDescription({Key? key}) : super(key: key);

  @override
  State<ProblemDescription> createState() => _ProblemDescriptionState();
}

class _ProblemDescriptionState extends State<ProblemDescription> {
  late final TextEditingController _keyword;
  @override
  void initState() {
    
    _keyword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _keyword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Problem Description'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            controller: _keyword,
            enableSuggestions: true,
            decoration: const InputDecoration(
                hintText: 'Type keyword to get results of your car problem'),
          ),
          // const SizedBox(height: 20),
          
        ),
      ),
      
    );
  }
}
