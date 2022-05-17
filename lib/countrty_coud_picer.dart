import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_codes/country_codes.dart';

class CountryCodesExampleApp extends StatelessWidget {
  const CountryCodesExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Country codes example app'),
        ),
        body: Builder(builder: (context) {
          CountryDetails details = CountryCodes.detailsForLocale();
          final locale = CountryCodes.dialNumbers();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Table(
                    border: const TableBorder(
                      horizontalInside: BorderSide(width: 0.5),
                      verticalInside: BorderSide(width: 0.5),
                      top: BorderSide(),
                      bottom: BorderSide(),
                      left: BorderSide(),
                      right: BorderSide(),
                    ),
                    children: <TableRow>[
                      _buildEntry(
                          title: 'Device region',
                          description: '${locale.isEmpty}-${locale.isEmpty}'),
                      _buildEntry(
                          title: 'Name', description: '${details.name}'),
                      _buildEntry(
                          title: 'Localized (PT lang)',
                          description: '${details.localizedName}'),
                      _buildEntry(
                          title: 'Alpha 2',
                          description: '${details.alpha2Code}'),
                      _buildEntry(
                          title: 'Dial code',
                          description: '${details.dialCode}'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: TextFormField(
                    decoration:
                        InputDecoration(prefix: Text("${details.name}")),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [DialCodeFormatter()],
                  ),
                ),
                // InkWell(onTap: () {
                //   <PopupMenuEntry<String>>[
                //  const PopupMenuItem(
                //     child: Text("First"),
                //     value: "1",
                //     // value: 1,
                //   ),
                //   const PopupMenuItem(
                //   child: Text("Second"),
                //   // value: 2,
                //   ),
                //   ]
                // }, child: Icon(Icons.more_horiz)),
                PopupMenuButton(
                    icon: Icon(Icons.more_horiz),
                    itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("First"),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: Text("Second"),
                            value: 2,
                          )
                        ])
              ],
            ),
          );
        }),
      ),
    );
  }

  TableRow _buildEntry({required String title, required String description}) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Text(
            title,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(description),
        ),
      ],
    );
  }
}
