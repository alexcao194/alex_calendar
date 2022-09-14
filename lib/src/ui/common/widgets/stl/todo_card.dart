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
                    Text('Có mô tả thì viết không ông thì thôi Có mô tả thì viết không ông thì thôi Có mô tả thì viết không ông thì thôi Có mô tả thì viết không ông thì thôi', style: AppTextStyles.descriptionCard),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Expanded(child: Center(child: Text('16:00 - 18:00', style: AppTextStyles.scheduleAndPlace))),
                        Card(
                          elevation: 1.0,
                          child: SizedBox(
                            height: size.height * 0.02,
                            width: 0.1,
                          ),
                        ),
                        Expanded(child: Center(child: Text('Hà Đông', style: AppTextStyles.scheduleAndPlace)))
                      ],
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
