import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Showfilm extends StatelessWidget {
  var results ;
  Showfilm(this.results );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Navigator.pushNamed(context,Detail.routName,arguments: result );

      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network("https://image.tmdb.org/t/p/original/${results.backdropPath}"??"",
              height: 180,fit: BoxFit.cover,),
            SizedBox(height: 10,),
            Text("${results.popularity}"??"",style: TextStyle(fontSize: 20,color: Colors.white)),
            SizedBox(height: 5,),
            Text(results.title??"",style:  TextStyle(fontSize: 20,color: Colors.yellow)),
            SizedBox(height: 5,),
            Text("${results.voteAverage}"??"",textAlign: TextAlign.right,style:TextStyle(fontSize: 15,color: Colors.white) ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}