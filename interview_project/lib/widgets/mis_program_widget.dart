import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/mis_program_provider.dart';

class ProgramWidget extends ConsumerWidget {
  const ProgramWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programs = ref.watch(programListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Program',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
     
        SizedBox(
          height: 300.h, 
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Category')),
                    DataColumn(label: Text('Created By')),
                    DataColumn(label: Text('Rating')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: programs.map((program) {
                    return DataRow(cells: [
                      DataCell(Text(program.name)),
                      DataCell(Text(program.category)),
                      DataCell(Text(program.createdBy)),
                      DataCell(Text(program.rating)),
                      DataCell(IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {},
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
