import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

import '../../../models/user.dart';

class InformationProfile extends StatelessWidget {
  final User user;
  const InformationProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(user.avatar),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: AppStyles.medium.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.email,
              style: AppStyles.regular.copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
