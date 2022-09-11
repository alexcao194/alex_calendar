import 'package:alex_calendar/src/constant/app_colors.dart';
import 'package:alex_calendar/src/constant/app_text_styles.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: size.height * 0.1,
                child: Column(
                  children: [
                    Text('4', style: AppTextStyles.dayOfMCard),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('Sun', style: AppTextStyles.dayOfWCard),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(Icons.ac_unit, color: AppColors.paradiseBeachPrimary50),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Có tiêu đề thì đặt không thì thôi', style: AppTextStyles.titleCard)),
                    const SizedBox(height: 4.0),
                    Text('có mô tả thì viết không thì thôi', style: AppTextStyles.descriptionCard),
                    const SizedBox(height: 4.0),
                    SizedBox(
                      height: (size.width > size.height ? size.height : size.width) * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Image size base on width or height of screen that is smaller
                          SizedBox(
                              height: (size.width > size.height ? size.height : size.width) * 0.2,
                              width: (size.width > size.height ? size.height : size.width) * 0.2,
                              child: Image.network(
                                  'https://cdn.discordapp.com/attachments/960780341952544798/1013253044009455666/Untitled.png', fit: BoxFit.cover)),
                          SizedBox(
                              height: (size.width > size.height ? size.height : size.width) * 0.2,
                              width: (size.width > size.height ? size.height : size.width) * 0.2,
                              child: Image.network(
                                  'https://cdn.discordapp.com/attachments/960780341952544798/1013253044009455666/Untitled.png', fit: BoxFit.cover)),
                          SizedBox(
                              height: (size.width > size.height ? size.height : size.width) * 0.2,
                              width: (size.width > size.height ? size.height : size.width) * 0.2,
                              child: Image.network(
                                  'https://cdn.discordapp.com/attachments/960780341952544798/1013253044009455666/Untitled.png', fit: BoxFit.cover)),
                          SizedBox(
                              height: (size.width > size.height ? size.height : size.width) * 0.2,
                              width: (size.width > size.height ? size.height : size.width) * 0.2,
                              child: Image.network(
                                  'https://cdn.discordapp.com/attachments/960780341952544798/1013253044009455666/Untitled.png', fit: BoxFit.cover))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
