import 'package:flutter/cupertino.dart';

class ItemModel{
  String title;
  String image;
  String description;
  String time;
  String location;
  double rating;
  ItemModel({
    this.title,
    this.location,
    this.description,
    this.time,
    this.image,
    this.rating
});
}