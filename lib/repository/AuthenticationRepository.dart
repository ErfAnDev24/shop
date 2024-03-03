import 'package:digikala/datasource/AuthenticationRemote.dart';
import 'package:digikala/di/ServiceLocator.dart';

class AuthenticationRepository {
  final datasource = locator.get<IAuthenticationRemote>();
}
