import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joseph_prueba/app/constants.dart';
import 'package:joseph_prueba/app/router/routes.dart';
import 'package:joseph_prueba/app/utils/dictionaries.dart';
import 'package:joseph_prueba/app/utils/utils.dart';
import 'package:joseph_prueba/app/widgets/focus_text.dart';
import 'package:joseph_prueba/login/bloc/login_bloc.dart';
import 'package:joseph_prueba/login/widgets/theme_button.dart';
import 'package:joseph_prueba/login/widgets/theme_text_form_field.dart';

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
  static GlobalKey<ScaffoldState> loginViewKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                // left: -UtilSize.width(41, context),
                // bottom: -UtilSize.height(259, context),
                child: SizedBox(
                  height: UtilSize.height(92, context),
                  width: UtilSize.width(304, context),
                  child: Image.asset(
                    'assets/images/gift.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: UtilSize.width(35, context)),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: UtilSize.height(9, context),
                          bottom: UtilSize.height(20, context),
                        ),
                        child: Image.asset(
                          'assets/images/plaza_vea.png',
                          height: UtilSize.height(45, context),
                          width: UtilSize.height(133, context),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Registrate para ingresar',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Constants.redColor,
                              fontSize: UtilSize.height(12, context),
                              height: UtilSize.height(18, context) / UtilSize.height(12, context),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: UtilSize.height(35, context),
                        bottom: UtilSize.height(10, context),
                      ),
                      child: Text(
                        'Foto de perfil',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: UtilSize.height(12, context),
                              height: UtilSize.height(18, context) / UtilSize.height(12, context),
                            ),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: UtilSize.width(40, context),
                        backgroundColor: Constants.grayColor,
                        child: SvgPicture.asset(
                          'assets/images/person.svg',
                          height: UtilSize.width(33.25, context),
                          width: UtilSize.width(31.5, context),
                        ),
                      ),
                    ),
                    Expanded(child: _Form(contextKey: loginViewKey.currentState?.context ?? context))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key? key,
    required this.contextKey,
  }) : super(key: key);
  final BuildContext contextKey;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static TextEditingController name = TextEditingController();
  static TextEditingController lastName = TextEditingController();

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  void _handleSubmittedLogin(BuildContext context, LoginState state) async {
    await Future.delayed(Duration.zero).then((_) => context.read<LoginBloc>().add(
          LoginFromEmailAndPasswordEvent(
            name: _Form.name.text,
            lastName: _Form.lastName.text,
            focusName: true,
            focusLastName: true,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _Form._formKey,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              Future.delayed(Duration.zero, () {
                Navigator.of(widget.contextKey).pushReplacementNamed(Routes.home);
              });
            });
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeTextFormField(
                title: 'Nombres',
                textFormField: TextFormField(
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Constants.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: UtilSize.height(12, context),
                        height: UtilSize.height(18, context) / UtilSize.height(12, context),
                      ),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Ingresa tus nombres',
                    hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Constants.blackColor.withOpacity(0.4),
                          fontWeight: FontWeight.w400,
                          fontSize: UtilSize.height(12, context),
                          height: UtilSize.height(18, context) / UtilSize.height(12, context),
                        ),
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                  ),
                  controller: _Form.name,
                  onChanged: (_) {
                    context.read<LoginBloc>().add(
                          LoginValidateEvent(
                            name: _Form.name.text,
                            lastName: _Form.lastName.text,
                            focusName: true,
                          ),
                        );
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              ThemeTextFormField(
                title: 'Apellidos',
                textFormField: TextFormField(
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Constants.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: UtilSize.height(12, context),
                        height: UtilSize.height(18, context) / UtilSize.height(12, context),
                      ),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Ingresa tus apellidos',
                    hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Constants.blackColor.withOpacity(0.4),
                          fontWeight: FontWeight.w400,
                          fontSize: UtilSize.height(12, context),
                          height: UtilSize.height(18, context) / UtilSize.height(12, context),
                        ),
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                  ),
                  controller: _Form.lastName,
                  onChanged: (_) {
                    context.read<LoginBloc>().add(
                          LoginValidateEvent(
                            name: _Form.name.text,
                            lastName: _Form.lastName.text,
                            focusLastName: true,
                          ),
                        );
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              // Warning notification
              context.watch<LoginBloc>().focusLastName && context.watch<LoginBloc>().lastNameMessage != '[CHECK]'
                  ? Row(
                      children: [
                        SizedBox(width: UtilSize.height(5, context)),
                        FocusText(text: Dictionaries.validationsLogin[context.watch<LoginBloc>().lastNameMessage] ?? ''),
                      ],
                    )
                  : const SizedBox(),

              // Handle create client
              GestureDetector(onTap: () => _handleSubmittedLogin(context, state), child: const ThemeButton(title: 'Ingresar')),
            ],
          );
        },
      ),
    );
  }
}
