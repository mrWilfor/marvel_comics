import 'package:chopper/chopper.dart';

import 'comic_data_wrapper.dart';

part 'comics_service.chopper.dart';

@ChopperApi()
abstract class ComicsService extends ChopperService {
  static ComicsService create([ChopperClient? chopperClient]) =>
      _$ComicsService(chopperClient);

  @Get(path: 'v1/public/comics')
  Future<Response<ComicDataWrapper>> getComics(@Query('ts') int timestamp,
      @Query('apikey') String apikey, @Query('hash') String hash);
}
