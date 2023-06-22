import 'package:flutter/material.dart';
import 'package:flutter_application_kobis_2/kobis_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  String _searchType = 'movieNm';
  final kobisApi = KobisApi(apiKey: '68e44fd6eab931b1a515299e75d9562e');
  dynamic movieList = const Text('응앵');

  void getMovieList() async {
    //검색을 눌렀을 때 동작
    var movies = await kobisApi.getSearchMovieList(
        searchType: _searchType, searchValue: controller.text);
    for (var movie in movies) {
      print(movie);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              child: DropdownButton(
                value: 'movieNm',
                onTap: () {},
                items: const [
                  DropdownMenuItem(
                    value: 'movieNm',
                    child: Text('영화 제목'),
                  ),
                  DropdownMenuItem(
                    value: 'DirectorNm',
                    child: Text('감독 명'),
                  ),
                ],
                onChanged: (value) {
                  _searchType = value.toString();
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                autofocus: true,
                controller: controller,
              ),
            ),
            ElevatedButton(onPressed: getMovieList, child: const Text('검색'))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          child: movieList,
        )
      ],
    ));
  }
}
