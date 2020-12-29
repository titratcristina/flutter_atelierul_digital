// // map
// // where
// // expand
// // toList
//
// void main() {
//   final int age = 18;
//   const int year = 1992;
//
//   final Set<int> set = <int>{0, 1, 2, 3};
//
//   // final list<String> = <int>[0, 1, 2, 3] //
//   //   .map((int element) => '$element****')
//   //   .toList();
//
//   // final List <String> list = <int>[0, 1, 2, 3] //
//   //     .expand((int element) => '$element****')
//   //     .toList();
//   //
//   // print(list);
//
//   // final List<String> result = <String>[];
//   // final List<int> ints = <int>[0, 1, 2, 3];
//   // for (int i = 0; i < ints.length; i++) {
//   //   final int element = ints[i];
//   //   // if () {
//   //   //
//   //   // }
//   //   result.addAll([element, element])
//   // }
//
//   // print(result);
//
//   // -------------------
//   // MAPS - are 2 tipuri
//   // keys
//   // entries
//   // final Map<String, int> map =<String, int>{
//   //   'name' : 0,
//   //   'name' : 1,
//   // };
//   // se ia ultima valoare
//
//   final Map<String, int> map = <String, int>{
//     'name': 0,
//     ...<String, int>{
//       'name': 1,
//     }
//   };
//
//   // map['name'] = 10;
//
//   print(map);
//   print(map['name']);
//   print(map.keys);
//   print(map.entries);
//
//   final List<int> list = <int>[
//     0,
//     1,
//     if (2 % 2 == 0) ...<int>[
//       2,
//       3,
//     ],
//   ];
//
//   print(list);
//
//   // switch (map) {
//   //   case 0:
//   //     break;
//   //   default:
//   // }
//
//   do {
//     //
//   } while (true);
//
//   while (true) {
//     //
//   }
// }
//
// // required positioned
// // optional positioned
// // optional named
//
// // class Car {
// //   Car(this.wheelNumber, this.gearCount);
// //   final int wheelNumber;
// //   final int gearCount;
// // }
//
// void main() {
//   final Dog dog = Dog();
//   dog.eat();
//   dog.makeASound();
//   dog.makeASound(fathersName: '');
// }
//
// class Dog with Behavior {
//   @override
//   string get sound => 'tit';
// }
//
// class Dog with Behavior implements Animal {
//   Dog(String name) :
//         assert(name != null)
//         super('name');
//
//   @override
//   void eat() {
//     //implement eat
//   }
//
//   @override
//   string get sound => 'bark'
// }
//
// abstract class Animal {
//   Animal(this.name);
//
//   final String name;
//
//   void eat();
//
//   @override
//   bool operator ==(Object other) {
//     identical(this, other) || other is Animal && runtimeType == other.runtimeType && name == other.name;
//   }
// }
//
// mixin Behavior {
//   String get sound;
//
//   void makeASound({String familyName, String firstName, String fathersName}) {
//     print('bark');
//   }
// }
