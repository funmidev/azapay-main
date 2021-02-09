import 'package:charts_flutter/flutter.dart';
import 'package:flutter/widgets.dart';

class WebChartUI extends StatefulWidget {
  final List<Series> seriesList;
  final bool animate;

  const WebChartUI({Key key, this.seriesList, this.animate = true}) : super(key: key);

  @override
  _WebChartUIState createState() => _WebChartUIState();
}

class _WebChartUIState extends State<WebChartUI> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TimeSeriesChart(
        widget.seriesList,
        animate: widget.animate,
        selectionModels: [
          SelectionModelConfig(
            type: SelectionModelType.info,
            // listener: _onSelectionChanged,
          )
        ],
      ),
    );
  }
}
