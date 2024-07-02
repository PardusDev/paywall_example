import 'package:flutter/material.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BottomSheet(PWcontext: context);


                  }
              );
            },
            child: const Text("Open Bottom Sheet"),
          ),
        ),
      ),
    );
  }
}

// *** BOTTOM SHEET ***
class BottomSheet extends StatefulWidget {
  final BuildContext PWcontext;
  const BottomSheet({super.key, required this.PWcontext});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  //widget.context
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container(), flex: 4,),
                Expanded(flex: 5,child: Text("Premium", style: TextStyle(color: Colors.grey, fontSize: 22, fontFamily: "RobotoCondensed", fontWeight: FontWeight.w800),)),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                      },),
                )
              ],
            ),
            SizedBox(height: 22,),
            Image.asset("assets/images/movieRectangle.png", width: 240,),
            SizedBox(height: 30,),
            TextWithIcon(icon: Icons.comment, header: "Professional Feedback", text: "Get full list of all feedbacks and reviews from our professionals."),
            TextWithIcon(icon: Icons.info, header: "General Information", text: "We gather all the information about a movie and give it to you."),
            TextWithIcon(icon: Icons.percent, header: "Professional Feedback", text: "Get your 50% off for the best known streaming services."),
            SizedBox(height: 24,),
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              onPressed: () {

              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromRGBO(99, 141, 179, 1.0), Color.fromRGBO(128, 162, 193, 1.0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    children: [
                      Text(
                        "START A 1-WEEK FREE TRIAL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                      Text(
                        "\$1.99/month after",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    shadowColor: WidgetStateColor.transparent,
                    overlayColor: WidgetStateColor.transparent
                  ),
                  onPressed: () {},
                  child: Text("Restore Purchases", style: TextStyle(color: Color.fromRGBO(99, 141, 179, 1.0), fontWeight: FontWeight.w600, fontSize: 16),)
              ),
            ),
            Text(
              "Subscriptions renew automatically and your credit card will be charged at the end of each billing period, unless you unsubscribe at least 24 hours before. To manage your subscription, access your Apple ID profile in your device's settings and navigate to the Subscriptions section.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWithIcon extends StatelessWidget {
  final IconData icon;
  final String header;
  final String text;
  const TextWithIcon({super.key, required this.icon, required this.header, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(178, 218, 255, 1.0),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                icon,
                color: Color.fromRGBO(102, 143, 181, 1.0),
                size: 32,
              ),
            ),
          ),
          SizedBox(width: 18,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 22,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

