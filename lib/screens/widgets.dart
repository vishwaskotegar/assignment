// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaptionText extends StatelessWidget {
  bool isBold;
  String data;
  Color color;
  CaptionText(
    this.data, {
    this.isBold = true,
    this.color = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: 11,
        fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  String data;
  Color color;
  HeadingText(
    this.data, {
    this.color = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montserrat(
          color: color, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class StepperCard extends StatelessWidget {
  bool isActive;
  int index;
  String title;
  String caption;
  StepperCard({
    Key? key,
    this.isActive = false,
    required this.index,
    required this.title,
    required this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isActive == true
                    ? const Color(0xff2ead86)
                    : const Color(0xff83ade7),
              ),
              color: isActive == true ? const Color(0xffeffbf7) : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeadingText(
                        title,
                        color: isActive == true
                            ? const Color(0xff2ead86)
                            : const Color(0xff83ade7),
                      ),
                      isActive == true
                          ? HeadingText(
                              "Complete",
                              color: const Color(0xff2ead86),
                            )
                          : Container()
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CaptionText(caption)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: isActive == true
                    ? const Color(0xff2ead86)
                    : const Color(0xff83ade7),
              ),
              shape: BoxShape.circle,
              color: isActive == true ? const Color(0xff2ead86) : Colors.white,
            ),
            child: Center(
              child: HeadingText(
                index.toString(),
                color: isActive == true
                    ? const Color(0xff2ead86)
                    : const Color(0xff83ade7),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  bool isGreen;
  EventCard({
    Key? key,
    required this.isGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var whiteColor = Colors.white;
    return Container(
      // width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: isGreen == true
            ? const LinearGradient(
                colors: [Color(0xff045e2a), Color(0xff5c9e76)],
              )
            : const LinearGradient(
                colors: [Color.fromARGB(255, 20, 46, 82), Color(0xff3278d8)],
              ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.58,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CaptionText(
                    "Jul 22     1:00PM - 9:00 PM",
                    color: whiteColor,
                    isBold: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  HeadingText(
                    "Shriners Children’s Boston",
                    color: whiteColor,
                  ),
                  HeadingText(
                    "\$480 at \$15/hr",
                    color: whiteColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CaptionText(
                    "227 Madison St, New York, NY 10002 , USA",
                    color: whiteColor,
                    isBold: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CaptionText(
                    "1.0 miles away    Registered Nurse",
                    color: whiteColor,
                    isBold: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.east,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CaptionText("Clock out and Complete Shift",
                          color: whiteColor, isBold: false),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: SizedBox(
                width: 80,
                child: Image.asset(
                  "assests/images/logo.jpeg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Icon(
              Icons.history,
              color: whiteColor,
              size: 60,
            )
          ],
        ),
      ]),
    );
  }
}
