import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/commands/widgets/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(dividerColor: AppColors.lightGrey.withAlpha(25)),
      child: ExpansionTile(
        dense: true,
        tilePadding: EdgeInsets.only(left: 0, top: 0),
        childrenPadding: EdgeInsets.symmetric(vertical: 10),

        title: Text(
          'Elenco',
          style: AppTextStyles.regularSmall,
        ),
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ActorCard(
                  imageUrrl:
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/psEJSjQr6I9GSJTdW28CKC4Kffs.jpg',
                  name: 'Jesus Nunes',
                  character: 'Biicinho bruto',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
