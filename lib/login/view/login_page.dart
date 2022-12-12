import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: UtilSize.width(35, context)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: UtilSize.height(29, context),
                  bottom: UtilSize.height(20, context),
                ),
                child: Image.asset(
                  'assets/images/plaza_vea.png',
                  height: UtilSize.height(45, context),
                  width: UtilSize.height(133, context),
                ),
              ),
              Text(
                'Registrate para ingresar',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Constants.redColor,
                      fontSize: UtilSize.height(12, context),
                      height: UtilSize.height(18, context) / UtilSize.height(12, context),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
