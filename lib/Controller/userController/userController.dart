import 'dart:io';
import '../../Export/AllExport.dart';

class UserController extends GetxController {
  RxBool isloading = false.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString profileImageUrl = ''.obs;

  @override
  void onReady() {
    super.onReady();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    isloading.value = true;
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString("name") ?? 'Guest';
    email.value = prefs.getString("email") ?? 'No Email';
    profileImageUrl.value = prefs.getString("image") ?? '';
    isloading.value = false;
  }

  Future<void> pickAndUploadProfileImage() async {
    final picker = ImagePicker();
    final PickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      final file = File(PickedFile.path);
      final uid = FirebaseAuth.instance.currentUser!.uid;
      try {
        isloading.value = true;
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_picture')
            .child('$uid.jpg');

        await storageRef.putFile(file);
        final downloadUrl = await storageRef.getDownloadURL();

        await FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadUrl);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .update({"image": downloadUrl});

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("image", downloadUrl);

        profileImageUrl.value = downloadUrl;

        showUltimateSnackBar('Success', 'Profile picture uploaded successfully',
            SnackBarType.success);
            isloading.value = false;
      } catch (e) {
        showUltimateSnackBar('Error', 'Something went wrong $e', SnackBarType.error);
        print(e);
      }finally{
        isloading.value = false;
      }
    } else {
      showUltimateSnackBar('Cancelled', 'No image selected', SnackBarType.info);
    }
  }
}
