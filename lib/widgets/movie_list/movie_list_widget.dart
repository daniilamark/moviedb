import 'package:flutter/material.dart';
import 'package:moviedb/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Рик и морти',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    ),
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Восход',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    ),
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Закат',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    ),
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Мир',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    ),
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Дружба',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    ),
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Жвачка',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    ),
    Movie(
      imageName: AppImages.rickandmorty,
      title: 'Кино',
      time: 'April 7, 2001',
      description:
          'This is package is an independent library that is not linked to your',
    )
  ];

  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searhMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searhMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        padding: const EdgeInsets.only(top: 70),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: _filteredMovies.length,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: AssetImage(movie.imageName)),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              movie.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movie.time,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              movie.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: avoid_print
                    onTap: () {
                      // ignore: avoid_print
                      print("ssssssss");
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            labelText: 'Поиск',
            filled: true,
            fillColor: Colors.white.withAlpha(235),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    ]);
  }
}
