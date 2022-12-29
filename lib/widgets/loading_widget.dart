import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoadingWidget extends StatelessWidget {
  const LottieLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 62,
        horizontal: 62,
      ),
      child: Lottie.network(
          'https://assets10.lottiefiles.com/packages/lf20_p8bfn5to.json'),
    );
  }
}
