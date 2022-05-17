import 'package:flutter/material.dart';

class AnimetedButton extends StatefulWidget {
  const AnimetedButton({Key? key}) : super(key: key);

  @override
  State<AnimetedButton> createState() => _AnimetedButtonState();
}

class _AnimetedButtonState extends State<AnimetedButton> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  final loginKey = GlobalKey<FormState>();
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimetedButton"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 32,
            ),
            Form(
              child: TextFormField(
                controller: emailController,
                validator: (emailController) {
                  if (emailController!.isEmpty) {
                    return "****";
                  }
                },
              ),
            ),
            Container(
              height: 32,
            ),
            const InkWell(
              child: SizedBox(
                height: 40,
                width: 450,
                child: Text("done"),
              ),
            ),

            // AnimatedContainer(duration: Duration()),
            // ProgressButton(
            //   stateWidgets: const {
            //     ButtonState.idle: Text(
            //       "Idle",
            //       style: TextStyle(
            //           color: Colors.white, fontWeight: FontWeight.w500),
            //     ),
            //     ButtonState.loading: Text(
            //       "Loading",
            //       style: TextStyle(
            //           color: Colors.white, fontWeight: FontWeight.w500),
            //     ),
            //     ButtonState.fail: Text(
            //       "Fail",
            //       style: TextStyle(
            //           color: Colors.white, fontWeight: FontWeight.w500),
            //     ),
            //     ButtonState.success: Text(
            //       "Success",
            //       style: TextStyle(
            //           color: Colors.white, fontWeight: FontWeight.w500),
            //     )
            //   },
            //   stateColors: {
            //     ButtonState.idle: Colors.grey.shade400,
            //     ButtonState.loading: Colors.blue.shade300,
            //     ButtonState.fail: Colors.red.shade300,
            //     ButtonState.success: Colors.green.shade400,
            //   },
            //   onPressed: () {
            //     if (loginKey.currentState!.validate()) {}
            //   },
            //   state: ButtonState.idle,
            // ),
          ],
        ),
      ),
    );
  }
}
