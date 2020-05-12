import '../models/users.dart';
import '../providers/remote_provider.dart';

class UserRepository {
  final RemoteProvider provider;

  UserRepository(this.provider);

  Future<List<User>> getUsers() async {
    final response = await provider.fetchUsers();
    return response.users;
  }
}
