import 'package:image_picker/image_picker.dart';

class ProductModel {
  final int id;
  final String title;
  final int price;
  final String content;
  final List<XFile> images;
  final String userNickName;
  final DateTime createdTime;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.content,
    required this.images,
    required this.userNickName,
    required this.createdTime,
  });
}
