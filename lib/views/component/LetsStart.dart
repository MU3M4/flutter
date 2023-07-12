import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/main_page.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MainPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.right_chevron,
              color: Colors.white.withOpacity(0.7)),
          Text(
            'Let\'s Start',
            style: TextStyle(
                fontSize: 25, color: CupertinoColors.white.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}
