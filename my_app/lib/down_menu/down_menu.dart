import 'package:flutter/material.dart';
import './down_menu_data.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dropdown_menu/dropdown_menu.dart';
import 'dart:io';

import 'dart:math' as math;
class DownMenu extends StatefulWidget {
  @override
  _DownMenuState createState() => _DownMenuState();
}
const int ORDER_INDEX = 0;
const int TYPE_INDEX = 2;
const int FOOD_INDEX = 1;


List FOODS = json.decode(FOOD_JSON);


class _DownMenuState extends State<DownMenu> {

  

  DropdownMenu buildDropdownMenu() {
    return new DropdownMenu(maxMenuHeight: kDropdownMenuItemHeight * 10,
        //  activeIndex: activeIndex,
        menus: [
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: TYPE_INDEX,
                  data: TYPES,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * TYPES.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownListMenu(
                  selectedIndex: ORDER_INDEX,
                  data: ORDERS,
                  itemBuilder: buildCheckItem,
                );
              },
              height: kDropdownMenuItemHeight * ORDERS.length),
          new DropdownMenuBuilder(
              builder: (BuildContext context) {
                return new DropdownTreeMenu(
                  selectedIndex: 0,
                  subSelectedIndex: 0,
                  itemExtent: 45.0,
                  background: Colors.red,
                  subBackground: Colors.blueAccent,
                  itemBuilder:
                      (BuildContext context, dynamic data, bool selected) {
                    if (!selected) {
                      return new DecoratedBox(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: Divider.createBorderSide(context))),
                          child: new Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: new Row(
                                children: <Widget>[
                                  new Text(data['title']),
                                ],
                              )));
                    } else {
                      return new DecoratedBox(
                          decoration: new BoxDecoration(
                              border: new Border(
                                  top: Divider.createBorderSide(context),
                                  bottom: Divider.createBorderSide(context))),
                          child: new Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: new Row(
                                children: <Widget>[
                                  new Container(
                                      color: Theme.of(context).primaryColor,
                                      width: 3.0,
                                      height: 20.0),
                                  new Padding(
                                      padding: new EdgeInsets.only(left: 12.0),
                                      child: new Text(data['title'])),
                                ],
                              )));
                    }
                  },
                  subItemBuilder:
                      (BuildContext context, dynamic data, bool selected) {
                    Color color = selected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).textTheme.body1.color;

                    return new SizedBox(
                      height: 45.0,
                      child: new Row(
                        children: <Widget>[
                          new Text(
                            data['title'],
                            style: new TextStyle(color: color),
                          ),
                          new Expanded(
                              child: new Align(
                                  alignment: Alignment.centerRight,
                                  child: new Text(data['count'].toString())))
                        ],
                      ),
                    );
                  },
                  getSubData: (dynamic data) {
                    return data['children'];
                  },
                  data: FOODS,
                );
              },
              height: 450.0)
        ]);
  }
  
  
  

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildDropdownMenu(),
    );
  }
}