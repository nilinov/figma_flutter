import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('FRAME:Frame 1 (0) 259:363:21'),
      decoration: BoxDecoration(
        color: Color(0x00000000),
      ),
      padding: EdgeInsets.only(
        top: 0,
        left: 16,
        right: 16,
        bottom: 0,
      ),
      child: Row(
        children: [
          Container(
            key: Key('WIDGET:app_switch/allowSend:22'),
            decoration: BoxDecoration(
              color: Color(0x00000000),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: SvgPicture.string(
                    '''<svg width="34" height="15" viewBox="0 0 34 15" fill="none" xmlns="http://www.w3.org/2000/svg">
<path opacity="0.38" fill-rule="evenodd" clip-rule="evenodd" d="M0 7.33325C0 3.46726 3.13401 0.333252 7 0.333252H27C30.866 0.333252 34 3.46726 34 7.33325V7.33325C34 11.1992 30.866 14.3333 27 14.3333H7C3.13401 14.3333 0 11.1992 0 7.33325V7.33325Z" fill="#AFBFCE"/>
</svg>
''',
                    key: Key('SVG:rail:23'),
                    width: 34,
                    height: 14,
                  ),
                  top: 3,
                  left: 0,
                ),
                Positioned(
                  child: SvgPicture.string(
                    '''<svg width="26" height="27" viewBox="0 0 26 27" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_ddd)">
<path fill-rule="evenodd" clip-rule="evenodd" d="M3 12.3333C3 6.8104 7.47715 2.33325 13 2.33325V2.33325C18.5228 2.33325 23 6.8104 23 12.3333V12.3333C23 17.8561 18.5228 22.3333 13 22.3333V22.3333C7.47715 22.3333 3 17.8561 3 12.3333V12.3333Z" fill="#AE0148" fill-opacity="0.6"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M3 12.3333C3 6.8104 7.47715 2.33325 13 2.33325V2.33325C18.5228 2.33325 23 6.8104 23 12.3333V12.3333C23 17.8561 18.5228 22.3333 13 22.3333V22.3333C7.47715 22.3333 3 17.8561 3 12.3333V12.3333Z" fill="#AE0148"/>
</g>
<defs>
<filter id="filter0_ddd" x="0" y="0.333252" width="26" height="26" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feOffset dy="1"/>
<feGaussianBlur stdDeviation="1.5"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feOffset dy="2"/>
<feGaussianBlur stdDeviation="1"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.12 0"/>
<feBlend mode="normal" in2="effect1_dropShadow" result="effect2_dropShadow"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"/>
<feOffset/>
<feGaussianBlur stdDeviation="1"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.14 0"/>
<feBlend mode="normal" in2="effect2_dropShadow" result="effect3_dropShadow"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect3_dropShadow" result="shape"/>
</filter>
</defs>
</svg>
''',
                    key: Key('SVG:knob:24'),
                    width: 20,
                    height: 20,
                  ),
                  top: 0,
                  left: 14,
                )
              ],
            ),
          ),
          SizedBox(
            child: null,
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              child: Text("Присылать уведомления",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xdd000000),
                  )),
              width: 362,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
