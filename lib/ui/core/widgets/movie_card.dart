import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCard extends ConsumerStatefulWidget {
  const MovieCard({super.key});

  @override
  ConsumerState<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 148,
          height: 250,
          child: Column(
            children: [
              Image.network(
                'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/sMRXfq7Ilg7sbKipdmT0B6403G1.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
