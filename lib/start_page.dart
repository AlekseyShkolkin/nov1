import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import './object_list_ip.dart';
import './objects_list.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Проверка качества')),
      ),
      body: start_page_list(context),
    );
  }

  ListView start_page_list(context) {
    return ListView(
      children: [
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ObjectListIp(),
              ),
            );
          },
          title: const Text('Контроль ИП'),
          trailing: Badge(
            badgeContent: const Text('2'),
            child: const Icon(Icons.all_out_rounded),
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ObjectList(),
              ),
            );
          },
          title: const Text('Контроль ЛКП'),
          trailing: Badge(
            badgeContent: const Text('3'),
            child: const Icon(Icons.imagesearch_roller_rounded),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
