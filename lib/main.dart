import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey
      ),

      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget{
  Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio>{

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "BORRAR"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

    });

  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlinedButton(
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(24.0))
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Calculadora Flutter", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blueGrey,
        ),
        body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 12.0
                    ),
                    child: new Text(output, style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,

                    ))),
                new Expanded(
                  child: new Divider(),
                ),


                new Column(children: [
                  new Row(children: [
                    buildButton("7"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("8"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("9"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("/")
                  ]),
                  new Row(children: [
                    new Divider(height: 5,)
                  ]),


                  new Row(children: [
                    buildButton("4"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("5"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("6"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("X")
                  ]),
                  new Row(children: [
                    new Divider(height: 5,)
                  ]),

                  new Row(children: [
                    buildButton("1"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("2"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("3"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("-")
                  ]),
                  new Row(children: [
                    new Divider(height: 5,)
                  ]),

                  new Row(children: [
                    buildButton("."),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("0"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("00"),new Row(children: [new Divider(indent: 5,)]),
                    buildButton("+")
                  ]),
                  new Row(children: [
                    new Divider(height: 5,)
                  ]),

                  new Row(children: [
                    buildButton("BORRAR"),
                    buildButton("="),
                  ]),
                  new Row(children: [
                    new Divider(height: 5,)
                  ]),
                ])
              ],
            )));
  }
}





Widget cuerpo(){
  return Text("widget cuerpo");
}
