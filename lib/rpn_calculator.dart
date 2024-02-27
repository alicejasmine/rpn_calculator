import 'operations.dart';

class RPNCalculator {
List<num> _stack = [];

void executeOperation(OperationHandler operation) {
  operation.execute(_stack);
}

void clearStack() {
  _stack.clear();
}

List<num> get stack => _stack.toList();
}



