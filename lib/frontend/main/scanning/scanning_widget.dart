import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/frontend/others/error_message/error_message_widget.dart';
import '/frontend/others/picture_error/picture_error_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'scanning_model.dart';
export 'scanning_model.dart';

class ScanningWidget extends StatefulWidget {
  const ScanningWidget({super.key});

  @override
  _ScanningWidgetState createState() => _ScanningWidgetState();
}

class _ScanningWidgetState extends State<ScanningWidget> {
  late ScanningModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanningModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiStepOneResult = await StepOneCheckHumanFaceCall.call(
        photo: FFAppState().imagefromuser,
        url: isWeb
            ? 'https://proxy.vizsoft.in/https://api.openai.com/'
            : 'https://api.openai.com/',
      );
      if ((_model.apiStepOneResult?.succeeded ?? true)) {
        if ('yes' ==
            ((String var1) {
              return var1
                  .replaceAll("```json", "")
                  .replaceAll("\n", "")
                  .replaceAll("```", "")
                  .replaceAll("{", "")
                  .replaceAll("}", "")
                  .replaceAll(":", "")
                  .replaceAll("\"", "")
                  .replaceAll("contains_human_face", "")
                  .replaceAll(" ", "");
            }(StepOneCheckHumanFaceCall.result(
              (_model.apiStepOneResult?.jsonBody ?? ''),
            )!))) {
          _model.apiStepTwoResult = await StepTwoCheckLandmarkCall.call(
            photo: FFAppState().imagefromuser,
            url: isWeb
                ? 'https://proxy.vizsoft.in/https://api.luxand.cloud/'
                : 'https://api.luxand.cloud/',
          );
          if ((_model.apiStepTwoResult?.succeeded ?? true)) {
            _model.jtoTLandmarkResult = await StepJSONtoTextCall.call(
              bodyJson: StepTwoCheckLandmarkCall.landmarkBody(
                (_model.apiStepTwoResult?.jsonBody ?? ''),
              ),
              url: isWeb
                  ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                  : 'https://nocodeplayground.onrender.com/',
            );
            if ((_model.jtoTLandmarkResult?.succeeded ?? true)) {
              _model.apiStepThreeResult = await StepThreeCheckAgeCall.call(
                photo: FFAppState().imagefromuser,
                url: isWeb
                    ? 'https://proxy.vizsoft.in/https://api.luxand.cloud/'
                    : 'https://api.luxand.cloud/',
              );
              if ((_model.apiStepThreeResult?.succeeded ?? true)) {
                _model.jtoTAgeGenderResult = await StepJSONtoTextCall.call(
                  bodyJson: StepThreeCheckAgeCall.ageGenderBody(
                    (_model.apiStepThreeResult?.jsonBody ?? ''),
                  ),
                  url: isWeb
                      ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                      : 'https://nocodeplayground.onrender.com/',
                );
                if ((_model.jtoTAgeGenderResult?.succeeded ?? true)) {
                  _model.landJtoT = '${(String var1) {
                    return var1.replaceAll('"', r'\"');
                  }(StepJSONtoTextCall.jtoT(
                    (_model.jtoTLandmarkResult?.jsonBody ?? ''),
                  )!)}${(String var1) {
                    return var1.replaceAll('"', r'\"');
                  }(StepJSONtoTextCall.jtoT(
                    (_model.jtoTAgeGenderResult?.jsonBody ?? ''),
                  )!)}';
                  _model.apiOpenAIResult = await StepFourOpenAICall.call(
                    landmark: _model.landJtoT,
                    url: isWeb
                        ? 'https://proxy.vizsoft.in/https://api.openai.com/'
                        : 'https://api.openai.com/',
                  );
                  if ((_model.apiOpenAIResult?.succeeded ?? true)) {
                    _model.apiFinalResult = await StepFinalTextJSONCall.call(
                      aItext: StepFourOpenAICall.predictResult(
                        (_model.apiOpenAIResult?.jsonBody ?? ''),
                      ),
                      url: isWeb
                          ? 'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/'
                          : 'https://nocodeplayground.onrender.com/',
                    );
                    if ((_model.apiFinalResult?.succeeded ?? true)) {
                      FFAppState().allResult = StepFinalTextJSONCall.all(
                        (_model.apiFinalResult?.jsonBody ?? ''),
                      );
                      _model.userPredictResult1 =
                          await queryUserPredictionRecordOnce(
                        queryBuilder: (userPredictionRecord) =>
                            userPredictionRecord.where(
                          'user_reference',
                          isEqualTo: currentUserReference,
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if ((_model.userPredictResult1 != null) == true) {
                        await _model.userPredictResult1!.reference.update({
                          ...mapToFirestore(
                            {
                              'user_prediction_list': FieldValue.arrayUnion([
                                getUserPredictionListFirestoreData(
                                  createUserPredictionListStruct(
                                    name: currentUserDisplayName,
                                    image: FFAppState().imagefromuser,
                                    goal: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.goal''',
                                    ).toString().toString(),
                                    interestingFact: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.interesting_fact''',
                                    ).toString().toString(),
                                    life: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.life''',
                                    ).toString().toString(),
                                    love: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.love''',
                                    ).toString().toString(),
                                    personalityType: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.personality_type''',
                                    ).toString().toString(),
                                    statistics: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.statistics''',
                                    ).toString().toString(),
                                    work: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.work''',
                                    ).toString().toString(),
                                    whatsappClickableStatus: 'Pending',
                                    createdAt: getCurrentTimestamp,
                                    id: _model.userPredictResult1!
                                            .userPredictionList
                                            .sortedList((e) => e.id)
                                            .last
                                            .id +
                                        1,
                                    clearUnsetFields: false,
                                  ),
                                  true,
                                )
                              ]),
                            },
                          ),
                        });
                        FFAppState().userWhatsAppIndex = _model
                            .userPredictResult1!.userPredictionList
                            .sortedList((e) => e.id)
                            .last
                            .id;
                      } else {
                        var userPredictionRecordReference =
                            UserPredictionRecord.collection.doc();
                        await userPredictionRecordReference.set({
                          ...createUserPredictionRecordData(
                            name: currentUserDisplayName != ''
                                ? currentUserDisplayName
                                : ' ',
                            userReference: currentUserReference,
                            phone: currentPhoneNumber,
                            email: currentUserEmail,
                            createdAt: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'user_prediction_list': [
                                getUserPredictionListFirestoreData(
                                  createUserPredictionListStruct(
                                    name: currentUserDisplayName,
                                    image: FFAppState().imagefromuser,
                                    goal: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.goal''',
                                    ).toString().toString(),
                                    interestingFact: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.interesting_fact''',
                                    ).toString().toString(),
                                    life: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.life''',
                                    ).toString().toString(),
                                    love: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.love''',
                                    ).toString().toString(),
                                    personalityType: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.personality_type''',
                                    ).toString().toString(),
                                    statistics: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.statistics''',
                                    ).toString().toString(),
                                    work: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.work''',
                                    ).toString().toString(),
                                    whatsappClickableStatus: 'Pending',
                                    createdAt: getCurrentTimestamp,
                                    id: 1,
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  true,
                                )
                              ],
                            },
                          ),
                        });
                        _model.newPredictResult1 =
                            UserPredictionRecord.getDocumentFromData({
                          ...createUserPredictionRecordData(
                            name: currentUserDisplayName != ''
                                ? currentUserDisplayName
                                : ' ',
                            userReference: currentUserReference,
                            phone: currentPhoneNumber,
                            email: currentUserEmail,
                            createdAt: getCurrentTimestamp,
                          ),
                          ...mapToFirestore(
                            {
                              'user_prediction_list': [
                                getUserPredictionListFirestoreData(
                                  createUserPredictionListStruct(
                                    name: currentUserDisplayName,
                                    image: FFAppState().imagefromuser,
                                    goal: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.goal''',
                                    ).toString().toString(),
                                    interestingFact: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.interesting_fact''',
                                    ).toString().toString(),
                                    life: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.life''',
                                    ).toString().toString(),
                                    love: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.love''',
                                    ).toString().toString(),
                                    personalityType: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.personality_type''',
                                    ).toString().toString(),
                                    statistics: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.statistics''',
                                    ).toString().toString(),
                                    work: getJsonField(
                                      (_model.apiFinalResult?.jsonBody ?? ''),
                                      r'''$.work''',
                                    ).toString().toString(),
                                    whatsappClickableStatus: 'Pending',
                                    createdAt: getCurrentTimestamp,
                                    id: 1,
                                    clearUnsetFields: false,
                                    create: true,
                                  ),
                                  true,
                                )
                              ],
                            },
                          ),
                        }, userPredictionRecordReference);
                        FFAppState().userWhatsAppIndex = 0;
                      }

