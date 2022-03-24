import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginAA extends StatefulWidget {
  const LoginAA({Key? key}) : super(key: key);

  @override
  _LoginAAState createState() => _LoginAAState();
}

class _LoginAAState extends State<LoginAA> {
  final TextEditingController _MobileNumberController = TextEditingController();
  final TextEditingController _codecontroller = TextEditingController();

  String phoneNumber = " ";
  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("======>>>New Country selected: " + countryCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with Otp"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 25),
        child: Column(
          children: [
            Stack(
              children: [
                IntlPhoneField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 10,
                  bottom: 10,
                  child: Container(
                    width: 1.5,
                    color: Colors.grey.withAlpha(60),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
