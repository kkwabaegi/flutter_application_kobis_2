import 'package:flutter/material.dart';
import 'package:flutter_application_kobis_2/kobis_api.dart';

class DetailView extends StatefulWidget {
  Map<String, dynamic> movieData;
  DetailView({super.key, required this.movieData});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  void showPopup() async {
    var kobisApi = KobisApi(apiKey: '68e44fd6eab931b1a515299e75d9562e');
    var company = await kobisApi.getCompanyDetail(
        companyCd: widget.movieData['companys'][0]['companyCd']);
    var msg = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('${company['companyNm']}'),
              content: const Text('asdad'),
              actions: [
                TextButton(onPressed: () {}, child: const Text('아니요')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('네'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    var genres = widget.movieData['genres'][0]['genreNm'].toString();
    var grade = widget.movieData['audits'][0]['watchGradeNm'].toString();
    Map<String, dynamic> gradeStyle = {};

    if (grade == '15세이상관람가') {
      gradeStyle['color'] = Colors.blue;
      gradeStyle['text'] = '15';
    }
    if (grade == '12세이상관람가') {
      gradeStyle['color'] = Colors.green;
      gradeStyle['text'] = '12';
    }
    if (grade == '19세이상관람가') {
      gradeStyle['color'] = Colors.red;
      gradeStyle['text'] = '19';
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: gradeStyle['color'], shape: BoxShape.circle),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      '${gradeStyle['text']}',
                      style: const TextStyle(fontSize: 40),
                    )),
                  ),
                ],
              ),
              Text(
                '${widget.movieData['movieNm']}(${widget.movieData['prdtYear']})',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.movieData['audits'][0]['watchGradeNm'].toString(),
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '${widget.movieData['genres'][0]['genreNm']}',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '${widget.movieData['directors'][0]['peopleNm']}',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          GestureDetector(
              onTap: showPopup,
              child: Text('${widget.movieData['companys'][0]['companyNm']}'))

          // for (int i = 0; i < movieData['actors'].length; i++)
          //   Container(
          //     width: double.infinity,
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       '${movieData['actors'][i]['cast']} - ${movieData['actors'][i]['peopleNm']}',
          //       style: const TextStyle(
          //         fontSize: 30,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
