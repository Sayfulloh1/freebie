


abstract class Repository{
  Future<void> getToken(String username, String password);
  Future<void> getDistance(String latitude, String longitude,String token);
  Future<void> getLocation();
}