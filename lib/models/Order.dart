
import 'package:ciying/grpc/proto/search.pb.dart';

class Order {

  ResourceSection _resourceSection;
  int _id;

  Order(this._resourceSection, this._id);

  int get id => _id;

  ResourceSection get resourceSection => _resourceSection;

}