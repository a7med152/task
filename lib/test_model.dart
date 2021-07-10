class TestModel {

  final String imageUrl;
  var nextX;
  var nextY;
  var perviousX;
  var perviousY;
  var currentX;
  var currentY;
  String name;
  int rate;

  TestModel(
      this.imageUrl, this.currentX, this.currentY,this.nextX, this.nextY, this.perviousX,
      this.perviousY, this.name, this.rate
      );
}

final allModels = [

TestModel(
    "assets/bed.png",
    10.0,
    10.0,
    10.0,
    10.0,
    10.0,
    10.0,
    "bed",
    5
    ),
  TestModel(
      "assets/chair.png",
      15.0,
      15.0,
      15.0,
      15.0,
      15.0,
      15.0,
      "chair",
      5
  ),
  TestModel(
      "assets/sofa.png",
      20.0,
      20.0,
      20.0,
      20.0,
      20.0,
      20.0,
      "sofa",
      5
  ),
  TestModel(
      "assets/sofa-with-centre-table.png",
      25.0,
      25.0,
      25.0,
      25.0,
      25.0,
      25.0,
      "sofa with show",
      5
  ),

];