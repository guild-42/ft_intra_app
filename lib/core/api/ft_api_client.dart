import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ft_intra/core/models/user.dart';
import 'package:ft_intra/core/models/event.dart';
import 'package:ft_intra/core/models/location.dart';
import 'package:ft_intra/core/models/scale_team.dart';
import 'package:ft_intra/core/models/slot.dart';
import 'package:ft_intra/core/models/campus.dart';

part 'ft_api_client.g.dart';

@RestApi(baseUrl: 'https://api.intra.42.fr/v2')
abstract class FtApiClient {
  factory FtApiClient(Dio dio, {String baseUrl}) = _FtApiClient;

  @GET('/me')
  Future<FtUser> getMe();

  @GET('/campus')
  Future<List<FtCampus>> getCampuses({
    @Query('page[size]') int pageSize = 100,
  });

  @GET('/users/{login}')
  Future<FtUser> getUser(@Path('login') String login);

  @GET('/users')
  Future<List<FtUser>> getUsersByIds(
    @Query('filter[id]') String commaSeparatedIds, {
    @Query('page[size]') int pageSize = 100,
  });

  @GET('/users/{id}/cursus_users')
  Future<List<CursusUser>> getCursusUsers(@Path('id') int userId);

  @GET('/users/{id}/locations')
  Future<List<FtLocation>> getUserLocations(
    @Path('id') int userId, {
    @Query('sort') String sort = '-begin_at',
    @Query('page[size]') int pageSize = 1,
  });

  @GET('/users/{id}/projects_users')
  Future<List<ProjectUser>> getProjectsUsers(
    @Path('id') int userId, {
    @Query('page[size]') int pageSize = 100,
  });

  @GET('/campus/{campusId}/locations')
  Future<List<FtLocation>> getCampusLocations(
    @Path('campusId') int campusId, {
    @Query('filter[active]') bool? active,
    @Query('page[size]') int pageSize = 100,
    @Query('page[number]') int page = 1,
  });

  @GET('/campus/{campusId}/events')
  Future<List<FtEvent>> getCampusEvents(
    @Path('campusId') int campusId, {
    @Query('sort') String sort = '-begin_at',
    @Query('page[size]') int pageSize = 30,
    @Query('page[number]') int page = 1,
  });

  @GET('/me/scale_teams/as_corrector')
  Future<List<ScaleTeam>> getMyScaleTeamsAsCorrector({
    @Query('page[size]') int pageSize = 30,
    @Query('page[number]') int page = 1,
  });

  @GET('/me/scale_teams/as_corrected')
  Future<List<ScaleTeam>> getMyScaleTeamsAsCorrected({
    @Query('page[size]') int pageSize = 30,
    @Query('page[number]') int page = 1,
  });

  // ───── Slots (evaluation availability) ─────
  // public scope + resource-owner token can manage the user's OWN slots.

  @GET('/me/slots')
  Future<List<FtSlot>> getMySlots({
    @Query('page[size]') int pageSize = 100,
    @Query('page[number]') int page = 1,
  });

  /// Create one (or several, if the range spans multiple 15-min blocks) slot(s).
  /// Body: { "slot": { "begin_at": iso8601, "end_at": iso8601 } }
  /// `user_id` is auto-set by 42 to the resource owner; do NOT send it.
  /// Returns void — the response may be a single object or an array, so the
  /// caller should refetch via [getMySlots] instead of parsing the result.
  @POST('/slots')
  Future<void> createSlot(@Body() Map<String, dynamic> body);

  @DELETE('/slots/{id}')
  Future<void> deleteSlot(@Path('id') int id);
}
