import 'package:flutter/material.dart';

class PokedexAppBar extends AppBar {
  PokedexAppBar()
      : super(
            leading: Builder(
              builder: (BuildContext context) {
                return Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFd7d9d6), shape: BoxShape.circle),
                    child: Container(
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Color(0xFF2aacfc), shape: BoxShape.circle),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  color: Color(0xFF186b9f),
                                  shape: BoxShape.circle)),
                          Positioned(
                            left: 2,
                            top: 1,
                            child: Container(
                              margin: EdgeInsets.all(2.0),
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2aacfc),
                                  shape: BoxShape.circle),
                              // color: Color(0xFFa1dafd), shape: BoxShape.circle
                            ),
                          ),
                          Positioned(
                            left: 8,
                            top: 5,
                            child: Container(
                              margin: EdgeInsets.all(2.0),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Color(0xFFa1dafd),
                                  shape: BoxShape.circle),
                              // color: Color(0xFFa1dafd), shape: BoxShape.circle
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(2.0),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFcd0a2c),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.0, color: Color(0xFF000000)),
                  ),

                  // color: Color(0xFFa1dafd), shape: BoxShape.circle
                ),
                Container(
                  margin: EdgeInsets.all(2.0),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFf0e159),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.0, color: Color(0xFF000000)),
                  ),
                  // color: Color(0xFFa1dafd), shape: BoxShape.circle
                ),
                Container(
                  margin: EdgeInsets.all(2.0),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFF66b271),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.0, color: Color(0xFF000000)),
                  ),
                  // color: Color(0xFFa1dafd), shape: BoxShape.circle
                ),
              ],
            ));
}
