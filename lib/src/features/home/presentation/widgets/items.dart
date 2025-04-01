import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/components/app_elevated_button.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/features/home/data/models/leadership_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

Widget buildLeadershipItem(BuildContext context, LeadershipModel? model) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/img_placeholder.jpg'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/img_placeholder.jpg',
                      fit: BoxFit.cover);
                },
                image: NetworkImage(model?.avatar ?? ''),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${model?.lastName} ${model?.firstName}\n${model?.fatherName}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.mainColor),
          ),
          const SizedBox(height: 10),
          Text(
            model?.position ?? '--',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.secondaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/call.svg',
                    height: 16,
                    color: AppColors.mainColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    S.of(context).phone,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryTextColor),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              model?.phone ?? '--',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    height: 16,
                    color: AppColors.mainColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    S.of(context).reception_days,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryTextColor),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              model?.receptionTime ?? '--',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: AppElevatedButton(
                      text: S.of(context).biography,
                      onClick: model?.biography != null
                          ? () {
                              context.pushNamed(AppRoutes.biography.name,
                                  pathParameters: {
                                    "text": model?.biography ?? ''
                                  });
                            }
                          : null)),
              const SizedBox(width: 12),
              Expanded(
                  child: AppElevatedButton(
                      text: S.of(context).functions,
                      onClick: model?.functions != null
                          ? () {
                              context.pushNamed(AppRoutes.functions.name,
                                  pathParameters: {
                                    "text": model?.functions ?? ''
                                  });
                            }
                          : null)),
            ],
          )
        ],
      ),
    ),
  );
}
