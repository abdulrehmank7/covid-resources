import 'package:covid_resources/data/model/resource.dart';
import 'package:covid_resources/utils/colors.dart';
import 'package:covid_resources/utils/common_utits.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResourceWidget extends StatelessWidget {
  final ResourceData resourceData;

  ResourceWidget(this.resourceData);

  @override
  Widget build(BuildContext context) {
    final colors = _getResColor(resourceData);
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 8,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 18),
            child: Text(
              resourceData.name,
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: colors[0],
                child: Icon(
                  _getResIcon(resourceData),
                  color: Colors.white,
                  size: 38,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 4),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(text: "City: ", style: GoogleFonts.poppins(fontSize: 18, color: colors[0])),
                          TextSpan(
                              text: resourceData.city, style: GoogleFonts.poppins(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 4),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(text: "Phone: ", style: GoogleFonts.poppins(fontSize: 18, color: colors[0])),
                          TextSpan(
                              text: resourceData.phone, style: GoogleFonts.poppins(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (resourceData.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(text: "More Details\n", style: GoogleFonts.poppins(fontSize: 18, color: colors[0])),
                  TextSpan(
                      text: resourceData.description, style: GoogleFonts.poppins(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400)),
                ]),
              ),
            ),
          Container(
            height: 1,
            color: Colors.grey.shade400,
            margin: const EdgeInsets.only(bottom: 8, top: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(text: "Updated ", style: GoogleFonts.poppins(fontSize: 18, color: Colors.black)),
                      TextSpan(
                          text: getTimeAgo(resourceData.updatedAt),
                          style: GoogleFonts.poppins(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400)),
                    ]),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  shape: CircleBorder(side: BorderSide(width: 2, color: colors[1], style: BorderStyle.solid)),
                  onPressed: () {},
                  child: Icon(
                    Icons.share_rounded,
                    size: 18,
                    color: colors[0],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: MaterialButton(
                  shape: CircleBorder(side: BorderSide(width: 2, color: colors[1], style: BorderStyle.solid)),
                  onPressed: () {
                    if (resourceData.phone.isNotEmpty) callPhone(resourceData.phone);
                  },
                  child: Icon(
                    Icons.phone_enabled_rounded,
                    size: 18,
                    color: colors[0],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<Color> _getResColor(ResourceData data) {
  if (data.type.length < 2) {
    if (data.type.contains("Oxygen"))
      return [resPurple1, resPurple2];
    else if (data.type.contains("Hospital Beds"))
      return [resPink1, resPink2];
    else
      return [resPeach1, resPeach2];
  } else
    return [resPeach1, resPeach2];
}

IconData _getResIcon(ResourceData data) {
  if (data.type.length < 2) {
    if (data.type.contains("Oxygen"))
      return Icons.medical_services_rounded;
    else if (data.type.contains("Hospital Beds"))
      return Icons.king_bed_rounded;
    else
      return Icons.medical_services_rounded;
  } else
    return Icons.medical_services_rounded;
}
