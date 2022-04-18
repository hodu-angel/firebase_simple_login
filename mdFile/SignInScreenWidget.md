# firebase & SignInScreen Widget
- firebase을 연동하여 email_login을 시도한다.
- SignIn Widget은 정해진 Widget이므로 Custom의 한계가 있다.
- SignInScreen Widget을 사용하기 위해선 flutter pub add flutterfire_ui가 요구된다.

<br>

---

<br>

- 사용자가 매번 로그인하거나 로그아웃을 할 때마다 지속적으로 authStateChanges가 변할것이다.
```
return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    ...
);
```

<br><br>

- email 로그인을 위한 추가.
```
return StreamBuilder(
    ...
    builder: (context, snapshot) {
        if(!snapshot.hasData){
            return SignInScreen(
                providerConfigs: const [
                   EmailProviderConfiguration(),
                ],
            );
        },
    },
);
```

<br><br>

- 상단에 이미지 추가.
> AspectRatio: child Widget의 특정한 비율을 지정해 주는 것이다. <br>
> child: AspectRatio( aspectRatio: 1.5, child: Image.asset()), 일때, child Widget인 Image.asset의 너비가 높이의 1.5배가 되는것이다. <br>

```
return StreamBuilder(
    ...
    builder: (context, snapshot) {
        if(!snapshot.hasData){
            return SignInScreen(
                headerBuilder:(context, constraints, double) {
                    return Padding(
                        padding: const EdgeInsets.all(20),
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset('assets/gold.PNG'),
                        ),
                    );
                },
                ...
            );
        },
        return Container();
    },
);
```

<br><br>

---

<br>

- **전체 source_code**
```
Widget _authentication(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
            if(!snapshot.hasData){
                return SignInScreen(
                    headerBuilder: (context, constraints, double){
                        return Padding(
                            padding: const EdgeInsets.all(20),
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
            },
            return Container();
        },
    );
}
```