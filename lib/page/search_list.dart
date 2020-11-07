import 'package:CiYing/api/search.dart';
import 'package:CiYing/components/rounded_input_field.dart';
import 'package:CiYing/grpc/proto/search.pb.dart';
import 'package:CiYing/page/resource_list.dart';
import 'package:CiYing/page/head_profile.dart';
import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  @override
  Widget build(BuildContext context) {
    return ResourceList();
  }
}
