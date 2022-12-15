import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/platzi_trips.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back_login.dart';

class SingInScreen extends StatelessWidget {
  late BlocUser userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot - data - Object User
        if (!snapshot.hasData || snapshot.hasError) return singInGoogleUi();
        return PlatziTrips();
      },
    );
  }

  Widget singInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const GradientBackLogin(
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome \n This is your Travel App",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                width: 300,
                height: 50,
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.singIn().then((UserCredential user) {
                    userBloc.updateUserData(UserModel(
                        id: user.user!.uid,
                        email: user.user?.email,
                        name: user.user?.displayName,
                        photoURL: user.user?.photoURL));
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
