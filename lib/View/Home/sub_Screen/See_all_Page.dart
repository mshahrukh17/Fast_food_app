import '../../../Export/AllExport.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Image.asset(
          'assets/logo2.png',
          height: 35,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
