import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddNews extends StatefulWidget {
  const AddNews({Key? key}) : super(key: key);

  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  var number;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              child: Opacity(
                opacity: 0.7,
                child: TextField(
                  onChanged: (value) {
                    number = value;
                  },
                  style: const TextStyle(
                      color: Color(0xff134373), fontSize: 16, height: 1.1),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xff134373), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'Номер телефона',
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Color(0xff134373)),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 320,
              child: Opacity(
                opacity: 0.7,
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  style: const TextStyle(
                      color: Color(0xff134373), fontSize: 16, height: 1.1),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xff134373), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    labelText: 'Пароль',
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Color(0xff134373)),
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              height: 48,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              margin: const EdgeInsets.only(top: 75),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
                onPressed: () {
                  print('Успешная регистрация!');
                  print(number);
                  print(password);
                  signup(number, password);
                  print('___________');
                },
                child: const Text('Завершить'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}


signup(number, password) async {
  //127.0.0.1:5000
  var url = Uri.parse("http://5.180.136.193:3000");
    final http.Response response = await http.post(url, headers: 
    <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(<String, String>{
        'number': number, 'password': password,
      }),
    );

    if(response.statusCode == 201) {

    } else {
      throw Exception('Ошибка при загрузке данных в БД.');
    }

    
}
