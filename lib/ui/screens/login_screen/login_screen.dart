import 'package:flutter/material.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/widgets/primary_button_widget.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                  height: media.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bienvenido!", style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 50.0)),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) => email != null && !EmailValidator.validate(email) ? 'Ingrese un email válido' : null,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: primaryColor
                          ),
                          filled: true,
                          fillColor: whiteColor,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: whiteColor
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                          )
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      TextFormField(
                        obscureText: _passwordVisible,
                        controller: passwordController,
                        autocorrect: false,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (pass) => pass != null && pass.length < 6 ? 'Ingrese mínimo 6 caracteres' : null,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: const TextStyle(
                            color: primaryColor
                          ),
                          filled: true,
                          fillColor: whiteColor,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: whiteColor
                            ),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          )
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Olvidó su contraseña", style: Theme.of(context).textTheme.headlineSmall!.copyWith( fontSize: 14.0, decoration: TextDecoration.underline ),)
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        child: PrimaryButton(text: 'Iniciar sesión', onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}