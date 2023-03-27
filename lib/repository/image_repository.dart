import 'dart:convert';
import 'dart:developer';
import 'dart:io';



import 'package:http/http.dart' as http;

import '../Models/model_image.dart';

class Image_Repository{

  Future<List<PixelfordImage>> getNetwokImages()async{
    try{
      var endpoint = Uri.parse('https://pixelford.com/api2/images');

      final response = await http.get(endpoint);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<PixelfordImage> imageList = decodedList.map((listItem) {
          return PixelfordImage.fromJson(listItem);
        }).toList();

        return imageList;
      } else {
        throw Exception("Api not successes");
      }
    }
    on SocketException{
      throw Exception("No internet! :(");
    }
    on HttpException{
      throw Exception("Couldn't retrieve images");
    }
    on FormatException{
      throw Exception("Invalid Format");
    }

    catch(e)
    {
      log(e.toString());
      throw Exception("Unknown Error");
    }
  }
}