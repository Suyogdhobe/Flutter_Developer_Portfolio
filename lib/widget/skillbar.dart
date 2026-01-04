import 'package:flutter/material.dart';

class SkillBar extends StatefulWidget {
  final String title;
  final double percent;

  const SkillBar({
    super.key,
    required this.title,
    required this.percent,
  });

  @override
  State<SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<SkillBar> {
  double value = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => value = widget.percent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value),
              duration: const Duration(milliseconds: 900),
              builder: (context, val, _) {
                return LinearProgressIndicator(
                  value: val,
                  minHeight: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
