import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/views/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarType extends StatefulWidget {
  const CarType({Key? key}) : super(key: key);

  @override
  State<CarType> createState() => _CarTypeState();
}

class _CarTypeState extends State<CarType> {
  final fb = FirebaseDatabase.instance;
  final db = FirebaseFirestore.instance;

  final List<String> carModel = [
    'Audi',
    'BMW',
    'Chevrolet',
    'Chrysler',
    'Daihatsu',
    'Ford',
    'Hino',
    'Honda',
    'Isuzu',
    'Jaguar',
    'Jeep',
    'Landrover',
    'Lexus',
    'Mazda',
    'Mercedes',
    'Mitsubishi',
    'Nissan',
    'Peugeot',
    'Porsche',
    'Subaru',
    'Suzuki',
    'Toyota',
    'UD',
    'Volkswagen',
    'Volvo'
  ];
  final List<String> audiMake = [
    'A3',
    'A4',
    'A5',
    'A6',
    'A7',
    'A8',
    'Q3',
    'Q5',
    'Q7',
    'Q8',
    'R8',
    'TT',
  ];
  final List<String> bmwMake = [
    '1 Series',
    '2 Series',
    '3 Series',
    '4 Series',
    '5 Series',
    '6 Series',
    '7 Series',
    '8 Series',
    'M2',
    'M3',
    'M4',
    'M5',
    'M6',
    'X1',
    'X2',
    'X3',
    'X4',
    'X5',
    'X6',
    'X7',
    'Z4',
    'i3',
    'i8',
  ];
  final List<String> chevroletMake = [
    'Beat Hatchback',
    'Blazer',
    'Captiva',
    'Cavalier',
    'Colorado/S-10',
    'Corvette',
    'Cruze',
    'D-Max',
    'Equinox',
    'Joy Plus',
    'Malibu',
    'Montana',
    'Optra',
    'Orlando',
    'Prisma',
    'Sail',
    'Silverado',
    'Sonic/Aveo',
    'Sparks',
    'Suburban',
    'Tahoe',
    'Tracker',
    'Trailblazer',
    'Traverse',
    'Trax',
  ];
  final List<String> chryslerMake = [
    '300',
    'Pacifica',
    'Voyager Minivan',
  ];
  final List<String> daihatsuMake = [
    'Hijet',
    'Mira',
    'Move',
    'Rocky',
    'Tanto',
    'Terios',
  ];
  final List<String> fordMake = [
    'Bronco',
    'EcoSport',
    'Endeavour',
    'Endura',
    'Escape',
    'Everest',
    'F-150',
    'Falcon',
    'Fiesta',
    'Figo',
    'Focus',
    'Ka',
    'Mondeo',
    'Mustang',
    'Ranger',
    'S-Max',
    'Transit',
    'Troller T4',
    'WildTrack',
  ];
  final List<String> hinoMake = [
    'Dutro',
    'Profia',
    'Ranger',
  ];
  final List<String> hondaMake = [
    'CRV',
    'Civic',
    'Fit',
    'Freed',
    'Insight',
    'Jade',
    'Jazz',
    'Stepwagon',
    'Vezel/HRV/XRV'
  ];
  final List<String> isuzuMake = [
    'Buses',
    'D-Max',
    'F-Series/Forward',
    'FVZ-Series/Lorry',
    'N-Series Truck/ELF Truck',
    'Prime Mover/Giga',
    'mu-X',
  ];
  final List<String> jaguarMake = [
    'E Pace',
    'F Pace',
    'F Type',
    'S Type',
    'X Type',
    'XF',
    'XJ',
    'XK',
  ];
  final List<String> jeepMake = [
    'Compass',
    'Gladiator',
    'Grand Cherokee',
    'Patriot',
    'Renegade',
    'Wagoneer',
    'Wrangler',
  ];
  final List<String> landRoverMake = [
    'Defender',
    'Discovery',
    'Discovery Sport',
    'Freelander',
    'Range Rover',
    'Range Rover Evoque',
    'Range Rover Sport',
    'Range Rover Velar',
  ];
  final List<String> lexusMake = [
    'CT',
    'ES',
    'GS',
    'GX',
    'IS',
    'LC',
    'LS',
    'LX',
    'NX',
    'RC',
    'RX',
    'UX',
  ];
  final List<String> mazdaMake = [
    'Atenza/6',
    'Axela/3',
    'BT-50',
    'Bongo',
    'CX-3',
    'CX-30',
    'CX-5',
    'CX-8',
    'CX-9',
    'Demio',
    'MPV',
    'Premacy/5',
    'Verisa',
  ];
  final List<String> mercedesMake = [
    'Benz AMG GT',
    'Benz CLA',
    'Benz CLS',
    'Benz EQC',
    'Benz GLA',
    'Benz GLB',
    'Benz GLC',
    'Benz GLS',
    'Benz SL',
    'Benz Sprinter',
    'Benz A Class',
    'Benz B Class',
    'Benz C Class',
    'Benz E Class',
    'Benz G Class',
    'Benz S Class',
    'Benz V Class',
    'Benz X Class',
    'Trucks'
  ];
  final List<String> mitsubishiMake = [
    'Canter',
    'Colt Plus',
    'Delica',
    'Eclipse',
    'Evo',
    'Galant',
    'Io',
    'L200/Triton',
    'LanceR',
    'Mini',
    'Mirage',
    'Outlander',
    'Pajero/Mini/Io',
    'RVR',
  ];
  final List<String> nissanMake = [
    'AD Van',
    'Bluebird Saphyl',
    'Caravan',
    'Civilian',
    'Cube',
    'Dualis/Qashqai',
    'Elgrand',
    'Fuga',
    'Hardbody',
    'Juke',
    'Lafesta',
    'March',
    'Murano',
    'Navara',
    'Note',
    'NV 200/Vanette',
    'Patrol/Safari',
    'Serena',
    'Skyline',
    'Teana',
    'Tiida',
    'Titan',
    'Wingroad',
    'X-Trail',
  ];
  final List<String> peugeotMake = [
    '208',
    '3008',
    '308',
    '404',
    '405',
    '406',
    '504',
    '505',
    '506',
    '508',
    '5008',
    'RCZ',
  ];
  final List<String> porscheMake = [
    '718',
    '911',
    'Cayenne',
    'Macan',
    'Panamera'
  ];
  final List<String> subaruMake = [
    'Exiga',
    'Forester',
    'Impreza',
    'Legacy',
    'Levorg',
    'Outback',
    'XV',
    'WRX/STI'
  ];
  final List<String> suzukiMake = [
    'Alto',
    'Baleno Hatchback',
    'Ciaz',
    'Ertiga',
    'Escudo or VItara',
    'Jimny',
    'Swift',
    'Wagon R',
    'SX 4',
  ];
  final List<String> toyotaMake = [
    '110',
    '4Runner',
    'Allion',
    'Alphard',
    'Auris',
    'Avalon',
    'Avensis',
    'Axio',
    'Belta',
    'Blade',
    'C-HR',
    'Camry',
    'Coaster',
    'Corolla Cross',
    'Corolla Rumion',
    'Crown',
    'Dyna',
    'Estima',
    'FJ Cruiser',
    'Fielder',
    'Fortuner',
    'Harrier',
    'HiAce Truck',
    'Hiace',
    'Highlander',
    'Hilux',
    'Isis',
    'Ist',
    'Kluger',
    'Land Cruiser',
    'Land Cruiser Pickup',
    'Land Cruiser Prado',
    'Mark X',
    'NZE',
    'Noah',
    'Passo',
    'Premio',
    'Prius',
    'Probox',
    'Rav-4',
    'Ractis',
    'Regius Van',
    'Rush',
    'Sequoia',
    'Sienta',
    'Starlet',
    'Succeed',
    'Supra',
    'Tacoma',
    'TownAce',
    'TownAce/LiteAce Truck',
    'Toyoace',
    'Tundra',
    'Vanguard',
    'Vellfire',
    'Venza',
    'Vios',
    'Vitz',
    'Voxy',
    'Wish',
    'Yaris',
    'bB',
  ];
  final List<String> udMake = [
    'Condor',
    'Croner',
    'Kazet',
    'Kuzer',
    'Quester',
    'Quon',
  ];
  final List<String> volkswagenMake = [
    'Amarok',
    'Golf',
    'Jetta',
    'Passat',
    'Polo & Cross Polo',
    'Scirocco',
    'Tiguan',
    'Touareg',
    'Transporter',
  ];
  final List<String> volvoMake = [
    'C40',
    'S60',
    'V40',
    'V60',
    'V90',
    'XC40',
    'XC60',
    'XC70',
    'XC90',
  ];
  String? selectedCarModel;
  String? selectedCarMake;
  List<String> carMake = [];
  late Map<String, List<String>> dataset = {
    'Audi': audiMake,
    'BMW': bmwMake,
    'Chevrolet': chevroletMake,
    'Chrysler': chryslerMake,
    'Daihatsu': daihatsuMake,
    'Ford': fordMake,
    'Hino': hinoMake,
    'Honda': hondaMake,
    'Isuzu': isuzuMake,
    'Jaguar': jaguarMake,
    'Jeep': jeepMake,
    'Landrover': landRoverMake,
    'Lexus': lexusMake,
    'Mazda': mazdaMake,
    'Mercedes': mercedesMake,
    'Mitsubishi': mitsubishiMake,
    'Nissan': nissanMake,
    'Peugeot': peugeotMake,
    'Porsche': porscheMake,
    'Subaru': subaruMake,
    'Suzuki': suzukiMake,
    'Toyota': toyotaMake,
    'UD': udMake,
    'Volkswagen': volkswagenMake,
    'Volvo': volvoMake,
  };
  onCarModelChanged(String? value) {
    //dont change second dropdown if 1st item didnt change
    if (value != selectedCarModel) selectedCarMake = null;
    setState(() {
      selectedCarModel = value;
    });
  }

  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _appModelController = TextEditingController();
  final TextEditingController _numberPlateController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = GlobalKey<FormState>();

