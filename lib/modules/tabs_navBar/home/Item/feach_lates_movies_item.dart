import 'package:flutter/material.dart';
import '../../../../models/LatestResponse.dart';
import '../../../../shared/components/add_firebase.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constant.dart';
import '../details_latest/latest_details_screen.dart';

class FeachLatesMoviesItem extends StatefulWidget {
  LatestMovie? latestMovie;
  
  FeachLatesMoviesItem(
      {required this.latestMovie,});

  @override
  State<FeachLatesMoviesItem> createState() => _FeachLatesMoviesItemState();
}

class _FeachLatesMoviesItemState extends State<FeachLatesMoviesItem> {
  bool add = false;

  @override
  Widget build(BuildContext context) {
    return
      // InkWell(
      // onTap: (){Navigator.of(context)
      //     .pushNamed(LatestMoviesDetails.routeName,
      //     arguments: widget.latestMovie);
      // },
      // child:
    Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.network(
            imageBaseURL +
                ((widget.latestMovie?.backdropPath) ??
                    '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,

          ),
          Positioned(
            left: 10,
            top: 80,
            child:
            Stack(
              children: [
                Image.network(
                  imageBaseURL +
                      ((widget.latestMovie?.posterPath) ??
                          '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                  width: 120,
                  height: 180,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child:
                  InkWell(
                    onTap: (){
                      //todo : add to fire base
                      widget.latestMovie?.video = true;
                      setState(() {

                      });
                      AddFirebase.addToFirebase(
                        context,
                        id: widget.latestMovie?.id,
                        backdropPath:widget.latestMovie?.backdropPath ,
                        overview: widget.latestMovie?.overview,
                        releaseDate: widget.latestMovie?.releaseDate,
                        title: widget.latestMovie?.title,
                        video: widget.latestMovie?.video,
                        voteAverage:widget.latestMovie?.voteAverage ,
                      );
                      showMessage(
                        context,
                        'Add Successfully',
                        'ok',
                            () {
                          Navigator.popUntil(
                            context,
                                (route) => route.isFirst,
                          );
                        },
                      );

                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children:[
                        widget.latestMovie?.video == false ?
                        Image.asset("assets/images/addToList.png",width: 35,height: 50,)
                            : Image.asset("assets/images/addToList.png",width: 35,height: 50,color: Colors.amberAccent,) ,
                        // firebase Condition
                        Padding(
                          padding:  EdgeInsets.only(top: 8),
                          child: widget.latestMovie?.video == false ?Icon(Icons.add, color: Colors.white,size: 16,)
                              :Icon(Icons.check, color: Colors.white,size: 16,),
                        )
                      ], ),
                  ),

                  ),

              ],
            ),
          ),
          Positioned(
            left: 160,
            top: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.latestMovie?.originalTitle ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      widget.latestMovie?.releaseDate ?? '2018',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ))
        ],
      );
    // );
  }
}
