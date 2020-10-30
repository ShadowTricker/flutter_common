

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_common/components/logo/logo.dart';

class PublishPage extends StatelessWidget {

  final bool isEdit;

  PublishPage({ @required this.isEdit });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit' : 'Add'),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Logo(size: 120.0);
    // return Text(isEdit.toString());
  }

}