import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsDetail extends StatefulWidget {
  Map<String, dynamic> data;
  NewsDetail({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25, right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.data['image'] != null)
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(widget.data["image"])),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  '${widget.data["title"]}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 15),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.data["categories"],
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: '  '),
                        TextSpan(
                          style: const TextStyle(color: Colors.grey),
                          text: timeago.format(
                            DateTime.parse(
                              widget.data['created_at'],
                            ),
                          ),
                        )
                      ]),

                  // '${widget.data["author"]} ${timeago.format(
                  //   DateTime.parse(
                  //     widget.data['created_at'],
                  //   ),
                  // )}',
                ),
              ),
              Text(
                '${widget.data["content"]}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
