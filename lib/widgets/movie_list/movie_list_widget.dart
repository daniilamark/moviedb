import 'package:flutter/material.dart';
import 'package:moviedb/resources/resources.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
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
                children: const [
                  Image(image: AssetImage(AppImages.rickandmorty)),
                ],
              ),
            ),
          );
        });
  }
}
