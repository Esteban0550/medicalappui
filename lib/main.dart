import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // Añadí 'const' aquí si HomePage es un widget constante
      theme:ThemeData(primarySwatch: Colors.red, ),
    
    
    
    
    
    
    );
  }
}
