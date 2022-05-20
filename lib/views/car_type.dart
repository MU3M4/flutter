import 'package:flutter/material.dart';

class CarType extends StatefulWidget {
  const CarType({Key? key}) : super(key: key);

  @override
  State<CarType> createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  late final TextEditingController _year;
  late final TextEditingController _appmodel;
  late final TextEditingController _numberplate;
  @override
  void initState() {
    _year = TextEditingController();
    _appmodel = TextEditingController();
    _numberplate = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _year.dispose();
    _appmodel.dispose();
    _numberplate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Type'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(children: <Widget>[
        // year textfield
        TextField(
          controller: _year,
          enableSuggestions: false,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Year',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
        ),
        //space in between the two fields
        const SizedBox(
          height: 25,
        ),
        //applied model textfield
        TextField(
          controller: _appmodel,
          enableSuggestions: false,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            hintText: 'Applied Model',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        //numberplate textfield
        TextField(
          controller: _numberplate,
          enableSuggestions: false,
          decoration: InputDecoration(
            hintText: 'Number Plate',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        //add car textbutton
        TextButton(
          onPressed: () {},
          child: const Text('ADD CAR'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Continue'),
        ),
      ]),
    );
  }
}
