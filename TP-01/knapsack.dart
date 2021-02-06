import 'dart:math';
import 'dart:io';

void main() {
  int maxWieght = 5;
  List<int> weights = <int>[4, 7, 8, 9];
  List<int> values = <int>[1, 2, 3, 5];
  int result = knapSack(maxWieght, weights, values);
  print("Le resultat est : " + result.toString());
}

///solve KnapSack problem
int knapSack(int maxWeight, List<int> weights, List<int> values) {
  List result = createMatrix(weights.length + 1, maxWeight + 1);
  for (int i = 0; i < weights.length + 1; i++) {
    for (int w = 0; w <= maxWeight; w++) {
      if ((i == 0) || (w == 0)) {
        result[i][w] = 0;
      } else {
        result[i][w] = result[i - 1][w];
        if (w >= weights[i - 1]) {
          result[i][w] =
              max<int>(result[i][w], result[i - 1][w - weights[i - 1]] + values[i - 1]);
        }
      }
    }
  }
  return result[values.length][maxWeight];
}

///create matrix of [rows,columns]
List<List<int>> createMatrix(int rows, int columns) {
  return Iterable<List<int>>.generate(
    rows,
    (_) => List<int>.filled(columns, 0),
  ).toList();
}

///red list of integers from command line
List<int> readList(int length) {
  List<int> inputs = <int>[];
  for (var i = 0; i < length; i++) {
    final _input = stdin.readLineSync();
    int number =
        int.parse(_input, onError: (_) => throw "ERROR, Please enter numbers only");
    inputs.add(number);
  }
  return inputs;
}
