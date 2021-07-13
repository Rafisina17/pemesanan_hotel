class Space {
  int id, rating, numberOfKitchens, numberOfBedrooms, numberOfCapboards;
  String name, imageUrl, city, country, address, phone, mapUrl;
  int price;
  List photos;

  Space(
      {this.city,
      this.country,
      this.id,
      this.imageUrl,
      this.name,
      this.price,
      this.rating,
      this.address,
      this.mapUrl,
      this.numberOfBedrooms,
      this.numberOfCapboards,
      this.numberOfKitchens,
      this.phone,
      this.photos});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    photos = json["photos"];
    mapUrl = json['map_url'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfCapboards = json['number_of_cupboards'];
  }
}
