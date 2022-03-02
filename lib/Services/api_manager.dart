import 'dart:convert';

import 'package:api_get_data2/Constants/strings.dart';
import 'package:api_get_data2/Model/cocktail_info.dart';
import 'package:http/http.dart' as http;


class Api_Manager{
  Future<CocktailModel> getData() async {
    var client = http.Client();
    var cocktailModel = null;
    try{
      var response = await client.get(Strings.Cocktail_Url);
      print("*****************************");
      print(response.body);
      print("*****************************");
      var responseString = response.body;
      var responseMap    = json.decode(responseString);
      cocktailModel = CocktailModel.fromJson(responseMap);


      print("------------------- CockTail Model ---------------------");
      print(cocktailModel);
      print("------------------- CockTail Model ---------------------");
    }
    catch (Exception){
      print("----------- Exception -----------------");
      return cocktailModel;

    }
    return cocktailModel;
  }

}







/*

class Api_Manager{

  Future<CocktailModel> getData() async {
    var client=http.Client();
    var flipModel=null;
    try{
      var response= await client.get(Strings.Cocktail_Url);
      var flipString=response.body;
      var flipMap=json.decode(flipString);
      flipModel=CocktailModel.fromJson(flipMap);
    }catch(Exception){
      return flipModel;
    }
    return flipModel;
  }

}*/
