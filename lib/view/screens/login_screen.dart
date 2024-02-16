import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../widgets/custom_widgets/custom_outlined_button.dart';
import '../widgets/custom_widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isSubmitButtonLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: UIConstants.defaultHeight * 10,
              width: UIConstants.defaultHeight * 10,
              child: Placeholder(
                color: Theme.of(context).colorScheme.primary,
                child: const Center(child: Text("Logo")),
              ),
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 2,
            ),
            Text(
              "Welcome back !",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 0.5,
            ),
            Text(
              "Sign in to the application to proceed",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: UIConstants.defaultHeight * 4,
            ),
            Center(
              child: SizedBox(
                width: 320,
                child: Column(
                  children: [
                    CustomOutlinedButton(
                      buttonText: "Sign in with Google",
                      isLoading: false,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: UIConstants.defaultHeight * 2,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(),
                        ),
                        const SizedBox(
                          width: UIConstants.defaultHeight * 2,
                        ),
                        Text(
                          "or",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(
                          width: UIConstants.defaultHeight * 2,
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: UIConstants.defaultHeight * 2,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            labelText: "Email Address",
                            validator: (value) {
                              if (value == null) {
                                return "Field is required. Please enter valid Email address";
                              } else {
                                if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                ).hasMatch(value.trim())) {
                                  return "Please enter valid Email address";
                                }
                                return null;
                              }
                            },
                          ),
                          CustomTextFormField(
                            labelText: "Password",
                            isPasswordField: true,
                            validator: (value) {
                              if (value == null) {
                                return "Field is required. Please enter password";
                              } else {
                                if (value.trim().isEmpty) {
                                  return "Field is required. Please enter password";
                                } else {
                                  return null;
                                }
                              }
                            },
                          ),
                          CustomOutlinedButton(
                            buttonText: "Submit",
                            isLoading: isSubmitButtonLoading,
                            onPressed: () {
                              setState(() {
                                isSubmitButtonLoading = true;
                              });
                              if (!formKey.currentState!.validate()) {
                                setState(() {
                                  isSubmitButtonLoading = false;
                                });
                                return;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
