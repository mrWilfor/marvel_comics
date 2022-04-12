import 'package:chopper/chopper.dart';

import '../comic_data_wrapper.dart';

part 'comics_service.chopper.dart';

@ChopperApi()
abstract class ComicsService extends ChopperService {
  static ComicsService create([ChopperClient? chopperClient]) =>
      _$ComicsService(chopperClient);

  @FactoryConverter(
      request: FormUrlEncodedConverter.requestFactory,
      response: comicDataWrapperFactory
  )
  @Get(path: 'v1/public/comics')
  Future<Response<ComicDataWrapper>> getComics();
}

Response<ComicDataWrapper> comicDataWrapperFactory(Response response) {
  var convertResponse = const JsonConverter().convertResponse(response);
  var comicDataWrapper = ComicDataWrapper.fromJson(convertResponse.body);

  return response.copyWith(body: comicDataWrapper);
}
