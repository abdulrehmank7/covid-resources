import 'package:covid_resources/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisclaimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomNav(context),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Disclaimer",
                    style: GoogleFonts.poppins(fontSize: 22, color: Colors.red.shade300, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                  child: SingleChildScrollView(
                    child: Text(
                      "This app is a charitable and gratuitous not-for-profit initiative created in the spirit of helping each other. The Developers of this Website have sought to put together a platform where people from all over the country can upload information which can help in the procurement the requisite medical assistance and supplies for COVID-infected patients. Along with the Developers, there are several Volunteers who are collating information from various sources and adding to this Website. The Website has also been made open for anyone to upload information of suppliers, etc. Due to the unavailability of sufficient resources or any institutional support, the Developers and Volunteers associated with this Website are unable to verify all the information that is being uploaded on this Website. Please be aware that there have been several media reports of anti-social elements misusing social media and platforms like these to dupe people by taking advance payments and not making any supplies or making defective supplies. In light of the same, please take due care and do your own due diligence before you deal with any supplier, etc. listed on this Website. Please be advised to use the information available on this Website solely at your own risk. The Developers and Volunteers of the Website wish to categorically state that we don't take any responsibility towards the authenticity or veracity of the information available on this Website. In case of any supplier, etc. defrauding any user of any money, providing a defective supply, or engaging in any other illegal behaviour or act, the Developers and Volunteers shall NOT be held liable. Last but not the least, we understand that if you are here, you are likely suffering from a tough time. We wish for you to stay strong and your loved ones to get well soon! Together, we'll beat this pandemic.",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
