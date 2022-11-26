import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/profile/screens/edit_profile_screen.dart';
import 'package:uit_hackathon/features/profile/widgets/background_profile.dart';
import 'package:uit_hackathon/features/profile/widgets/divider_custom.dart';
import 'package:uit_hackathon/features/profile/widgets/information_profile.dart';
import 'package:uit_hackathon/features/profile/widgets/item_choice.dart';
import 'package:uit_hackathon/models/stat.dart';
import 'package:uit_hackathon/models/user.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = User(
    email: 'julian@gmail.com',
    password: 'teoemak123',
    phone: '426-980-0043',
    name: 'Julia Andrews',
    avatar:
        'https://images.unsplash.com/photo-1657299143548-658603d76b1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
    address: '',
    id: '',
    token: '',
    type: '',
  );

  List<Stat> stats = [
    Stat(name: 'Order History', img: AppAssets.icOrderHistory),
    Stat(name: 'Payment Method', img: AppAssets.icPaymentMethod),
    Stat(
      name: 'Delivery Address',
      img: AppAssets.icDeliveryAddress,
    ),
  ];

  List<Stat> stat1s = [
    Stat(name: 'My Profile', img: AppAssets.icProfile),
    Stat(name: 'Saved Article', img: AppAssets.icSavedArticle),
    Stat(name: 'Settings', img: AppAssets.icSetting),
    Stat(name: 'Invite Friend and Family', img: AppAssets.icInviteFriend),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundProfile(),
          Positioned.fill(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InformationProfile(
                  user: user,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 30,
                        color: const Color(0xFF8D979E).withOpacity(0.2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Wala Point',
                              style: AppStyles.regular,
                            ),
                            Expanded(child: Container()),
                            Text(
                              'Get more',
                              style: AppStyles.regular.copyWith(
                                fontSize: 16,
                                color: const Color(0xFFFE9870),
                              ),
                            ),
                            Image.asset(
                              AppAssets.icArrowRight,
                              color: const Color(0xFF353B48),
                            ),
                          ],
                        ),
                      ),
                      const DividerCustom(),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: size.width * 0.1,
                        children: List.generate(
                          stats.length,
                          (index) => SizedBox(
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(stats[index].img),
                                const SizedBox(height: 5),
                                Text(
                                  stats[index].name,
                                  textAlign: TextAlign.center,
                                  style: AppStyles.medium.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 30,
                        color: const Color(0xFF8D979E).withOpacity(0.2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            EditProfileScreen.routeName,
                            arguments: user,
                          ),
                          child: ItemChoice(
                            name: stat1s[0].name,
                            img: stat1s[0].img,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DividerCustom(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ItemChoice(
                          name: stat1s[1].name,
                          img: stat1s[1].img,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DividerCustom(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ItemChoice(
                          name: stat1s[2].name,
                          img: stat1s[2].img,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const DividerCustom(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ItemChoice(
                          name: stat1s[3].name,
                          img: stat1s[3].img,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
