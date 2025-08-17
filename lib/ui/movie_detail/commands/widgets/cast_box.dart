import 'package:cinebox/data/models/movie_detail.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/commands/widgets/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  final MovieDetail movieDetail;

  const CastBox({super.key, required this.movieDetail});

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
              itemCount: movieDetail.cast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final actor = movieDetail.cast[index];
                return ActorCard(
                  imageUrrl:
                      'https://image.tmdb.org/t/p/w185/${actor.profilePath}',
                  name: actor.name,
                  character: actor.character,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
