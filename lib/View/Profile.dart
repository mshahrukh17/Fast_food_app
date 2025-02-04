import '../Export/AllExport.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
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
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 190,
              width: sw * 9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Your Name',
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: 'Shah Rukh',
                        color: Colors.black,
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
                        text: 'Occupation',
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: 'Developer',
                        color: Colors.black,
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
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: 'Hyderabad, Pakistan',
                        color: Colors.black,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomMainText(
                        text: 'Phone Number',
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: '+92 000 000000',
                        color: Colors.black,
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
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      CustomMainText(
                        text: 'email@gmail.com',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
