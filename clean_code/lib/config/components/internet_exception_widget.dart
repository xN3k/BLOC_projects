import 'package:clean_code/config/color/colors.dart';
import 'package:flutter/material.dart';

class InternetException extends StatelessWidget {
  final VoidCallback onPress;
  const InternetException({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
        ),
        Icon(
          Icons.cloud_off,
          color: AppColors.redColor,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            "We are unable to Proceed\nPlease check your internet\nconnection",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 20),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .1,
        ),
        ElevatedButton(
          onPressed: onPress,
          child: Text(
            'Retry',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
