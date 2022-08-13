void problem1() {
  List givenArr = [1, 2, 5, 11];
  int target = 13;
  int first = 0;
  int second = 0;
  for (int i = 0; i < givenArr.length; i++) {
    for (int j = 1; j < givenArr.length; j++) {
      if (givenArr[i] + givenArr[j] == target) {
        first = i;
        second = j;
        break;
      }
    }
  }
  print("(" + first.toString() + "," + second.toString() + ")");
}
