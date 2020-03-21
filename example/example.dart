import 'package:hashcode_combine/hashcode_combine.dart';

main() {
  int test1 = 1234;
  double test2 = 56.78;
  String test3 = "hejsan";
  String test4 = null;
  var hashCode = HashCode.combine(test1, test2, test3, test4);
  print(hashCode);
}
