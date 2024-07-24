import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:practica1/constants.dart';
import 'package:practica1/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: '${dotenv.env["SUPABASE_URL"]}',
      anonKey: '${dotenv.env["SUPABASE_ANONKEY"]}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi app",
      theme: ThemeData(
          brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
    );
  }
}

class HandlerAuth extends StatefulWidget {
  const HandlerAuth({super.key});
  @override
  HandlerAuthState createState() => HandlerAuthState();
}

class HandlerAuthState extends State<HandlerAuth> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _getAuth();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = supabaseClient.auth.currentUser;
    });
    supabaseClient.auth.onAuthStateChange.listen((event) {
      setState(() {
        _user = event.session?.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
    );
  }
}
