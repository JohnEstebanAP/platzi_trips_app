import 'package:auto_size_text/auto_size_text.dart';
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

    return _handleCurrentSession(context);
  }

  Widget _handleCurrentSession(BuildContext context) {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot - data - Object User
        if (!snapshot.hasData || snapshot.hasError) {
          return singInGoogleUi(context);
        }
        return const PlatziTrips();
      },
    );
  }

  AutoSizeText _title(String textTitle) {
    return AutoSizeText(
      textTitle,
      maxLines: 2,
      style: const TextStyle(
          fontSize: 37.0,
          fontFamily: "Lato",
          color: Colors.white,
          fontWeight: FontWeight.bold),
    );
  }

  Widget singInGoogleUi(BuildContext context) {
    var size = MediaQuery.of(context).size;

    bool _istable = (size.shortestSide > 600);

    String textTitle = (_istable)
        ? "Welcome This is your Travel App"
        : "Welcome \nThis is your Travel App";

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const GradientBackLogin(
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _title(textTitle),
                const SizedBox(height: 40),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: ButtonGreen(
                    width: double.infinity,
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