                      context.goNamed(
                        'Prediction',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Final..',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );

                      context.goNamed(
                        'Home',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Step OpenAI..',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );

                    context.goNamed('Home');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Step 3JtoT..',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );

                  context.goNamed('Home');
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Step3..',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );

                context.goNamed('Home');
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Step 2JtoT..',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );

              context.goNamed('Home');
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Step2..',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );

            context.goNamed(
              'Home',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          }
        } else {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () => _model.unfocusNode.canRequestFocus
                      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                      : FocusScope.of(context).unfocus(),
                  child: const SizedBox(
                    width: 400.0,
                    child: ErrorMessageWidget(),
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));

          context.goNamed('Home');
        }
      } else {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: const AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: const SizedBox(
                  width: 400.0,
                  child: PictureErrorWidget(),
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));

        context.goNamed(
          'Home',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 400.0,
                  child: Stack(
                    children: [
                      Lottie.asset(
                        'assets/lottie_animations/red-loading.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 420.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 200.0,
                          height: 200.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              FFAppState().imagefromuser,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hundred-faces-5460t7/assets/8zu7q4jbt343/playstore_icon.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Opacity(
                          opacity: 0.7,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/1_YF4KdQE-RadFtNa6n66wdg.gif',
                                width: 300.0,
                                height: 180.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  _model.state,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
