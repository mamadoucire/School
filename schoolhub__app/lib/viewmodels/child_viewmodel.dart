import 'package:flutter/material.dart';
import '../models/child.dart';

class ChildViewModel extends ChangeNotifier {
  ChildModel child;

  ChildViewModel({required this.child});

  double get average => child.average;

  Map<String, double> subjectAverages() {
    final Map<String, List<double>> map = {};
    for (final n in child.notes) {
      map.putIfAbsent(n.subject, () => []);
      map[n.subject]!.add(n.value);
    }
    return map.map((k, v) => MapEntry(k, v.reduce((a, b) => a + b) / v.length));
  }
}
