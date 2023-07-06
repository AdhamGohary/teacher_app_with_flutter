import 'package:flutter/material.dart';
import 'package:teacher_app/ui/screen/mobile_screen/component/container_as_side_bar/container_as_side_bar.dart';
import 'package:teacher_app/ui/widgets/custom_container/custom_container.dart';
import 'package:teacher_app/utils/functions/screen_size_function.dart';

// ignore: must_be_immutable
class SidebarAndContainer extends StatefulWidget {
  late int iconIndex;
  late Widget widgetOfScreen;
  SidebarAndContainer(
      {super.key, required this.iconIndex, required this.widgetOfScreen});

  @override
  State<SidebarAndContainer> createState() => _SidebarAndContainerState();
}

class _SidebarAndContainerState extends State<SidebarAndContainer> {
  late bool index;
  @override
  void initState() {
    index = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: 0.8 * getWidth(context: context),
              top: 0.05 * getWidth(context: context)),
          child: SizedBox(
            height: 0.05 * getHeight(context: context),
            child: InkWell(
              child: Image.asset('images/sidebar 1.png'),
              onTap: () {
                setState(() {
                  index = !index;
                });
              },
            ),
          ),
        ),
        Stack(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 0.03 * getHeight(context: context)),
                child: CustomContainer(
                    height: 0.9 * getHeight(context: context),
                    backgroundColor: Colors.white,
                    child: widget.widgetOfScreen)),
            ContainerAsSideBar(
              iconIndex: widget.iconIndex,
              index: index,
            ),
          ],
        ),
      ],
    );
  }
}
