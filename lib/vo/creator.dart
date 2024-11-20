class Creator {
  String name;
  String profile;
  Creator({required this.name, required this.profile});
  factory Creator.fromMap(Map<String, dynamic> map) {
    return Creator(name: map['name'] ?? "", profile: map['profile'] ?? "");
  }
}
