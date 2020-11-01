

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_common/components/shadow_button/shadow_button.dart';

class PublishPage extends StatelessWidget {

  final bool isEdit;

  final TextEditingController _title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _content = TextEditingController();

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
    return Scrollbar(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            // autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _title,
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Article Title',
                    hintText: 'Article Title'
                  ),
                  validator: (v) => v.trim().length > 0
                    ? null
                    : 'Please input a title.'
                ),
                TextFormField(
                  controller: _author,
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Author',
                    hintText: 'Author'
                  ),
                  validator: (v) => v.trim().length > 0
                    ? null
                    : 'Please input an author\'s name.'
                ),
                TextFormField(
                  controller: _content,
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    hintText: 'Content',
                    alignLabelWithHint: true
                  ),
                  maxLines: 10,
                  validator: (v) => v.trim().length > 0
                    ? null
                    : 'Please input article content.',
                ),
                _mySigninButton()
              ],
            )
          )
        )
      )
    );
    /* return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _title,
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Article Title',
                hintText: 'Article Title'
              )
            ),
            TextField(
              controller: _author,
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Author',
                hintText: 'Author'
              )
            ),
            TextField(
              controller: _content,
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Content',
                hintText: 'Content',
                alignLabelWithHint: true
              ),
              maxLines: 10,
            ),
            _mySigninButton()
          ],
        )
      ),
    ); */
  }

  Widget _mySigninButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Builder(
        builder: (BuildContext context) {
          return ShadowButton(
            text: 'SIGN IN',
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w600
            ),
            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12.0),
            borderRadius: BorderRadius.circular(60.0),
            onPressed: () {
              print(Form.of(context).validate());
            },
          );
        }
      )
    );
  }

}