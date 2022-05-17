import 'package:blocpatten/add_event_google_celander.dart';
import 'package:blocpatten/animation.dart';
import 'package:blocpatten/animetedbutton.dart';
import 'package:blocpatten/google_Sign.dart';
import 'package:blocpatten/googlecalendar.dart';
import 'package:blocpatten/image_pdf.dart';
import 'package:blocpatten/pagination/apicalling_new_cubit/cubit/cricket_cubit.dart';
import 'package:blocpatten/pagination/apicalling_new_cubit/screen/apiscreen.dart';
import 'package:blocpatten/screen/homescreen.dart';
import 'package:blocpatten/view/form_bloc/login_bloc.dart';
import 'package:blocpatten/view/loginscreen.dart';
import 'package:blocpatten/widget/date_picker_flair.dart';
import 'package:blocpatten/widget/date_pickerr.dart';
import 'package:blocpatten/widget/page1.dart';
import 'package:blocpatten/widget/swip.dart';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'PageView.dart';
import 'aaaaaa.dart';
import 'apicalling_cubit/cubit/cricket_cubit_bloc.dart';
import 'apicalling_cubit/screen/apiscreen.dart';
import 'binance.dart';
import 'bloc/internet_bloc.dart';
import 'countrty_coud_picer.dart';
import 'liqvid_swipe.dart';
import 'mainscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CountryCodes.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PagintionCubit()..fetchCricketApi(""),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageToPdf(),
      ),
    );
  }
}
