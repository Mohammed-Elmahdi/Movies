import 'package:flutter/material.dart';
import 'package:movies/shared/components/add_firebase.dart';
import 'package:movies/shared/components/components.dart';
import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/components/constant.dart';
import '../../details/movies_details.dart';


class PopularDataItem extends StatefulWidget {
  Results results ;
  PopularDataItem({required this.results});

  @override
  State<PopularDataItem> createState() => _PopularDataItemState();
}

class _PopularDataItemState extends State<PopularDataItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){Navigator.of(context)
            .pushNamed(MoviesDetails.routeName,
            arguments: widget.results);
          // print('id movie =>${results.id}');
        },
        child: Stack(
        //  alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageBaseURL +
                ((widget.results.backdropPath) ??
              '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                height: 120,width: 80,fit: BoxFit.fitHeight,),
            ),
        Positioned(
          left: 0,
          right: 60,
          top: 0,
          bottom: 90,
          child: InkWell(
              onTap: (){
                //todo : add to fire base
                widget.results.video = true;
                setState(() {

                });
                AddFirebase.addToFirebase(
                  context,
                  id: widget.results.id,
                  backdropPath:widget.results.backdropPath ,
                  overview: widget.results.overview,
                  releaseDate: widget.results.releaseDate,
                  title: widget.results.title,
                  video: widget.results.video,
                  voteAverage:widget.results.voteAverage ,
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
                children:[ widget.results.video == false ?
                  Image.asset("assets/images/addToList.png",width: 35,height: 50,)
                  : Image.asset("assets/images/addToList.png",width: 35,height: 50,color: Colors.amberAccent,) ,
                  // firebase Condition
                  Padding(
                    padding:  EdgeInsets.only(top: 3),
                    child: widget.results.video == false ?Icon(Icons.add, color: Colors.white,size: 16,)
                                                         :Icon(Icons.check, color: Colors.white,size: 16,),
                  )

                ] ),),
        )
          ],
        ),
      ),
    );
  }

  
}