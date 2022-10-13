import 'dart:convert';

List<Foods> foodsFromJson(String str) =>
    List<Foods>.from(json.decode(str).map((x) => Foods.fromJson(x)));

String foodsToJson(List<Foods> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foods {
  Foods({
    this.id,
    this.name,
    this.description,
    this.country,
    this.type,
    this.recommendedtime,
    this.rating,
    this.likes,
    this.image,
    this.nutrients,
    this.times,
    this.ingredients,
    this.restaurants,
  });

  int? id;
  String? name;
  String? description;
  String? country;
  String? type;
  String? recommendedtime;
  double? rating;
  int? likes;
  String? image;
  Nutrients? nutrients;
  Times? times;
  List<Ingredient>? ingredients;
  List<Restaurant>? restaurants;

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        country: json["country"],
        type: json["type"],
        recommendedtime: json["recommendedtime"],
        rating: json["rating"].toDouble(),
        likes: json["likes"],
        image: json["image"],
        nutrients: Nutrients.fromJson(json["nutrients"]),
        times: Times.fromJson(json["times"]),
        ingredients: json["ingredients"] != null
            ? List<Ingredient>.from(
                json["ingredients"].map((x) => Ingredient.fromJson(x)))
            : [],
        restaurants: json["restaurants"] != null
            ? List<Restaurant>.from(
                json["restaurants"].map((x) => Restaurant.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "country": country,
        "type": type,
        "recommendedtime": recommendedtime,
        "rating": rating,
        "likes": likes,
        "image": image,
        "nutrients": nutrients?.toJson(),
        "times": times?.toJson(),
        "ingredients": ingredients != null
            ? List<dynamic>.from(ingredients!.map((x) => x.toJson()))
            : [],
        "restaurants": restaurants != null
            ? List<dynamic>.from(restaurants!.map((x) => x.toJson()))
            : [],
      };
}

class Ingredient {
  Ingredient({
    this.name,
    this.weight,
    this.weightname,
    this.image,
    this.description,
  });

  String? name;
  double? weight;
  String? weightname;
  String? image;
  String? description;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        weight: json["weight"].toDouble(),
        weightname: json["weightname"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "weight": weight,
        "weightname": weightname,
        "image": image,
        "description": description,
      };
}

class Nutrients {
  Nutrients({
    this.calories,
    this.protein,
    this.carbohydrates,
    this.fat,
    this.sugar,
    this.cholesterol,
  });

  int? calories;
  double? protein;
  double? carbohydrates;
  double? fat;
  double? sugar;
  double? cholesterol;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        calories: json["calories"],
        protein: json["protein"].toDouble(),
        carbohydrates: json["carbohydrates"].toDouble(),
        fat: json["fat"].toDouble(),
        sugar: json["sugar"].toDouble(),
        cholesterol: json["cholesterol"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "protein": protein,
        "carbohydrates": carbohydrates,
        "fat": fat,
        "sugar": sugar,
        "cholesterol": cholesterol,
      };
}

class Restaurant {
  Restaurant({
    this.name,
    this.description,
    this.address,
    this.image,
    this.rating,
    this.telephone,
    this.latitude,
    this.longtitude,
    this.datetime,
  });

  String? name;
  String? description;
  String? address;
  String? image;
  double? rating;
  String? telephone;
  String? latitude;
  String? longtitude;
  List<Datetime>? datetime;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        name: json["name"],
        description: json["description"],
        address: json["address"],
        image: json["image"],
        rating: json["rating"].toDouble(),
        telephone: json["telephone"],
        latitude: json["latitude"],
        longtitude: json["longtitude"],
        datetime: json["datetime"] != null
            ? List<Datetime>.from(
                json["datetime"].map((x) => Datetime.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "address": address,
        "image": image,
        "rating": rating,
        "telephone": telephone,
        "latitude": latitude,
        "longtitude": longtitude,
        "datetime": datetime != null
            ? List<dynamic>.from(datetime!.map((x) => x.toJson()))
            : [],
      };
}

class Datetime {
  Datetime({
    this.date,
    this.time,
  });

  String? date;
  String? time;

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
      };
}

class Times {
  Times({
    this.preparation,
    this.cookingtime,
    this.additional,
    this.total,
  });

  int? preparation;
  int? cookingtime;
  int? additional;
  int? total;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        preparation: json["preparation"],
        cookingtime: json["cookingtime"],
        additional: json["additional"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "preparation": preparation,
        "cookingtime": cookingtime,
        "additional": additional,
        "total": total,
      };
}
