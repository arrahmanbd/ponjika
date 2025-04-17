
import 'package:flutter/material.dart';
import 'package:ponjika/ponjika.dart';

void main() {
  runApp(const PonjikaExampleApp());
}

class PonjikaExampleApp extends StatelessWidget {
  const PonjikaExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final date = Ponjika.format(
      date: today,
      format: "DD MM, YY",
      showWeekDays: true,
      showSeason: true,
    );

    final season = Ponjika.getSeasonEmoji(today, showName: true);
    final day = Ponjika.format(date: today, format: "WW", showWeekDays: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Shohid', useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFB30000), // Classic deep red
          foregroundColor: Colors.white,
          title: const Text(
            'বাংলা ক্যালেন্ডার',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
          elevation: 4,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/bg.jpg', fit: BoxFit.cover),
            ),

            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                width: 360,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(6, 8),
                      blurRadius: 16,
                      spreadRadius: 5,
                    ),
                  ],
                  color: const Color.fromARGB(
                    36,
                    252,
                    247,
                    208,
                  ).withValues(alpha:0.95), // Retro yellow with slight opacity
                  border: Border.all(color: const Color(0xFFB30000), width: 6),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      season,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB30000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 24,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB30000),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
