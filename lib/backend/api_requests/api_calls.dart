import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Yelp Group Code

class YelpGroup {
  static String baseUrl = 'https://api.yelp.com/v3';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer 04AOzyya6HdlxsIhmlhdscvibUxE7nVADA_yyAdem00bLdwAA641Gv7AgGb54MVcQBi8vpb8lEAk8RFOZIojo3tRVY2c4SjD_fdRb574Ck7JP07hZmwMqe9QPPhTY3Yx',
  };
  static GetBusinessDetailsCall getBusinessDetailsCall =
      GetBusinessDetailsCall();
}

class GetBusinessDetailsCall {
  Future<ApiCallResponse> call({
    String? location = 'Indianapolis',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getBusinessDetails',
      apiUrl: '${YelpGroup.baseUrl}/businesses/search',
      callType: ApiCallType.GET,
      headers: {
        ...YelpGroup.headers,
      },
      params: {
        'location': location,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Yelp Group Code

/// Start Mux Group Code

class MuxGroup {
  static String baseUrl = 'https://api.mux.com';
  static Map<String, String> headers = {
    'Authorization': 'Basic f42e542e-0bf0-44d0-a35e-53b45e43cc7b',
  };
  static CreateMuxAssetCall createMuxAssetCall = CreateMuxAssetCall();
  static RetreiveMuxAssetCall retreiveMuxAssetCall = RetreiveMuxAssetCall();
}

class CreateMuxAssetCall {
  Future<ApiCallResponse> call() {
    final body = '''
{
  "input": [
    {
      "url": "https://muxed.s3.amazonaws.com/leds.mp4"
    }
  ],
  "playback_policy": [
    "public"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createMuxAsset',
      apiUrl: '${MuxGroup.baseUrl}/video/v1/assets',
      callType: ApiCallType.POST,
      headers: {
        ...MuxGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RetreiveMuxAssetCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'retreiveMuxAsset',
      apiUrl: '${MuxGroup.baseUrl}/video/v1/assets',
      callType: ApiCallType.GET,
      headers: {
        ...MuxGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Mux Group Code

class CreateAssetCall {
  static Future<ApiCallResponse> call() {
    final body = '''
{
  "input": "https://storage.googleapis.com/muxdemofiles/mux-video-intro.mp4",
  "playback_policy": [
    "public"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createAsset',
      apiUrl: 'https://api.mux.com/video/v1/assets',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic base64 79940181-10cf-4e0f-b787-0c0576983cd2:URb0No3xKVmaK9El+7n3C3R1UE91tjVzftaspFZoq+PnZf2MUxSxqUDfzY4SUvwt1sHyQ5HuB4v',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetAssetCall {
  static Future<ApiCallResponse> call({
    String? assetId = 'RiyQPM31a1SPtfI802bEP2zD02F5FQVNL801FRHeE5t01G4',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAsset',
      apiUrl: 'https://api.mux.com/video/v1/assets/${assetId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 5urf8or0susb54d0ks6sheg17',
      },
      params: {
        'ASSET_ID': assetId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
