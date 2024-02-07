import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opticreader/pages/answer_key_page.dart';
import 'package:opticreader/pages/read_optic_page.dart';
import 'package:opticreader/widgets/main_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool answerKeyValid = false;
  bool readOpticDisabled = true;
  List<String> answers = ["A", "B", "D", "C", "E"];

  File? image;

  Future pickImageAndPush(ImageSource source, var page) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      setState(() {
        this.image = File(image.path);

        // TODO fotoğraf sisteme gönderilir, bilgi gelince devam

        answerKeyValid = true;
        readOpticDisabled = false;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      });
    } on PlatformException catch (e){
      final snackBar = SnackBar(content: Text("Fotoğraf seçilemedi: $e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 87, left: 24, right: 24),
        child: Column(
          children: [
            MainButton(
              onTap: () {
                if (answerKeyValid){
                  // TODO answer key page için answers parametresi olcak
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnswerKeyPage(answers: answers)));
                }
                else {
                  pickImageAndPush(ImageSource.camera, AnswerKeyPage(answers: answers));
                }
              },
              title: "Cevap Anahtarı",
              subtitle: "Henüz bir cevap anahtarı okutmadınız",
              imagePath: "assets/cevapanahtari.png",
              answerKeyValid: answerKeyValid,
            ),
            const SizedBox(height: 86),
            MainButton(
              onTap: () {
                if (readOpticDisabled){
                  var snackBar = const SnackBar(
                    content: Text("Önce cevap anahtarı okutmalısınız"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                else {
                  pickImageAndPush(ImageSource.camera, OpticPage());
                }
              },
              title: "Optik Oku",
              subtitle: "Öncelikle cevap anahtarının okutulması gerekli",
              imagePath: "assets/optik.png",
              disabled: readOpticDisabled,
              answerKeyValid: answerKeyValid,
            ),
          ],
        ),
      ),
    );
  }
}
