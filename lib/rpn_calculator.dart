import 'operations.dart';

class RPNCalculator {
 List<num> _stack = [];

void executeOperation(OperationHandler operation) {
  operation.execute(_stack);
}

void clearStack() {
  _stack.clear();
}
 void addToList(double value) {
   _stack.add(value);
 }


List<num> get stack => _stack.toList();

}


