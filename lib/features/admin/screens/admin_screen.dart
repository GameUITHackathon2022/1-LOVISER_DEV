import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/admin/screens/add_garbage_screen.dart';
import 'package:uit_hackathon/features/admin/screens/garbages_screen.dart';
import 'package:uit_hackathon/features/profile/screens/profile_screen.dart';
import 'package:uit_hackathon/providers/bottom_navigaton_provider.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/tab_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List screens = [
    const GarbagesScreen(),
    Container(),
    Container(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      extendBody: true,
      body: screens[provider.currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left tab icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabWidget(
                    iconData: FontAwesomeIcons.house,
                    onPressed: () {
                      provider.currentIndex = 0;
                    },
                    name: 'Home',
                    color: provider.currentIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                  TabWidget(
                    onPressed: () {
                      provider.currentIndex = 1;
                    },
                    iconData: FontAwesomeIcons.globe,
                    name: 'Challenge',
                    color: provider.currentIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                ],
              ),
              // right tab icon
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabWidget(
                    onPressed: () {
                      provider.currentIndex = 2;
                    },
                    iconData: FontAwesomeIcons.chartLine,
                    name: 'Board',
                    color: provider.currentIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                  TabWidget(
                    onPressed: () {
                      provider.currentIndex = 3;
                    },
                    iconData: FontAwesomeIcons.user,
                    name: 'Profile',
                    color: provider.currentIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.textSecondaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showModalBottomSheet,
        //  () => Navigator.pushNamed(
        //   context,
        //   AddGarbageScreen.routeName,
        // ),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  final List<Map<String, dynamic>> typeCreate = [
    {'type': 'Khó phân huỷ'},
    {'type': 'Tái chế'},
    {'type': "Đồ dùng cũ"},
  ];
  String type = 'Tất cả';
  void _showModalBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (builder) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(100.0),
            ),
          ),
          height: height * 0.77,
          child: Column(
            children: [
              const Icon(Icons.remove, size: 40),
              SizedBox(
                width: width * 0.8,
                child: const Text(
                  "Thêm rác mới",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Phân loại rác",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SizedBox(
                  height: height * 0.05,
                  width: width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tên rác thải',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          height: height * 0.002,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Chi tiết",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: height * 0.1,
                    width: width * 0.9,
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Chi tiết về loại rác",
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          height: height * 0.002,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Giá (VNĐ/KG)",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SizedBox(
                  height: height * 0.05,
                  width: width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Giá',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          height: height * 0.002,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: height * 0.035),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFEC1C24),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Icon(Icons.camera_alt),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Text(
                        "Thêm ảnh của bạn",
                        style: TextStyle(
                            color: const Color(0xFF000000),
                            fontSize: height * 0.015,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.065,
                width: width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: const Text(
                    "Đăng",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
