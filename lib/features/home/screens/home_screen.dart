import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uit_hackathon/features/home/widgets/box_challenge.dart';
import 'package:uit_hackathon/features/home/widgets/item_garbage.dart';
import 'package:uit_hackathon/features/home/widgets/item_type.dart';
import 'package:uit_hackathon/models/garbage.dart';
import 'package:uit_hackathon/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> types = [
    {'type': 'Tất cả'},
    {'type': 'Khó phân huỷ'},
    {'type': 'Tái chế'},
    {'type': "Đồ dùng cũ"},
  ];
  String type = 'Tất cả';

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 56,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào',
                            style: AppStyles.regular,
                          ),
                          Text(
                            'Quốc Hưng',
                            style: AppStyles.medium,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        FontAwesomeIcons.bell,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hãy cùng nhau đổi rác vì một hành tinh xanh 🌍',
                    style: AppStyles.semibold,
                  ),
                  const SizedBox(height: 10),
                  // box challenge
                  const BoxChallenge(),
                  const SizedBox(height: 15),
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
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.height * 0.61 / 1.0),
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //Garbage garbage = garbages[index];
                  // return GestureDetector(
                  //   onTap: () {},
                  //   child: ItemGarbage(
                  //     garbage: garbage,
                  //   ),
                  // );
                  return Container();
                },
                childCount: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
