import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/waterfall.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              Container(
                child: TextField(
                  onChanged:(value){
                    cityName = value;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter a city name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                child: Text('Get Weather'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
