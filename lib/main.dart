import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "calcualtor",
      home: SimpleCalcultor(),
    );
  }
}

class SimpleCalcultor extends StatefulWidget {
  @override
  _SimpleCalcultorState createState() => _SimpleCalcultorState();
}

class _SimpleCalcultorState extends State<SimpleCalcultor> {
  String equation = "0", expression = "", result = "";
  double equaFontSize = 38, resultFontSize = 48;

  longPressed (String btnText){
    setState(() {
      if(btnText == "="){
        equaFontSize = 38;
        resultFontSize = 48;
        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression. replaceAll("÷", "/");
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${(exp.evaluate(EvaluationType.REAL, cm))}";
        }catch (e){
          result = "Syntax Error";
        }

      }else  if(btnText == "Del"){
        equaFontSize = 48;
        resultFontSize = 38;
        equation = "0";
        result = "0";
      }else  if(btnText == "C"){
        equaFontSize = 48;
        resultFontSize = 38;
        equation = "0";
        result = "0";

      }else{
        equaFontSize = 48;
        resultFontSize = 38;
        if(equation == "0"){
          equation = btnText;
        }else{
          equation = equation + btnText;
        }

      }
    });
  }

  pressed (String btnText){
    setState(() {
      if(btnText == "="){
        equaFontSize = 38;
        resultFontSize = 48;
        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression. replaceAll("÷", "/");
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = "${(exp.evaluate(EvaluationType.REAL, cm))}";
        }catch (e){
         result = "Syntax Error";
        }

      }else  if(btnText == "Del"){
        equaFontSize = 48;
        resultFontSize = 38;
        equation = equation.substring(0, equation.length-1);
      }else  if(btnText == "C"){
        equaFontSize = 48;
        resultFontSize = 38;
        equation = "0";
        result = "0";

      }else{
        equaFontSize = 38;
        resultFontSize = 48;
        if(equation == "0"){
          equation = btnText;
        }else{
          equation = equation + btnText;
        }

      }
    });
  }

  Widget buildButton(String btnText, Color btnColor, double btnHeight) {
    return (Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.1 * btnHeight,
      child: FlatButton(
        onPressed: () => pressed(btnText),
        onLongPress: () => longPressed(btnText),
        child: Text(btnText, style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      //padding: EdgeInsets.all(16),
      color: btnColor,
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calcultor",
          style: TextStyle(fontSize: 28,),),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            child: Text(result, style: TextStyle(fontSize: resultFontSize),),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
          ),

          Container(
            child: Text(equation, style: TextStyle(fontSize: equaFontSize),),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10.0),
          ),

          Expanded(child: Divider()),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.75,
                child: Table(children: [
                  TableRow(children: [
                    buildButton("C", Colors.redAccent, 1),
                    buildButton("Del", Colors.blue, 1),
                    buildButton("÷", Colors.blue, 1)
                  ]),
                  TableRow(children: [
                    buildButton("9", Colors.black54, 1),
                    buildButton("8", Colors.black54, 1),
                    buildButton("7", Colors.black54, 1)
                  ]),
                  TableRow(children: [
                    buildButton("6", Colors.black54, 1),
                    buildButton("5", Colors.black54, 1),
                    buildButton("4", Colors.black54, 1)
                  ]),
                  TableRow(children: [
                    buildButton("3", Colors.black54, 1),
                    buildButton("2", Colors.black54, 1),
                    buildButton("1", Colors.black54, 1)
                  ]),
                  TableRow(children: [
                    buildButton(".", Colors.black54, 1),
                    buildButton("0", Colors.black54, 1),
                    buildButton("00", Colors.black54, 1)
                  ])
                ],),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Table(children: [
                  TableRow(children: [
                    buildButton("x", Colors.blue, 1),
                  ]),
                  TableRow(children: [
                    buildButton("-", Colors.blue, 1),
                  ]),
                  TableRow(children: [
                    buildButton("+", Colors.blue, 1),
                  ]),
                  TableRow(children: [
                    buildButton("=", Colors.redAccent, 2),
                  ]),

                ],),
              )
            ],
          )
        ])
    );
  }
}
























//
//
// // import 'package:flutter/material.dart';
//
// // void main() {
// //   runApp(MyApp());
// // }
//
// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }
//
// // class _MyAppState extends State<MyApp> {
// //   var questionIndex = 0;
//
// //   @override
// //   Widget build(BuildContext context) {
// //     var level = 0;
//
// //     void count() {
// //       setState(() {
// //         level += 1;
// //       });
// //     }
//
// //     return MaterialApp(
// //       home: Scaffold(
// //         backgroundColor: Colors.grey[600],
// //         appBar: AppBar(
// //           title: Text(
// //             'My Title',
// //             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //           ),
// //           centerTitle: true,
// //           backgroundColor: Colors.grey[800],
// //         ),
// //         body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //           Center(
// //             child: CircleAvatar(
// //               backgroundImage: AssetImage('assets/Emmnuella.jpg'),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 40,
// //           ),
// //           Text(
// //             "NAME",
// //             style: TextStyle(
// //               color: Colors.white,
// //               letterSpacing: 2,
// //             ),
// //           ),
// //           SizedBox(
// //             height: 10,
// //           ),
// //           Text(
// //             "BRAVE",
// //             style: TextStyle(
// //               color: Colors.yellow,
// //               fontSize: 28,
// //               letterSpacing: 2,
// //             ),
// //           ),
// //           SizedBox(
// //             height: 40,
// //           ),
// //           Text(
// //             "CURRENT LEVEL",
// //             style: TextStyle(
// //               color: Colors.white,
// //               letterSpacing: 2,
// //             ),
// //           ),
// //           SizedBox(
// //             height: 10,
// //           ),
// //           Text(
// //             "$level",
// //             style: TextStyle(
// //               color: Colors.yellow,
// //               fontSize: 28,
// //               letterSpacing: 2,
// //             ),
// //           ),
// //           SizedBox(
// //             height: 40,
// //           ),
// //           Row(
// //             children: [
// //               Icon(Icons.email),
// //               SizedBox(
// //                 width: 10,
// //               ),
// //               Text("moyongho@gmail.com")
// //             ],
// //           )
// //         ]),
// //         floatingActionButton: FloatingActionButton(
// //           child: Text("click"),
// //           onPressed: count,
// //         ),
// //       ),
// //     );
// //   }
// // }
