import 'package:flutter/material.dart';
import 'package:flutter_app/screens/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var whiteColor = Colors.white;
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header - Location and searchbar
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: w * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "New York",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "254 Broadway, New York, NY 10007 , USA",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade300,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextField(
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              hintText: "Search facilities",
                              fillColor: const Color(0xfff5f5f5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              value: "Facilities",
                              items: const [
                                DropdownMenuItem(
                                  value: "Facilities",
                                  child: Text(
                                    "Facilities",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                              onChanged: (value) => null,
                            ),
                            DropdownButton(
                              value: "Date",
                              items: const [
                                DropdownMenuItem(
                                  value: "Date",
                                  child: Text(
                                    "Date",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                              onChanged: (value) => null,
                            ),
                            DropdownButton(
                              value: "Shift Type",
                              items: const [
                                DropdownMenuItem(
                                  value: "Shift Type",
                                  child: Text(
                                    "Shift Type",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                              onChanged: (value) => null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //custom stepper -
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xfff5f8fd),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(
                              "Kickstart your journey",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CaptionText(
                                "Please complete the onboarding process to start applying for shifts"),
                          ],
                        ),
                      ),
                      StepperCard(
                        index: 1,
                        isActive: true,
                        title: "Submit your credentials",
                        caption: "Upload your documents to get started",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StepperCard(
                        index: 2,
                        isActive: false,
                        title: "Document Verification",
                        caption: "Caregigs team will verify your credentials",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StepperCard(
                        index: 3,
                        isActive: false,
                        title: "Screening Interview",
                        caption:
                            "A brief interview to understand your requirements",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                //Event Cards -
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        EventCard(
                          isGreen: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EventCard(
                          isGreen: false,
                        ),
                      ],
                    ),
                  ),
                ),

                //Calender
                Container(
                    width: w,
                    color: whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingText("My calendar"),
                          const SizedBox(
                            height: 20,
                          ),
                          TableCalendar(
                              onFormatChanged: (format) => null,
                              focusedDay: DateTime.now(),
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14))
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
