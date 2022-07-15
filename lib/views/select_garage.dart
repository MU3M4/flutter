import 'package:flutter/material.dart';

class SelectGarage extends StatefulWidget {
  const SelectGarage({Key? key}) : super(key: key);

  @override
  State<SelectGarage> createState() => _SelectGarageState();
}

class _SelectGarageState extends State<SelectGarage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage'),
        centerTitle: true,
        elevation: 0,
      ),
      body:  Column(
        children: [
          Row(
             children: const <Widget>[
              Expanded(
                child: Text('Search by', textAlign: TextAlign.left,),
              ),
              SizedBox(width: 10,),
              Expanded(child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.filter_alt)),
                ),
              ),
              
             ],
             
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Location',
                prefixIcon: Icon(Icons.search),
              ),
            )
        ],
        
      ),
        

        
        
        
        

      
    );
  }
  
 
}

_selectOptions() {
}
