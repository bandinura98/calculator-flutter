import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'calc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "0";
  String _counter2 = "";
  String oper = "";
  bool flag = false;

  void emptyer(){
    _counter = "";
    oper = "";
  }

  void _incrementCounter(String title,String op) {
//1 sayı 2 operasyon 3 sil 4 eşittir

    setState(() {
      if(op == "1" && flag==false){
        _counter += title;
      }
      if(op == "1" && flag==true){
        _counter2 += title;
      }
      if(op=="2"){
        flag=true;
        oper=title;
      }
      if(op=="4" && oper=="+"){
        _counter = (double.parse(_counter) + double.parse(_counter2)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="-"){
        _counter = (double.parse(_counter) - double.parse(_counter2)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="/"){
        _counter = (double.parse(_counter) / double.parse(_counter2)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="x"){
        _counter = (double.parse(_counter) * double.parse(_counter2)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="sin"){
        _counter = sin(double.parse(_counter)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="cos"){
        _counter = cos(double.parse(_counter)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="tan"){
        _counter = tan(double.parse(_counter)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="cot"){
        _counter = (sin(double.parse(_counter))/cos(double.parse(_counter))) as String;
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="square"){
        _counter = (double.parse(_counter) * double.parse(_counter)).toString();
        _counter2 = "";
        oper = "";
      }
      if(op=="4" && oper=="pow"){
        _counter = (pow(double.parse(_counter), double.parse(_counter2))).toString();//(int.parse(_counter) * int.parse(_counter)).toString();
        _counter2 = "";
        oper = "";
      }

      if(op=="3"){
        _counter2="";
        _counter="0";
        flag=false;
      }

      if(double.parse(_counter) == double.parse(_counter).toInt()){
        _counter = double.parse(_counter).toInt().toString();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'sin',
      'cos',
      'tan',
      'cot',
      'square',
      'pow'
    ];
    String? selectedValue;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '$_counter' + '$oper' + '$_counter2',
                  style: Theme.of(context).textTheme.headline4,
                ),

              ),
              GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    if(index==20){
                      return DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Select Item',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                              print(selectedValue);
                              _incrementCounter(selectedValue.toString(),"2");
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.yellow,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 50,
                          buttonWidth: 160,
                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.redAccent,
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding: const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: 200,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.redAccent,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      );
                    }
                    else return Center(
                        child: TextButton(
                          child: Text(choices[index].title),
                          onPressed: (){
                            _incrementCounter(choices[index].title,choices[index].op);
                          },
                        )
                      //Text(choices[index].title)
                    );
                  }
                  )
              ),
            ],
          )
      ),

    );
  }
}


class Choice {
  const Choice({required this.title, required this.op});
  final String title;
  final String op;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '', op: "0"),
  const Choice(title: '', op: "0"),
  const Choice(title: '', op: "0"),
  const Choice(title: '', op: "0"),
  const Choice(title: '1', op: "1"),
  const Choice(title: '2', op: "1"),
  const Choice(title: '3', op: "1"),
  const Choice(title: '+', op: "2"),
  const Choice(title: '4', op: "1"),
  const Choice(title: '5', op: "1"),
  const Choice(title: '6', op: "1"),
  const Choice(title: '-', op: "2"),
  const Choice(title: '7', op: "1"),
  const Choice(title: '8', op: "1"),
  const Choice(title: '9', op: "1"),
  const Choice(title: 'x', op: "2"),
  const Choice(title: 'C', op: "3"),
  const Choice(title: '0', op: "1"),
  const Choice(title: '/', op: "2"),
  const Choice(title: '=', op: "4"),
  const Choice(title: '' ,op: '2'),//empty for selection part
];


