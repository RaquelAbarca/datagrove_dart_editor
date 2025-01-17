import 'package:flutter/cupertino.dart';

import 'menu.dart';

// should we have a contacts list? Is this what we get from districts?
// the contact list could includes mail connections and web connections
// the contact list could be merged
// maybe we generate page states from routes?

/*
CupertinoPageScaffold(
        child: CustomScrollView(slivers: [
      CupertinoSliverNavigationBar(
          leading: leading ??
              CupertinoButton(
                  child: const Icon(CupertinoIcons.left_chevron),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
          largeTitle: title,
          middle: title,
          trailing: Row(children: trailing)),
      ...children
    ]))*/

// unclear if we need this. generate might wrap this directly?
class FormTuple {
  List<String> cell = [];

  TextEditingController text(int x) {
    return TextEditingController();
  }
}

// a general database change feels to coarse, but views can be joins of more than
// one table, so maybe future work.
class Db extends ChangeNotifier {
  Db();
}

// app listens to the database, widgets listen to the app
//
class App extends ChangeNotifier {
  Db db;
  var table = <String, AppTable>{};

  List<MenuItem> menu = [];

  String get label => '';

  // todo; this is only macos right now?
  bool get isMenuBar => true;

  App({required this.db, required this.table, required this.menu}) {
    db.addListener(_update);
    for (var o in table.entries) {
      o.value.app = this;
    }
  }
  @override
  dispose() {
    super.dispose();
  }

  _update() {
    notifyListeners();
  }

  // define a menu. Add is context dependent
}

class AppRow {}

// be careful of indices, these are only relevent to a snapshot which can change
// in the background. unclear if keys are as general though?

// maybe CellFormatter would be a better name?
class CellFormatter {
  const CellFormatter();

  Widget build(FormTuple t) {
    return Container();
  }
}

// an app menu could be nested
typedef Editor = List<Widget> Function(AppTable a, int row);

// maybe this should be "view", it can be a table or view.
class AppTable {
  late App app;
  List<int> all = [];
  List<FormTuple> row_ = [];

  FormTuple operator [](int i) {
    return row_[i];
  }

  List<int> where(String search) {
    if (search.isEmpty) {
      return all;
    }
    search = search.toLowerCase();

    final r = <int>[];
    int i = 0;
    for (var o in row_) {
      for (var k in o.cell) {
        if (k.toLowerCase().startsWith(search)) {
          r.add(i);
        }
        i++;
      }
    }
    return r;
  }

  CellFormatter rowTitle;
  CellFormatter subtitle;
  CellFormatter leading;
  String label = "";

  get length => row_.length;

  // the form for this table is a list of slivers that edit this
  //
  addListener(Function() a) {
    app.addListener(a);
  }

  // a function that build some edit slivers for a tuple
  Editor? editor;

  AppTable(
      {required this.rowTitle,
      this.leading = const CellFormatter(),
      this.subtitle = const CellFormatter(),
      this.label = "",
      this.editor});

  onTap(int x) async {
    // await St
    //udentEditor.show(context, widget.school, o);
  }

  // we could merge menus with the global menu so that we can have local menus.
  // not every table should have insert/delete.
  menu(BuildContext context) async {
    // SettingsDialog.show(context);
    final Cmd? o = await showCmd(context, []);
    if (o != null) {
      //await doCmd(o, context);
    }
  }

  // an add should clear the search and then reposition to the added record.
  void add(BuildContext context) async {
    //widget.school.student.add(r);
    // we need to build a new record in order to edit it.
    // we could later delete it if nothing was added or leave it blank in some cases
    // the validation is tricky here; we need to allow invalid records?
    // would you share invalid records? can you avoid them?
    //await TableEdit.show(context, this, -1);
    // _filter();
  }
}
