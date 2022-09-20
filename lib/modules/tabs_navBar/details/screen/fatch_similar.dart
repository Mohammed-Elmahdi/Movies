import 'package:flutter/material.dart';
import 'package:movies/models/simillar_response.dart';
import '../../../../models/TopRatedRespons.dart';
import '../../../../shared/network/api_manager.dart';
import '../../home/Item/feach_top_rated_item.dart';
import '../item/fetch_similar_item.dart';


class FeachSimilar extends StatelessWidget {
 int id;
 FeachSimilar(this.id);

  @override
  Widget build(BuildContext context) {

    return Container(
      // height: 150,
      color: const Color(0xff282A28),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            ' More Like This',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Expanded(
            child: FutureBuilder<SimillarResponse>(
                future: ApiManager.getMoviesSimilar(id),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snap.hasError) {
                    return const AlertDialog(
                      content: Text("Error"),
                    );
                  }
                  var listOfSimilar = snap.data!.results ?? [];
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfSimilar.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //todo : navigator to details
                          },
                          child: FeachSimilarItem(
                          results: listOfSimilar[index],),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
