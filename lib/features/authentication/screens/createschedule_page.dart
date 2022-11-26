import 'package:flutter/material.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

import '../../home/widgets/item_type.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  final List<Map<String, dynamic>> types = [
    {'type': 'Tất cả các ngày'},
    {'type': 'Thứ 7 - Chủ nhật'},
  ];
  String type = 'Tất cả';
  bool dayOption = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bool timeOption = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              size.width * 0.05, size.width * 0.1, size.width * 0.05, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                const Text(
                  'Đặt lịch thu gom',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Vui lòng chọn địa chỉ và thời gian thu gom mong muốn',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(child: Image.asset(AppAssets.schedule)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(AppAssets.icAddress),
                    const Text(
                      'Địa chỉ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        const Text(
                          'Đông Hòa, Dĩ An, Bình Dương',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Image.asset(AppAssets.icPencil),
                        Image.asset(AppAssets.icMap),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Image.asset(AppAssets.icClock),
                    const Text(
                      'Thời gian thu rác',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                              height: 35,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: types.length,
                                itemBuilder: (context, index) {
                                  String name = types[index]['type'];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        type = name;
                                      });
                                    },
                                    child: ItemType(
                                      type: name,
                                      isCheck: type == name ? true : false,
                                    ),
                                  );
                                },
                              ),
                            ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Giờ thu gom',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(97),
                                        color: AppColors.primaryColor),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Center(
                                          child: Text(
                                        '8h - 17.30',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(97),
                                        color: AppColors.primaryColor),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Center(
                                          child: Text(
                                        '17.30 - 22h',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryButton(
                    text: 'Xác nhận',
                    color: AppColors.primaryColor,
                    onPress: () {})
              ]),
        ),
      ),
    );
  }
}
