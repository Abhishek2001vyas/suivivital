import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import '../../utils/color.dart';
import 'option_choose.dart';

class ONborad extends StatefulWidget {
  const ONborad({super.key});

  @override
  State<ONborad> createState() => _ONboradState();
}

class _ONboradState extends State<ONborad> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  child: Image.asset(
                    'assets/images/Onboarding_1.png',
                  ),
                ),
                Text(
                  "Find Your Doctor",
                  style: TextStyle(
                      color: Color(0xff0c1037),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                    softWrap: true,
                    style: TextStyle(
                      color: Color(0xff898f99),
                      fontSize: 15,
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  child: Image.asset(
                    'assets/images/Onboarding_2 (1).png',
                  ),
                ),
                Text(
                  "Lab Test At Home",
                  style: TextStyle(
                      color: Color(0xff0c1037),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                    style: TextStyle(
                      color: Color(0xff898f99),
                      fontSize: 15,
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  child: Image.asset(
                    'assets/images/03_Onboarding.png',
                  ),
                ),
                Text(
                  "Order Your Medicine",
                  style: TextStyle(
                      color: Color(0xff0c1037),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                    style: TextStyle(
                      color: Color(0xff898f99),
                      fontSize: 15,
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    // getvali().whenComplete(()async{
    //   Timer(Duration(milliseconds: 1),()=> Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return  finalname == null ? Login(): Signup();
    //   },))
    //   );});

    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: Colors.white,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Get.to(Choose_option());
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Choose role',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  var q;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Onboarding(
              pages: onboardingPagesList,
              onPageChange: (int pageIndex) {
                index = pageIndex;
              },
              startPageIndex: 0,
              footerBuilder: (context, dragDistance, pagesLength, setIndex) {
                return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 0.0,
                        color: Colors.white,
                      ),
                    ),
                    child: ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIndicator(
                              netDragPercent: dragDistance,
                              pagesLength: pagesLength,
                              indicator: Indicator(
                                activeIndicator: ActiveIndicator(
                                  color: colors.primary,
                                ),
                                closedIndicator: ClosedIndicator(
                                  color: colors.primary,
                                ),
                                indicatorDesign: IndicatorDesign.polygon(
                                    polygonDesign: PolygonDesign(
                                        polygon: DesignType.polygon_circle)),
                              ),
                            ),
                            index == pagesLength - 1
                                ? _signupButton
                                : _skipButton(setIndex: setIndex)
                          ],
                        ),
                      ),
                    ));
              }),
        ));
  }

  void qwer() {
    setState(() {
      q = AppLocalizations.of(context)!.choose_role;
    });
    print(q);
  }
}
