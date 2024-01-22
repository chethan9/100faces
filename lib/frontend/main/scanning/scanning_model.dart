import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scanning_widget.dart' show ScanningWidget;
import 'package:flutter/material.dart';

class ScanningModel extends FlutterFlowModel<ScanningWidget> {
  ///  Local state fields for this page.

  String state = 'Processing...';

  String landJtoT = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (StepOneCheckHumanFace)] action in Scanning widget.
  ApiCallResponse? apiStepOneResult;
  // Stores action output result for [Backend Call - API (StepTwoCheckLandmark)] action in Scanning widget.
  ApiCallResponse? apiStepTwoResult;
  // Stores action output result for [Backend Call - API (StepJSONtoText)] action in Scanning widget.
  ApiCallResponse? jtoTLandmarkResult;
  // Stores action output result for [Backend Call - API (StepThreeCheckAge)] action in Scanning widget.
  ApiCallResponse? apiStepThreeResult;
  // Stores action output result for [Backend Call - API (StepJSONtoText)] action in Scanning widget.
  ApiCallResponse? jtoTAgeGenderResult;
  // Stores action output result for [Backend Call - API (StepFourOpenAI)] action in Scanning widget.
  ApiCallResponse? apiOpenAIResult;
  // Stores action output result for [Backend Call - API (StepFinalTextJSON)] action in Scanning widget.
  ApiCallResponse? apiFinalResult;
  // Stores action output result for [Firestore Query - Query a collection] action in Scanning widget.
  UserPredictionRecord? userPredictResult1;
  // Stores action output result for [Backend Call - Create Document] action in Scanning widget.
  UserPredictionRecord? newPredictResult1;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
