import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_skillriser_app/services/api_client.dart';

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  ApiClient _client = ApiClient();
  List<dynamic> courses = [];
  @override
  void initState() {
    super.initState();
    _callapi();
  }

  _callapi() async {
    final CoursesList = await _client.getdata();
    setState(() {
      courses = CoursesList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6OQ5w1UciT5a2gsWtpRunCFvWE08kPKomHw&usqp=CAU"),
          Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          GestureDetector(
                              onDoubleTap: () {},
                              child:
                                  Image.network(courses[index]["courseImage"])),
                          Text(courses[index]["title"])
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
