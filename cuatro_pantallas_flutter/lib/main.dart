import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuración de los idiomas generados
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // Inglés
        Locale('es', ''), // Español
      ],
      home: const PantallaResponsive(),
    );
  }
}

class PantallaResponsive extends StatelessWidget {
  const PantallaResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Detectamos la orientación (Vertical u Horizontal)
    final orientation = MediaQuery.of(context).orientation;
    final esVertical = orientation == Orientation.portrait;

    // 2. Detectamos el idioma actual
    final locale = Localizations.localeOf(context).languageCode;
    final esEspanol = locale == 'es';

    // 3. Asignamos colores según Orientación e Idioma
    Color colorFondo;
    Color colorTexto;

    if (esVertical) {
      if (esEspanol) {
        colorFondo = const Color(0xFFF3F4F6); // Gris claro
        colorTexto = const Color(0xFF212121); // Gris oscuro
      } else {
        colorFondo = const Color(0xFF1E490E); // Verde oscuro
        colorTexto = const Color(0xFF3EE202); // Verde claro
      }
    } else {
      if (esEspanol) {
        colorFondo = const Color(0xFFFBB200); // Naranja/Amarillo
        colorTexto = const Color(0xFFFFFFFF); // Blanco
      } else {
        colorFondo = const Color(0xFF098989); // Cian oscuro
        colorTexto = const Color(0xFFFDFDFD); // Blanco
      }
    }

    // 4. Construimos la interfaz
    return Scaffold(
      backgroundColor: colorFondo,
      body: Center(
        child: Text(
          // Seleccionamos el texto de los archivos .arb según la orientación
          esVertical
              ? AppLocalizations.of(context)!.saludoVertical
              : AppLocalizations.of(context)!.saludoHorizontal,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorTexto,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}