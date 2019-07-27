import 'package:flutter/material.dart';
import './down_menu_data.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dropdown_menu/dropdown_menu.dart';
import 'dart:io';

import 'dart:math' as math;
import './down_menu.dart';

class MenuHeader extends StatefulWidget {
  MenuHeader({DropdownMenuHeadTapCallback onTap});
  @override
  _MenuHeaderState createState() => _MenuHeaderState();
}

class _MenuHeaderState extends State<MenuHeader> {

  DropdownHeader buildDropdownHeader({DropdownMenuHeadTapCallback onTap}) {
    return new DropdownHeader(
      onTap: onTap,
      titles: [TYPES[TYPE_INDEX], ORDERS[ORDER_INDEX], FOODS[0]['children'][0]],
    );
  }
 
  
  @override
  Widget build(BuildContext context) {
    return buildDropdownHeader();
  }
}