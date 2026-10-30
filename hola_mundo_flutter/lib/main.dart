import 'package:flutter/material.dart';

// La función principal que arranca la app
void main() {
  runApp(const MiHolaMundo());
}

// Un Widget sin estado (Stateless), ideal para interfaces estáticas
class MiHolaMundo extends StatelessWidget {
  const MiHolaMundo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta roja de "DEBUG"
      title: 'App Hola Mundo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Primera Práctica'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text(
            '¡Hola Mundo desde Flutter :D',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}