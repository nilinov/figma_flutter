import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_visible/components/_components.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(
          '{type: WIDGET, value: Align(alignment: Alignment.topLeft), name: FRAME:Frame 3 (0) 291:374}'),
      width: 407,
      height: 321,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      child: Align(
        child: Container(
          key: ValueKey(
              '{type: WIDGET, value: Column(direction: vertical, mainAxisAlignment: center, crossAxisAlignment: start), name: Frame 1}'),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Text("Поделиться купоном",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff141e2e),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto-Bold",
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.23000000417232513)),
                  width: double.infinity),
              SizedBox(height: 27),
              SizedBox(
                  child: Text(
                      "Введите номер телефона друга, с которым вы хотите поделиться этим купоном",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff141e2e),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto-Regular",
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.23000000417232513)),
                  width: double.infinity),
              SizedBox(height: 27),
              Container(
                key: ValueKey(
                    '{type: WIDGET, value: Container-[<WIDGET:input>](padding: EdgeInsets.zero, bg: BoxDecoration(color: Color(0x00000000), border: Border.all(BorderSide(Color(0x00000000), 0.0, BorderStyle.solid)), borderRadius: BorderRadius.zero)), name: input}'),
                decoration: BoxDecoration(
                  color: Color(0x00000000),
                  border: Border.all(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.zero,
                  boxShadow: [],
                ),
                padding: EdgeInsets.zero,
                child: AppInput(
                  placeholder: "Номер телефона",
                  label: "Номер телефона",
                  borderDefaultColor: Color(0xff8a96a5),
                  borderFocusColor: Color(0xffae0148),
                  isAnimatedLabel: false,
                  styleLabel: TextStyle(
                      fontSize: 13,
                      color: Color(0xff8a96a5),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto-Regular",
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.07999999821186066),
                ),
                height: 40,
              ),
              SizedBox(height: 27),
              AppButton(
                title: Text("Поделиться купоном",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto-Black",
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.4099999964237213)),
                bg: Color(0xffae0148),
                bgTapped: Color(0x99ae0148),
                height: 59,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                onTap: () {},
              )
            ],
          ),
        ),
        alignment: Alignment.topLeft,
      ),
    );
  }
}
