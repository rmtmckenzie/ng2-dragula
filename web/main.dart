import 'package:angular/angular.dart';
import 'package:ng2_dragula/dragula.dart';
import 'dart:html';
import 'dart:async';

@Component(
    selector: 'app',
    styleUrls: const ['app.css'],
    templateUrl: 'app.html',
    directives: const [Dragula])
class App {
  OnDrop onDrop = (Element el, _, __, ___) {
    return el.classes.add('ex-moved');
  };

  OnDrag onDrag = (Element el, _) {
    return el.classes.remove('ex-moved');
  };

  OnOver onOver = (_, Element container, __) {
    return container.classes.add('ex-over');
  };

  OnOut onOut = (_, Element container, __) {
    return container.classes.remove('ex-over');
  };

  Copy copy = (Element el, Element source) {
    return source == querySelector('#left-copy-1tomany');
  };

  Accepts accepts = (Element el, Element target, Element source,
          Element sibling) {
    return target != querySelector('#left-copy-1tomany');
  };

  Moves moves = (el, container, handle, sibling) {
    return handle.className == 'handle';
  };

  onClick(MouseEvent e, DivElement sortable) {
    DivElement target = e.target;
    if (target == sortable) {
      return;
    }
    target.text += ' [click!]';
    new Future.delayed(
        new Duration(milliseconds: 500),
        () => target.text =
            target.text.replaceAll(new RegExp(r'\[click!\]'), ''));
  }
}

main() {
  bootstrap(App);
}
