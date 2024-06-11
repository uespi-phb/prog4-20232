// ignore_for_file: unused_element

void asyncTask() {
  print('A');
  Future(() {
    print('B');
    Future(() => print('C'));
    Future(() => print('D'));
    Future(() => print('E'));
    print('F');
  });
  print('G');
}

void asyncMicroTask() {
  print('A');
  Future(() {
    print('B');
    Future(() => print('C'));
    Future.microtask(() => print('D'));
    Future(() => print('E'));
    print('F');
  });
  print('G');
}

void asyncSample() {
  int syncCalc(int a, int b) {
    return a + b;
  }

  Future<int> asyncCalc(int a, int b) {
    return Future<int>(() {
      return a + b;
    });
  }

  print('Starting...');
  syncCalc(2, 6);
  print('Finishing...');
}

void main() {
  asyncTask();
}
