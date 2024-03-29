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
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        title: 'Atta',
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.light,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black12,
        ),
        home: const Splash(),
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
        },
      ),
    ),
  );
}
