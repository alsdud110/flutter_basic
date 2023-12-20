import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("다양한 Flutter의 입력 알아보기"),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  // checkbox를 쓸 때 bool 타입의 value값을 미리 선언해두고
  late List<bool> values;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values = [false, false, false]; // initState 로 value값을 저장
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // checkbox는 value, onChanged 필수
        Checkbox(
          value: values[0],
          onChanged: (newValue) => setState(() {
            values[0] = newValue!;
          }),
        ),
        Checkbox(
          value: values[1],
          onChanged: (newValue) => setState(() {
            values[1] = newValue!;
          }),
        ),
        Checkbox(
          value: values[2],
          onChanged: (newValue) => setState(() {
            values[2] =
                !values[2]; // 여기서 newValue 는 버튼을 눌렀을 때의 변경되는 값이다. bool 타입
          }),
        ),
      ],
    );
  }
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

enum TestValue {
  test1,
  test2,
  test3;
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestValue? selectValue; // enum 선언

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<TestValue>(
            value: TestValue.test1,
            groupValue: selectValue,
            onChanged: (value) => setState(() {
              print("selectValue : $selectValue");
              print("value : $value");
              selectValue = value!;
              print("selectValue-a : $selectValue");
              print("value-a : $value");
            }),
          ),
          title: Text(TestValue.test1.name),
          // ListTile로 할 때는 onTap 안에 선언한 enum 값이 현재 값인지 확인하고 아니면 같도록 해준다.
          onTap: () => setState(() {
            if (selectValue != TestValue.test1) {
              selectValue = TestValue.test1;
            }
          }),
        ),
        Radio<TestValue>(
          // radio button 을 하려면 value값 enum이 필요하고, 사용 시에는 제네릭을 써야함
          value: TestValue.test2, // enum 값의 value
          groupValue: selectValue, // enum
          onChanged: (value) => setState(() {
            // enum값을 선택한 값(value)로 변경해줘야함
            print("selectValue : $selectValue");
            print("value : $value");
            selectValue = value!;
            print("selectValue-a : $selectValue");
            print("value-a : $value");
          }),
        ),
        Radio<TestValue>(
          value: TestValue.test3,
          groupValue: selectValue,
          onChanged: (value) => setState(() {
            print("selectValue : $selectValue");
            print("value : $value");
            selectValue = value!;
            print("selectValue-a : $selectValue");
            print("value-a : $value");
          }),
        ),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("$value"),
        Slider(
          label: value.round().toString(), // slider 를 움직일 때 마다 보여지는 값
          divisions:
              100, // slider 를 몇개로 쪼갤지, 10으로 하면 0, 10, 20, 30 식으로, 50으로 하면 0, 2, 4, 6, 식으로
          max: 100, // slider max 값
          min: 0, // slider min 값
          value: value, // 지금 slider 값
          activeColor: Colors.red,
          onChanged: (newValue) {
            // 새로운 값으로 setState 해준다
            setState(() {
              value = newValue;
            });
          },
          onChangeEnd: (newValue) {
            // slider를 끝까지 이동하면 사용할 함수
            print('Ended change on $newValue');
          },
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    // switch, cupertinoSwitch 도 value, onChange가 필요함
    return Column(
      children: [
        CupertinoSwitch(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue;
          }),
        ),
        Switch(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue;
          }),
        ),
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue selectValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(selectValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestValue.values
                .map(
                  (value) => PopupMenuItem(
                    value: value,
                    child: Text(value.name),
                  ),
                )
                .toList();
          },
          onSelected: (newValue) {
            setState(() {
              selectValue = newValue;
            });
          },
        ),
      ],
    );
  }
}
