import 'package:flutter/material.dart';
import 'package:voice_assistant/color_manager.dart';
import 'package:voice_assistant/widgets/command_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: ColorManager.lightYellow,
        title: const Text("Leo"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/images/leo.jpg',
              height: 150,
            )),
            const SizedBox(height: 12),
            Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width - 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius:
                      BorderRadius.circular(20).copyWith(topLeft: Radius.zero)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text("How can I help you , Pookie?",
                      style: TextStyle(
                          fontFamily: 'Cera Pro',
                          color: Colors.black87,
                          fontSize: 25),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Here are a few commands",
                    style: TextStyle(
                        fontFamily: 'Cera Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),
            CommandBox(
              color: ColorManager.darkYellow,
              heading: "ChatGpt",
              text: "A smarter way to stay organised and informed with ChatGpt",
            ),
            CommandBox(
              color: ColorManager.mediumYellow,
              heading: "Dall-E",
              text:
                  "Get inspired and stay creative with your personal assistant powered by Dall-E",
            ),
            CommandBox(
              color: ColorManager.darkYellow,
              heading: "Smart voice Assistant",
              text:
                  "Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT",
            ),
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){},child:const Icon(Icons.mic),backgroundColor: ColorManager.lightYellow) ,
    );
  }
}

