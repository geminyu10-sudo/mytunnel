import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyTunnelApp());
}

class MyTunnelApp extends StatelessWidget {
  const MyTunnelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTunnel',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const TunnelHome(),
    );
  }
}