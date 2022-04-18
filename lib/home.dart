import 'package:fcm_push_test/ui/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

//SignIn Widget으로 로그인을 구현해 볼 것이다.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _authentication() {
    return StreamBuilder(
      //사용자가 매번 로그인하거나 로그아웃을 할때마다 지속적으로 authStateChanges가 변할것이고
      //builder method를 통해 새롭게 화면을 그려 줄 수 있게 되는 것이다.
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            //상단에 이미지 넣기
            headerBuilder: (context, constraints, double) {
              return Padding(
                padding: const EdgeInsets.all(20),
                //AspectRatio: child widget의 특정한 비율을 지정해 주는 것.
                //child widget의 너비가 높이의 1배가 되는 것.
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/gold.PNG'),
                ),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
          );
        }
        return const ChatScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'simple_login_app',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _authentication(),
    );
  }
}
