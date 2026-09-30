import 'dart:math';

import 'package:calculator_app/enums/operation.type.dart';
import 'package:calculator_app/pages/historic.page.dart';
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

  void clear() {
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

  List<OperationTypeEnum> getOperations(String expression) {
    final expression1 = expression.characters.where(
      (x) => OperationTypeEnum.values.any((op) => op.symbol == x),
    );

    return expression1
        .map((x) => OperationTypeEnum.values.firstWhere((op) => op.symbol == x))
        .toList();
  }

  void resolverPriorityOperations(
    List<double> numbers,
    List<OperationTypeEnum> operators,
  ) {
    int index = 0;

    while (index < operators.length) {
      if (operators[index] == OperationTypeEnum.multiplication) {
        numbers[index] = numbers[index] * numbers[index + 1];
        numbers.removeAt(index + 1);
        operators.removeAt(index);
      } else if (operators[index] == OperationTypeEnum.division) {
        numbers[index] = numbers[index] / numbers[index + 1];
        numbers.removeAt(index + 1);
        operators.removeAt(index);
      } else {
        index++;
      }
    }
  }

  double resolverAdditionAndSubtraction(
    List<double> numbers,
    List<OperationTypeEnum> operators,
  ) {
    int index = 0;

    while (operators.isNotEmpty) {
      if (operators[index] == OperationTypeEnum.addition) {
        numbers[0] = numbers[0] + numbers[1];
        numbers.removeAt(index + 1);
        operators.removeAt(index);
      } else {
        numbers[0] = numbers[0] - numbers[1];
        numbers.removeAt(1);
        operators.removeAt(index);
      }

      index++;
    }

    return numbers[0];
  }

  void calculate() {
    String expression = displayNumber.replaceAll(',', '.');

    List<double> numbers = parseNumbers(expression);
    List<OperationTypeEnum> operations = getOperations(expression);

    resolverPriorityOperations(numbers, operations);
    final result = resolverAdditionAndSubtraction(numbers, operations);
    setState(() {
      displayNumber = result.toString().replaceAll('.', ',');
    });
  }

  void appendNumber(String stringNumber) {
    setState(() {
      if (displayNumber == '0') {
        displayNumber = stringNumber;
      } else {
        displayNumber += stringNumber;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora', textAlign: TextAlign.center),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoricPage()),
              );
            },
            icon: Icon(Icons.history),
          ),
        ],

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              color: Colors.black12,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  displayNumber,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

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
                    ButtonWidget(
                      text: "C",
                      onPressed: () {
                        clear();
                      },
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                    ),

                    ButtonWidget(
                      text: "\u00F7",
                      onPressed: () {
                        setOperationType(OperationTypeEnum.division);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),

                Row(
                  children: [
                    ButtonWidget(
                      text: "7",
                      onPressed: () {
                        appendNumber("7");
                      },
                    ),
                    ButtonWidget(
                      text: "8",
                      onPressed: () {
                        appendNumber("8");
                      },
                    ),
                    ButtonWidget(
                      text: "9",
                      onPressed: () {
                        appendNumber("9");
                      },
                    ),
                    ButtonWidget(
                      text: "x",
                      onPressed: () {
                        setOperationType(OperationTypeEnum.multiplication);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),

                Row(
                  children: [
                    ButtonWidget(
                      text: "4",
                      onPressed: () {
                        appendNumber("4");
                      },
                    ),
                    ButtonWidget(
                      text: "5",
                      onPressed: () {
                        appendNumber("5");
                      },
                    ),
                    ButtonWidget(
                      text: "6",
                      onPressed: () {
                        appendNumber("6");
                      },
                    ),
                    ButtonWidget(
                      text: "-",
                      onPressed: () {
                        setOperationType(OperationTypeEnum.subtration);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),

                Row(
                  children: [
                    ButtonWidget(
                      text: "1",
                      onPressed: () {
                        appendNumber("1");
                      },
                    ),
                    ButtonWidget(
                      text: "2",
                      onPressed: () {
                        appendNumber("2");
                      },
                    ),
                    ButtonWidget(
                      text: "3",
                      onPressed: () {
                        appendNumber("3");
                      },
                    ),
                    ButtonWidget(
                      text: "+",
                      onPressed: () {
                        setOperationType(OperationTypeEnum.addition);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),

                Row(
                  children: [
                    ButtonWidget(
                      text: "0",
                      onPressed: () {
                        appendNumber("0");
                      },
                    ),
                    ButtonWidget(
                      text: ",",
                      onPressed: () {
                        appendNumber(",");
                      },
                    ),
                    ButtonWidget(
                      text: "=",
                      onPressed: () {
                        calculate();
                      },
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
