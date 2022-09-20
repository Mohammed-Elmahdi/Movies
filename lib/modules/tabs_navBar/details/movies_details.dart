import 'package:flutter/material.dart';
import 'package:movies/modules/tabs_navBar/details/screen/fatch_similar.dart';

import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/components/constant.dart';
import '../../../shared/components/add_firebase.dart';
import '../../../shared/components/components.dart';

class MoviesDetails extends StatefulWidget {
  static const String routeName = 'Top_Detail';

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  // Results results;
  @override
  Widget build(BuildContext context) {
    var results = ModalRoute.of(context)!.settings.arguments as Results;

    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff1A1A1A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            results.title ?? '',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(0xff1A1A1A)),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/original/${results.backdropPath}",
                          height: MediaQuery.of(context).size.height * .3,
                          width: double.infinity,
                        ),
                      ),
                      Center(
                        child:Image.asset('assets/images/video.png')
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Row(
                      children: [
                        Text(
                          results.title ?? '',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: Row(
                      children: [
                        Text(results.releaseDate!,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff343534),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3,
                                bottom: 3,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  imageBaseURL +
                                      ((results.posterPath) ??
                                          '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                                  height: MediaQuery.of(context).size.height * .21,
                                  width: MediaQuery.of(context).size.width * .32,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              //todo : add to fire base
                              results.video = true;
                              setState(() {

                              });
                              AddFirebase.addToFirebase(
                                context,
                                id: results.id,
                                backdropPath:results.backdropPath ,
                                overview: results.overview,
                                releaseDate: results.releaseDate,
                                title: results.title,
                                video: results.video,
                                voteAverage:results.voteAverage ,
                              );
                              showMessage(
                                context,
                                'Add Successfully',
                                'ok',
                                    () {
                                  Navigator.pop(context);
                                  // Navigator.pop(context);
                                },
                              );

                            },
                            child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  results.video == false ?
                                  Image.asset("assets/images/addToList.png",width: 35,height: 40,)
                                      : Image.asset("assets/images/addToList.png",width: 35,height: 40,color: Colors.amberAccent,) ,
                                  // firebase Condition
                                   Padding(
                                    padding: EdgeInsets.only(top: 6),
                                     child:results.video == false ?Icon(Icons.add, color: Colors.white,size: 16,)
                                         :Icon(Icons.check, color: Colors.white,size: 16,),
                                  )
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              results.overview!,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('${results.voteAverage!}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Container(
                    height: 300,
                    child: FeachSimilar(results.id!),
                  )
                ]
            ),
          ),
        ));
  }
}
