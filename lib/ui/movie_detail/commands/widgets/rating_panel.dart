import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class RatingPanel extends StatelessWidget {
  final double votAverage;
  final int voteCount;

  const RatingPanel({
    super.key,
    required this.votAverage,
    required this.voteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Avaliação',
          style: AppTextStyles.boldMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          votAverage.toStringAsFixed(2),
          style: AppTextStyles.titleLarge.copyWith(fontSize: 40),
        ),
        Text(
          'Total de $voteCount avaliações',
          style: AppTextStyles.lightGreyRegular,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
