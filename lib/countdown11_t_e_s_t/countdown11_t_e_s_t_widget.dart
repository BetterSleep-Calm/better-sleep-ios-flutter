import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'countdown11_t_e_s_t_model.dart';
export 'countdown11_t_e_s_t_model.dart';

class Countdown11TESTWidget extends StatefulWidget {
  const Countdown11TESTWidget({super.key});

  static String routeName = 'Countdown11TEST';
  static String routePath = '/countdown11TEST';

  @override
  State<Countdown11TESTWidget> createState() => _Countdown11TESTWidgetState();
}

class _Countdown11TESTWidgetState extends State<Countdown11TESTWidget> {
  late Countdown11TESTModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Countdown11TESTModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Update Audio Index
      FFAppState().audioIndex = functions.getNextIndex(FFAppState().audioIndex);
      safeSetState(() {});
      // Get correct audio track
      _model.trackQuery1 = await queryAudioTracksRecordOnce(
        queryBuilder: (audioTracksRecord) => audioTracksRecord.where(
          'index',
          isEqualTo: FFAppState().audioIndex,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      // UPdate page state to correct URL
      _model.currentAudioUrl = _model.trackQuery1?.url;
      safeSetState(() {});
      // Set to is not playing
      _model.isPlaying = false;
      safeSetState(() {});
      final isEntitled =
          await revenue_cat.isEntitled('LifetimeAccess2') ?? false;
      if (!isEntitled) {
        await revenue_cat.loadOfferings();
      }

      if (isEntitled) {
        // Yes: load main page

        context.pushNamed(Countdown11TESTWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await actions.controlAudioPause(
        '\"\"',
        'stop',
      );
      _model.currentAudioUrl = '\"\"';
      safeSetState(() {});
      _model.timerController.onResetTimer();
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xEB5CE1E6),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height + 80,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/background.webp',
                    ).image,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/background.webp',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.0,
                      height: 200.0,
                      decoration: BoxDecoration(),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        updateStateInterval: Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) safeSetState(() {});
                        },
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              color: Color(0x885CE1E6),
                              fontSize: 80.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 9.43,
                      decoration: BoxDecoration(),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 300.0,
                        height: 175.51,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.isPlaying == false) {
                                _model.timerController.onStartTimer();
                                _model.isPlaying = true;
                                safeSetState(() {});
                                await actions.controlAudioPause(
                                  _model.currentAudioUrl!,
                                  'play',
                                );
                              } else {
                                _model.timerController.onStopTimer();
                                _model.isPlaying = false;
                                safeSetState(() {});
                                await actions.controlAudioPause(
                                  _model.currentAudioUrl!,
                                  'pause',
                                );
                              }
                            },
                            text: _model.isPlaying ? 'Pause' : 'Play',
                            options: FFButtonOptions(
                              width: 100.0,
                              height: 100.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x885CE1E6),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await actions.controlAudioPause(
                            _model.currentAudioUrl!,
                            'stop',
                          );
                          _model.timerController.onResetTimer();
                        },
                        text: 'Reset',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x005CE1E6),
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xAAFFFFFF),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Color(0x885CE1E6),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      height: 138.11,
                      decoration: BoxDecoration(),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Provide Feedback',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x065CE1E6),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xAAFFFFFF),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Color(0x885CE1E6),
                        ),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
