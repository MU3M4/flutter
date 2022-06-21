import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_progress/views/map_screen.dart';
import 'package:google_place/google_place.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.startPosition, required this.endPosition}) : super(key: key );
  final DetailsResult? startPosition;
  final DetailsResult? endPosition;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _startSearchFieldController = TextEditingController();
  final _endSearchFieldController = TextEditingController();

//DetailsResult is used to give the user details about a place.
//the details include the latlng position and so much more...

  DetailsResult? startPosition;
  DetailsResult? endPosition;

// Used to focus on a particular text field

  late FocusNode startFocusNode;
  late FocusNode endFocusNode;

// import the google place
//used to highlight places on the Google Map API
// Enable the Places API in Google Cloud to function properly.

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;
  @override
  void initState() {
    
    super.initState();
    String apiKEY = 'AIzaSyAH89SmA9RnEzXN7TiwCpe2UNXccmOuZfg';
    googlePlace = GooglePlace(apiKEY);

    startFocusNode = FocusNode();
    endFocusNode = FocusNode();
  }

  @override
  void dispose() {
    
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _startSearchFieldController,
              focusNode: startFocusNode,
              autofocus: false,
              style: const TextStyle(fontSize: 24),
              decoration: InputDecoration(
                  hintText: 'Starting Point?',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 24),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                  suffixIcon: _startSearchFieldController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              predictions = [];
                              _startSearchFieldController.clear();
                            });
                          },
                          icon: const Icon(Icons.clear_outlined),
                        )
                      : null),
              onChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 1000), () {
                  if (value.isNotEmpty) {
                    //call the places api
                    autoCompleteSearch(value);
                  } else {
                    //clear the textfield
                    setState(() {
                      predictions = [];
                      startPosition = null;
                    });
                  }
                });
              },
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(predictions[index].description.toString()),
                    onTap: () async {
                      final placeId = predictions[index].placeId!;
                      final details = await googlePlace.details.get(placeId);
                      if (details != null &&
                          details.result != null &&
                          mounted) {
                        if (startFocusNode.hasFocus) {
                          setState(() {
                            startPosition = details.result;
                            _startSearchFieldController.text =
                                details.result!.name!;
                            predictions = [];
                          });
                        } else {
                          setState(() {
                            endPosition = details.result;
                            _endSearchFieldController.text =
                                details.result!.name!;
                            predictions = [];
                          });
                        }
                        if (startPosition != null && endPosition != null) {
                          print('navigate');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => MapScreen(
                                  startPosition: startPosition,
                                  endPosition: endPosition)),
                            ),
                          );
                        }
                      }
                    },
                  );
                }),
            const SizedBox(height: 10),
            TextField(
                controller: _endSearchFieldController,
                autofocus: false,
                focusNode: endFocusNode,
                enabled: _startSearchFieldController.text.isNotEmpty &&
                    startPosition != null,
                style: const TextStyle(fontSize: 24),
                decoration: InputDecoration(
                    hintText: 'End Point?',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: InputBorder.none,
                    suffixIcon: _endSearchFieldController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                predictions = [];
                                _endSearchFieldController.clear();
                              });
                            },
                            icon: const Icon(Icons.clear_outlined),
                          )
                        : null),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 1000), () {
                    if (value.isNotEmpty) {
                      //call the places api
                      autoCompleteSearch(value);
                    } else {
                      //clear the textfield
                      setState(() {
                        predictions = [];
                        endPosition = null;
                      });
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}
