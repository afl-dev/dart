class Model {
  String search;
  int index;

  Model({this.search, this.index});
}

void main() {
  /// рисуем елочку
  drawTree(10);

  /// проверяем выражение
  print(checkBracket('()((()))()(') ? 'ok' : 'error');
}

void drawTree(int line) {
  int size = line * 2;
  int lenght = size;
  for (int i = 0; i < lenght; i += 2) {
    print(' ' * (size-- - (lenght ~/ 2) - 1) + '*' * (i + 1));
  }
}

bool checkBracket(String search) {
  List list = <Model>[];
  String bracketOpen = '(';
  String bracketClose = ')';
  for (int i = 0; i < search.length; i++) {
    if (search[i].contains(bracketOpen)) {
      list.add(Model(search: search[i], index: i));
    } else if (search[i].contains(bracketClose)) {
      if (list.isNotEmpty && list.last.search == bracketOpen) {
        list.removeLast();
      } else {
        list.add(Model(search: search[i], index: i));
      }
    }
  }

  if (list.isEmpty) {
    return true;
  }
  list.forEach((e) => print('index: ${e.index} - symbol: ${e.search}'));
  return false;
}
