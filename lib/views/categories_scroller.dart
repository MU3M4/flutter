import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesScroller extends StatelessWidget {
  CategoriesScroller({Key? key}) : super(key: key);
  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: Row(
              children: <Widget>[
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Brakes',
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '20 items',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                          ])),
                ),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Engine',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '20 items',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                              SizedBox(height: 10),
                            ]))),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade400, borderRadius: const BorderRadius.all(Radius.circular(20.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'AC',
                            style: TextStyle(fontSize: 25, color: Colors.orange),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '20 items',
                            style: TextStyle(fontSize: 25, color: Colors.orange),
                          ),
                          SizedBox(height: 10),
                        ]),
                  ),
                ),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Steering Wheel',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.blue),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '20 items',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.blueAccent),
                              ),
                              SizedBox(height: 10),
                            ]))),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Car Battery',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.orangeAccent),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '20 items',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.blue),
                              ),
                              SizedBox(height: 10),
                            ]))),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 20),
                    height: categoryHeight,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Text(
                                'Suspensions',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.red),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '20 items',
                                style:
                                    TextStyle(fontSize: 25, color: Colors.blue),
                              ),
                              SizedBox(height: 10),
                            ]))),
                Expanded(child: ListView.builder(
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                  return itemsData[index];
                })))
              ],
            ),
          )),
    );
  }
}
