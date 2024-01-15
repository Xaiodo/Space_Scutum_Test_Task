import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/src/pages/house_page/house_view.dart';
import 'package:space_scutum_test_task/src/values/app_constants.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConstants.applicationEnterPageTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 30),
                  const Image(
                    height: 200,
                    width: 200,
                    image: AssetImage(
                      AppConstants.catImagePath,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 228,
                    height: 57,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HouseView(),
                        ),
                      ),
                      child: Text(
                        AppConstants.enterButtonText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 28,
                right: 49,
                child: Text(
                  AppConstants.desingedBy,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      );
}
