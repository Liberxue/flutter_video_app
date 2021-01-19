import 'package:ciying/api/feedback/feedback.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';

class FeedBackModel {
  Future<FeedbackResponse> favoriteAction(FeedbackRequest data) async {
    return await Feedback.feedbackAPIRequest(data);
  }
}
