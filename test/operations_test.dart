import 'package:rpn_calculator/operations.dart';
import 'package:test/test.dart';

void main() {
  test('Addition should calculate correct last value in stack', () {
    final addition = AddOperation();
    //int
    final List<num> stack = [10, 5];
    //decimal
    final List<num> stackDec = [6.2, 1.2];
    addition.execute(stack);
    addition.execute(stackDec);
    expect(stack.last, 15);
    expect(stackDec.last, 7.4);
  });

  test('Subtraction should calculate correct last value in stack', () {
    final subtraction = SubtractOperation();
    final stack = [10, 5];

    subtraction.execute(stack);
    expect(stack.last, 5);
  });

  test('Multiplication should calculate correct last value in stack', () {
    final multiplication = MultiplyOperation();
    final List<num> stack = [10, 5];

    multiplication.execute(stack);
    expect(stack.last, 50);
  });

  test('Division should calculate correct last value in stack', () {
    final division = DivideOperation();
    final List<num> stack = [10, 5];

    division.execute(stack);
    expect(stack.last, 2);
  });

  test('Power should calculate correct last value in stack', () {
    final power = ExponentialOperation();
    final List<num> stack = [10, 5];
    power.execute(stack);
    expect(stack.last, 100000);
  });

  test('Rest should calculate correct last value in stack', () {
    final rest = RestOperation();
    final List<num> stack = [10, 5];

    rest.execute(stack);
    expect(stack.last, 0);
  });
}
