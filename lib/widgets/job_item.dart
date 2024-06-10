import 'package:flutter/material.dart';
import 'package:collab_u/model/home/lowongan.dart';
import 'package:collab_u/widgets/job_details_sheet.dart';
import 'package:collab_u/widgets/callculate_time_ago.dart';

class JobItem extends StatelessWidget {
  final Lowongan lowongan;
  final TabController tabController;

  const JobItem({
    Key? key,
    required this.lowongan,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lowongan.posisi,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFF150A33),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    lowongan.kompetisi,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TimeAgoText(lowongan.tglPosting),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => JobDetailsSheet(
                    lowongan: lowongan,
                    tabController: tabController,
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFfbded2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Lamar',
                    style: TextStyle(
                      color: Color(0xFF524B6B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
