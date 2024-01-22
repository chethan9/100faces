import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'copy_text_model.dart';
export 'copy_text_model.dart';

class CopyTextWidget extends StatefulWidget {
  const CopyTextWidget({
    super.key,
    required this.jtot,
  });

  final String? jtot;

  @override
  _CopyTextWidgetState createState() => _CopyTextWidgetState();
}

class _CopyTextWidgetState extends State<CopyTextWidget> {
  late CopyTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CopyTextModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: widget.jtot!));
      },
      child: Text(
        widget.jtot!,
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
