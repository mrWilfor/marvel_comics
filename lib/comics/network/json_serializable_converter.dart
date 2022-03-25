

import 'package:chopper/chopper.dart';
import 'package:japx/japx.dart';

class JsonSerializableConverter extends JsonConverter {
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final jsonRes = super.convertResponse(response);
    final flatJson = Japx.decode(jsonRes.body);
    return jsonRes.copyWith<BodyType>(body: JsonTypeParser.decode<InnerType>(flatJson['data']));

  }

  @override
  Request convertRequest(Request request) => super.convertRequest(request);

  @override
  Response convertError<BodyType, InnerType>(Response response) {
    final jsonRes = super.convertError(response);
    final responseError = JsonTypeParser.decode<ResponseError>(jsonRes.body);
    return jsonRes.copyWith(bodyError: responseError);
  }
} 