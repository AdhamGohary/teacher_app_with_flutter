class TeacherClasses {
  String gradeName;
  String className;
  String subjectName;
  String gradeId;
  String classId;
  String subjectId;

  TeacherClasses(
      {required this.classId,
      required this.className,
      required this.gradeId,
      required this.gradeName,
      required this.subjectId,
      required this.subjectName});
  factory TeacherClasses.fromJson(Map<String, dynamic> json) {
    return TeacherClasses(
        classId: json['classId'],
        className: json['className'],
        gradeId: json['gradeId'],
        gradeName: json['gradeName'],
        subjectId: json['subjectId'],
        subjectName: json['subjectName']);
  }
  Map<String, dynamic> toJson() {
    return {
      "classId":classId,
      "className":className,
      "gradeId":gradeId,
      "gradeName":gradeName,
      "subjectId":subjectId,
      "subjectName":subjectName,
    };
  }
}
