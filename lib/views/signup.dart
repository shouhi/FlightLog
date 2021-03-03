import 'package:flight_log/importer.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _signupKey = GlobalKey<FormState>();

  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  bool _showPassword;

  @override
  initState() {
    super.initState();
    emailInputController = TextEditingController();
    pwdInputController = TextEditingController();

    _showPassword = false;
    // Firebase.initializeApp().whenComplete(() {
    //   print("completed");
    //   setState(() {});
    // });
  }

  // e-Mailバリデーション
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return '正しいEmailのフォーマットで入力してください';
    } else {
      return null;
    }
  }

  // passwordバリデーション
  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    } else {
      return null;
    }
  }

  // アカウント登録
  void registeUser() {
    // if (_signupKey.currentState.validate()) {
    //   FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(
    //       email: emailInputController.text,
    //       password: pwdInputController.text)
    //       .then((result) => {
    //         FirebaseFirestore.instance
    //             .collection('memberProfile')
    //             .doc(FirebaseAuth.instance.currentUser.uid)
    //             .set({
    //           'description': '',
    //           'docId': FirebaseAuth.instance.currentUser.uid,
    //           'github_id': '',
    //           'goal': '',
    //           'imagePath': '',
    //           'job': '',
    //           'message': '',
    //           'name': '',
    //           'name_kana': '',
    //           'slack_user_id': '',
    //         }),
    //     Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => MemberPage()),
    //             (_) => false),
    //     emailInputController.clear(),
    //     pwdInputController.clear(),
    //   })
    //       .catchError((err) => print(err))
    //       .catchError((err) => print(err));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("アカウント作成"),
      //   backgroundColor: Const.utilColor["mild_black"],
      // ),
      body: signupscreen(),
    );
  }

  Widget signupscreen() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
            image: AssetImage('assets/landscape2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ))),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                  child: Center(
                      child: Text('Drone',
                          style: TextStyle(
                              color: Const.utilColor["white"],
                              fontSize: 60,
                              fontWeight: FontWeight.bold)))),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[500].withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.envelope,
                              size: 28,
                              color: Const.utilColor["white"],
                            ),
                          ),
                          labelText: 'メールアドレス',
                          hintText: 'drone@co.jp',
                        ),
                        controller: emailInputController,
                        validator: emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey[500].withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(
                              FontAwesomeIcons.lock,
                              size: 28,
                              color: Const.utilColor["white"],
                            ),
                          ),
                          labelText: 'パスワード',
                          hintText: '********',
                          suffixIcon: IconButton(
                              icon: Icon(_showPassword
                                  ? FontAwesomeIcons.solidEye
                                  : FontAwesomeIcons.solidEyeSlash),
                              onPressed: () {
                                this.setState(() {
                                  _showPassword = !_showPassword;
                                });
                              }),
                        ),
                        controller: pwdInputController,
                        obscureText: !_showPassword,
                        validator: pwdValidator,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Const.utilColor["blue"],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      registeUser();
                    },
                    child: Text(
                      'SignUp',
                      style: Const.utilTextStyle["kBodyText"]
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: FlatButton(
                    child: Text(
                      "既にアカウントお持ちですか？",
                      style: Const.utilTextStyle["kBodyText"],
                    ),
                    onPressed: () {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => SignIn()),
                      //     (_) => false);
                    },
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Const.utilColor["white"]))),
                ),
                SizedBox(
                  height: 40,
                )
              ])
            ],
          ),
        )
      ],
    );
  }
}
