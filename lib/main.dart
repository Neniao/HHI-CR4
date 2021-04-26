
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'indicator.dart';

void main() {
  runApp(new ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HII/CR4 Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _resultAvailable = false;
  bool _resultMerged =false;
  int _firmNumber = 1;
  int _mergeFirmNumber=1;
  List<int> _firmShares = List<int>.filled(9, 22, growable: true);
  List<int> _mergeShares = List<int>.filled(9, 22, growable: true);
  List<int> _firmSort;
  int _hhi=0;
  int _cr4=0;
  List<bool> _firmCheck = List<bool>.filled(9, false,growable: true);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Input'),
              Tab(text: 'Result'),
              Tab(text: 'Merge'),
            ],
          ),
          title: Text('HHI/CR4 Calculator'),
        ),
        body: TabBarView(
          children: [
            _IntegerExample(),
            _DecimalExample(),
            _MergedResult(),
          ],
        ),
      ),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  static __IntegerExampleState of(BuildContext context) {
        print('call to of');
        print(context.findAncestorStateOfType<__IntegerExampleState>());
        print('this is context in of');
        print(context);
        return context.findAncestorStateOfType<__IntegerExampleState>();
  }

    @override
    __IntegerExampleState createState() => __IntegerExampleState();

}

class __IntegerExampleState extends State<_IntegerExample> {
  int _firmNumber=1;
  List<int> _firmShares = List<int>.filled(9, 0, growable: true);
  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child:Column(
            children: <Widget>[
              SizedBox(height: 16),
              Text('Total Firms:', style: Theme.of(context).textTheme.headline6),
              NumberPicker(
                value: _firmNumber,
                minValue: 1,
                maxValue: 8,
                step: 1,
                itemHeight: 50,
                axis: Axis.horizontal,
                onChanged: (value) =>
                    setState(() => _firmNumber = value),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black26),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => setState(() {
                      final newValue = _firmNumber - 1;
                      _firmNumber = newValue.clamp(1, 8);
                    }),
                  ),
                  Text('Current firm number: $_firmNumber'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() {
                      final newValue = _firmNumber + 1;
                      _firmNumber = newValue.clamp(1, 8);
                    }),
                  ),
                ],
              ),
              Divider(color: Colors.grey, height: 32),
              Text('Firm information:',style: Theme.of(context).textTheme.headline6),
              TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm1 share:',
                ),
                onChanged: (text){
                  _firmShares[1]=int.parse(text);
                  print(_firmShares[1]);
                },
              ),
              if (_firmNumber > 1) TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm2 share:',
                ),
                onChanged: (text){
                  _firmShares[2]=int.parse(text);
                },
              ),
              if (_firmNumber > 2) TextField(
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm3 share:',
                ),
                onChanged: (text){
                  _firmShares[3]=int.parse(text);
                },
              ),
              if (_firmNumber > 3) TextField(
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm4 share:',
                ),
                onChanged: (text){
                  _firmShares[4]=int.parse(text);
                },
              ),
              if (_firmNumber > 4) TextField(
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm5 share:',
                ),
                onChanged: (text){
                  _firmShares[5]=int.parse(text);
                },
              ),
              if (_firmNumber > 5) TextField(
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm6 share:',
                ),
                onChanged: (text){
                  _firmShares[6]=int.parse(text);
                },
              ),
              if (_firmNumber > 6) TextField(
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm7 share:',
                ),
                onChanged: (text){
                  _firmShares[7]=int.parse(text);
                },
              ),
              if (_firmNumber > 7) TextField(
                decoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  hintText: 'number by percentage',
                  labelText:'Firm8 share:',
                ),
                onChanged: (text){
                  _firmShares[8]=int.parse(text);
                },
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  _MyHomePageState hp = context.findAncestorStateOfType<_MyHomePageState>();
                  print('_firmShares');
                  print(_firmShares);
                  print('_firmShares.length');
                  print(_firmShares.length);
                  List<int> sortshares = List.from(_firmShares);
                  sortshares[0]=0;
                  sortshares.sort((a,b)=>b.compareTo(a));
                  print('sortshares:');
                  print(sortshares);
                  hp.setState(() {
                    hp._resultAvailable = true;
                    hp._resultMerged = false;
                    hp._firmNumber = _firmNumber;
                    hp._firmShares=List.from(_firmShares,growable: true);
                    hp._hhi=0;
                    hp._cr4=0;
                    for( var i =  1; i <=hp._firmNumber ; i++ ) {
                       hp._hhi+=hp._firmShares[i]*hp._firmShares[i];
                    }
                    hp._cr4=0;
                    for( var i =  0; i <4 ; i++ ) {
                      hp._cr4+=sortshares[i];
                    }
                  });
                  DefaultTabController.of(context).animateTo(1);
                },
                child: Text('Calculate'),
              )
            ],
          ),
        ),
    );
  }
}

class _DecimalExample extends StatefulWidget {
  @override
  __DecimalExampleState createState() => __DecimalExampleState();
}

class __DecimalExampleState extends State<_DecimalExample> {
  int _showNumber;
  List<int> _showShares = List<int>.filled(9, 22, growable: true);

