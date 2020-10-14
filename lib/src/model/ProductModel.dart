class ProductModel {
  int furnitureStock;
  int furnitureID;
  String furnitureName;
  String furnitureType;
  String furnitureImage;
  double furniturePrice;

  ProductModel(
    this.furnitureStock,
    this.furnitureID,
    this.furnitureName,
    this.furnitureType,
    this.furnitureImage,
    this.furniturePrice,
  );

  ProductModel.fromJson(Map<String, dynamic> data) {
    furnitureStock = data['furnitureStock'];
    furnitureID = data['furnitureID'];
    furnitureName = data['furnitureName'];
    furnitureType = data['furnitureType'];
    furnitureImage = data['furnitureImage'];
    furniturePrice = data['furniturePrice'];
  }
}
