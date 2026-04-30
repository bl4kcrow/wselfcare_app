import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF0C0069),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF1A05A2),
        onPrimaryContainer: Color(0xFF8C8BFF),
        secondary: Color(0xFFA7238B),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFFF71D8),
        onSecondaryContainer: Color(0xFF72005F),
        tertiary: Color(0xFF3F0012),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFF660022),
        onTertiaryContainer: Color(0xFFFF6081),
        error: Color(0xFFBA1A1A),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFFFDAD6),
        onErrorContainer: Color(0xFF93000A),
        surface: Color(0xFFFFF8F6),
        onSurface: Color(0xFF331100),
      ),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.notoSerif(),
        displayMedium: GoogleFonts.notoSerif(),
        displaySmall: GoogleFonts.notoSerif(),
        headlineLarge: GoogleFonts.notoSerif(),
        headlineMedium: GoogleFonts.notoSerif(),
        headlineSmall: GoogleFonts.notoSerif(),
        titleLarge: GoogleFonts.notoSerif(fontStyle: FontStyle.italic),
        titleMedium: GoogleFonts.plusJakartaSans(),
        titleSmall: GoogleFonts.plusJakartaSans(),
        bodyLarge: GoogleFonts.plusJakartaSans(),
        bodyMedium: GoogleFonts.plusJakartaSans(),
        bodySmall: GoogleFonts.plusJakartaSans(),
        labelLarge: GoogleFonts.plusJakartaSans(),
        labelMedium: GoogleFonts.plusJakartaSans(),
        labelSmall: GoogleFonts.plusJakartaSans(),
      ),
      scaffoldBackgroundColor: const Color(0xFFFFF8F6),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF0C0069)),
        titleTextStyle: GoogleFonts.notoSerif(
          color: const Color(0xFF0C0069),
          fontSize: 24,
          fontStyle: FontStyle.italic,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF0C0069),
        unselectedItemColor: Color(0xFF777585),
        backgroundColor: Colors.white,
      ),
    );
  }
}
