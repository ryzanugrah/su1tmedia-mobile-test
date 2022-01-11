import 'package:flutter/material.dart';
import 'package:suitmedia_mobile/constants.dart';
import 'package:suitmedia_mobile/models/user_model.dart';
import 'package:suitmedia_mobile/views/third/components/user_list.dart';
import 'package:suitmedia_mobile/services/api.dart';

class ThirdScreen extends StatefulWidget {
  static String routeName = '/third';

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<UserModel> _userModel;
  int data = 12;

  @override
  void initState() {
    super.initState();
    _userModel = Api().fetchData(data);
  }

  Future refreshData() async {
    if (data == 12) {
      setState(() {
        data = data;
        _userModel = Api().fetchData(data);
      });
    }
  }

  Widget userList() {
    return RefreshIndicator(
      color: primaryColor,
      onRefresh: refreshData,
      child: FutureBuilder(
        future: _userModel,
        builder: (context, AsyncSnapshot<UserModel> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColor,
            ));
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.data.length,
                itemBuilder: (context, index) {
                  var user = snapshot.data?.data[index];
                  return UserList(data: user!);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Third Screen'),
      ),
      body: userList(),
    );
  }
}
