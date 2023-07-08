import 'package:provider/provider.dart';
import 'package:teacher_app/model/chat.dart';
import 'package:teacher_app/ui/screen/mobile_screen/connection_with_parent_screen/connection_with_parent_screen.dart';
import 'package:teacher_app/utils/functions/navigate_with_slide_transtion_fun.dart';
import 'package:teacher_app/view_model/chat_view_model/chat_view_model.dart';
import 'package:teacher_app/view_model/student_view_model/student_view_model.dart';
import 'package:teacher_app/view_model/user_data_view_model/user_data_view_model.dart';

void chatIconBtn({required var index, required var context,required var idOfStudent}) {
  context.read<ChatViewModel>().getMsgsWithPagination(Chat(
      studentId: idOfStudent,
      teacherId:
          Provider.of<UserDataViewModel>(context, listen: false).teacherId,
      page: 1));
  navigateWithSlideTranstionFun(
      context: context,
      nextScreen: ConnectionWithFatherOrMother(
        nameOfStud: Provider.of<StudentViewModel>(context, listen: false)
            .classStudents![index]
            .name,
        imageOfStud: Provider.of<StudentViewModel>(context, listen: false)
            .classStudents![index]
            .imgUrl,
        idOfStudent: Provider.of<StudentViewModel>(context, listen: false)
            .classStudents![index]
            .id,
      ),
      xBegin: 1,
      yBegin: 0);
}
