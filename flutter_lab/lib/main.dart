import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The North Face',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF3F1E8),
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// SPLASH SCREEN
// ============================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Animation de la barre de chargement
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.forward();

    // Après 3 secondes → page suivante
    Timer(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F1E8),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Stack(
              children: [

                // ==================================================
                // 1. LOGO
                // ==================================================

                Positioned(
                  top: height * 0.065,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: width * 0.18,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // ==================================================
                // 2. "BUILT FOR"
                // ==================================================

                Positioned(
                  top: height * 0.18,
                  left: 0,
                  right: 0,
                  child: Text(
                    'B U I L T   F O R',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF161616),
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                ),

                // ==================================================
                // 3. "WHAT'S NEXT"
                // ==================================================

                Positioned(
                  top: height * 0.205,
                  left: 0,
                  right: 0,
                  child: Text(
                    "WHAT’S NEXT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF161616),
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 4,
                    ),
                  ),
                ),

                // ==================================================
                // 4. SOUS-TITRE
                // ==================================================

                Positioned(
                  top: height * 0.255,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Performance. Style. Aucune limite.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF85847F),
                      fontSize: width * 0.032,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                // ==================================================
                // 5. MODÈLE
                // ==================================================

                Positioned(
                  top: height * 0.285,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/splash.png',
                      width: width * 0.90,
                      height: height * 0.90,
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),

                // ==================================================
                // 6. BARRE DE CHARGEMENT
                // ==================================================

                Positioned(
                  bottom: height * 0.065,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return SizedBox(
                          width: width * 0.18,
                          height: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [

                                // Fond de la barre
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFF77756F),
                                      width: 0.7,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                ),

                                // Progression
                                FractionallySizedBox(
                                  widthFactor: _controller.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ============================================================
// PAGE APRÈS LE SPLASH
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF3F1E8),
      body: Center(
        child: Text(
          'HOME',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}