class ProductModel{
  int id,catId;
  String title,shortDescription,description,image,catTitle;
  double price;


  ProductModel(
      this.id, this.title, this.shortDescription, this.description, this.price,this.image,this.catId,this.catTitle);

  ProductModel.fromJason(Map<String,dynamic> map) {

    this.id = map["id"];
    this.title = map["title"];
    this.shortDescription = map["shortDescription"];
    this.description = map["description"];
    this.price = map["price"];
    this.image = map["image"]["url"];
    this.catId = map["category"]["id"];
    this.catTitle = map["category"]["title"];
  }
}