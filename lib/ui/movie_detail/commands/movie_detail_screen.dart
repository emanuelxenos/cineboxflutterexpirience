import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/commands/widgets/cast_box.dart';
import 'package:cinebox/ui/movie_detail/commands/widgets/movie_trailer.dart';
import 'package:cinebox/ui/movie_detail/commands/widgets/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do filme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 278,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/psEJSjQr6I9GSJTdW28CKC4Kffs.jpg',
                      placeholder: (context, url) => Container(
                        width: 160,
                        color: AppColors.lightGrey,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Luca',
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: Colors.yellow,
                    starSize: 14,
                    valueLabelVisibility: false,
                    value: 3,
                  ),
                  Text(
                    'Animação,Comédiaa, Familia, Fantasia',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text(
                    '2024 (USA) | 1h41',
                    style: AppTextStyles.regularSmall,
                  ),
                  Text(
                    'asgasdgasdgasdgsadgasdgasdgasdggasdgasdgasdfgfadgadsfadfhadfhadfh',
                    style: AppTextStyles.regularSmall,
                  ),
                  CastBox(),
                  MovieTrailer(),
                  const SizedBox(
                    height: 15,
                  ),
                  RatingPanel(
                    votAverage: 1,
                    voteCount: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
