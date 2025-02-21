import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:propstake/utils/widget_extensions.dart';

import 'apptexts.dart';

class AppDatePicker extends StatelessWidget {
  final String? title;
  final DateTime? date;
  final Function() onTap;
  const AppDatePicker({super.key, this.date, this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
            AppText(
              title.toString(),
              color: const Color(0xFF60646C),
              size: 13.33,
              weight: FontWeight.w500,
            ),
          4.sp.sbH,
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_month_outlined),
                  8.sp.sbHW,
                  AppText(
                    date != null
                        ? DateFormat('yyyy-MM-dd').format(date!)
                        : "Select end date",
                    color: date != null ? const Color(0xFF1C2024) : const Color(0xFF80838D),
                    size: 12,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}