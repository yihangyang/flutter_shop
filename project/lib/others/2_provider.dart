// How to use provider to share data
// 1. create shared data
// 2. create ChangeNotifierProvider in the top level(main.dart)
//    class CounterViewModel extends ChangeNotifier{data, get, set}
// 3. use shared data 
//  3.1 Provider.of
//    (when data changed, the build method is not needed to rebuild)
//    int counter = Provider.of<CounterViewModel>(context).counter;
//  3.2 Consumer (recommend)
//    (when data changed, the build method is not needed to rebuild)
//    Consumer<CounterViewModel>(builder: (ctx, counterVM,child) {
// 3.3 Selector
//    ((1)transform the data (2)shouldRebuild)
//    Selector<CounterViewModel,CounterViewModel>(

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/service/category_request.dart';
import 'package:provider/provider.dart';

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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ShowData01(),
              ShowData02(),
              ShowData03(),
              MyButton()
            ],
          ),
        ),
      ),
      floatingActionButton: Selector<CounterViewModel,CounterViewModel>(
        selector: (ctx, counterVM) => counterVM,
        shouldRebuild: (prev, next) => true,
        builder: (ctx, counterVM, child) {
          // child in order not to rebuild
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterVM.counter++;
            },
          );
        },
        child: Icon(Icons.add),
      )
    );
  }
}

class ShowData01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    int counter = Provider.of<CounterViewModel>(context).counter;
    print('data01 provider.of');
    return Card(
      color: Colors.red,
      child: Text('now number: $counter', style: TextStyle(fontSize: 30),),
    );
  }
}

class ShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('data02 consumer'); 
    return Card(
      color: Colors.blue,
      child: Consumer<CounterViewModel>(
        builder: (ctx, counterVM, child) {
          return Text('now number: ${counterVM.counter}', style: TextStyle(fontSize: 30),);
        },
      )
    );
  }
}
class ShowData03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('data02 consumer'); 
    return Card(
      color: Colors.blue,
      child: Consumer2<UserViewModel, CounterViewModel>(
        builder: (ctx, userVM, counterVM, child) {
          return Text(
            'now number: ${counterVM._counter}, nickname: ${userVM.user.nickname}',
            style: TextStyle(fontSize: 30),
          );
        },
      )
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
    return Consumer<CounterViewModel>(
      builder: (ctx, counterVM, child) {
        return Container(
          child: RaisedButton(
            onPressed:  (){
              counterVM.counter++;
            },
            child: Text(
              'count++'
            )
          ),
        );
      },
    );
  }
}

class UserViewModel extends ChangeNotifier{
  UserModel _user;
  UserViewModel(this._user);
  UserModel get user => _user;
  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }

}

class UserModel {
  String nickname;
  int level;
  String imgUrl;

  UserModel(this.nickname, this.level, this.imgUrl);
}

class CounterViewModel extends ChangeNotifier{
  int _counter = 100;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    notifyListeners();
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