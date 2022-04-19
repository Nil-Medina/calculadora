// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(
        title: '',
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String strInput = "";
  final txtResultado = TextEditingController();
  final txtEntrada = TextEditingController();
  @override
  void initState() {
    super.initState();
    txtEntrada.addListener(() {});
    txtResultado.addListener(() {});
  }

  @override
  void dispose() {
    txtResultado.dispose();
    super.dispose();
  }

  //Boton widget
  Widget calcbutton(String btntext, Color btncolor, Color textcolor) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          txtEntrada.text = txtEntrada.text + btntext;
        });
      },
      child: Text(
        btntext,
        style: TextStyle(
          fontSize: 33,
          color: textcolor,
        ),
      ),
      shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      color: btncolor,
      padding: const EdgeInsets.all(19),
    );
  }

  Widget botonpenu(String btntext, Color btncolor, Color textcolor) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            setState(() {
              txtEntrada.text = txtEntrada.text + btntext;
            });
          },
          child: Text(
            btntext,
            style: TextStyle(
              fontSize: 33,
              color: textcolor,
            ),
          ),
          shape: const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
          color: btncolor,
          padding: const EdgeInsets.all(19),
        ),
      ],
    );
  }

  Widget botonBorrar() {
    return RaisedButton(
      onPressed: () {
        txtEntrada.text = (txtEntrada.text.isNotEmpty)
            ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
            : "";
      },
      child: (const Icon(
        Icons.backspace,
        color: Colors.white,
        size: 35,
      )),
      shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      color: Colors.grey[700]!,
      padding: const EdgeInsets.all(21),
    );
  }

  Widget acBoton(String btntext, Color btncolor, Color textcolor) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          txtEntrada.text = "";
          txtResultado.text = "";
        });
      },
      child: Text(
        btntext,
        style: TextStyle(
          fontSize: 33,
          color: textcolor,
        ),
      ),
      shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      color: btncolor,
      padding: const EdgeInsets.all(19),
    );
  }

  Widget botonIgual() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: FlatButton(
        child: const Text(
          '=',
          style: TextStyle(fontSize: 28.0, color: Colors.black),
        ),
        onPressed: () {
          // ignore: unnecessary_new
          Parser p = new Parser();
          // ignore: unnecessary_new
          ContextModel cm = new ContextModel();
          Expression exp = p.parse(txtEntrada.text);
          setState(() {
            txtResultado.text =
                "=" + exp.evaluate(EvaluationType.REAL, cm).toString();
          });
        },
        color: Colors.orange,
        padding: const EdgeInsets.all(25),
        splashColor: Colors.black,
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      ),
    );
  }

  Widget botonope(String btntext, Color btncolor, Color textcolor) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          txtEntrada.text = txtEntrada.text + "*";
        });
      },
      child: Text(
        btntext,
        style: TextStyle(
          fontSize: 33,
          color: textcolor,
        ),
      ),
      shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      color: btncolor,
      padding: const EdgeInsets.all(19),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('CALCULADORA'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Pantalla de la calculadora
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "0",
                    hintStyle: TextStyle(
                      fontSize: 55,
                    )),
                style: const TextStyle(
                  fontSize: 55,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                      hintText: '', fillColor: Colors.black),
                  textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                  controller: txtResultado,
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                acBoton('AC', Colors.grey[700]!, Colors.white),
                botonope('x', Colors.orange, Colors.black),
                calcbutton('/', Colors.orange, Colors.black),
                botonBorrar(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.grey[900]!, Colors.orange),
                calcbutton('8', Colors.grey[900]!, Colors.orange),
                calcbutton('9', Colors.grey[900]!, Colors.orange),
                calcbutton('+', Colors.orange, Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey[900]!, Colors.orange),
                calcbutton('5', Colors.grey[900]!, Colors.orange),
                calcbutton('6', Colors.grey[900]!, Colors.orange),
                calcbutton('-', Colors.orange, Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botonpenu('1', Colors.grey[900]!, Colors.orange),
                botonpenu('2', Colors.grey[900]!, Colors.orange),
                botonpenu('3', Colors.grey[900]!, Colors.orange),
                calcbutton('%', Colors.orange, Colors.black),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Este es el boton 0
                RaisedButton(
                  padding: const EdgeInsets.fromLTRB(34, 19, 128, 19),
                  onPressed: () {
                    setState(() {
                      txtEntrada.text = txtEntrada.text + "0";
                    });
                  },
                  shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(10, 10))),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 33,
                      color: Colors.orange,
                    ),
                  ),
                  color: Colors.grey[900]!,
                ),
                calcbutton('.', Colors.grey[900]!, Colors.orange),
                botonIgual(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
