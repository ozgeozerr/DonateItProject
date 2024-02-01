import 'package:donate_it/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:donate_it/pages/login_page.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => TutorialScreenContent(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: DoIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_pageIndex == demo_data.length - 1) {
                        // If on the last page navigate to the login screen !!!
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      } else {

                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "lib/icons/arrow-right.svg",
                        color: Colors.deepPurple,
                        height: 36,
                        width: 36,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoIndicator extends StatelessWidget {
  const DoIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.indigoAccent : Colors.indigoAccent.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Tutorial {
  final String image, title, description;

  Tutorial({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Tutorial> demo_data =  [
  Tutorial(
    image: "lib/images/security.png",
    title: "First, Login to \nexplore DonateIt",
    description: "If you are new, Sign in with your email or Google account!",
  ),
  Tutorial(
    image: "lib/images/newspaper.png",
    title: "Keep yourself updated \non the news",
    description: "Check the news to see what is most needed by children in need!",
  ),
  Tutorial(
    image: "lib/images/donate.png",
    title: "Willing to help? \nSimply click on Donate button!",
    description: "You will then be directed to the donation page and can choose which category you want to donate in.",
  ),
  Tutorial(
    image: "lib/images/donation.png",
    title: "Did you choose what you are willing to donate? \nTake a picture of your item!",
    description: "After taking your photo and submitting it, you will wait for confirmation",
  ),
  Tutorial(
    image: "lib/images/post-office.png",
    title: "Upon confirmation, you can now send your desired items",
    description: "With the received cargo code, visit any nearby post office",
  ),
  Tutorial(
    image: "lib/images/role-model.png",
    title: "You are now a hero! \nAnd we have a surprise for you!",
    description: "You will be benefited with discounts from our sponsors, Thank you for being a part of DonateIt :)",
  ),
];

class TutorialScreenContent extends StatelessWidget {
  const TutorialScreenContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 250,
          ),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
