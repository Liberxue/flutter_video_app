import 'package:ciying/grpc/proto/search.pb.dart';

class VideoPlayArguments {
  final String searchText;
  ResourceSection resourceSection;

  VideoPlayArguments(this.searchText, this.resourceSection);
}
