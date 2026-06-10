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

  // Reviews where the user is the corrector (Reviewer) / corrected (Reviewee).
  // Needs the `projects` OAuth scope, otherwise returns an empty array.
  @GET('/me/scale_teams/as_corrector')
  Future<List<ScaleTeam>> getScaleTeamsAsCorrector({
    @Query('page[size]') int pageSize = 100,
    @Query('page[number]') int page = 1,
  });

  @GET('/me/scale_teams/as_corrected')
  Future<List<ScaleTeam>> getScaleTeamsAsCorrected({
    @Query('page[size]') int pageSize = 100,
    @Query('page[number]') int page = 1,
  });

  // Read-only: slot create/delete require a non-public OAuth scope (403), so
  // only listing is wired.
  @GET('/me/slots')
  Future<List<FtSlot>> getMySlots({
    @Query('page[size]') int pageSize = 100,
    @Query('page[number]') int page = 1,
  });
}
