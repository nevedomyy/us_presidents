import 'package:flutter/material.dart';
import 'package:simple_coverflow/simple_coverflow.dart';


void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Presidents(),
    );
  }
}

class Presidents extends StatefulWidget{
  @override
  _Presidents createState() => _Presidents();
}

class _Presidents extends State<Presidents>{
  static Size _size;
  static List<Widget> _presPicture = List(45);
  static List<String> _presName = [
    'George Washington',
    'John Adams',
    'Thomas Jefferson',
    'James Madison',
    'James Monroe',
    'John Quincy Adams',
    'Andrew Jackson',
    'Martin Van Buren',
    'William Henry Harrison',
    'John Tyler',
    'James K. Polk',
    'Zachary Taylor',
    'Millard Fillmore',
    'Franklin Pierce',
    'James Buchanan',
    'Abraham Lincoln',
    'Andrew Johnson',
    'Ulysses S. Grant',
    'Rutherford B. Hayes',
    'James A. Garfield',
    'Chester A. Arthur',
    'Grover Cleveland',
    'Benjamin Harrison',
    'Grover Cleveland',
    'William McKinley',
    'Theodore Roosevelt',
    'William Howard Taft',
    'Woodrow Wilson',
    'Warren G. Harding',
    'Calvin Coolidge',
    'Herbert Hoover',
    'Franklin D. Roosevelt',
    'Harry S. Truman',
    'Dwight D. Eisenhower',
    'John F. Kennedy',
    'Lyndon B. Johnson',
    'Richard Nixon',
    'Gerald Ford',
    'Jimmy Carter',
    'Ronald Reagan',
    'George H. W. Bush',
    'Bill Clinton',
    'George W. Bush',
    'Barack Obama',
    'Donald Trump',
  ];
  static List<String> _presDate = [
    '1789-1797',
    '1797-1801',
    '1801-1809',
    '1809-1817',
    '1817-1825',
    '1825-1829',
    '1829-1837',
    '1837-1841',
    '1841-1841',
    '1841-1845',
    '1845-1849',
    '1849-1850',
    '1850-1853',
    '1853-1857',
    '1857-1861',
    '1861-1865',
    '1865-1869',
    '1869-1877',
    '1877-1881',
    '1881-1881',
    '1881-1885',
    '1885-1889',
    '1889-1893',
    '1893-1897',
    '1897-1901',
    '1901-1909',
    '1909-1913',
    '1913-1921',
    '1921-1923',
    '1923-1929',
    '1929-1933',
    '1933-1945',
    '1945-1953',
    '1953-1961',
    '1961-1963',
    '1963-1969',
    '1969-1974',
    '1974-1977',
    '1977-1981',
    '1981-1989',
    '1989-1993',
    '1993-2001',
    '2001-2009',
    '2009-2017',
    '2017-Incumbent',
  ];
  String _appbarName = _presName[0];
  String _appbarDate = _presDate[0];
  int _number = 1;


  Widget _listOfPres(BuildContext context, int i){
    _size = MediaQuery.of(context).size;
    _presPicture[i] = SizedBox(width: _size.width*0.6, height: _size.height*0.65,
      child: Image.asset('assets/${i+1}.jpg', fit: BoxFit.cover),
    );
    return _presPicture[i];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(_appbarName, style: TextStyle(color: Colors.black, fontSize: 35.0, fontFamily: 'Abel-Regular'),),
                    Text(_appbarDate, style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Abel-Regular'),)
                  ],
                ),
              ),
            ),
            Expanded(
              child: CoverFlow(
                  itemBuilder: (_, int index,){return _listOfPres(context, index);},
                  itemCount: _presPicture.length,
                  dismissibleItems: false,
                  currentItemChangedCallback: (int index){setState(() {
                      _appbarName = _presName[index];
                      _appbarDate = _presDate[index];
                      _number = index + 1;});
                  }
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text('№'+_number.toString(), style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Abel-Regular'),),
              )
            )
          ],
        ),
      ),
    );
  }
}
