import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'mobilemenu_model.dart';
export 'mobilemenu_model.dart';

class MobilemenuWidget extends StatefulWidget {
  const MobilemenuWidget({
    super.key,
    this.colorOne,
    this.colorTwo,
    this.colorThree,
  });

  final Color? colorOne;
  final Color? colorTwo;
  final Color? colorThree;

  @override
  _MobilemenuWidgetState createState() => _MobilemenuWidgetState();
}

class _MobilemenuWidgetState extends State<MobilemenuWidget>
    with TickerProviderStateMixin {
  late MobilemenuModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: const Offset(300.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MobilemenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 250.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).tertiary,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'Home',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'Home',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Montserrat',
                        color:
                            'hundredfaces://hundredfaces.com${GoRouter.of(context).location}' ==
                                    'hundredfaces://hundredfaces.com/home'
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            if (loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'EditProfileUser',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'Edit Profile',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Montserrat',
                        color: 'hundredfaces://hundredfaces.com${GoRouter.of(context).location}' ==
                                'hundredfaces://hundredfaces.com/editprofileuser'
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            if (loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'changepassworduser',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'Change Password',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Montserrat',
                        color: 'hundredfaces://hundredfaces.com${GoRouter.of(context).location}' ==
                                'hundredfaces://hundredfaces.com/changepassworduser'
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            if (!loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'Register',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'Login / Signup',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Montserrat',
                        color:
                            'hundredfaces://hundredfaces.com${GoRouter.of(context).location}' ==
                                    'hundredfaces://hundredfaces.com/register'
                                ? FlutterFlowTheme.of(context).primaryText
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            if (loggedIn)
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth(
                    'Register',
                    context.mounted,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Text(
                  'Logout',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
          ].divide(const SizedBox(height: 24.0)).around(const SizedBox(height: 24.0)),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
