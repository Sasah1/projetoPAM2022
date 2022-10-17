import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Programa de Ordenação de Número',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        // primaryColor: const Color(0xFFed5656),
        // accentColor: const Color(0xFFff3f3f),
        // canvasColor: const Color(0xFF000000),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController pNota = TextEditingController(text: '00');
  final TextEditingController sNota = TextEditingController(text: '00');
  String media = "";
  String status = "";
  String teste = "";
  String teste2 = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: new Text('Aplicativo Cálculo e Média'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.asset('assets/animation/heart.json')),
                // new Icon(Icons.favorite_border,
                //     color: const Color(0xFFbf1a1a), size: 48.0),
                new Text(
                  "Primeira Nota:",
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: const Color(0xFFf9eded),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new TextFormField(
                    controller: pNota,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                new Text(
                  "Segunda Nota:",
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: const Color(0xFFe3d8d8),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
                new TextFormField(
                    controller: sNota,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Resultado:",
                        style: new TextStyle(
                            fontSize: 26.0,
                            color: const Color(0xFFe6d1d1),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      ),
                      new Text(
                        media,
                        style: new TextStyle(
                            fontSize: 26.0,
                            color: const Color(0xFFdf1313),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      )
                    ]),
                SizedBox(
                  height: 20,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        "Situação:",
                        style: new TextStyle(
                            fontSize: 26.0,
                            color: const Color(0xFFece3e3),
                            fontWeight: FontWeight.w100,
                            fontFamily: "Roboto"),
                      ),
                      new Text(
                        status,
                        style: new TextStyle(
                            fontSize: 26.0,
                            color: const Color(0xFFfb1a1a),
                            fontWeight: FontWeight.w300,
                            fontFamily: "Roboto"),
                      )
                    ]),
                SizedBox(
                  height: 20,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new ElevatedButton(
                          key: null,
                          onPressed: buttonPressed,
                          //color: const Color(0xFFe0e0e0),
                          child: new Text(
                            "Calcular",
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto"),
                          )),
                      new ElevatedButton(
                          key: null,
                          onPressed: limpar,
                          //color: const Color(0xFFe0e0e0),
                          child: new Text(
                            "Limpar",
                            style: new TextStyle(
                                fontSize: 22.0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto"),
                          ))
                    ])
              ]),
        ),
      ),
    );
  }

  void buttonPressed() {
    double pN = 0, sN = 0, me;
    pN = double.parse(pNota.text);
    sN = double.parse(sNota.text);
    me = (pN + sN) / 2;
    setState(() {
      media = me.toStringAsFixed(2);
      if (me >= 7) {
        status = "Aluno Aprovado";
      } else {
        status = "Aluno Reprovado";
      }
    });
  }

  void limpar() {
    pNota.text = "00";
    sNota.text = "00";
    // pNum.text = "Digite a Segunda";
    setState(() {
      media = "";
      status = "";
    });
  }
}
