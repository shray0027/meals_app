import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  final List<String> content;
  final String contentTitle;
  const ContentContainer({required this.contentTitle, required this.content});

  Widget _buildContentItem(BuildContext context, String desp) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              desp,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                contentTitle,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: content.map((e) {
                return _buildContentItem(context, e);
              }).toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
