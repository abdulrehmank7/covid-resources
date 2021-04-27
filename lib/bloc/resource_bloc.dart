import 'dart:async';

import 'package:covid_resources/data/model/resource.dart';
import 'package:covid_resources/data/rest_apis/apis.dart';

enum ResourceEvent { FetchNewResource }

class ResourceBloc {
  final _resDataStreamController = StreamController<List<ResourceData>>.broadcast();

  StreamSink<List<ResourceData>> get _resDataSink => _resDataStreamController.sink;

  Stream<List<ResourceData>> get resDataStream => _resDataStreamController.stream;

  final _resDataEventStreamController = StreamController<ResourceEvent>();

  StreamSink<ResourceEvent> get eventSink => _resDataEventStreamController.sink;

  Stream<ResourceEvent> get _eventStream => _resDataEventStreamController.stream;

  ResourceBloc() {
    getResource().then((response) {
      _resDataSink.add(response.data);
    });
  }

  dispose() {
    _resDataStreamController.close();
    _resDataEventStreamController.close();
  }
}
