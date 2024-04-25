import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController bilangan1 = TextEditingController();
  TextEditingController bilangan2 = TextEditingController();
  TextEditingController hasil = TextEditingController();
  String operasi = '+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Kalkulator Sederhana'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: bilangan1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bilangan Pertama',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: bilangan2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bilangan Kedua',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    hitung('+');
                  },
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    hitung('-');
                  },
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    hitung('*');
                  },
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    hitung('/');
                  },
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: hasil,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hasil',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void hitung(String op) {
    double num1 = double.tryParse(bilangan1.text) ?? 0;
    double num2 = double.tryParse(bilangan2.text) ?? 0;
    double result = 0;
    setState(() {
      switch (op) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            result = double.nan; // Menampilkan "NaN" untuk pembagian oleh nol
          }
          break;
      }
      hasil.text = result.toString();
    });
  }
}
