import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

class BlocUser implements Bloc {
  final AuthRepository _auth_repository = AuthRepository();

  //Flujo de datos - String
  //Stream - Firebase
  //StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  //Casos uso
  //1. SignIn a la aplicacion Google
  Future<UserCredential> singIn() {
    return _auth_repository.signInFirebase();
  }

  //Caso de uso 2
  //2. cerrar sesión
  signOut() {
    _auth_repository.signOut();
  }

  //Caso de uso 3
  //3. Registrar usuario en base de datos
  final _cloudFirestoreDataFirestore = CloudFirestoreRepository();

  void updateUserData(UserModel user) =>
      _cloudFirestoreDataFirestore.updateUserDataFirestore(user);

  @override
  void dispose() {}
}
