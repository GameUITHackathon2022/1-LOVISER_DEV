import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:uit_hackathon/widgets/text_field_input.dart';

class AddGarbageScreen extends StatefulWidget {
  const AddGarbageScreen({super.key});

  static const String routeName = '/add_garbage_screen';

  @override
  State<AddGarbageScreen> createState() => _AddGarbageScreenState();
}

class _AddGarbageScreenState extends State<AddGarbageScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  List<String> types = [
    'Khó phân huỷ',
    'Tái chế',
    "Đồ dùng cũ",
  ];

  String type = '';

  @override
  void initState() {
    super.initState();
    type = types[0];
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    moneyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimaryColor,
          ),
        ),
        title: Text(
          'Thêm rác',
          style: AppStyles.medium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomTextField(
                controller: nameController,
                hintText: 'Nhập loại cần thu mua',
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descriptionController,
                hintText: 'Nhập mô tả',
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: DropdownButton(
                  elevation: 0,
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  items: types
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  value: type,
                  onChanged: (value) {
                    setState(() {
                      type = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: moneyController,
                hintText: 'Nhập giá tiền thu mua',
                type: TextInputType.number,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
