import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _numeroaleatorio = 0;
  var _fraseescolhida = '';
  List _frases = [
    'Desanima não, tem mais coisa ruim para acontecer.',
    'Seu futuro só depende de você. Pode chorar!',
    'Nada pode ser tão ruim que não possa piorar.',
    'A persistência é o caminho do êxito.',
    'A mentira nunca é plena, mata a alma e a envenena.',
    'Para que estudar se o futuro é a morte!'
  ];
  void _gerarFrase() {
    setState(() {
      _numeroaleatorio = Random().nextInt(_frases.length);
      _fraseescolhida = _frases[_numeroaleatorio];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Image.asset("images/logo.png"),
          Text(
            _fraseescolhida,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic, color: Colors.black),
          ),
          Text(
            "Clique abaixo para gerar uma frase!",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: _gerarFrase,
              child: Text("Nova Frase", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)))
        ]),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Container(height: 50.0),
      ),
    );
  }
}
