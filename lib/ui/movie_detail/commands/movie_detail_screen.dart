import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/movie_detail/commands/get_movie_details_command.dart';
import 'package:cinebox/ui/movie_detail/commands/movie_detail_view_model.dart';
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

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int;
      if (movieId == null) {
        showErrorSnackBar('Id do filme não encontrado');
        Navigator.pop(context);
        return;
      }
      ref.read(movieDetailViewModelProvider).fetchMovieDetails(movieId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(getMovieDetailsCommandProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do filme'),
      ),
      body: movieDetail.when(
        data: (data) {
          if (data == null) {
            return Center(
              child: Text('Filme não encontrado'),
            );
          }

          final hoursRuntime = data.runtime ~/ 60;
          final minutesRuntime = data.runtime % 60;

          return SingleChildScrollView(
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 278,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: data.images[index],
                          placeholder: (context, url) => Container(
                            width: 160,
                            color: AppColors.lightGrey,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                        data.title,
                        style: AppTextStyles.titleLarge,
                      ),
                      RatingStars(
                        starCount: 5,
                        starColor: Colors.yellow,
                        starSize: 14,
                        valueLabelVisibility: false,
                        value: data.voteAverage / 2,
                      ),
                      Text(
                        data.genres.map((g) => g.name).join(', '),
                        style: AppTextStyles.lightGreyRegular,
                      ),
                      Row(
                        children: [
                          Text(
                            '${DateTime.parse(data.releaseDate).year} | ',
                            style: AppTextStyles.regularSmall,
                          ),
                          Icon(
                            Icons.access_time,
                            size: 15,
                            color: AppColors.lightGrey,
                          ),
                          Text(
                            '${hoursRuntime}h${minutesRuntime}',
                            style: AppTextStyles.regularSmall,
                          ),
                        ],
                      ),
                      Text(
                        data.overview,
                        style: AppTextStyles.regularSmall,
                      ),
                      CastBox(movieDetail: data),
                      if (data.videos.isNotEmpty)
                        MovieTrailer(videoId: data.videos.first),
                      const SizedBox(
                        height: 15,
                      ),
                      RatingPanel(
                        votAverage: data.voteAverage,
                        voteCount: data.voteCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('Erro ao buscar detalhes do filme'),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
