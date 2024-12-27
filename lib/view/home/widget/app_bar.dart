import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/home/widget/custom_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const   Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      child: Row(
       
        children: [
         AppBarIcon(icon: FontAwesomeIcons.bars),
          Spacer(),
          Row(
            children: [
               AppBarIcon(
                 icon: FontAwesomeIcons.magnifyingGlass),
              SizedBox(
                width: 10,
              ),
           AppBarIcon( icon: FontAwesomeIcons.bell)
            ],
          )
        ],
      ),
    );
  }
}
