// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.grey[400], shape: BoxShape.circle),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            )
            //cards
            //3 buttons - send, bill and pay
            //column - stats and transactions
          ],
        ),
      ),
    );
  }
}