  @override
  void dispose() {
    _yearController.dispose();
    _appModelController.dispose();
    _numberPlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final ref = fb.ref().child("car");
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Type'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        key: _formKeyValue,
        // autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String?>(
              value: selectedCarModel,
              items: dataset.keys.map((e) {
                return DropdownMenuItem<String?>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: onCarModelChanged,
              hint: const Text('car model'),
            ),

            const SizedBox(
              height: 10,
            ),
            DropdownButton<String?>(
                value: selectedCarMake,
                hint: const Text('car make'),
                items: (dataset[selectedCarModel] ?? []).map((e) {
                  return DropdownMenuItem<String?>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCarMake = val!;
                  });
                }),

            const SizedBox(
              height: 10,
            ),
            // year textfield
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _yearController,
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
            ),
            //space in between the two fields
            const SizedBox(
              height: 10,
            ),
            //applied model textfield
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _appModelController,
                enableSuggestions: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Applied Model',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //numberplate textfield
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _numberPlateController,
                enableSuggestions: false,
                decoration: InputDecoration(
                  hintText: 'Number Plate',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.deepOrange),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //add car textbutton
            ElevatedButton(
              onPressed: () {
                if (_yearController.text.isNotEmpty &&
                    _appModelController.text.isNotEmpty &&
                    _numberPlateController.text.isNotEmpty) {
                  insertData(
                    _yearController.text,
                    _appModelController.text,
                    _numberPlateController.text,
                    selectedCarMake,
                    selectedCarModel,
                  );
                  Fluttertoast.showToast(msg: 'Success');
                }
              },
              child: const Text('ADD CAR'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const HomeScreen()),
                    ));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  void insertData(
    String year,
    String appmodel,
    String numberplate,
    selectedCarMake,
    selectedCarModel,
  ) {
    User user = FirebaseAuth.instance.currentUser!;
    db.collection('Car Details').doc(user.uid).set({
      "year": year,
      "appmodel": appmodel,
      "numberplate": numberplate,
      "carmodel": selectedCarModel,
      "carMake": selectedCarMake,
    });
    // fb.ref().child(user.uid).push().set({
    //   "year": year,
    //   "appmodel": appmodel,
    //   "numberplate": numberplate,
    //   "carmodel": selectedCarModel,
    //   "carMake": selectedCarMake,
    // });
    _yearController.clear();
    _appModelController.clear();

    _numberPlateController.clear();
  }
}
