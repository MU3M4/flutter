import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress/constants/routes.dart';
import 'package:flutter_progress/views/calendar/appointment.dart';
import 'package:flutter_progress/views/calendar/event_provider.dart';
import 'package:flutter_progress/views/car_type.dart';
import 'package:flutter_progress/views/forgot_password.dart';
import 'package:flutter_progress/views/home_screen.dart';
import 'package:flutter_progress/views/login_view.dart';
import 'package:flutter_progress/views/map_screen.dart';
import 'package:flutter_progress/views/otp.dart';
import 'package:flutter_progress/views/phone_verification.dart';
import 'package:flutter_progress/views/register_view.dart';
import 'package:flutter_progress/views/select_garage.dart';
import 'package:flutter_progress/views/splash_screen.dart';
import 'package:flutter_progress/views/verify_email_view.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Atta',
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: Colors.black,
        //   primaryColor: Colors.deepOrange,
        // ),

        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const Splash(),

        // initialRoute: phoneRoute: (content) => const PhoneAuth(),};
        routes: {
          phoneRoute: (context) => const PhoneAuth(),
          otpRoute: (context) => const OtpPage(phone: ''),
          loginRoute: (context) => const LoginView(),
          mapRoute: (context) => const MapScreen(),
          registerRoute: (context) => const RegistrationView(),
          homeRoute: (context) => const HomeScreen(),
          forgotRoute: (context) => ForgotPassword(),
          garageRoute: (context) => const SelectGarage(),
          appointmentRoute: (context) => const AppointmentDetails(),

          carRoute: (context) => const CarType(),

          //locationRoute: (context) => LocationController(),
        },
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const VerifyEmailView();
              } else {
                return const LoginView();
              }
            }),
    
      );
      
}
