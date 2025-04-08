import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/mentor_list_provider.dart';

class MentorWidget extends ConsumerWidget {
  const MentorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mentors = ref.watch(mentorListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Mentors',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),

        SizedBox(
          height: 300.h, 
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Program')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Rating')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: mentors.map((mentor) {
                    return DataRow(cells: [
                      DataCell(Text(mentor.name)),
                      DataCell(Text(mentor.program)),
                      DataCell(Text(mentor.email)),
                      DataCell(Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow.shade800, size: 18),
                          SizedBox(width: 4.w),
                          Text(
                            mentor.rating.toString(),
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      )),
                      DataCell(IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                 
                        },
                      )),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
