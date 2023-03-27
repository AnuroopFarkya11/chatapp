import 'package:chatapp/Models/model_image.dart';
import 'package:flutter/material.dart';

import '../repository/image_repository.dart';

class NetworkImagePickerBody extends StatelessWidget {
  Function(String newImage) imagePicked;

  NetworkImagePickerBody({Key? key, required this.imagePicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FutureBuilder(
            future: Image_Repository().getNetwokImages(),
            builder: (context, AsyncSnapshot<List<PixelfordImage>> snapshot) {

              // if(snapshot.connectionState==ConnectionState.waiting)
              //   return Center(child: Text("API IS IN WAITING",style: TextStyle(fontSize: 30),),);
              // if(snapshot.connectionState==ConnectionState.active)
              //   return Center(child: Text("API IS IN ACTIVE",style: TextStyle(fontSize: 30),),);
              // if(snapshot.connectionState==ConnectionState.none)
              //   return Center(child: Text("API IS IN NONE",style: TextStyle(fontSize: 30),),);


              if (snapshot.hasData) {
                return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                imagePicked(snapshot.data![index].urlSmallSize);
                              },
                              child: Image.network(
                                  snapshot.data![index].urlSmallSize));
                        }));
              }


              if(snapshot.hasError)
                {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("Oopsss:  ${snapshot.error}"),
                  );
                }



              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
