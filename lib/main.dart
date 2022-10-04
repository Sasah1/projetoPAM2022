import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Programa de Ordenação de Número',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFed5656),
        accentColor: const Color(0xFFff3f3f),
        canvasColor: const Color(0xFF000000),
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
  TextEditingController pNota = TextEditingController();
  TextEditingController sNota = TextEditingController();
  String media = "";
  String status = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Aplicativo Cálculo e Média'),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.favorite_border,
                color: const Color(0xFFbf1a1a), size: 48.0),
            new Text(
              "Primeira Nota:",
              style: new TextStyle(
                  fontSize: 26.0,
                  color: const Color(0xFFf9eded),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new TextField(
              controller: pNota,
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new Text(
              "Segunda Nota:",
              style: new TextStyle(
                  fontSize: 26.0,
                  color: const Color(0xFFe3d8d8),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new TextField(
              controller: sNota,
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
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
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      key: null,
                      onPressed: buttonPressed,
                      color: const Color(0xFFe0e0e0),
                      child: new Text(
                        "Calcular",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: const Color(0xFF0f0606),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                      )),
                  new RaisedButton(
                      key: null,
                      onPressed: limpar,
                      color: const Color(0xFFe0e0e0),
                      child: new Text(
                        "Limpar",
                        style: new TextStyle(
                            fontSize: 22.0,
                            color: const Color(0xFFca1313),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      ))
                ])
          ]),
    );
  }

  void buttonPressed() {
    double pN, sN, me;
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
    pNota.text = "";
    sNota.text = "";
    pNum.text = "Digite a Segunda";
    setState(() {
      media = "";
      status = "";
    });
  }
}
