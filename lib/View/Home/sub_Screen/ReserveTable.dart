import '../../../Export/AllExport.dart';

class ReserveTable extends StatefulWidget {
  @override
  _ReserveTableState createState() => _ReserveTableState();
}

class _ReserveTableState extends State<ReserveTable> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Image.asset(
            'assets/logo2.png',
            height: 35,
          )),
      body: Stack(
        children: [
          Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: table.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Image.asset(
                        table[index].tableimage,
                        color:
                            selectedIndex == index ?const Color(0xff009944) : null,
                      ));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomMainText(
                      text: 'Description',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomMainText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi',
                      color:const Color(0xFF9E9E9E),
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: selectedIndex == null
                  ? const SizedBox()
                  : AppButtonTheme(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.TableBook);
                      },
                      child: CustomMainText(
                        text: 'Reserve the Table',
                        color: const Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      iscolor: true))
        ],
      ),
    );
  }
}
