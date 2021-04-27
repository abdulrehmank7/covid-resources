import 'package:covid_resources/bloc/resource_bloc.dart';
import 'package:covid_resources/data/model/resource.dart';
import 'package:covid_resources/utils/colors.dart';
import 'package:covid_resources/utils/common_utils.dart';
import 'package:covid_resources/utils/widget/resource_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bloc = ResourceBloc();
  String _dropdownValue = "Delhi";
  final ScrollController _controller = ScrollController();

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
        value: _dropdownValue,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: SizedBox(),
        onChanged: (String newValue) {
          setState(() {
            _dropdownValue = newValue;
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
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Disclaimer",
                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.red.shade300, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 16, 8),
                child: Text(
                  "We are unable to verify all the information that is being uploaded on this app. Please be aware that there have been several media reports of anti-social elements misusing social media and platforms like these to dupe people by taking advance payments and not making any supplies or making defective supplies. In light of the same, please take due care and do your own due diligence before you deal with any supplier, etc. listed on this Website. Please be advised to use the information available on this Website solely at your own risk. The Developers and Volunteers of the Website wish to categorically state that we don't take any responsibility towards the authenticity or veracity of the information available on this Website. In case of any supplier, etc. defrauding any user of any money, providing a defective supply, or engaging in any other illegal behaviour or act, the Developers and Volunteers shall NOT be held liable.",
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 2,
                color: resPurple2,
              ),
              StreamBuilder<List<ResourceData>>(
                  stream: _bloc.resDataStream,
                  initialData: [],
                  builder: (context, resData) {
                    if (resData.data.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else
                      return ListView.builder(
                        shrinkWrap: true,
                        controller: _controller,
                        itemCount: resData.data.length,
                        itemBuilder: (context, index) {
                          return ResourceWidget(resData.data[index]);
                        },
                      );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
