import 'package:frutes_app/core/repos/orders_repo/orders_repo.dart';
import 'package:frutes_app/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:frutes_app/core/repos/products_repo/products_repo.dart';
import 'package:frutes_app/core/repos/products_repo/products_repo_impl.dart';
import 'package:frutes_app/core/services/database_service.dart';
import 'package:frutes_app/core/services/firebase_auth_services.dart';
import 'package:frutes_app/core/services/firestore_service.dart';
import 'package:frutes_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:frutes_app/features/auth/domain/repos/auth_repo.dart';
import 'package:frutes_app/features/profile/data/repos/user_order_repo_impl.dart';
import 'package:frutes_app/features/profile/domain/repos/user_orders_repo.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupGetIt() {
  getit.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getit.registerSingleton<DatabaseService>(FirestoreService());

  getit.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getit<FirebaseAuthServices>(),
      databaseService: getit<DatabaseService>(),
    ),
  );

  getit.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getit<DatabaseService>()),
  );
  getit.registerSingleton<OrdersRepo>(OrdersRepoImpl(getit<DatabaseService>()));
  getit.registerSingleton<UserOrdersRepo>(
    UserOrderRepoImpl(getit<DatabaseService>()),
  );
}
