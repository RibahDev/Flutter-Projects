import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx/app/data/repositories/github_repository.dart';
import 'package:getx/app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(
        repository: GithubRepository(
      dio: Dio(),
    ));
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub users'),
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.users.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhum Usuário foi encontrado!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: _controller.users.length,
                      itemBuilder: (context, index) {
                        final user = _controller.users[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(user.avatarUrl),
                              ),
                            ),
                          ),
                          title: const Text(
                            'usuário',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            user.login,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {},
                        );
                      },
                    );
        },
      ),
    );
  }
}
