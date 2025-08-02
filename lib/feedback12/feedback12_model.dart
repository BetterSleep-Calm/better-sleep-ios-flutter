import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'feedback12_widget.dart' show Feedback12Widget;
import 'package:flutter/material.dart';

class Feedback12Model extends FlutterFlowModel<Feedback12Widget> {
  ///  Local state fields for this page.
  /// Changes to "Done"
  String buttonLabel = 'Submit';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Age is required';
    }

    if (val.length < 1) {
      return 'Please enter age';
    }
    if (val.length > 2) {
      return 'Too many digits';
    }
    if (!RegExp('^(?:[1-9]|[1-9][0-9])\$').hasMatch(val)) {
      return 'Try again';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mins is required';
    }

    if (val.length < 1) {
      return 'Please enter mins';
    }
    if (val.length > 2) {
      return 'Too many digits';
    }
    if (!RegExp('^[0-9]{1,2}\$').hasMatch(val)) {
      return 'Try again';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? isFormValid;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
