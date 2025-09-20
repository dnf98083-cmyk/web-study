// dart 기본 문법
void main() {
  print('Hello, Dart!');
}


//변수 /Null safety/Null-aware
void main() {
  // 타입 추론
  var title = 'Flutter TIL';

  // 명시적 타입 + Null Safety
  String? bookName;            // null 허용
  print(bookName ?? 'No book'); // null이면 기본값 출력

  // null-safe access
  print(bookName?.length);     // null이면 null
}

//3숫자/문자열/멀티라인
void main() {
  int age = 20;
  double height = 175.5;
  var multi = '''
여러 줄
문자열
''';
  print('$age / $height');
  print(multi);
}
//컬렉션
void main() {
  // List
  var nums = [1, 2, 3];
  nums.add(4);
  var fixed = List<int>.filled(3, 0); // [0,0,0]

  // Set (중복 제거)
  var fruits = <String>{'사과', '바나나', '사과'}; // {사과, 바나나}

  // Map
  var person = {'name': '우림', 'age': 23};

  print(nums);
  print(fixed);
  print(fruits);
  print(person['name']);
}
//연산자 조거 반복
void main() {
  // 산술/비교/삼항
  print(5 + 3);
  print(5 >= 3);
  var status = (20 >= 18) ? '성인' : '미성년자';
  print(status);

  // if-else
  int score = 82;
  if (score >= 90) print('A');
  else if (score >= 80) print('B');
  else print('C');

  // for / for-in / while
  for (int i = 0; i < 3; i++) print(i);
  for (var n in [10, 20, 30]) print(n);
  int c = 0; while (c < 2) { print('loop $c'); c++; }
}
</String>
// 함수 위치 이름 지정파라미터
int add(int a, int b) => a + b;

String createUser({required String name, int? age}) {
  return 'User: $name, Age: ${age ?? 'Unknown'}';
}

void main() {
  print(add(3, 5));
  print(createUser(name: '우림'));
  print(createUser(name: '우림', age: 23));
}
//객체지향:클래스 상속/override
class Person {
  final String name;
  final int age;
  Person({required this.name, required this.age});
  void introduce() => print('저는 $name, $age살입니다.');
}

class Student extends Person {
  final String school;
  Student({required super.name, required super.age, required this.school});
  @override
  void introduce() {
    super.introduce();
    print('$school에 다닙니다.');
  }
}

void main() {
  final s = Student(name: '우림', age: 23, school: 'Shingu Univ.');
  s.introduce();
}
//Dart 3.x: Records & 패턴 매칭
void main() {
  // Records (그룹화/구조분해)
  var person = ('우림', 23, 'developer');
  var (name, age, job) = person;
  print('$name / $age / $job');

  // Named record
  var user = (name: '우림', level: 1);
  print(user.name); // 우림

  // 패턴 매칭 switch
  var data = [1, 2, 3];
  switch (data) {
    case [1, 2, 3]:
      print('정확히 1,2,3');
    case [..., var last]:
      print('마지막 요소: $last');
  }
}
