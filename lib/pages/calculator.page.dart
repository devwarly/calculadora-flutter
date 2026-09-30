import 'package:calculator_app/enums/operation.type.dart';
import 'package:calculator_app/widgets/button.widget.dart';
import 'package:flutter/material.dart';

class CalculartoPage extends StatefulWidget {
  const new({super.key});

  @override
  State<CalculartoPage> createState() => _CalculartoPageState();
}

class _CalculartoPageState extends State<CalculartoPage> {
  late String displayNumber;
  OperationTypeEnum? operationType;

  @override
  void initState() {
    displayNumber = '0';
    
    super.initState();
  }

  void setOperationType(OperationTypeEnum newType) {
    setState(() {
      operationType = newType;
      displayNumber += newType.symbol;
    });
  }

  void clear(){
    setState(() {
      displayNumber = '0';
      operationType = null;
    });
  }

  List<double> parseNumbers(String expression) {
    RegExp regExp = RegExp(r'[0-9]+\.?[0-9]*');

    var matches = regExp.allMatches(expression);

    List<double> numbers = [];

    for (var match in matches) {
      String numberText = match.group(0)!;
      numbers.add(double.parse(numberText));
    }
    return numbers;
  }

  List<OperationTypeEnum> getOperations(String expression){
    final expression1 = expression.characters.where(
      (x) => OperationTypeEnum.values.any((op) => op.symbol == x),
    );

    return expression1
      .map((x) => OperationTypeEnum.values.firstWhere((op) => op.symbol == x))
      .toList();
  }

  void calculate(){
     String expression = displayNumber.replaceAll(',', '.');

     List<double> numbers = parseNumbers(expression);

  }

  void appendNumber(String stringNumber){
    setState(() {

      if (displayNumber == '0') {
        displayNumber = stringNumber;
      }
      else {
        displayNumber += stringNumber;
      }
    });
  }

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
                displayNumber,
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
                  ButtonWidget(
                    text: "\u232B",
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  ButtonWidget(text: "C", onPressed: () {
                    clear();
                  }, color: Colors.blueGrey, textColor: Colors.white,),
                  
                  ButtonWidget(text: "%", onPressed: () {}, color: Colors.blueGrey, textColor: Colors.white,),
                  ButtonWidget(text: "\u00F7", onPressed: () {
                    setOperationType(OperationTypeEnum.division);
                  }, color: Colors.blue, textColor: Colors.white,),

                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "7", onPressed: () {
                    appendNumber("7");
                  }),
                  ButtonWidget(text: "8", onPressed: () {
                    appendNumber("8");
                  }),
                  ButtonWidget(text: "9", onPressed: () {
                    appendNumber("9");
                  }),
                  ButtonWidget(text: "x", onPressed: () {
                    setOperationType(OperationTypeEnum.multiplication);
                  }, color: Colors.blue, textColor: Colors.white,),
                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "4", onPressed: () {
                    appendNumber("4");
                  }),
                  ButtonWidget(text: "5", onPressed: () {
                    appendNumber("5");
                  }),
                  ButtonWidget(text: "6", onPressed: () {
                    appendNumber("6");
                  }),
                  ButtonWidget(text: "-", onPressed: () {
                    setOperationType(OperationTypeEnum.subtration);
                  }, color: Colors.blue, textColor: Colors.white,),
                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "1", onPressed: () {
                    appendNumber("1");
                  }),
                  ButtonWidget(text: "2", onPressed: () {
                    appendNumber("2");
                  }),
                  ButtonWidget(text: "3", onPressed: () {
                    appendNumber("3");
                  }),
                  ButtonWidget(text: "+", onPressed: () {
                    setOperationType(OperationTypeEnum.addition);
                  }, color: Colors.blue, textColor: Colors.white,),
                ],
              ),

              Row(
                children: [
                  ButtonWidget(text: "0", onPressed: () {
                    appendNumber("0");
                  }),
                  ButtonWidget(text: ",", onPressed: () {
                    appendNumber(",");
                  }),
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
