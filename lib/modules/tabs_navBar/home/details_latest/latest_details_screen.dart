import 'package:flutter/material.dart';
import 'package:movies/modules/tabs_navBar/details/screen/fatch_similar.dart';
import '../../../../../shared/components/constant.dart';
import '../../../../models/LatestResponse.dart';


class LatestMoviesDetails extends StatelessWidget {
  static const String routeName='Top_Detail';

  // Results results;
  // TopRatedDetails(this.results);
  @override
  Widget build(BuildContext context) {
    var latestMovie=ModalRoute.of(context)!.settings.arguments as LatestMovie;

    var size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff1A1A1A),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:  Text(latestMovie.title??'',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),textAlign: TextAlign.center,),
          centerTitle: true,
        ),
        body:Container(
          decoration: BoxDecoration(
              color: Color(0xff1A1A1A)
          ),
          child:
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network("https://image.tmdb.org/t/p/original/${latestMovie.backdropPath}"
                        ,height: MediaQuery.of(context).size.height*.3,
                        width: double.infinity,

                      ),
                      Center(
                        child: Icon(Icons.ondemand_video_sharp,
                          size: 45,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height*.01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width*.03
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(latestMovie.title??'',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),textAlign: TextAlign.start,),
                        SizedBox(
                          height: size.height*.01,
                        ),
                        Text(latestMovie.releaseDate!,style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        )),
                        SizedBox(
                          height: size.height*.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    imageBaseURL +
                                        ((latestMovie.posterPath) ??
                                            '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                                    height: MediaQuery.of(context).size.height*.22,
                                    width: MediaQuery.of(context).size.width*.34,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top:0,
                                  right: size.width*0.22,
                                  bottom: size.height*0.02,
                                  child: GestureDetector(
                                      onTap: () {
                                        // add to Watchlist
                                      },
                                      child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            Image.asset(
                                              "assets/images/addToList.png",
                                              width: 35,
                                              height: 50,
                                            ),
                                            // firebase Condition
                                            const Padding(
                                              padding: EdgeInsets.only(top: 6),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                            )
                                          ])
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width:size.width*.02,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    latestMovie.overview!,
                                    style: TextStyle(fontSize: 14,
                                      height: 1.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.amber,),
                                      SizedBox(width: 5,),
                                      Text('${latestMovie.voteAverage!}',style:
                                      TextStyle(
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
                        Container(
                          height: 100,
                          child: Expanded(
                              child: FeachSimilar(latestMovie.id??0)),
                        )
                      ],
                    ),
                  ),
                  //     Expanded(
                  //         child: FetchSimilar(results.id??0),
                  // ),
                ]
            ),
          ) ,
        )
    );


  }
}
