import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:qualcontr/object_list_vhc.dart';
import 'package:qualcontr/teor.dart';
import './object_list_ip.dart';
import 'objects_list_lkp.dart';

class StartPage extends StatelessWidget {
  // final int todosLengthIp;
  // final int todosLengthLKP;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
            child: Text(
          'КОНТРОЛЬ ПОКРЫТИЙ',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        )),
      ),
      body: start_page_list(context),
    );
  }

  ListView start_page_list(context) {
    // print('ДлинаИП: $todosLengthIp');
    // print('ДлинаЛКП: $todosLengthLKP');
    return ListView(
      children: [
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ObjectListIp(),
              ),
            );
          },
          title: Text(
            'КОНТРОЛЬ ИП',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
          trailing: Badge(
            // badgeContent: todosLengthIp != null
            //     ? Text(todosLengthIp.toString())
            //     : Text('нет'),
            child: Icon(
              Icons.all_out_rounded,
              size: 52,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ObjectList(),
              ),
            );
          },
          title: Text(
            'КОНТРОЛЬ ЛКП',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
          trailing: Badge(
            // badgeContent: todosLengthLKP != null
            //     ? Text(todosLengthLKP.toString())
            //     : Text('нет'),
            child: Icon(
              Icons.imagesearch_roller_rounded,
              size: 52,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ObjectListVhC(),
              ),
            );
          },
          title: Text(
            'ВХОДНОЙ КОНТРОЛЬ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
          trailing: Badge(
            // badgeContent: todosLengthLKP != null
            //     ? Text(todosLengthLKP.toString())
            //     : Text('нет'),
            child: Icon(
              Icons.playlist_add_check,
              size: 52,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Teor(),
              ),
            );
          },
          title: Text(
            'ТЕОРИЯ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
          trailing: Icon(
            Icons.menu_book_outlined,
            size: 52,
            color: Theme.of(context).accentColor,
          ),
        ),
        Divider(),
      ],
    );
  }
}
