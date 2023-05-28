import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterunittesting/counter.dart';

void main() {
  //pre testing setup
  late Counter counter;
  setUp(() {
    counter = Counter();
  });

  //setUp is called before every test
  // and setUpAll is called only once before all tests
  setUpAll(() => null);

  //post testing setup
  tearDown(() => null);
  tearDownAll(() => null);
  group('Counter test -', () {
    test('given that when counter class in initiated value of counter is 0',
        () {
      // Counter counter = Counter();

      expect(counter.count, 0);
    });
    test(
        'given when counter class is incremented after initiating value of counter becomes 1',
        () {
      // Counter counter = Counter();
      counter.increment();
      expect(counter.count, 1);
    });
    test(
        'given when counter class is decremented after initiating value of counter becomes -1',
        () {
      // Counter counter = Counter();
      counter.decrement();
      expect(counter.count, -1);
    });
  });
  //test for reset function
  test('given when the reset function is called the value should be 0', () {
    counter.reset();
    expect(counter.count, 0);
  });
}


//writing test cases for counter classs
// 