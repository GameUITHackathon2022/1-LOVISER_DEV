import 'package:flutter/material.dart';
import 'package:uit_hackathon/models/challenge.dart';

class AdminChallengeScreen extends StatefulWidget {
  const AdminChallengeScreen({super.key});

  @override
  State<AdminChallengeScreen> createState() => _AdminChallengeScreenState();
}

class _AdminChallengeScreenState extends State<AdminChallengeScreen> {
  List<Challenge> challenges = [
    Challenge(
      title: "Dọn rác",
      description:
          "Khu vực chợ đêm làng đại học có nhiều rác thải, cần dọn sạch...",
      startTime: 9,
      endTime: 1669499049803,
      maximumParticipants: 15,
      address: "Khu phố 6, P. Linh Trung, Thủ đức",
      images: [],
      // image: "assets/images/challenge1.png",
    ),
    Challenge(
      title: "Dọn rác",
      description:
          "Khu vực chợ đêm làng đại học có nhiều rác thải, cần dọn sạch...",
      startTime: 9,
      endTime: 1669499049803,
      maximumParticipants: 15,
      address: "Khu phố 6, P. Linh Trung, Thủ đức",
      images: [],
      // image: "assets/images/challenge1.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Xét duyệt',
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: challenges.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ChallengeInfo(
                  height: height, width: width, challenge: challenges[index]),
            );
          }),
    );
  }
}

class ChallengeInfo extends StatelessWidget {
  const ChallengeInfo({
    super.key,
    required this.height,
    required this.width,
    required this.challenge,
  });

  final double height;
  final double width;
  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height * 0.3,
        width: width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 13, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  challenge.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              RichText(
                text: TextSpan(
                  text: "Mô tả: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: challenge.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              RichText(
                text: const TextSpan(
                  text: "Thời gian: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "9 giờ - 10/12/2022 • Trong 1 ngày",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              RichText(
                text: TextSpan(
                  text: "Số người đã tham gia: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "${10}/${challenge.maximumParticipants} người",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              RichText(
                text: TextSpan(
                  text: "Địa điểm: ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: challenge.address,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                children: [
                  Container(
                    height: 0.08,
                    width: 0.25,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Từ chối",
                      style: TextStyle(
                        color: Color(0xFFDC312D),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.08,
                    width: 0.25,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Từ chối",
                      style: TextStyle(
                        color: Color(0xFFDC312D),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
