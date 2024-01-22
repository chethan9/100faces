import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UserFaceCall {
  static Future<ApiCallResponse> call({
    String? file = '',
    String? instruction = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userFace',
      apiUrl:
          'https://proxy.vizsoft.in/https://nocodeplayground.onrender.com/process_image',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'openai_api_key': "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",
        'file': file,
        'instruction': instruction,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices.choices.content''',
      );
}

class StepOneCheckHumanFaceCall {
  static Future<ApiCallResponse> call({
    String? photo = '',
    String? url = 'https://api.openai.com/',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-4-vision-preview",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "is this image contain any human face respond in json with yes or no. Also if its more than one person consider it as no"
        },
        {
          "type": "image_url",
          "image_url": {
            "url": "$photo"
          }
        }
      ]
    }
  ],
  "max_tokens": 300
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StepOneCheckHumanFace',
      apiUrl: '${url}v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? result(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
  static String? fail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class StepTwoCheckLandmarkCall {
  static Future<ApiCallResponse> call({
    String? photo = '',
    String? url = 'https://api.luxand.cloud/',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StepTwoCheckLandmark',
      apiUrl: '${url}photo/landmarks',
      callType: ApiCallType.POST,
      headers: {
        'token': '5acc11ec40f9441284ce5f90c0467087',
      },
      params: {
        'photo': photo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic landmarkBody(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class StepThreeCheckAgeCall {
  static Future<ApiCallResponse> call({
    String? photo = '',
    String? url = 'https://api.luxand.cloud/',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StepThreeCheckAge',
      apiUrl: '${url}photo/detect',
      callType: ApiCallType.POST,
      headers: {
        'token': '5acc11ec40f9441284ce5f90c0467087',
      },
      params: {
        'photo': photo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic ageGenderBody(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class StepJSONtoTextCall {
  static Future<ApiCallResponse> call({
    dynamic bodyJson,
    String? url = 'https://nocodeplayground.onrender.com/',
  }) async {
    final body = _serializeJson(bodyJson);
    final ffApiRequestBody = body;
    return ApiManager.instance.makeApiCall(
      callName: 'StepJSONtoText',
      apiUrl: '${url}serialize_json',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? jtoT(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.serialized_json''',
      ));
}

class StepFourOpenAICall {
  static Future<ApiCallResponse> call({
    String? landmark = '',
    String? url = 'https://api.openai.com/',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo-1106",
  "response_format": {
    "type": "json_object"
  },
  "seed": 2023,
  "messages": [
    {
      "role": "system",
      "content": "You are role playing as fortune teller and orcale specialized in Face reading taking facial landmark as input and returning personality type based on face structure and faceial feature. Can you also add in the end one statistics about user face feature anything intresting. Also in your prediction give more details about personality, love, work ,life, goal but all general but each with seprate heading to group them. I will also prodive aproximate age, gender you can also incorporate relevant prediction based on this data.Also dont mention this Based on the facial landmark provided, I can analyze the facial features to predict your personality type. Make your words related to your role, also in the end a trivia fact also which intrigue user. Never ever user facial landmarks word anywhere. you are prohibiated from using this words or sentances- Remember or these predictions are just for entertainment purposes!or these insights are simply for entertainment purposes, and I hope you enjoyed this lighthearted analysis of your features!or remember, it's all in good fun or entertainment purposes any sentance similar. As your inside Role Play. Use lot of emojies to make it more attractive along with words example if there a word related to love use love emoji, if its work use work emoji, if there is book use book emoji, travel user flight emoji . ALl your output is in json format without faile each section seprated. please provide your answer in json format like this {\\"goal\\": \\"goals details\\",\\"interesting_fact\\": \\"interesting_fact details\\",\\"life\\": \\"life details\\",\\"love\\": \\"love details\\",\\"personality_type\\": \\"personality_type details\\",\\"work\\": \\"work details\\",\\"statistics\\": \\"statistics details\\"}"
    },
    {
      "role": "user",
      "content": "$landmark Strictly avoid saying Based on the facial landmark provided, I can analyze the facial features to predict your personality type. or Remember, these predictions are just for fun or anything similar to this.Also ensure output in json mode only"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StepFourOpenAI',
      apiUrl: '${url}v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? predictResult(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class StepFinalTextJSONCall {
  static Future<ApiCallResponse> call({
    String? aItext = '',
    String? url = 'https://nocodeplayground.onrender.com/',
  }) async {
    final ffApiRequestBody = '''
$aItext''';
    return ApiManager.instance.makeApiCall(
      callName: 'StepFinalTextJSON',
      apiUrl: '${url}format-json',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'text/plain',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? goal(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.goal''',
      ));
  static String? interestingFact(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.interesting_fact''',
      ));
  static String? life(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.life''',
      ));
  static String? love(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.love''',
      ));
  static String? personality(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.personality''',
      ));
  static String? work(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.work''',
      ));
  static dynamic all(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