  int touchedIndex;
  @override
  Widget build(BuildContext context) {
      _MyHomePageState hp = context.findAncestorStateOfType<_MyHomePageState>();
      int share_total=0;
      print('firmNumber');
      print(hp._firmNumber);
      print('hp.firmShare');
      print(hp._firmShares);
      for (int i =1;i<=hp._firmNumber;i++){
        share_total+=hp._firmShares[i];
      }
      if (!hp._resultAvailable) return Center(
        child:Text('No result available.',style: TextStyle(height: 1.2, fontSize:15,letterSpacing: 1.0,fontWeight: FontWeight.bold)),
      );
      else if (share_total!=100) return Center(
        child: Text('Invalid firm shares, please make sure shares add up to 100.',style: TextStyle(height: 1.2, fontSize:15,letterSpacing: 1.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
      );
      else return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                        pieTouchResponse.touchInput is! PointerUpEvent;
                    if (desiredTouch && pieTouchResponse.touchedSection != null) {
                      touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                    } else {
                      touchedIndex = -1;
                    }
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 50,
                sections: showingSections()
              ),
          )),
          Text('HHI=${hp._hhi}',style: TextStyle(height: 1.2, fontSize:20,letterSpacing: 1.0,fontWeight: FontWeight.bold)),
          if (hp._firmNumber<4)Text('CR4 not available.',style: TextStyle(height: 1.2, fontSize:20,letterSpacing: 1.0,fontWeight: FontWeight.bold)),
          if (hp._firmNumber>=4)Text('CR4=${hp._cr4}',style: TextStyle(height: 1.2, fontSize:20,letterSpacing: 1.0,fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(30.0),
          ),
          if (hp._hhi<1500)Text('Unconcentrated Market',style: TextStyle(height: 1.2, fontSize:20,letterSpacing: 1.0)),
          if (hp._hhi<2500 && hp._hhi>=1500)Text('Moderately Concentrated Market',style: TextStyle(height: 1.2, fontSize:20,letterSpacing: 1.0)),
          if (hp._hhi>=2500)Text('Concentrated Market',style: TextStyle(height: 1.2, fontSize:20,letterSpacing: 1.0)),
          Padding(
            padding: EdgeInsets.all(80.0),
          ),
        ],
      );
  }

  List<PieChartSectionData> showingSections() {
    _MyHomePageState hp = context.findAncestorStateOfType<_MyHomePageState>();
    if (!hp._resultMerged) {
      _showNumber = hp._firmNumber;
      _showShares = hp._firmShares;
    }else{
      _showNumber = hp._mergeFirmNumber;
      _showShares = hp._mergeShares;
    }

    print('this is show');
    print(_showNumber);
    print(_showShares);
    print('this is _resultMerge:${hp._resultMerged}');
    return List.generate(_showNumber, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: _showShares[1].toDouble(),
            //value: 90,
            title: '${_showShares[1]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: _showShares[2].toDouble(),
            //value: 10,
            title: '${_showShares[2]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: _showShares[3].toDouble(),
            title: '${_showShares[3]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: _showShares[4].toDouble(),
            title: '${_showShares[4]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xf113f18e),
            value: _showShares[5].toDouble(),
            title: '${_showShares[5]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 5:
          return PieChartSectionData(
            color: const Color(0xffff1111),
            value: _showShares[6].toDouble(),
            title: '${_showShares[6]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 6:
          return PieChartSectionData(
            color: const Color(0xf7f3df8e),
            value: _showShares[7].toDouble(),
            title: '${_showShares[7]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 7:
          return PieChartSectionData(
            color: const Color(0x7ff7d37b),
            value: _showShares[8].toDouble(),
            title: '${_showShares[8]}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}

class _MergedResult extends StatefulWidget {
  @override
  __MergedResultState createState() => __MergedResultState();
}

class __MergedResultState extends State<_MergedResult> {


  @override
  Widget build(BuildContext context) {
    _MyHomePageState hp = context.findAncestorStateOfType<_MyHomePageState>();
      return Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text('Check firms to merge',style: TextStyle(height: 1.2, fontSize:15,letterSpacing: 1.0,fontWeight: FontWeight.bold)),
          Column(
              children: List.generate(hp._firmNumber, (index){
                  return CheckboxListTile(
                      title: Text('firm${index+1}'),
                      value: hp._firmCheck[index+1],
                      onChanged: (bool value){
                          setState(() {
                            hp._firmCheck[index+1]=value;
                          });
                      }
                  );
              }),
          ),
          TextButton(
              onPressed: (){
                bool have_check = false;
                int first_check = 0;
                hp._resultMerged=true;
                hp._mergeFirmNumber = hp._firmNumber;
                hp._mergeShares = List.from(hp._firmShares);
                print('box check ${hp._firmCheck}');
                for (int i=1;i<=hp._firmNumber;i++){
                  if (hp._firmCheck[i]) {
                    if (first_check ==0) first_check=i;
                    if ((first_check !=0)&&(first_check!=i)) {
                      hp._mergeShares[first_check]+=hp._mergeShares[i];
                      hp._mergeShares[i]=0;
                    };
                    hp._mergeFirmNumber--;
                    have_check =true;
                  }
                }
                print('mergenum check ${hp._mergeFirmNumber}');
                print('mergeshare check ${hp._mergeShares}');
                if (have_check) hp._mergeFirmNumber++;
                print('mergenum check ${hp._mergeFirmNumber}');
                print('mergeshare check ${hp._mergeShares}');
                hp._mergeShares.sort((a,b)=>b.compareTo(a));
                List<int> tem = List.filled(1, 0,growable: true);
                tem.addAll(hp._mergeShares);
                hp._mergeShares = List.from(tem);
                hp.setState(() {
                  hp._hhi=0;
                  hp._cr4=0;
                  for( var i =  1; i <=hp._mergeFirmNumber ; i++ ) {
                    hp._hhi+=hp._mergeShares[i]*hp._mergeShares[i];
                  }
                  hp._cr4=0;
                  for( var i =  1; i <=4 ; i++ ) {
                    hp._cr4+=hp._mergeShares[i];
                  }
                });
                DefaultTabController.of(context).animateTo(1);
              },
              child: Text('Merge'),
          ),
        ],
      );
  }
}