//solution

import 'dart:math';

generateMatrix(int gridSize) {
  List<List<int?>> matrix =
      List.generate(gridSize, (_) => List.filled(5, null));

  // Set to track unique numbers already added to the matrix
  Set<int> addedNumbers = {};

  Random random = Random();

  // Loop through each cell in the matrix
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      int randomNumber;

      // Check if the current cell is null (i.e., not yet filled)
      if (matrix[i][j] == null) {
        // Generate a random number between 1 and 25
        do {
          randomNumber = random.nextInt(25) + 1;
        } while (addedNumbers
            .contains(randomNumber)); // Keep generating until unique

        // Add the unique number to the matrix and track it
        matrix[i][j] = randomNumber;
        addedNumbers.add(randomNumber);
      }
    }
  }

  for (int i = 0; i < 5; i++) {
    print(matrix[i]);
  }
}

void main() {
  generateMatrix(5);
  print('test');
}
