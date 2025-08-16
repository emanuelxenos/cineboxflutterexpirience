import 'dart:async';

import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/movies/movies_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppbar extends ConsumerStatefulWidget {
  const MoviesAppbar({super.key});

  @override
  ConsumerState<MoviesAppbar> createState() => _MoviesAppbarState();
}

class _MoviesAppbarState extends ConsumerState<MoviesAppbar> {
  Timer? _debounce;
  final _searchController = TextEditingController();
  final _showClearButtton = ValueNotifier(false);

  @override
  void initState() {
    _searchController.addListener(() {
      _showClearButtton.value = _searchController.text.isNotEmpty;
    });
    super.initState();
  }

  void onSearchChange(String query) {
    if (query.isEmpty) {
      _debounce?.cancel();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () {
      FocusScope.of(context).unfocus();
      ref.read(moviesViewModelProvider.notifier).fetchMoviesBySearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
        titlePadding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        title: SizedBox(
          height: 36,
          child: TextFormField(
            controller: _searchController,
            onChanged: onSearchChange,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: 'Procurar Filmes',
              hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
              prefixIconConstraints: BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey[600],
                  size: 15,
                ),
              ),
              suffixIcon: ValueListenableBuilder(
                valueListenable: _showClearButtton,
                builder: (_, value, child) {
                  return Visibility(
                    visible: value,
                    child: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        ref
                            .read(moviesViewModelProvider.notifier)
                            .fetchMoviesByCategory();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: AppColors.lightGrey,
                        size: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
