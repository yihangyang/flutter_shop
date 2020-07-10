// how to use InheritedWidget to share data


import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/service/category_request.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

class CounterWidget extends InheritedWidget {
  // 1. shared data
  final int counter;

  // 2. constructor
  CounterWidget({this.counter, Widget child}): super(child: child);

  // 3. get neatest Inheritedwidget
  static CounterWidget of(BuildContext context) {
    // go though Element tree, to find nestest CounterElement, pick Widget from Element
    // 沿着Element树， 找到最近的CounterElement, 从ELement中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType() ;
  }
  // 4. whether recall didChangeDependencies from StatefulWidget
  // when true:  implement didChangeDependencies from StatefulWidget
  // when false: not  implement didChangeDependencies from StatefulWidget
  @override
  bool updateShouldNotify(CounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: CounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ShowData01(),
              ShowData02(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class ShowData01 extends StatefulWidget {
  @override
  _ShowData01State createState() => _ShowData01State();
}

class _ShowData01State extends State<ShowData01> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('implement ShowData01State in didChangeDependencies');
  }
  @override
  Widget build(BuildContext context) {
    int counter = CounterWidget.of(context).counter;
    return Card(
      color: Colors.red,
      child: Text('now number: $counter', style: TextStyle(fontSize: 30),),
    );
  }
}

class ShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = CounterWidget.of(context).counter;
    return Card(
      color: Colors.blue,
      child: Text('now number: $counter', style: TextStyle(fontSize: 30),),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Selector<CategoryViewModel,List<CategoryModel>>(
      selector: (ctx, categoryVM) {
        return categoryVM.categorys;
      },
      // shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, categorys, child) {
        return ListView.builder(
          itemCount: categorys.length,
          itemBuilder: (ctx, index) {
            return Text(categorys.length.toString());
          }
        );
      },
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as CategoryModel;
    return Container(
      child: RaisedButton(
        onPressed:  (){},
        child: Text(
          'count'
        )
      ),
    );
  }
}

class CategoryViewModel extends ChangeNotifier{

  CategoryViewModel() {
    CategoryRequest.getCategoryData().then((res) {
      _categoryList = res;
      notifyListeners();
    });
  }
  List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categorys {
    return _categoryList;
  }

  set categorys(List<CategoryModel> value) {
    _categoryList = value;
    notifyListeners();
  }
}
