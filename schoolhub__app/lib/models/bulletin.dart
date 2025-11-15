class BulletinModel {
  final String id;
  final String trimester; // "T1", "T2", ...
  final Map<String, double> subjectAverages; // subject -> average
  final double overallAverage;

  BulletinModel({
    required this.id,
    required this.trimester,
    required this.subjectAverages,
    required this.overallAverage,
  });
}
