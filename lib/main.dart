import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/schedule_screen.dart';

void main() {
  runApp(const WolfpackApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/schedule', builder: (context, state) => const ScheduleScreen()),
  ],
);

class WolfpackApp extends StatelessWidget {
  const WolfpackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kerala Wolfpack Rugby Club',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFBBF24),
          error: Color(0xFFE11D48),
          surface: Color(0xFF050505),
        ),
        scaffoldBackgroundColor: const Color(0xFF050505),
        textTheme: GoogleFonts.outfitTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
    );
  }
}
