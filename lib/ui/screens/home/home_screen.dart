import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home-screen';
  static const String path = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAgreed = false;
  String _fullName = 'Oreoluwa Adejumo';
  String _slackName = 'Mavipop';
  String _githubHandle = 'HaywhyD';
  String _bio =
      'Determined Mobile Developer offering more than 2 years of expertise in fast-paced departments. Bilingual and well-spoken with the ability to work closely with people of all different backgrounds and personalities. Seeking an opportunity to oversee a team of exceptional in a well established company.';
  final String _track = 'Mobile Track';
  String _skills = 'Flutter, Swift, Kotlin, WordPress, HTML, CSS, Js';
  String _language = 'English, Yoruba, French';

  List _work = [];
  List _education = [];
  List _certification = [];

  doUpdate() {}

  @override
  void initState() {
    super.initState();

    setState(() {
      _work.add(
        {
          'role': 'Lead Developer',
          'company': 'Becadel Solutions',
          'startMonth': 'December',
          'startYear': '2020',
          'endMonth': 'December',
          'endYear': '2021',
          'workRoles':
              'Troubleshooting of technical issues to solve problems within a reasonable time frame',
        },
      );
      _work.add(
        {
          'role': 'Lead Developer',
          'company': 'WebEdge Solutions',
          'startMonth': 'September',
          'startYear': '2022',
          'endMonth': 'June',
          'endYear': '2023',
          'workRoles': 'Developing complex websites using HTML, CSS and Js'
        },
      );
      _education.add(
        {
          'school': 'Federal University of Agriculture, Abeokuta',
          'startYear': '2017',
          'endYear': '2023',
          'degree': 'BSC: Agricultural Engineering',
        },
      );
      _certification.add({
        'institution': 'Side Hustle',
        'year': '2017',
        'certification': 'Certificate of Completion, Mobile Development',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness == Brightness.dark
        ? SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarContrastEnforced: true,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.light,
            ),
          )
        : SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarContrastEnforced: true,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                top: 30,
                right: 15,
              ),
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF181818)
                  : Colors.white,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$_fullName\'s CV',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.88,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF14394B).withOpacity(.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Center(
                                    child: Hero(
                                      flightShuttleBuilder: (
                                        flightContext,
                                        animation,
                                        flightDirection,
                                        fromHeroContext,
                                        toHeroContext,
                                      ) {
                                        switch (flightDirection) {
                                          case HeroFlightDirection.push:
                                            return Material(
                                              color: Colors.transparent,
                                              child: ScaleTransition(
                                                scale: animation
                                                    .drive(Tween<double>(
                                                  begin: 0,
                                                  end: 1,
                                                ).chain(CurveTween(
                                                  curve: Curves.fastOutSlowIn,
                                                ))),
                                                child: toHeroContext.widget,
                                              ),
                                            );

                                          case HeroFlightDirection.pop:
                                            return Material(
                                              color: Colors.transparent,
                                              child: toHeroContext.widget,
                                            );
                                        }
                                      },
                                      tag: 'profile',
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? const Color(0xFFD4D4D4)
                                                    : Colors.grey.shade300,
                                          ),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              'assets/icon/icon.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 80,
                                    width: 1,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _fullName,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 24,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            _track,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('1'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'About',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _bio,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('2'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Slack Username',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _slackName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('3'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Github Handle',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _githubHandle,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('4'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Full Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _fullName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('5'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Skills',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _skills,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('6'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Language',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _language,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('7'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Work Experience',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      children: [
                                        for (int i = 0; i < _work.length; i++)
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                _work[i]
                                                                    ['role'],
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Text(
                                                              '|',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Flexible(
                                                              child: Text(
                                                                _work[i]
                                                                    ['company'],
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        '${_work[i]['startMonth']} ${_work[i]['startYear']} - ${_work[i]['endMonth']} ${_work[i]['endYear']}',
                                                        style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade500
                                                              : Colors.grey
                                                                  .shade600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const Text(
                                                                    '-',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Flexible(
                                                                    fit: FlexFit
                                                                        .tight,
                                                                    child: Text(
                                                                      _work[i][
                                                                          'workRoles'],
                                                                      style:
                                                                          TextStyle(
                                                                        color: Theme.of(context).brightness ==
                                                                                Brightness.dark
                                                                            ? Colors.grey.shade300
                                                                            : Colors.grey.shade800,
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('8'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Education',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.grey.shade500,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      children: [
                                        for (int i = 0;
                                            i < _education.length;
                                            i++)
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          _education[i]
                                                              ['school'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${_education[i]['startYear']} - ${_education[i]['endYear']}',
                                                        style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade500
                                                              : Colors.grey
                                                                  .shade600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                _education[i]
                                                                    ['degree'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? Colors
                                                                          .grey
                                                                          .shade300
                                                                      : Colors
                                                                          .grey
                                                                          .shade800,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color(0xFF353945)
                                      : Colors.grey.shade300,
                                ),
                                child: const Text('9'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Certifications',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      children: [
                                        for (int i = 0;
                                            i < _certification.length;
                                            i++)
                                          Flexible(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Container(
                                                    width: 7,
                                                    height: 7,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          _certification[i]
                                                              ['institution'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${_certification[i]['year']}',
                                                        style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors
                                                                  .grey.shade500
                                                              : Colors.grey
                                                                  .shade600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Flexible(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                _certification[
                                                                        i][
                                                                    'certification'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark
                                                                      ? Colors
                                                                          .grey
                                                                          .shade300
                                                                      : Colors
                                                                          .grey
                                                                          .shade800,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                // List getState =
                                //     await Navigator.of(context).push(
                                //   CupertinoPageRoute(
                                //     builder: (context) => EditScreen(
                                //       fullName: _fullName,
                                //       slackName: _slackName,
                                //       githubHandle: _githubHandle,
                                //       bio: _bio,
                                //       skills: _skills,
                                //       language: _language,
                                //       work: _work,
                                //       education: _education,
                                //       certification: _certification,
                                //     ),
                                //   ),
                                // );
                                // setState(() {
                                //   _fullName = getState[0];
                                //   _slackName = getState[1];
                                //   _githubHandle = getState[2];
                                //   _bio = getState[3];
                                //   _skills = getState[4];
                                //   _language = getState[5];
                                //   _work = getState[6];
                                //   _education = getState[7];
                                //   _certification = getState[8];
                                // });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF14394B),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  'Edit details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
