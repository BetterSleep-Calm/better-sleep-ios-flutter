// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';

AudioPlayer? _audioPlayer;
String? _lastLoadedUrl;

Future<void> controlAudioPause(String url, String action) async {
  try {
    _audioPlayer ??= AudioPlayer();

    // Handle stop before checking for URL changes
    if (action == "stop") {
      await _audioPlayer?.stop();
      await _audioPlayer?.dispose();
      _audioPlayer = null;
      _lastLoadedUrl = null;
      print("Audio player stopped and disposed.");
      return;
    }

    // Load audio if URL has changed
    if (_lastLoadedUrl != url) {
      await _audioPlayer!.setUrl(url);
      await _audioPlayer!.seek(Duration.zero);
      _lastLoadedUrl = url;
      print("New audio URL loaded: $url");
    }

    if (action == "play") {
      final isPaused = !_audioPlayer!.playing;
      final position = _audioPlayer!.position.inMilliseconds;

      if (position < 1000 && isPaused) {
        await _audioPlayer!.seek(Duration.zero);
        await _audioPlayer!.play();
        print("Started from beginning.");
      } else if (isPaused) {
        await _audioPlayer!.play();
        print("Resumed playback.");
      } else {
        print("Already playing — no action taken.");
      }
    } else if (action == "pause") {
      if (_audioPlayer!.playing) {
        await _audioPlayer!.pause();
        print("Audio paused.");
      } else {
        print("Already paused.");
      }
    } else {
      print("Unsupported action: $action");
    }
  } catch (e) {
    print('Audio $action error: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
