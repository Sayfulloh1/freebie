


abstract class Repository{
  Future<void> signIn(String email, String password);
  Future<void> createAccount(String name, String surname, String birthDate, String gender, List<String>habits);
}