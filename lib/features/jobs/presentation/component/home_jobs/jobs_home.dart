import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalameha/core/resource_manager/app_images.dart';
import 'package:zalameha/core/resource_manager/app_strings.dart';
import 'package:zalameha/core/theming/colors.dart';
import 'package:zalameha/core/utils/extensions.dart';
import 'package:zalameha/features/jobs/data/models/job_model.dart';

part '../widget/jobs_home_card.dart';

class JobsHome extends StatelessWidget {
  const JobsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.19,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                StringsManager.latestJobs,
                style: context.textTitleLarge(fontSize: context.width * 0.052),
              ),
              const Spacer(),
              SvgPicture.asset(AppImages.arrow, height: context.height * 0.02),
            ],
          ),
          SizedBox(height: context.height * 0.018),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: homeJobs.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: context.width * 0.04),
              itemBuilder: (context, index) =>
                  _JobsHomeCard(job: homeJobs[index]),
            ),
          ),
        ],
      ),
    );
  }
}
