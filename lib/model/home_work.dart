
class HomeWork {
  late String? id;
  late String? title;
  late String ?desc;
  late String ?classId;
  late String? className;
  late String ?grade;
  late String? gradeName;
  late String ?subject;
  late String? subjectName;
  late String ?teacher;
  HomeWork(
      { this.title,
       this.desc,
      this.id,
      this.classId,
      this.className,
      this.grade,
      this.gradeName,
      this.subject,
      this.subjectName,
      this.teacher});
  factory HomeWork.fromJson(Map<String, dynamic> json) {
    return HomeWork(
        
        title: json['title'],
        desc: json['desc'],
        id: json['_id'],
        className: json['className'],
        gradeName: json['gradeName'],
        subjectName: json['subjectName'],);
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'desc': desc,
      'classId': classId,
      'grade': grade,
      'subject': subject,
      'teacher': teacher
    };
  }
}
