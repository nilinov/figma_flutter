import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 431,
      height: 994,
      key: Key('''1_null'''),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        key: Key('''2_null'''),
        children: [
/*          Container(
            key: Key('''3_null'''),
            decoration: BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              key: Key('''4_null'''),
              children: [
                SvgPicture.string(
                  '''<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.50595 20.5058L13.0353 12.9765L5.41602 5.35718" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
<path d="M20.4672 5.4436L13.0117 12.8991L20.5563 20.4437" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
</svg>
'>]''',
                  key: Key(
                      '''5_[<'SVG:<svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.50595 20.5058L13.0353 12.9765L5.41602 5.35718" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
<path d="M20.4672 5.4436L13.0117 12.8991L20.5563 20.4437" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
</svg>
'>]'''),
                  width: 26,
                  height: 26,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),*/
/*
          Container(
            key: Key('''6_null'''),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              key: Key('''7_null'''),
              children: [
                Expanded(
                  child: Container(
                    key: Key('''8_null'''),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Stack(
                      key: Key('''9_null'''),
                      children: [
                        Positioned(
                          key: Key('''10_null'''),
                          child: SvgPicture.string(
                            '''<svg width="121" height="89" viewBox="0 0 121 89" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M37.4186 21.1152V18.6942L33.2093 19.897L37.4186 21.1152Z" fill="#141E2E"/>
<path d="M37.4186 46.5345V44.1136L33.2093 45.3163L37.4186 46.5345Z" fill="#141E2E"/>
<path d="M34.3267 54.9398C35.2144 54.9398 35.6583 55.4692 35.6583 56.5281V57.5458H33.0256V56.5126C33.0256 55.9781 33.1225 55.5823 33.3164 55.3253C33.5103 55.0683 33.8266 54.9398 34.2654 54.9398H34.3267Z" fill="#141E2E"/>
<path d="M37.4186 69.0475V66.6265L33.2093 67.8293L37.4186 69.0475Z" fill="#141E2E"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.5 5.92647C0.5 3.06758 2.82149 0.75 5.68518 0.75H115.315C118.179 0.75 120.5 3.06758 120.5 5.92647V83.5735C120.5 86.4324 118.179 88.75 115.315 88.75H5.68519C2.82149 88.75 0.5 86.4324 0.5 83.5735V5.92647ZM5.68518 3.70798C4.45789 3.70798 3.46296 4.70123 3.46296 5.92647V83.5735C3.46296 84.7988 4.45789 85.792 5.68519 85.792H20.6852V3.70798H5.68518ZM69.6639 85.792H52.7222V57.1241L69.6639 85.792ZM115.315 85.792H105.795L77.537 41.4223L104.495 3.70798H115.315C116.542 3.70798 117.537 4.70124 117.537 5.92647V83.5735C117.537 84.7988 116.542 85.792 115.315 85.792ZM52.7222 3.70798H71.8483L52.7222 31.9434V3.70798ZM30.6684 15.01L36.9288 11.4171H41.6126V8.24051L36.9288 8.24051L30.6684 4.81721V7.83958L34.3573 9.70543L30.6684 11.5713V15.01ZM30.6684 21.732V17.6457L41.6126 14.1453V17.4915L39.5768 18.0774V21.732L41.6126 22.318V25.2633L30.6684 21.732ZM30.6684 36.5274V39.7194L41.6126 37.1596V34.0756L34.6634 32.3639L41.6126 30.6677V27.3678L30.6684 24.7926V27.7224L37.5564 29.2182L30.6684 30.8219V33.6284L37.4951 35.1087L30.6684 36.5274ZM30.6684 47.1514V43.065L41.6126 39.5646V42.9108L39.5768 43.4967V47.1514L41.6126 47.7373V50.6826L30.6684 47.1514ZM30.6684 56.3739V60.6915H41.6126L41.6126 57.5458H37.6941V56.8056L41.6126 54.5697V51.2389L37.0819 53.8758C36.5716 52.5496 35.6124 51.8866 34.2042 51.8866H34.143C32.9899 51.8866 32.1225 52.2721 31.5408 53.0431C30.9592 53.8038 30.6684 54.9141 30.6684 56.3739ZM30.6684 69.6643V65.578L41.6126 62.0776V65.4238L39.5768 66.0097V69.6643L41.6126 70.2503V73.1956L30.6684 69.6643ZM41.7963 78.7461C41.7963 80.648 41.2861 82.0872 40.2656 83.0638C39.3064 84.0199 37.9543 84.4979 36.2094 84.4979H36.0869C34.4236 84.4979 33.0715 83.9633 32.0307 82.8942C31.0102 81.8456 30.5 80.504 30.5 78.8695C30.5 77.42 30.8367 76.2378 31.5102 75.3228C32.2348 74.3976 33.3011 73.8733 34.7093 73.75V77.0036C33.5562 77.127 32.9797 77.7438 32.9797 78.8541C32.9797 79.5737 33.2501 80.1391 33.7909 80.5503C34.3216 80.9615 35.0818 81.1671 36.0716 81.1671H36.1941C37.1839 81.1671 37.9492 80.9666 38.4901 80.5657C39.0207 80.1545 39.286 79.5685 39.286 78.8078C39.286 77.605 38.6891 76.9214 37.4951 76.7569V73.6112C38.8625 73.714 39.934 74.2383 40.7095 75.1841C41.434 76.099 41.7963 77.2863 41.7963 78.7461Z" fill="#141E2E"/>
</svg>
'>]''',
                            key: Key(
                                '''11_[<'SVG:<svg width="121" height="89" viewBox="0 0 121 89" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M37.4186 21.1152V18.6942L33.2093 19.897L37.4186 21.1152Z" fill="#141E2E"/>
<path d="M37.4186 46.5345V44.1136L33.2093 45.3163L37.4186 46.5345Z" fill="#141E2E"/>
<path d="M34.3267 54.9398C35.2144 54.9398 35.6583 55.4692 35.6583 56.5281V57.5458H33.0256V56.5126C33.0256 55.9781 33.1225 55.5823 33.3164 55.3253C33.5103 55.0683 33.8266 54.9398 34.2654 54.9398H34.3267Z" fill="#141E2E"/>
<path d="M37.4186 69.0475V66.6265L33.2093 67.8293L37.4186 69.0475Z" fill="#141E2E"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.5 5.92647C0.5 3.06758 2.82149 0.75 5.68518 0.75H115.315C118.179 0.75 120.5 3.06758 120.5 5.92647V83.5735C120.5 86.4324 118.179 88.75 115.315 88.75H5.68519C2.82149 88.75 0.5 86.4324 0.5 83.5735V5.92647ZM5.68518 3.70798C4.45789 3.70798 3.46296 4.70123 3.46296 5.92647V83.5735C3.46296 84.7988 4.45789 85.792 5.68519 85.792H20.6852V3.70798H5.68518ZM69.6639 85.792H52.7222V57.1241L69.6639 85.792ZM115.315 85.792H105.795L77.537 41.4223L104.495 3.70798H115.315C116.542 3.70798 117.537 4.70124 117.537 5.92647V83.5735C117.537 84.7988 116.542 85.792 115.315 85.792ZM52.7222 3.70798H71.8483L52.7222 31.9434V3.70798ZM30.6684 15.01L36.9288 11.4171H41.6126V8.24051L36.9288 8.24051L30.6684 4.81721V7.83958L34.3573 9.70543L30.6684 11.5713V15.01ZM30.6684 21.732V17.6457L41.6126 14.1453V17.4915L39.5768 18.0774V21.732L41.6126 22.318V25.2633L30.6684 21.732ZM30.6684 36.5274V39.7194L41.6126 37.1596V34.0756L34.6634 32.3639L41.6126 30.6677V27.3678L30.6684 24.7926V27.7224L37.5564 29.2182L30.6684 30.8219V33.6284L37.4951 35.1087L30.6684 36.5274ZM30.6684 47.1514V43.065L41.6126 39.5646V42.9108L39.5768 43.4967V47.1514L41.6126 47.7373V50.6826L30.6684 47.1514ZM30.6684 56.3739V60.6915H41.6126L41.6126 57.5458H37.6941V56.8056L41.6126 54.5697V51.2389L37.0819 53.8758C36.5716 52.5496 35.6124 51.8866 34.2042 51.8866H34.143C32.9899 51.8866 32.1225 52.2721 31.5408 53.0431C30.9592 53.8038 30.6684 54.9141 30.6684 56.3739ZM30.6684 69.6643V65.578L41.6126 62.0776V65.4238L39.5768 66.0097V69.6643L41.6126 70.2503V73.1956L30.6684 69.6643ZM41.7963 78.7461C41.7963 80.648 41.2861 82.0872 40.2656 83.0638C39.3064 84.0199 37.9543 84.4979 36.2094 84.4979H36.0869C34.4236 84.4979 33.0715 83.9633 32.0307 82.8942C31.0102 81.8456 30.5 80.504 30.5 78.8695C30.5 77.42 30.8367 76.2378 31.5102 75.3228C32.2348 74.3976 33.3011 73.8733 34.7093 73.75V77.0036C33.5562 77.127 32.9797 77.7438 32.9797 78.8541C32.9797 79.5737 33.2501 80.1391 33.7909 80.5503C34.3216 80.9615 35.0818 81.1671 36.0716 81.1671H36.1941C37.1839 81.1671 37.9492 80.9666 38.4901 80.5657C39.0207 80.1545 39.286 79.5685 39.286 78.8078C39.286 77.605 38.6891 76.9214 37.4951 76.7569V73.6112C38.8625 73.714 39.934 74.2383 40.7095 75.1841C41.434 76.099 41.7963 77.2863 41.7963 78.7461Z" fill="#141E2E"/>
</svg>
'>]'''),
                            width: 119.99999237060547,
                            height: 88,
                          ),
                          left: 0,
                          top: 0,
                          width: 119.99999237060547,
                          height: 88,
                        )
                      ],
                    ),
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          Container(
            key: Key('''12_null'''),
            decoration: BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.only(
              top: 0,
              left: 16,
              right: 0,
              bottom: 0,
            ),
            child: Column(
              key: Key('''13_null'''),
              children: [
                Container(
                  key: Key('''14_null'''),
                  decoration: BoxDecoration(
                    color: Color(0x00000000),
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    key: Key('''15_null'''),
                    children: [
                      Expanded(
                        key: Key('''16_null'''),
                        child: Text("Номер телефона",
                            key: Key('''17_null'''),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff8a96a5),
                            )),
                      ),
                      SvgPicture.string(
                        '''<svg width="21" height="17" viewBox="0 0 21 17" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.68506 3.5L10.6851 8.5L5.68506 13.5" stroke="#8A96A5" stroke-width="1.8"/>
</svg>
'>]''',
                        key: Key(
                            '''18_[<'SVG:<svg width="21" height="17" viewBox="0 0 21 17" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.68506 3.5L10.6851 8.5L5.68506 13.5" stroke="#8A96A5" stroke-width="1.8"/>
</svg>
'>]'''),
                        width: 20.815046310424805,
                        height: 16,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                SvgPicture.string(
                  '''<svg width="415" height="1" viewBox="0 0 415 1" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 0.5L415 0.5" stroke="#E4E7ED" stroke-width="0.5"/>
</svg>
'>]''',
                  key: Key(
                      '''19_[<'SVG:<svg width="415" height="1" viewBox="0 0 415 1" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 0.5L415 0.5" stroke="#E4E7ED" stroke-width="0.5"/>
</svg>
'>]'''),
                  width: 415,
                  height: 0,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          Container(
            key: Key('''20_null'''),
            decoration: BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.only(
              top: 0,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            child: Column(
              key: Key('''21_null'''),
              children: [
                Container(
                  key: Key('''22_[<'INSTANCE:btn / primary'>]'''),
                  decoration: BoxDecoration(
                    color: Color(0xffafbfce),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    key: Key('''23_null'''),
                    children: [
                      Positioned(
                        key: Key('''24_null'''),
                        child: Text("Получить код",
                            key: Key('''25_null'''),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xffffffff),
                            )),
                        left: 145.85714721679688,
                        top: 14,
                        width: 107,
                        height: 22,
                      )
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
*/
          Container(
            key: Key('''26_null'''),
            decoration: BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              key: Key('''27_null'''),
              children: [
                Text(
                    "Регистрируясь в системе, вы соглашаетесь с политикой конфиденциальности",
                    key: Key('''29_null'''),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: null,
                    ))
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
