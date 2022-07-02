import 'package:fashion_store/constants/colors.dart';
import 'package:fashion_store/constants/text.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: deviceHeight,
          width: double.infinity,
          child: Image.asset(
            onboardingImage1,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: deviceHeight,
          width: deviceWidth / 2,
          decoration: const BoxDecoration(gradient: AppColors.blurContainer),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 46, 29, 219),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      onboardingText1,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      onboardingText2,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              const Text(
                onboardingText3,
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_forward)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 63, bottom: 205),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.borderColor)),
                      child: const CircleAvatar(
                        backgroundColor: AppColors.containerTransparent,
                        child: Text(
                          'f',
                          style: TextStyle(color: AppColors.borderColor),
                        ),
                      ),
                    ),
                    
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: AppColors.containerTransparent,
                        child: Image.asset(twitterImage),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.borderColor)),
                      child: const CircleAvatar(
                        backgroundColor: AppColors.containerTransparent,
                        child: Text(
                          'G',
                          style: TextStyle(color: AppColors.borderColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                  color: AppColors.borderColor,
                  thickness: 2.5,
                  endIndent: 25 * 10)
            ],
          ),
        ),
      ]),
    );
  }
}
