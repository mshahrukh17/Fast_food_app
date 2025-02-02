import 'package:fastfood_app/Components/custom_widget.dart';

import '../Export/AllExport.dart';

class OnboardingSC extends StatelessWidget {
  const OnboardingSC({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaveAnimation(
                  delay: Duration(microseconds: 800),
                  duration: Duration(microseconds: 100),
                  begin: 1,
                  end: 3,
                  child: Image.asset('assets/logo.png', height: 140)),
              SizedBox(
                height: 10,
              ),
              Text("ARestro", style: ThemeText.themetext(22, Colors.black)),
              SizedBox(height: sh * 0.10),
              Column(
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Get.toNamed(AppRoutes.Login);
                        }
                        else if(index==1){

                          Get.toNamed(AppRoutes.Signup);


                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 0
                                  ? Colors.transparent
                                  : Colors.black),
                          color: index == 0
                              ? const Color(0xff009944)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: CustomMainText(
                          text: index == 0 ? "LogIn" : "SighnUp",
                          fontSize: 18,
                          color: index == 0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
