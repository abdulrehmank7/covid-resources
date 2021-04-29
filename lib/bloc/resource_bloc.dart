import 'dart:async';

import 'package:covid_resources/data/model/cities.dart';
import 'package:covid_resources/data/model/resource.dart';
import 'package:covid_resources/data/rest_apis/apis.dart';

enum ResourceEvent { FetchNewResource, FetchCities }

class ResourceBloc {
  final _resDataStreamController = StreamController<List<ResourceData>>.broadcast();

  StreamSink<List<ResourceData>> get _resDataSink => _resDataStreamController.sink;

  Stream<List<ResourceData>> get resDataStream => _resDataStreamController.stream;

  final _resDataEventStreamController = StreamController<ResourceEvent>();

  StreamSink<ResourceEvent> get eventSink => _resDataEventStreamController.sink;

  Stream<ResourceEvent> get _eventStream => _resDataEventStreamController.stream;

  final _citiesStreamController = StreamController<List<String>>.broadcast();

  StreamSink<List<String>> get _citiesDataSink => _citiesStreamController.sink;

  Stream<List<String>> get citiesDataStream => _citiesStreamController.stream;

  final _citiesLoadingStreamController = StreamController<bool>.broadcast();

  StreamSink<bool> get _citiesLoadingSink => _citiesLoadingStreamController.sink;

  Stream<bool> get citiesLoadingStream => _citiesLoadingStreamController.stream;

  String selectedState = "";
  String selectedCity;
  bool isLoading = true;

  Cities currentStateCities;

  ResourceBloc() {
    _fetchResource();

    _eventStream.listen((event) {
      if (event == ResourceEvent.FetchCities) {
        _citiesLoadingSink.add(true);
        getCities(selectedState).then((value) {
          currentStateCities = value;
          if (currentStateCities != null) _citiesDataSink.add(currentStateCities.data);
          _citiesLoadingSink.add(false);
        });
      } else if (event == ResourceEvent.FetchNewResource) _fetchResource();
    });
  }

  _fetchResource() {
    isLoading = true;
    getResource(selectedState, selectedCity == null ? "" : selectedCity).then((response) {
      isLoading = false;
      if (response != null) _resDataSink.add(response.data);
    });
  }

  dispose() {
    _resDataStreamController.close();
    _resDataEventStreamController.close();
    _citiesStreamController.close();
    _citiesLoadingStreamController.close();
  }
}
