import 'package:flutter/material.dart';
import '../../../../models/LatestResponse.dart';
import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/components/add_firebase.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constant.dart';
import '../movies_details.dart';

class FeachSimilarItem extends StatefulWidget {
  Results results;

  FeachSimilarItem({
    required this.results,
  });

  @override
  State<FeachSimilarItem> createState() => _FeachSimilarItemState();
}

class _FeachSimilarItemState extends State<FeachSimilarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.of(context)
          .pushNamed(MoviesDetails.routeName,
          arguments: widget.results);
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            // height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff343534),
            ),
            margin: EdgeInsets.all(4),
            width: 100,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageBaseURL +
                        ((widget.results.backdropPath) ??
                            '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                    height: 120,
                    width: 80,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFBB3B),
                        size: 10,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${widget.results.voteAverage}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ),
                Text(
                  widget.results.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.results.releaseDate ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
          Positioned(
            right: 70,
            top: 0,
            left: 0,
            bottom: 190,
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

                    // Navigator.pop(context);
                  },
                );
                Navigator.pop(context);


              },
              child: Stack(
                  alignment: Alignment.topCenter,
                  children: [widget.results.video == false ?
                    Image.asset("assets/images/addToList.png",width: 35,height: 50,)
                        : Image.asset("assets/images/addToList.png",width: 35,height: 50,color: Colors.amberAccent,) ,
                    // firebase Condition
                     Padding(
                      padding: EdgeInsets.only(top: 6),
                      child:widget.results.video == false ?Icon(Icons.add, color: Colors.white,size: 16,)
                          :Icon(Icons.check, color: Colors.white,size: 16,),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
