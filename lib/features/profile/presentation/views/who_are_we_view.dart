import 'package:flutter/material.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';

class WhoAreWeView extends StatelessWidget {
  const WhoAreWeView({super.key});
  static const routeName = 'whoarewe';
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF2A2A2A) : Colors.white;
    final textColor1 = isDarkMode ? Colors.grey[400] : const Color(0xff949D9E);
    final textColor2 = isDarkMode ? Colors.grey[300] : const Color(0xff4E5556);

    return Scaffold(
      appBar: customAppBar(context, title: 'من نحن', showNotification: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Card(
            elevation: 4,
            color: cardColor,
            shadowColor: isDarkMode ? Colors.black38 : Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'تطبيق "فروتيز" يقدّم لك تجربة فريدة لاختيار وطلب أفضل الفواكه الطازجة والعصائر الطبيعية. يمكنك تصفح مجموعتنا الكبيرة من الفواكه المحلية والمستوردة، واختيار ما يناسب ذوقك.',
                    style: TextStyles.semiBold13.copyWith(
                      color: textColor1,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'نحن نحرص على تقديم منتجات ذات جودة عالية، مع إمكانية متابعة حالة الطلب حتى باب منزلك. كما يوفّر التطبيق عروضًا مميزة يوميًا على تشكيلة واسعة من الفواكه الموسمية والعصائر الطازجة.',
                    style: TextStyles.semiBold13.copyWith(
                      color: textColor2,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'تطبيق "فروتيز" يسهل عليك اختيار الفواكه حسب الفئة أو النوع، ويوفّر توصيات يومية حسب اختياراتك السابقة. سواء كنت تبحث عن الفواكه الطازجة أو العصائر الطبيعية، ستجد كل ما تحتاجه هنا.',
                    style: TextStyles.semiBold13.copyWith(
                      color: textColor1,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'يمكنك مشاركة طلباتك مع الأصدقاء والعائلة، والاستمتاع بالعروض الموسمية الحصرية. نحن نهتم بتجربة المستخدم ونسعى لجعل عملية التسوّق سهلة وسريعة.',
                    style: TextStyles.semiBold13.copyWith(
                      color: textColor2,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'ابدأ اليوم واستمتع بأفضل مجموعة فواكه وعصائر طازجة يتم توصيلها مباشرة إلى منزلك بأعلى جودة وسرعة.',
                    style: TextStyles.semiBold13.copyWith(
                      color: textColor1,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
