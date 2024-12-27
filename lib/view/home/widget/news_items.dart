
import 'package:flutter/material.dart';

class NewsItems extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String category;
  final String author;
  final String time;

  const NewsItems({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.category,
    required this.author,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            imgUrl,
            height: 120,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                '${author} • ${time}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
