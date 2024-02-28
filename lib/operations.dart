import 'dart:math';

abstract class OperationHandler {
  void execute(List<num> stack);
}

class AddOperation implements OperationHandler {
  @override
  void execute(List<num> stack) {
    print(stack.length);
    if (stack.length < 2)
      return;
    else {
      num num2 = stack.removeLast();
      num num1 = stack.removeLast();
      stack.add(num1 + num2); // Add the result to the stack
    }
  }
}

class SubtractOperation implements OperationHandler {
  @override
  void execute(List<num> stack) {
    if (stack.length < 2) return;
    num num2 = stack.removeLast();
    num num1 = stack.removeLast();
    stack.add(num1 - num2);
  }
}

class MultiplyOperation implements OperationHandler {
  @override
  void execute(List<num> stack) {
    if (stack.length < 2) return;
    num num2 = stack.removeLast();
    num num1 = stack.removeLast();
    stack.add(num1 * num2);
  }
}

class DivideOperation implements OperationHandler {
  @override
  void execute(List<num> stack) {
    if (stack.length < 2) return;
    num num2 = stack.removeLast();
    num num1 = stack.removeLast();

    if (num2 == 0) {
      print("Error: Division by zero");
      stack.add(num1);
      stack.add(num2);
    } else {
      stack.add(num1 / num2);
    }
  }
}

class ExponentialOperation implements OperationHandler {
  @override
  void execute(List<num> stack) {
    if (stack.length < 2) return;
    num num2 = stack.removeLast();
    num num1 = stack.removeLast();
    stack.add(pow(num1, num2));
    print("power  $stack");
  }
}

class RestOperation implements OperationHandler {
  @override
  void execute(List<num> stack) {
    if (stack.length < 2) return;
    num num2 = stack.removeLast();
    num num1 = stack.removeLast();
    stack.add(num1 % num2);
  }
}
