// ignore_for_file: unused_element, deprecated_member_use
import '../../../Export/AllExport.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    String capitalize(String text) {
      if (text.isEmpty) return '';
      return text[0].toUpperCase() + text.substring(1).toLowerCase();
    }

    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 1,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => userController.pickAndUploadProfileImage(),
              child: Obx(
                () => CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFD3D0D0),
                  backgroundImage: userController.isloading.value
                      ? null
                      : userController.profileImageUrl.value.isNotEmpty
                          ? NetworkImage(userController.profileImageUrl.value)
                          : null,
                  child: userController.isloading.value
                      ? CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              const Color(0xFF000000)),
                        )
                      : userController.profileImageUrl.value.isEmpty
                          ? Icon(
                              Icons.person,
                              size: 40,
                              color: const Color(0xFF414040),
                            )
                          : null,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 190,
              width: sw * 9,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9E9E9E).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomMainText(
                    text: 'Personal Info',
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Your Name',
                        color: const Color(0xFF424242),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      Obx(
                        () => CustomMainText(
                          text: capitalize(userController.name.value),
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Occupation',
                        color: const Color(0xFF424242),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: 'Developer',
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Address',
                        color: const Color(0xFF424242),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: 'Hyderabad, Pakistan',
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              width: sw * 9,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9E9E9E).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomMainText(
                    text: 'Contact Info',
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Phone Number',
                        color: const Color(0xFF424242),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: '+92 000 000000',
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Email',
                        color: const Color(0xFF424242),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      Obx(
                        () => CustomMainText(
                          text: userController.email.value,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
