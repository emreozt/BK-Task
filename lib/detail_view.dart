import 'package:bk_task/service/user_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final User user;
  DetailView(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 30),
          Image(image: NetworkImage(user.avatar ?? '')),
          SizedBox(height: 10),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.name ?? '',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              Text(' '),
              Text(
                user.surname ?? '',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut '
            'labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut '
            'aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore '
            'eu fugiat nulla pariatur. '
            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            style: TextStyle(fontWeight: FontWeight.w400),
            maxLines: 20,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

/*class DetailView extends StatefulWidget {
  final User? user;
  //DetailView{this.user};

  const DetailView({Key? key, this.user}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Text(widget.user?.name ?? ''),
              const Text('12 '),
              //Text(_users?[index].surname ?? '')
            ],
          ),
          Row(),
          Row(),
        ],
      ),
    );
  }
}*/
