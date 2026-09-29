import 'package:calculator_app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class CalculartoPage extends StatefulWidget {
  const new({super.key});

  @override
  State<CalculartoPage> createState() => _CalculartoPageState();
}

class _CalculartoPageState extends State<CalculartoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora', textAlign: TextAlign.center),

        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            color: Colors.black12,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "0",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonWidget(text: "C", onPressed: () {}, color: Colors.red, textColor: Colors.white,),
                  ButtonWidget(
                    text: "\u232B",
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  ButtonWidget(text: "%", onPressed: () {}, color: Colors.blue, textColor: Colors.white,),
                  ButtonWidget(text: "\u00F7", onPressed: () {}, color: Colors.blue, textColor: Colors.white,),

                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "7", onPressed: () {}),
                  ButtonWidget(text: "8", onPressed: () {}),
                  ButtonWidget(text: "9", onPressed: () {}),
                  ButtonWidget(text: "x", onPressed: () {}, color: Colors.blue, textColor: Colors.white,),
                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "4", onPressed: () {}),
                  ButtonWidget(text: "5", onPressed: () {}),
                  ButtonWidget(text: "6", onPressed: () {}),
                  ButtonWidget(text: "-", onPressed: () {}, color: Colors.blue, textColor: Colors.white,),
                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "1", onPressed: () {}),
                  ButtonWidget(text: "2", onPressed: () {}),
                  ButtonWidget(text: "3", onPressed: () {}),
                  ButtonWidget(text: "+", onPressed: () {}, color: Colors.blue, textColor: Colors.white,),
                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "0", onPressed: () {}),
                  ButtonWidget(text: ",", onPressed: () {}),
                  ButtonWidget(text: "=", onPressed: () {
                    print("CLicou Aqui, porque eu sou foda");
                  }, color: Colors.green,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
