import 'package:elden_build/layout/layout.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _page_visible = false;

  @override
  void initState(){
    super.initState();
    _pageanimation();
    _navigatetologin();
  }

  _pageanimation()async{
    await Future.delayed(const Duration(milliseconds: 500), () {});
    setState(() {
      _page_visible = !_page_visible;
    });
  }

  _navigatetologin()async{
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    Navigator.pushNamed(context, Onboarding.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 2000),
        opacity: _page_visible ? 1.0 : 0.0,
        child: Scaffold(
          body: Stack(
            children: const [Background(), LogoSection()],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage('img/logo.png'),
          alignment: FractionalOffset.topCenter,
        ),
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage('img/logo.png'),
              alignment: FractionalOffset.topCenter,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only( top: 40),
          child: const Text('Elden Build',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Mantinia',
                  fontSize: 50,
              )
          ),
        ),
      ]
    );
  }
}
