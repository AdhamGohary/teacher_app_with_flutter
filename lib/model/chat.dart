class Chat {
  String? studentId;
  String? teacherId ;
  String? msg ;
  int? page;
  bool? isTeacher;

  Chat({this.studentId, this.teacherId, this.msg, this.isTeacher, this.page});

  factory Chat.fromJson(var json) {
    return Chat(
        studentId: json['studentId'],
        teacherId: json['teacherId'],
        msg: json['msg'],
        page: json['page'],
        isTeacher: json['isTeacher']);
  }
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'teacherId': teacherId,
      'msg': msg,
      'page': page,
      'isTrue' :isTeacher
    };
  }
}
