class Screening {
  int totalAttend;
  int totalTarget;
  String text;
  String status;
  Screening(
      {required this.totalAttend,
      required this.totalTarget,
      required this.text,
      required this.status});

  factory Screening.fromMap(Map<String, dynamic> map) {
    return Screening(
        totalAttend: map['total_attend'] ?? 0,
        totalTarget: map['total_target'] ?? 0,
        text: map['text'] ?? '',
        status: map['status'] ?? '');
  }
}
