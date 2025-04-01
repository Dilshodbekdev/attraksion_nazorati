import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final String img;
  final String btnText;
  final Color bgColor;
  final Color btnColor;
  final VoidCallback onClick;

  const HomeCardWidget({
    super.key,
    required this.title,
    required this.btnText,
    required this.bgColor,
    required this.btnColor,
    required this.onClick,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 140,
        child: Stack(
          children: [
            Positioned(
              right: 0,
                child: Image.asset(img,fit: BoxFit.cover,height: 140,)),
            Positioned(
              left: 16,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: btnColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () => onClick(),
                    child: Ink(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(69), color: btnColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              btnText,
                              style: TextStyle(
                                color: bgColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8,),
                            SvgPicture.asset(
                              'assets/icons/ic_arrow_right.svg',
                              color: bgColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
