import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'countdown11_widget.dart' show Countdown11Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class Countdown11Model extends FlutterFlowModel<Countdown11Widget> {
  ///  Local state fields for this page.

  bool isPlaying = false;

  bool timerStart = false;

  String buttonLabel = 'Start';

  bool isActionRunning = false;

  String? currentAudioUrl =
      'https://firebasestorage.googleapis.com/v0/b/sleep-app-4ec19.firebasestorage.app/o/wordlist1b.mp3?alt=media&token=6769ad3c-a98d-4d28-adfe-7efc2d93b707';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Countdown11 widget.
  AudioTracksRecord? trackQuery1;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
