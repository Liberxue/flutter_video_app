import 'package:CiYing/models/image.dart';
import 'package:meta/meta.dart';

class ImageList {
  List<Image> images = [];
  String searchQuery;

  ImageList({@required this.images, @required this.searchQuery});

  addToList(Image image) {
    images.add(image);
  }
}
