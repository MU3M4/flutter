import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  final TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Edt Number'),
          previousPageTitle: 'Back',
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text(
                  'Phone Verification',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 30),
                )
              ],
            ),
            Text(
              'Enter your phone number',
              style: TextStyle(
                color: CupertinoColors.systemOrange.withOpacity(0.7),
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Kenya',
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text(
                    "+254",
                    style: TextStyle(
                        fontSize: 25, color: CupertinoColors.secondaryLabel),
                  ),
                  Expanded(
                    child: CupertinoTextField(
                      placeholder: 'Enter your phone number',
                      controller: _phoneNumber,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontSize: 25, color: CupertinoColors.secondaryLabel),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
