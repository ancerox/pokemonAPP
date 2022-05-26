import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  static String route = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

int currentPage = 0;
final pageController = new PageController(initialPage: 0);

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "image": "assets/splash/Warning-cuate.svg",
        "text": "Are you in dangerous?",
      },
      {
        "image": "assets/splash/Depression-rafiki.svg",
        "text": "Are you being attacked?",
      },
      {
        "image": "assets/splash/dog.svg",
        "text": "Dont worry, this app is will save your life",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, i) => SplashContent(
                          image: splashData[i]["image"]!,
                          text: splashData[i]["text"]!,
                        ))),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index)),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Container(
                width: double.infinity,
                height: 70,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: const Text(
                  'Get Stared',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 8),
      width: currentPage == index ? 40 : 12,
      height: 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: currentPage == index ? Colors.red : Colors.grey),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.image,
    this.text,
  }) : super(
          key: key,
        );

  final String? image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          'Poken Savior',
          style: TextStyle(
              color: Colors.red, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          style: TextStyle(
              color: Colors.red, fontSize: 13, fontWeight: FontWeight.w400),
        ),
        SvgPicture.asset(
          image!,
          height: 420,
        ),
      ],
    );
  }
}
