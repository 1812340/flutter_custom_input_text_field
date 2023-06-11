import 'package:custom_text_field/constants/widget/textfFeld.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
      child: Column(
        children:  [
          SizedBox(height: screenHeight*0.5,),
          const Text("This is input text field custom widget"),
          SizedBox(height: 20.h,),
          const TextFieldWidget(
            hintText: "email",
          ),
        ],
      ),
    ));
  }
}
