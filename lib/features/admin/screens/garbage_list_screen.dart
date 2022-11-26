import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class GarbageList extends StatefulWidget {
  const GarbageList({super.key});

  @override
  State<GarbageList> createState() => _GarbageListState();
}

class _GarbageListState extends State<GarbageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Danh sách lấy rác',
            style: AppStyles.medium.copyWith(
              color: AppColors.textPrimaryColor,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ),
      body: Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Tiêu đề: ',
              style: AppStyles.semibold.copyWith(
                fontSize: 14,
              ),
              children: <TextSpan>[
                // TextSpan(
                //   text: challenge.title,
                //   style: AppStyles.regular.copyWith(
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Thời gian: ',
              style: AppStyles.semibold.copyWith(
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '',
                  style: AppStyles.regular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Số người tham gia: ',
              style: AppStyles.semibold.copyWith(
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '10',
                  style: AppStyles.regular.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}
