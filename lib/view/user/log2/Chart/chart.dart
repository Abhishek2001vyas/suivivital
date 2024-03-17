import 'dart:ffi';
import 'package:collection/collection.dart';

class Point {
  final double x;
  final double y;
  Point({required this.x, required this.y});
}

List<Point> get points {
  final data = <double>[10, 151, 1616, 626, 2];

  return data
      .mapIndexed(((index, element) => Point(x: index.toDouble(), y: element)))
      .toList();
}
