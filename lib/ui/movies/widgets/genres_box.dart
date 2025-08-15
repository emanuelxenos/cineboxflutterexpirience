import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/movies/commands/get_genres_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresBox extends ConsumerWidget {
  final selectedGenre = ValueNotifier(0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getGenresCommandProvider);

    return genres.when(
      data: (data) {
        return SizedBox(
          height: 25,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final genre = data[index];
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  selectedGenre.value = genre.id;
                },
                child: ValueListenableBuilder(
                  valueListenable: selectedGenre,
                  builder: (_, value, _) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: value == genre.id
                            ? AppColors.redColor
                            : AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        genre.name,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Erro ao buscar generos'),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
