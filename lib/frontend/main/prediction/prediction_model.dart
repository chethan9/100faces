import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prediction_widget.dart' show PredictionWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class PredictionModel extends FlutterFlowModel<PredictionWidget> {
  ///  Local state fields for this page.

  List<UserPredictionListStruct> userPredictList = [];
  void addToUserPredictList(UserPredictionListStruct item) =>
      userPredictList.add(item);
  void removeFromUserPredictList(UserPredictionListStruct item) =>
      userPredictList.remove(item);
  void removeAtIndexFromUserPredictList(int index) =>
      userPredictList.removeAt(index);
  void insertAtIndexInUserPredictList(
          int index, UserPredictionListStruct item) =>
      userPredictList.insert(index, item);
  void updateUserPredictListAtIndex(
          int index, Function(UserPredictionListStruct) updateFn) =>
      userPredictList[index] = updateFn(userPredictList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserPredictionRecord? userPredictResult1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
