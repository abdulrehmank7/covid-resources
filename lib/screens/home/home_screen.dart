import 'package:covid_resources/bloc/resource_bloc.dart';
import 'package:covid_resources/data/model/resource.dart';
import 'package:covid_resources/utils/common_utits.dart';
import 'package:covid_resources/utils/widget/resource_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = ResourceBloc();
  String dropdownValue = "Delhi";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateDropDown = Center(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.black),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: SizedBox(),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          "Andaman & Nicobar",
          "Andhra Pradesh",
          "Arunachal Pradesh",
          "Assam",
          "Bihar",
          "Chandigarh",
          "Chhattisgarh",
          "Dadra & Nagar Haveli",
          "Daman & Diu",
          "Delhi",
          "Goa",
          "Gujarat",
          "Haryana",
          "Himachal Pradesh",
          "Jammu & Kashmir",
          "Jharkhand",
          "Karnataka",
          "Kerala",
          "Lakshadweep",
          "Madhya Pradesh",
          "Maharashtra",
          "Manipur",
          "Meghalaya",
          "Mizoram",
          "Nagaland",
          "Orissa",
          "Pondicherry",
          "Punjab",
          "Rajasthan",
          "Sikkim",
          "Tamil Nadu",
          "Tripura",
          "Uttar Pradesh",
          "Uttaranchal",
          "West Bengal"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    ));

    return Scaffold(
      bottomNavigationBar: getBottomNav(context),
      body: SafeArea(
        child: StreamBuilder<List<ResourceData>>(
            stream: bloc.resDataStream,
            initialData: [],
            builder: (context, resData) {
              return ListView.builder(
                itemCount: resData.data.length,
                itemBuilder: (context, index) {
                  return ResourceWidget(resData.data[index]);
                },
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
