import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Center(
          child: SizedBox(
              width: 300,
              height: 300,
              child: RiveAnimation.asset(
                'assets/ai_talk.riv',
              )),
        ),
        const SizedBox(height: 25),
        Text(
          'Get ready for some magic!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          'Crafting a compelling story...',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15),
        ),
        const SizedBox(height: 25),
        const SizedBox(
            width: 40, height: 40, child: CircularProgressIndicator()),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
