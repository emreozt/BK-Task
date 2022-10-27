import 'dart:io';

import 'package:bk_task/detail_view.dart';
import 'package:bk_task/service/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  List<User>? _users;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserItems();
  }

  Future<void> fetchUserItems() async {
    final response =
        await Dio().get('https://63581b4dc27556d2893767fa.mockapi.io/Users');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _users = _datas.map((e) => User.fromJson(e)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('BK Mobil'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: _users?.length ?? 0,
          itemBuilder: (context, index) {
            return _UserCard(model: _users?[index]);
          }),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required User? model,
  })  : _model = model,
        super(key: key);

  final User? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueAccent,
      margin: const EdgeInsets.only(top: 20),
      child: ListTile(
        leading: Image(
          image: NetworkImage(_model?.avatar ?? ''),
        ),
        title: Row(
          children: [
            Text(
              _model?.name ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Text(' '),
            Text(
              _model?.surname ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _model?.email ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              _model?.phone ?? '',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailView(_model!)),
            );
          },
          icon: Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),
    );
  }
}
