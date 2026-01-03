import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String expression = "0";
  String result = "0";

  // --- RESPONSIVE BUTON FONKSİYONU ---
  Widget buildButton(String text, Color textColor, {Color? bgColor}) {
    return Expanded(
      child: Container(
        // Butonların birbirine yapışık ve responsive olması için Expanded şart
        decoration: BoxDecoration(color: bgColor ?? Colors.transparent),
        child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onPressed: () => print("button pressed: $text"),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //yorum satiri eklemem soylendi
  @override
  Widget build(BuildContext context) {
    const Color panelColor = Color(0xFF9E9E9E);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: panelColor,
          title: const Text('Calculator'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            // 1. ÜST PANEL (SONUÇ EKRANI)
            Expanded(
              flex: 4, // Ekranın %30'u buraya ayrıldı
              child: Container(
                width: double.infinity, // Yatayda tam yayıl
                padding: const EdgeInsets.symmetric(),
                alignment: Alignment.bottomRight, // Yazıları sağ alta yasla
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Expression (İşlem)
                    SingleChildScrollView(
                      // Çok uzun işlemler için kaydırılabilir
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        expression,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Result (Sonuç)
                    FittedBox(
                      // Ekranın arkasında kalmaması ve taşmaması için şart!
                      fit: BoxFit.scaleDown,
                      child: Text(
                        result,
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 2. ALT PANEL (TUŞ TAKIMI)
            Expanded(
              flex: 5, // Ekranın %70'i buraya ayrıldı
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF9E9E9E), // AppBar ile aynı renk
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Column(
                    children: [
                      // Tüm satırları Expanded yaparak tuş takımının kendi içinde yayılmasını sağla
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("7", Colors.black),
                            buildButton("8", Colors.black),
                            buildButton("9", Colors.black),
                            buildButton("C", Colors.red),
                            buildButton("AC", Colors.red),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("4", Colors.black),
                            buildButton("5", Colors.black),
                            buildButton("6", Colors.black),
                            buildButton("+", Colors.white),
                            buildButton("-", Colors.white),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("1", Colors.black),
                            buildButton("2", Colors.black),
                            buildButton("3", Colors.black),
                            buildButton("x", Colors.white),
                            buildButton("/", Colors.white),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            buildButton("0", Colors.black),
                            buildButton(".", Colors.black),
                            buildButton("00", Colors.black),
                            buildButton(
                              "=",
                              Colors.white,
                              bgColor: Colors.blueAccent,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20), // Alt güvenli boşluk
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
