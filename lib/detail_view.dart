import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  Map<String, dynamic> movieData;
  DetailView({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '${movieData['movieNm']}(${movieData['prdtYear']})',
            style: const TextStyle(
              fontSize: 50,
            ),
          ),
          for (int i = 0; i < movieData['actors'].length; i++)
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                '${movieData['actors'][i]['cast']} - ${movieData['actors'][i]['peopleNm']}',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
