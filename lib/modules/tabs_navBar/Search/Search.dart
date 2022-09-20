import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provid/my_provider.dart';
import '../../../shared/network/api_manager.dart';
import 'Api_Search.dart';
import 'Showfilms.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

var formKey = GlobalKey<FormState>();
var searchcontroller = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  late var provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProviderApp>(context);
    return Scaffold(
      // appBar: PreferredSize(
      //
      //   preferredSize: Size.fromHeight(75),
      //   child: AppBar(
      //     centerTitle: true,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0.0,
      //     title: TextFormField(
      //       controller: searchcontroller,
      //       decoration: InputDecoration(
      //         focusedBorder: OutlineInputBorder(
      //           borderSide: BorderSide(color: Colors.white, width: 0.5),
      //         ),
      //         enabledBorder: OutlineInputBorder(
      //           borderSide: BorderSide(color: Colors.white, width: 0.5),
      //         ),
      //         hintText: 'Tell us about yourself',
      //
      //         //helperText: 'Keep it short, this is just a demo.',
      //         prefixIcon:  Icon(
      //           Icons.person,
      //           color: Colors.yellow,
      //         ),
      //         prefixText: ' ',
      //         suffixIcon: IconButton(
      //             onPressed: () {
      //               gitsearch();
      //             },
      //             icon:  Icon(
      //               Icons.search,
      //               color: Colors.yellow,
      //             )),
      //
      //         fillColor: Colors.white,
      //         labelText: 'Search',
      //         labelStyle: TextStyle(color: Colors.black),
      //         focusColor: Color(0xFFFFFFFF),
      //       ),
      //
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: searchcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(110.0),
                      ),
                      filled: true,
                      hintText: 'Tell us about yourself',

                      //helperText: 'Keep it short, this is just a demo.',
                      prefixText: ' ',
                      suffixIcon: IconButton(
                          onPressed: () {
                            gitsearch();
                          },
                          icon:  Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      fillColor: Color(0xff514F4F),
                      labelText: 'Search',
                      focusColor: Color(0xFFFFFFFF),
                    ),

                  ),
                ),
              ),
            ],
          ),
           Expanded(
             child: FutureBuilder<ApiSearch>(
          future: ApiManager.getSearch(provider.Q),
          builder: (_,snapShot){
              if(snapShot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());}
              if(snapShot.hasError){
                return Column(
                  children: [
                    Text('Something went wrong'),
                    ElevatedButton(onPressed: (){}, child: Text('Try Again')),
                  ],
                );
              }
              // if("ok" != snapShot.data?.page){ // error
              //   return Column(
              //     children: [
              //       Text('Something went wrong'),
              //       ElevatedButton(onPressed: (){}, child: Text('Try Again')),
              //     ],
              //   );
              // }

              var newsList=snapShot.data?.results ?? [];
              // print('edit');
              // print(newsList[0]);
              if(newsList.isEmpty){
                return Image.asset("assets/images/image_filmjpg.png");
              }
              return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder:(c,index){
                    return Showfilm(newsList[index]);
                    //Text(newsList[index].title ?? "no data",style: TextStyle(color: Colors.black),);
                  } ) ;

          }),
           ) 


        ],
      ),
    );
  }

   gitsearch() {

      provider.search(searchcontroller.text);
      print(searchcontroller.text);
     // Navigator.pushNamed(context, routeName)

  }
}
