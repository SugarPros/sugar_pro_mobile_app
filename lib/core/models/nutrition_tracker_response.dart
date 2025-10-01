class NutritionTrackerResponse {
  String? type;
  NutritionTracker? data;

  NutritionTrackerResponse({this.type, this.data});

  NutritionTrackerResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? NutritionTracker.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NutritionTracker {
  List<Foods>? foods;

  NutritionTracker({this.foods});

  NutritionTracker.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foods != null) {
      data['foods'] = foods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Foods {
  String? id;
  String? name;
  String? brand;
  String? calories;
  String? protein;
  String? carbs;
  String? fat;
  String? fiber;
  String? sugar;
  String? sodium;
  String? servingDescription;
  String? foodUrl;
  int? healthScore;
  List<Servings>? servings;

  Foods(
      {this.id,
      this.name,
      this.brand,
      this.calories,
      this.protein,
      this.carbs,
      this.fat,
      this.fiber,
      this.sugar,
      this.sodium,
      this.servingDescription,
      this.foodUrl,
      this.healthScore,
      this.servings});

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    calories = json['calories'];
    protein = json['protein'];
    carbs = json['carbs'];
    fat = json['fat'];
    fiber = json['fiber'];
    sugar = json['sugar'];
    sodium = json['sodium'];
    servingDescription = json['serving_description'];
    foodUrl = json['food_url'];
    healthScore = json['health_score'];
    if (json['servings'] != null) {
      servings = <Servings>[];
      json['servings'].forEach((v) {
        servings!.add(Servings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['brand'] = brand;
    data['calories'] = calories;
    data['protein'] = protein;
    data['carbs'] = carbs;
    data['fat'] = fat;
    data['fiber'] = fiber;
    data['sugar'] = sugar;
    data['sodium'] = sodium;
    data['serving_description'] = servingDescription;
    data['food_url'] = foodUrl;
    data['health_score'] = healthScore;
    if (servings != null) {
      data['servings'] = servings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Servings {
  String? calcium;
  String? calories;
  String? carbohydrate;
  String? cholesterol;
  String? fat;
  String? fiber;
  String? iron;
  String? measurementDescription;
  String? metricServingAmount;
  String? metricServingUnit;
  String? monounsaturatedFat;
  String? numberOfUnits;
  String? polyunsaturatedFat;
  String? potassium;
  String? protein;
  String? saturatedFat;
  String? servingDescription;
  String? servingId;
  String? servingUrl;
  String? sodium;
  String? sugar;
  String? vitaminA;
  String? vitaminC;

  Servings(
      {this.calcium,
      this.calories,
      this.carbohydrate,
      this.cholesterol,
      this.fat,
      this.fiber,
      this.iron,
      this.measurementDescription,
      this.metricServingAmount,
      this.metricServingUnit,
      this.monounsaturatedFat,
      this.numberOfUnits,
      this.polyunsaturatedFat,
      this.potassium,
      this.protein,
      this.saturatedFat,
      this.servingDescription,
      this.servingId,
      this.servingUrl,
      this.sodium,
      this.sugar,
      this.vitaminA,
      this.vitaminC});

  Servings.fromJson(Map<String, dynamic> json) {
    calcium = json['calcium'];
    calories = json['calories'];
    carbohydrate = json['carbohydrate'];
    cholesterol = json['cholesterol'];
    fat = json['fat'];
    fiber = json['fiber'];
    iron = json['iron'];
    measurementDescription = json['measurement_description'];
    metricServingAmount = json['metric_serving_amount'];
    metricServingUnit = json['metric_serving_unit'];
    monounsaturatedFat = json['monounsaturated_fat'];
    numberOfUnits = json['number_of_units'];
    polyunsaturatedFat = json['polyunsaturated_fat'];
    potassium = json['potassium'];
    protein = json['protein'];
    saturatedFat = json['saturated_fat'];
    servingDescription = json['serving_description'];
    servingId = json['serving_id'];
    servingUrl = json['serving_url'];
    sodium = json['sodium'];
    sugar = json['sugar'];
    vitaminA = json['vitamin_a'];
    vitaminC = json['vitamin_c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calcium'] = calcium;
    data['calories'] = calories;
    data['carbohydrate'] = carbohydrate;
    data['cholesterol'] = cholesterol;
    data['fat'] = fat;
    data['fiber'] = fiber;
    data['iron'] = iron;
    data['measurement_description'] = measurementDescription;
    data['metric_serving_amount'] = metricServingAmount;
    data['metric_serving_unit'] = metricServingUnit;
    data['monounsaturated_fat'] = monounsaturatedFat;
    data['number_of_units'] = numberOfUnits;
    data['polyunsaturated_fat'] = polyunsaturatedFat;
    data['potassium'] = potassium;
    data['protein'] = protein;
    data['saturated_fat'] = saturatedFat;
    data['serving_description'] = servingDescription;
    data['serving_id'] = servingId;
    data['serving_url'] = servingUrl;
    data['sodium'] = sodium;
    data['sugar'] = sugar;
    data['vitamin_a'] = vitaminA;
    data['vitamin_c'] = vitaminC;
    return data;
  }
}
