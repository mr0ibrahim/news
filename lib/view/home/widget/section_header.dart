import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title; // العنوان (مثل Breaking News)
  final String viewAllText; // نص العرض الكل (مثل View All)
  final VoidCallback onViewAllTap; // الوظيفة التي تنفذ عند الضغط على زر View All
  final Color titleColor; // لون النص الخاص بالعنوان
  final Color viewAllColor; // لون النص الخاص بـ "عرض الكل"

  const SectionHeader({
    Key? key,
    required this.title,
    required this.onViewAllTap,
    this.viewAllText = 'View All', // الافتراضي إذا لم يتم تحديد نص العرض الكل
    this.titleColor = Colors.black, // اللون الافتراضي للعنوان
    this.viewAllColor = Colors.blue, // اللون الافتراضي للنص "عرض الكل"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            title, // النص الديناميكي
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: titleColor),
          ),
          const Spacer(),
          InkWell(
            onTap: onViewAllTap, // الوظيفة التي ينفذها عند الضغط على زر "عرض الكل"
            child: Text(
              viewAllText, // النص الديناميكي
              style: TextStyle(color: viewAllColor),
            ),
          ),
        ],
      ),
    );
  }
}
