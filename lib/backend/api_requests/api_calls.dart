import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class MuxVideoCall {
  static Future<ApiCallResponse> call({
    String? videoUrl = '',
  }) {
    final body = '''
{
  "input": "${videoUrl}",
  "playback_policy": "public"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'muxVideo',
      apiUrl: 'https://api.mux.com/video/v1/assets',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GetVideoGIFCall {
  static Future<ApiCallResponse> call({
    String? videoUrl = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getVideoGIF',
      apiUrl: 'https://image.mux.com/{PLAYBACK_ID}/animated.gif',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'videoUrl': videoUrl,
      },
      returnBody: true,
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
