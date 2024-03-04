import 'package:flutter/material.dart';

import 'operations.dart';
import 'rpn_calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final RPNCalculator calculator = RPNCalculator();

  String input = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("RPN Calculator",
              style: TextStyle(color: Colors.white)), // Text color white
          backgroundColor: Colors.blue.shade900),


      body: Column(
        children: <Widget>[
          Expanded(child: _buildDisplayRow()),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildButton('CLEAR', () => onClearButtonPress()),
                _buildButton('%', () => onOperationButtonPress('%')),
                _buildButton('^', () => onOperationButtonPress('^')),
                _buildButton('÷', () => onOperationButtonPress('÷')),
                _buildButton('7', () => onNumericButtonPress('7')),
                _buildButton('8', () => onNumericButtonPress('8')),
                _buildButton('9', () => onNumericButtonPress('9')),
                _buildButton('x', () => onOperationButtonPress('x')),
                _buildButton('4', () => onNumericButtonPress('4')),
                _buildButton('5', () => onNumericButtonPress('5')),
                _buildButton('6', () => onNumericButtonPress('6')),
                _buildButton('-', () => onOperationButtonPress('-')),
                _buildButton('1', () => onNumericButtonPress('1')),
                _buildButton('2', () => onNumericButtonPress('2')),
                _buildButton('3', () => onNumericButtonPress('3')),
                _buildButton('+', () => onOperationButtonPress('+')),
                _buildButton('0', () => onNumericButtonPress('0')),
                _buildButton(',', () => onCommaButtonPress()),
                _buildButton('ENTER', () => onEnterButtonPress()),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void onNumericButtonPress(String value) {
    setState(() {
      if (input == '0') {
        input = value;
      } else {
        input = input + value;
      }
    });
  }

  void onCommaButtonPress() {
    final newInput = input.toString() + '.';
    setState(() {
      input = newInput;
    });
  }

  void onEnterButtonPress() {
    setState(() {
      calculator.addToList(double.parse(input));
      input = '0';
    });
  }

  void onOperationButtonPress(String value) {
    setState(() {
      calculator.addToList(double.parse(input));

      switch (value) {
        case '+':
          calculator.executeOperation(AddOperation());
        case '-':
          calculator.executeOperation(SubtractOperation());
        case 'x':
          calculator.executeOperation(MultiplyOperation());
        case '÷':
          calculator.executeOperation(DivideOperation());
        case '^':
          calculator.executeOperation(ExponentialOperation());
        case '%':
          calculator.executeOperation(RestOperation());
        default:
          print("Invalid operation");
      }
    });
    input = '0';
  }

  void onClearButtonPress() {
    setState(() {
      calculator.clearStack();
      input = '0';
    });
  }

  Widget _buildButton(String text, void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }



  Widget _buildDisplayRow() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                calculator.stack.isEmpty ? "0" : '${calculator.stack.last}',
                style: TextStyle(fontSize: 45),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$input',
                style: TextStyle(fontSize: 45),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
