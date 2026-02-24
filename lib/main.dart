import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ugocode Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF020617),
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 237, 106, 58),
          secondary: Color(0xFF2563EB),
          surface: Color(0xFF0F172A),
          // background: Color.fromARGB(255, 91, 39, 5),
        ),
        textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme)
            .copyWith(
              displayLarge: GoogleFonts.spaceGrotesk(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              displayMedium: GoogleFonts.spaceGrotesk(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              displaySmall: GoogleFonts.spaceGrotesk(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              headlineMedium: GoogleFonts.spaceGrotesk(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              bodyLarge: GoogleFonts.dmSans(
                fontSize: 18,
                color: const Color(0xFF94A3B8),
              ),
              bodyMedium: GoogleFonts.dmSans(
                fontSize: 16,
                color: const Color(0xFF94A3B8),
              ),
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
