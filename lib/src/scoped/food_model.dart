import 'dart:convert';
import 'package:food_app/models/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model{
  List <Food> _foods = [];
  bool _Loading = false;

  bool get Loading{
    return _Loading;
  }

  List<Food> get foods{
    return List.from(_foods);
  }

  Future <bool> addFood(Food food) async{
    //_foods.add(food);
    _Loading =true;
    notifyListeners();
    try{
      final Map<String, dynamic> foodData ={
        "title" : food.name,
        "description" : food.description,
        "price" : food.price,
        "discount" : food.discount,
        "category" : food.category,
      };
      final http.Response response = await http.post("https://foodapp-4df1d-default-rtdb.firebaseio.com/foods.json",
          body: json.encode(foodData));

      final Map <String, dynamic> responeData = json.decode(response.body);

      //print(responeData["name"]);

        Food foodWithID =Food(
        //id: responeData =["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
        price: food.price,
      );
        _foods.add(foodWithID);
        _Loading =false;
        notifyListeners();
      //fetchFoods();
      return Future.value(true);
    }catch(e){
      _Loading =false;
      notifyListeners();
      return Future.value(true);
      //print("Connection error : $e");
    }
  }

  Future<bool> fetchFoods()async{

    _Loading = true;
    notifyListeners();

    try{
      final http.Response response = await http.get('https://foodapp-4df1d-default-rtdb.firebaseio.com/foods.json');

      final Map<String, dynamic> fetchedData = json.decode(response.body);
      print(fetchedData);

      final List <Food> foodItems = [];

      fetchedData.forEach((String id, dynamic foodData) {
        Food foodItem = Food (
          id: id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: foodData["price"],
          discount: foodData["discount"],
        );

        foodItems.add(foodItem);
      });

      _foods = foodItems;
      _Loading = false;
      notifyListeners();
      return Future.value(true);
    }
    catch(error){

      _Loading =false;
      notifyListeners();
      return Future.value(false);

    }


  }
}