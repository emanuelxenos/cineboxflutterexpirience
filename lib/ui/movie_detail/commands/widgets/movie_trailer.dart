import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({super.key});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController _controller;
  bool _isVisiblePlayer = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'grak7GawJ_0',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Trailer',
          style: AppTextStyles.boldMedium,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            clipBehavior: Clip.hardEdge,
            child: Visibility(
              visible: _isVisiblePlayer,
              replacement: GestureDetector(
                onTap: () {
                  setState(() {
                    _isVisiblePlayer = true;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      YoutubePlayer.getThumbnail(
                        videoId: 'grak7GawJ_0',
                        quality: ThumbnailQuality.medium,
                      ),
                      fit: BoxFit.cover,
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 64,
                    ),
                  ],
                ),
              ),
              child: YoutubePlayer(controller: _controller),
            ),
          ),
        ),
      ],
    );
  }
}
