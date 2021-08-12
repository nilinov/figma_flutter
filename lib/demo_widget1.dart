import 'package:flutter_visible/imports.dart';

class frame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        boxShadow: [],
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 108,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(0)),
              boxShadow: [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SizedBox(
                            child: Stack(children: [
                              Positioned(
                                child: Image.asset(AppImages.Image),
                                left: 4,
                                top: 4,
                                right: 4,
                                bottom: 4,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe30613),
                                  ),
                                  child: null,
                                ),
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 0,
                              )
                            ]),
                            width: 68,
                            height: 68,
                          ),
                        ),
                        height: 68,
                        width: 68),
                    SizedBox(height: 4),
                    SizedBox(
                      child: Text("Новинки недели",
                          textAlign: TextAlign.center,
                          style: AppStyledText.num_12_Regular
                              .copyWith(color: AppStyledPaint.Primary_Black)),
                      width: double.infinity,
                    )
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SizedBox(
                            child: Stack(children: [
                              Positioned(
                                child: Image.asset(AppImages.Image),
                                left: 4,
                                top: 4,
                                right: 4,
                                bottom: 4,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe30613),
                                  ),
                                  child: null,
                                ),
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 0,
                              )
                            ]),
                            width: 68,
                            height: 68,
                          ),
                        ),
                        height: 68,
                        width: 68),
                    SizedBox(height: 4),
                    SizedBox(
                      child: Text("Новинки недели",
                          textAlign: TextAlign.center,
                          style: AppStyledText.num_12_Regular
                              .copyWith(color: AppStyledPaint.Primary_Black)),
                      width: double.infinity,
                    )
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SizedBox(
                            child: Stack(children: [
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x3d8a8884),
                                  ),
                                  child: null,
                                ),
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 0,
                              ),
                              Positioned(
                                child: Image.asset(AppImages.Image),
                                left: 4,
                                top: 4,
                                right: 4,
                                bottom: 4,
                              )
                            ]),
                            width: 68,
                            height: 68,
                          ),
                        ),
                        height: 68,
                        width: 68),
                    SizedBox(height: 4),
                    SizedBox(
                      child: Text("Новинки месяца",
                          textAlign: TextAlign.center,
                          style: AppStyledText.num_12_Regular
                              .copyWith(color: AppStyledPaint.Primary_Black)),
                      width: double.infinity,
                    )
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SizedBox(
                            child: Stack(children: [
                              Positioned(
                                child: Image.asset(AppImages.Image),
                                left: 4,
                                top: 4,
                                right: 4,
                                bottom: 4,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe30613),
                                  ),
                                  child: null,
                                ),
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 0,
                              )
                            ]),
                            width: 68,
                            height: 68,
                          ),
                        ),
                        height: 68,
                        width: 68),
                    SizedBox(height: 4),
                    SizedBox(
                      child: Text("Новинки недели",
                          textAlign: TextAlign.center,
                          style: AppStyledText.num_12_Regular
                              .copyWith(color: AppStyledPaint.Primary_Black)),
                      width: double.infinity,
                    )
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: SizedBox(
                            child: Stack(children: [
                              Positioned(
                                child: Image.asset(AppImages.Image),
                                left: 4,
                                top: 4,
                                right: 4,
                                bottom: 4,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffe30613),
                                  ),
                                  child: null,
                                ),
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 0,
                              )
                            ]),
                            width: 68,
                            height: 68,
                          ),
                        ),
                        height: 68,
                        width: 68),
                    SizedBox(height: 4),
                    SizedBox(
                      child: Text("Новинки недели",
                          textAlign: TextAlign.center,
                          style: AppStyledText.num_12_Regular
                              .copyWith(color: AppStyledPaint.Primary_Black)),
                      width: double.infinity,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 35),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppImages.Image),
              SizedBox(height: 12),
              SizedBox(
                child: Text("Супер сет «Крепкий иммунитет»",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff414951),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Open Sans-SemiBold",
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0)),
                width: double.infinity,
              )
            ],
          )
        ],
      ),
    );
  }
}
