import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('''1_null'''),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        key: Key('''2_null'''),
        children: [
          Container(
            key: Key('''3_null'''),
            decoration: BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            child: Row(
              key: Key('''4_null'''),
              children: [
                SvgPicture.string(
                  '''<svg width="44" height="44" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M14.5059 29.5058L22.0353 21.9765L14.416 14.3572" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
<path d="M29.4672 14.4436L22.0117 21.8991L29.5563 29.4437" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
</svg>
'>]''',
                  key: Key(
                      '''5_[<'SVG:<svg width="44" height="44" viewBox="0 0 44 44" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M14.5059 29.5058L22.0353 21.9765L14.416 14.3572" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
<path d="M29.4672 14.4436L22.0117 21.8991L29.5563 29.4437" stroke="#8A96A5" stroke-width="2.2" stroke-linejoin="round"/>
</svg>
'>]'''),
                  width: 44,
                  height: 44,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          SizedBox(
            key: Key('''6_null'''),
            child: null,
            height: 143,
          ),
          Container(
            key: Key('''7_null'''),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              key: Key('''8_null'''),
              children: [
                Container(
                  key: Key('''9_null'''),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Stack(
                    key: Key('''10_null'''),
                    children: [
                      Positioned(
                        key: Key('''11_null'''),
                        child: SvgPicture.string(
                          '''<svg width="121" height="88" viewBox="0 0 121 88" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M37.4186 20.3652V17.9442L33.2093 19.147L37.4186 20.3652Z" fill="#141E2E"/>
<path d="M37.4186 45.7845V43.3636L33.2093 44.5663L37.4186 45.7845Z" fill="#141E2E"/>
<path d="M34.3267 54.1898C35.2144 54.1898 35.6583 54.7192 35.6583 55.7781V56.7958H33.0256V55.7626C33.0256 55.2281 33.1225 54.8323 33.3164 54.5753C33.5103 54.3183 33.8266 54.1898 34.2654 54.1898H34.3267Z" fill="#141E2E"/>
<path d="M37.4186 68.2975V65.8765L33.2093 67.0793L37.4186 68.2975Z" fill="#141E2E"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.5 5.17647C0.5 2.31758 2.82149 0 5.68518 0H115.315C118.179 0 120.5 2.31758 120.5 5.17647V82.8235C120.5 85.6824 118.179 88 115.315 88H5.68519C2.82149 88 0.5 85.6824 0.5 82.8235V5.17647ZM5.68518 2.95798C4.45789 2.95798 3.46296 3.95123 3.46296 5.17647V82.8235C3.46296 84.0488 4.45789 85.042 5.68519 85.042H20.6852V2.95798H5.68518ZM69.6639 85.042H52.7222V56.3741L69.6639 85.042ZM115.315 85.042H105.795L77.537 40.6723L104.495 2.95798H115.315C116.542 2.95798 117.537 3.95124 117.537 5.17647V82.8235C117.537 84.0488 116.542 85.042 115.315 85.042ZM52.7222 2.95798H71.8483L52.7222 31.1934V2.95798ZM30.6684 14.26L36.9288 10.6671H41.6126V7.49051L36.9288 7.49051L30.6684 4.06721V7.08958L34.3573 8.95543L30.6684 10.8213V14.26ZM30.6684 20.982V16.8957L41.6126 13.3953V16.7415L39.5768 17.3274V20.982L41.6126 21.568V24.5133L30.6684 20.982ZM30.6684 35.7774V38.9694L41.6126 36.4096V33.3256L34.6634 31.6139L41.6126 29.9177V26.6178L30.6684 24.0426V26.9724L37.5564 28.4682L30.6684 30.0719V32.8784L37.4951 34.3587L30.6684 35.7774ZM30.6684 46.4014V42.315L41.6126 38.8146V42.1608L39.5768 42.7467V46.4014L41.6126 46.9873V49.9326L30.6684 46.4014ZM30.6684 55.6239V59.9415H41.6126L41.6126 56.7958H37.6941V56.0556L41.6126 53.8197V50.4889L37.0819 53.1258C36.5716 51.7996 35.6124 51.1366 34.2042 51.1366H34.143C32.9899 51.1366 32.1225 51.5221 31.5408 52.2931C30.9592 53.0538 30.6684 54.1641 30.6684 55.6239ZM30.6684 68.9143V64.828L41.6126 61.3276V64.6738L39.5768 65.2597V68.9143L41.6126 69.5003V72.4456L30.6684 68.9143ZM41.7963 77.9961C41.7963 79.898 41.2861 81.3372 40.2656 82.3138C39.3064 83.2699 37.9543 83.7479 36.2094 83.7479H36.0869C34.4236 83.7479 33.0715 83.2133 32.0307 82.1442C31.0102 81.0956 30.5 79.754 30.5 78.1195C30.5 76.67 30.8367 75.4878 31.5102 74.5728C32.2348 73.6476 33.3011 73.1233 34.7093 73V76.2536C33.5562 76.377 32.9797 76.9938 32.9797 78.1041C32.9797 78.8237 33.2501 79.3891 33.7909 79.8003C34.3216 80.2115 35.0818 80.4171 36.0716 80.4171H36.1941C37.1839 80.4171 37.9492 80.2166 38.4901 79.8157C39.0207 79.4045 39.286 78.8185 39.286 78.0578C39.286 76.855 38.6891 76.1714 37.4951 76.0069V72.8612C38.8625 72.964 39.934 73.4883 40.7095 74.4341C41.434 75.349 41.7963 76.5363 41.7963 77.9961Z" fill="#141E2E"/>
</svg>
'>]''',
                          key: Key(
                              '''12_[<'SVG:<svg width="121" height="88" viewBox="0 0 121 88" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M37.4186 20.3652V17.9442L33.2093 19.147L37.4186 20.3652Z" fill="#141E2E"/>
<path d="M37.4186 45.7845V43.3636L33.2093 44.5663L37.4186 45.7845Z" fill="#141E2E"/>
<path d="M34.3267 54.1898C35.2144 54.1898 35.6583 54.7192 35.6583 55.7781V56.7958H33.0256V55.7626C33.0256 55.2281 33.1225 54.8323 33.3164 54.5753C33.5103 54.3183 33.8266 54.1898 34.2654 54.1898H34.3267Z" fill="#141E2E"/>
<path d="M37.4186 68.2975V65.8765L33.2093 67.0793L37.4186 68.2975Z" fill="#141E2E"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M0.5 5.17647C0.5 2.31758 2.82149 0 5.68518 0H115.315C118.179 0 120.5 2.31758 120.5 5.17647V82.8235C120.5 85.6824 118.179 88 115.315 88H5.68519C2.82149 88 0.5 85.6824 0.5 82.8235V5.17647ZM5.68518 2.95798C4.45789 2.95798 3.46296 3.95123 3.46296 5.17647V82.8235C3.46296 84.0488 4.45789 85.042 5.68519 85.042H20.6852V2.95798H5.68518ZM69.6639 85.042H52.7222V56.3741L69.6639 85.042ZM115.315 85.042H105.795L77.537 40.6723L104.495 2.95798H115.315C116.542 2.95798 117.537 3.95124 117.537 5.17647V82.8235C117.537 84.0488 116.542 85.042 115.315 85.042ZM52.7222 2.95798H71.8483L52.7222 31.1934V2.95798ZM30.6684 14.26L36.9288 10.6671H41.6126V7.49051L36.9288 7.49051L30.6684 4.06721V7.08958L34.3573 8.95543L30.6684 10.8213V14.26ZM30.6684 20.982V16.8957L41.6126 13.3953V16.7415L39.5768 17.3274V20.982L41.6126 21.568V24.5133L30.6684 20.982ZM30.6684 35.7774V38.9694L41.6126 36.4096V33.3256L34.6634 31.6139L41.6126 29.9177V26.6178L30.6684 24.0426V26.9724L37.5564 28.4682L30.6684 30.0719V32.8784L37.4951 34.3587L30.6684 35.7774ZM30.6684 46.4014V42.315L41.6126 38.8146V42.1608L39.5768 42.7467V46.4014L41.6126 46.9873V49.9326L30.6684 46.4014ZM30.6684 55.6239V59.9415H41.6126L41.6126 56.7958H37.6941V56.0556L41.6126 53.8197V50.4889L37.0819 53.1258C36.5716 51.7996 35.6124 51.1366 34.2042 51.1366H34.143C32.9899 51.1366 32.1225 51.5221 31.5408 52.2931C30.9592 53.0538 30.6684 54.1641 30.6684 55.6239ZM30.6684 68.9143V64.828L41.6126 61.3276V64.6738L39.5768 65.2597V68.9143L41.6126 69.5003V72.4456L30.6684 68.9143ZM41.7963 77.9961C41.7963 79.898 41.2861 81.3372 40.2656 82.3138C39.3064 83.2699 37.9543 83.7479 36.2094 83.7479H36.0869C34.4236 83.7479 33.0715 83.2133 32.0307 82.1442C31.0102 81.0956 30.5 79.754 30.5 78.1195C30.5 76.67 30.8367 75.4878 31.5102 74.5728C32.2348 73.6476 33.3011 73.1233 34.7093 73V76.2536C33.5562 76.377 32.9797 76.9938 32.9797 78.1041C32.9797 78.8237 33.2501 79.3891 33.7909 79.8003C34.3216 80.2115 35.0818 80.4171 36.0716 80.4171H36.1941C37.1839 80.4171 37.9492 80.2166 38.4901 79.8157C39.0207 79.4045 39.286 78.8185 39.286 78.0578C39.286 76.855 38.6891 76.1714 37.4951 76.0069V72.8612C38.8625 72.964 39.934 73.4883 40.7095 74.4341C41.434 75.349 41.7963 76.5363 41.7963 77.9961Z" fill="#141E2E"/>
</svg>
'>]'''),
                          width: 119.99999237060547,
                          height: 88,
                        ),
                        top: 0,
                        left: 0,
                      )
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          SizedBox(
            key: Key('''13_null'''),
            child: null,
            height: 143,
          ),
          Container(
            key: Key('''14_null'''),
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
              key: Key('''15_null'''),
              children: [
                Container(
                  key: Key('''16_null'''),
                  decoration: BoxDecoration(
                    color: Color(0x00000000),
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    key: Key('''17_null'''),
                    children: [
                      Expanded(
                        key: Key('''18_null'''),
                        child: Text("Номер телефона",
                            key: Key('''19_null'''),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff8a96a5),
                            )),
                      ),
                      SvgPicture.string(
                        '''<svg width="21" height="16" viewBox="0 0 21 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.68506 3L10.6851 8L5.68506 13" stroke="#8A96A5" stroke-width="1.8"/>
</svg>
'>]''',
                        key: Key(
                            '''20_[<'SVG:<svg width="21" height="16" viewBox="0 0 21 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M5.68506 3L10.6851 8L5.68506 13" stroke="#8A96A5" stroke-width="1.8"/>
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
                  '''<svg width="391" height="2" viewBox="0 0 391 2" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 1L391 1" stroke="#E4E7ED" stroke-width="0.5"/>
</svg>
'>]''',
                  key: Key(
                      '''21_[<'SVG:<svg width="391" height="2" viewBox="0 0 391 2" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 1L391 1" stroke="#E4E7ED" stroke-width="0.5"/>
</svg>
'>]'''),
                  width: 391,
                  height: 0,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          SizedBox(
            key: Key('''22_null'''),
            child: null,
            height: 143,
          ),
          Container(
            key: Key('''23_null'''),
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
              key: Key('''24_null'''),
              children: [
                Container(
                  key: Key('''25_[<'INSTANCE:btn / primary'>]'''),
                  decoration: BoxDecoration(
                    color: Color(0xffafbfce),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    key: Key('''26_null'''),
                    children: [
                      Positioned(
                        key: Key('''27_null'''),
                        child: Expanded(
                          key: Key('''28_null'''),
                          child: Text("Получить код",
                              key: Key('''29_null'''),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xffffffff),
                              )),
                        ),
                        top: 14,
                        left: 133.0612335205078,
                      )
                    ],
                  ),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          SizedBox(
            key: Key('''30_null'''),
            child: null,
            height: 143,
          ),
          Container(
            key: Key('''31_null'''),
            decoration: BoxDecoration(
              color: Color(0x00000000),
              borderRadius: BorderRadius.zero,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              key: Key('''32_null'''),
              children: [
                Expanded(
                  key: Key('''33_null'''),
                  child: Text(
                      "Регистрируясь в системе, вы соглашаетесь с политикой конфиденциальности",
                      key: Key('''34_null'''),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: null,
                      )),
                )
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
