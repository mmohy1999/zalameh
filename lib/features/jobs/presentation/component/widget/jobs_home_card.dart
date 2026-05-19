part of '../home_jobs/jobs_home.dart';

class _JobsHomeCard extends StatelessWidget {
  const _JobsHomeCard({required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.035),
      decoration: BoxDecoration(
        color: ColorsManager.jobFillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsManager.grayPageDots),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  job.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: context.textTitleLarge(
                    fontSize: context.width * 0.043,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                SizedBox(height: context.height * 0.012),
                Text(
                  job.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: context.textBodyLarge(
                    fontSize: context.width * 0.03,
                    color: ColorsManager.black,
                  ),
                ),
                SizedBox(height: context.height * 0.012),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _JobInfoChip(icon: AppImages.location, label: job.location),
                    SizedBox(width: context.width * 0.025),

                    _JobInfoChip(icon: AppImages.workTime, label: job.type),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            AppImages.arrowShort,
            width: context.width * 0.018,
            height: context.height * 0.024,
          ),
        ],
      ),
    );
  }
}

class _JobInfoChip extends StatelessWidget {
  const _JobInfoChip({required this.icon, required this.label});

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.015,
          vertical: context.height * 0.006,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.grayPageDots,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorsManager.grayPageDots),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: context.width * 0.035,
              height: context.width * 0.035,
            ),
            SizedBox(width: context.width * 0.005),

            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textBodyLarge(
                  fontSize: context.width * 0.028,
                  color: ColorsManager.blackText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
