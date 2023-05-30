//import 'dart:js_util';
import 'package:flutter/foundation.dart';

import 'main.dart';


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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result ="";
  var bgColor= Colors.indigo.shade100;
  var msg = "";
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:Text('BMI Application'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 54, fontWeight: FontWeight.w700)),
                SizedBox(height: 21),
                TextField(
                  controller: wtcontroller,
                  decoration:InputDecoration(
                    label: Text('Enter your Weight'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number ,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftcontroller,
                  decoration:InputDecoration(
                    label: Text('Enter your Height(in feet)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number ,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: incontroller,
                  decoration:InputDecoration(
                    label: Text('Enter your height(in Inch)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number ,
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  var wt = wtcontroller.text.toString();
                  var ft = ftcontroller.text.toString();
                  var inch = incontroller.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculation
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt * 12) +  iInch;
                    var tCm= (tInch * 2.54);
                    var tM= tCm/100;
                    var bmi = iWt/(tM*tM);


                    if(bmi>25){
                      msg="You are Overweight";
                      bgColor = Colors.red;

                    } else if(bmi<18 ){
                      msg="You are Underweight";
                      bgColor = Colors.yellow;

                    }else{
                      msg="You are Healthy";
                      bgColor = Colors.green;
                    }



                    setState(() {
                      result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                    });
                  }else{
                      setState((){
                        result = 'Please fill all the Information!!';
                      });
                    }
                  }, child: Text("Calculate")),
                Text(result + ".\n " + msg, style: TextStyle(fontSize: 20),) //Note: not showing up for anonymous reason!!!!!!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
