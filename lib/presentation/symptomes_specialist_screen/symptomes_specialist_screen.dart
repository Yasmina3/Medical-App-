import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SymptomSelectorScreen extends StatefulWidget {
  @override
  _SymptomSelectorScreenState createState() => _SymptomSelectorScreenState();
}

class _SymptomSelectorScreenState extends State<SymptomSelectorScreen> {
  Map<String, String> symptomMap = {
  'حكة': 'itching',
  'طفح جلدي': 'skin_rash',
  'انفجارات جلدية عقدية': 'nodal_skin_eruptions',
  'بقع متغيرة اللون': 'dischromic _patches',
  'عطاس مستمر': 'continuous_sneezing',
  'ارتعاش': 'shivering',
  'قشعريرة': 'chills',
  'دموع من العيون': 'watering_from_eyes',
  'ألم في المعدة': 'stomach_pain',
  'حموضة': 'acidity',
  'قرح على اللسان': 'ulcers_on_tongue',
  'قيء': 'vomiting',
  'سعال': 'cough',
  'ألم في الصدر': 'chest_pain',
  'جلد مصفر': 'yellowish_skin',
  'غثيان': 'nausea',
  'فقدان الشهية': 'loss_of_appetite',
  'ألم في البطن': 'abdominal_pain',
  'اصفرار العينين': 'yellowing_of_eyes',
  'حرقان أثناء التبول': 'burning_micturition',
  'تبول متقطع': 'spotting_ urination',
  'تمرير الغازات': 'passage_of_gases',
  'حكة داخلية': 'internal_itching',
  'عسر الهضم': 'indigestion',
  'ضمور العضلات': 'muscle_wasting',
  'بقع في الحلق': 'patches_in_throat',
  'حمى شديدة': 'high_fever',
  'علاقات خارج الزواج': 'extra_marital_contacts',
  'إعياء': 'fatigue',
  'فقدان الوزن': 'weight_loss',
  'قلق': 'restlessness',
  'خمول': 'lethargy',
  'مستوى السكر غير المنتظم': 'irregular_sugar_level',
  'رؤية مشوشة ومشوهة': 'blurred_and_distorted_vision',
  'سمنة': 'obesity',
  'جوع مفرط': 'excessive_hunger',
  'زيادة الشهية': 'increased_appetite',
  'كثرة التبول': 'polyuria',
  'عيون غائرة': 'sunken_eyes',
  'جفاف': 'dehydration',
  'إسهال': 'diarrhoea',
  'ضيق في التنفس': 'breathlessness',
  'تاريخ عائلي': 'family_history',
  'بلغم مخاطي': 'mucoid_sputum',
  'صداع': 'headache',
  'دوار': 'dizziness',
  'فقدان التوازن': 'loss_of_balance',
  'قلة التركيز': 'lack_of_concentration',
  'تيبس الرقبة': 'stiff_neck',
  'اكتئاب': 'depression',
  'التهيج': 'irritability',
  'اضطرابات بصرية': 'visual_disturbances',
  'ألم الظهر': 'back_pain',
  'ضعف الأطراف': 'weakness_in_limbs',
  'ألم الرقبة': 'neck_pain',
  'ضعف جانب واحد من الجسم': 'weakness_of_one_body_side',
  'تغير الحسية': 'altered_sensorium',
  'بول داكن': 'dark_urine',
  'تعرق': 'sweating',
  'ألم في العضلات': 'muscle_pain',
  'حمى خفيفة': 'mild_fever',
  'تورم الغدد الليمفاوية': 'swelled_lymph_nodes',
  'توعك': 'malaise',
  'بقع حمراء على الجسم': 'red_spots_over_body',
  'ألم في المفاصل': 'joint_pain',
  'ألم خلف العينين': 'pain_behind_the_eyes',
  'إمساك': 'constipation',
  'مظهر سام (التيفوس)': 'toxic_look_(typhos)',
  'ألم في البطن': 'belly_pain',
  'بول أصفر': 'yellow_urine',
  'تلقي نقل الدم': 'receiving_blood_transfusion',
  'تلقي حقن غير معقمة': 'receiving_unsterile_injections',
  'غيبوبة': 'coma',
  'نزيف في المعدة': 'stomach_bleeding',
  'فشل كبدي حاد': 'acute_liver_failure',
  'تورم في المعدة': 'swelling_of_stomach',
  'انتفاخ في البطن': 'distention_of_abdomen',
  'تاريخ استهلاك الكحول': 'history_of_alcohol_consumption',
  'فرط السوائل': 'fluid_overload',
  'بلغم': 'phlegm',
  'دم في البلغم': 'blood_in_sputum',
  'تهيج الحلق': 'throat_irritation',
  'احمرار العينين': 'redness_of_eyes',
  'ضغط الجيوب الأنفية': 'sinus_pressure',
  'سيلان الأنف': 'runny_nose',
  'احتقان': 'congestion',
  'فقدان الشم': 'loss_of_smell',
  'سرعة ضربات القلب': 'fast_heart_rate',
  'بلغم صدئ': 'rusty_sputum',
  'ألم أثناء حركات الأمعاء': 'pain_during_bowel_movements',
  'ألم في منطقة الشرج': 'pain_in_anal_region',
  'براز دموي': 'bloody_stool',
  'تهيج في الشرج': 'irritation_in_anus',
  'تشنجات': 'cramps',
  'كدمات': 'bruising',
  'تورم الساقين': 'swollen_legs',
  'تورم الأوعية الدموية': 'swollen_blood_vessels',
  'أوردة بارزة على الساق': 'prominent_veins_on_calf',
  'زيادة الوزن': 'weight_gain',
  'برودة اليدين والقدمين': 'cold_hands_and_feets',
  'تقلبات المزاج': 'mood_swings',
  'انتفاخ الوجه والعينين': 'puffy_face_and_eyes',
  'تضخم الغدة الدرقية': 'enlarged_thyroid',
  'أظافر هشة': 'brittle_nails',
  'تورم الأطراف': 'swollen_extremeties',
  'حيض غير طبيعي': 'abnormal_menstruation',
  'ضعف العضلات': 'muscle_weakness',
  'قلق': 'anxiety',
  'كلام متداخل': 'slurred_speech',
  'خفقان': 'palpitations',
  'جفاف وتنميل الشفاه': 'drying_and_tingling_lips',
  'ألم الركبة': 'knee_pain',
  'ألم مفصل الورك': 'hip_joint_pain',
  'تورم المفاصل': 'swelling_joints',
  'المشي المؤلم': 'painful_walking',
  'تيبس الحركة': 'movement_stiffness',
  'حركات دوار': 'spinning_movements',
  'عدم الثبات': 'unsteadiness',
  'بثور مملوءة بالصديد': 'pus_filled_pimples',
  'رؤوس سوداء': 'blackheads',
  'تندب': 'scurring',
  'انزعاج المثانة': 'bladder_discomfort',
  'رائحة كريهة للبول': 'foul_smell_of urine',
  'شعور مستمر بالبول': 'continuous_feel_of_urine',
  'تقشر الجلد': 'skin_peeling',
  'غبار فضي': 'silver_like_dusting',
  'ثقوب صغيرة في الأظافر': 'small_dents_in_nails',
  'أظافر ملتهبة': 'inflammatory_nails',
  'بثرة': 'blister',
  'قرحة حمراء حول الأنف': 'red_sore_around_nose',
  'قشرة صفراء تنزف': 'yellow_crust_ooze'
};


  Map<String, String> specialistMap = {
    'Allergist': 'اختصاصي حساسية',
    'Cardiologist': 'طبيب القلب',
    'Common Cold': 'نزلة برد',
    'Dermatologist': 'طبيب الأمراض الجلدية',
    'Endocrinologist': 'طبيب الغدد الصماء',
    'Gastroenterologist': 'طبيب الجهاز الهضمي',
    'Gynecologist': 'طبيب أمراض النساء',
    'Hepatologist': 'اختصاصي الكبد',
    'Internal Medicine': 'الطب الباطني',
    'Neurologist': 'طبيب الأعصاب',
    'Osteoarthristis': 'التهاب المفاصل العظمي',
    'Osteopathic': 'طبيب تقويم العظام',
    'Otolaryngologist': 'طبيب الأنف والأذن والحنجرة',
    'Pediatrician': 'طبيب الأطفال',
    'Phlebologist': 'اختصاصي الأوعية الدموية',
    'Pulmonologist': 'طبيب الرئة',
    'Rheumatologists': 'أطباء الروماتيزم'
  };

  List<String> allSymptoms = []; // List of all possible Arabic symptoms
  List<String> selectedSymptoms = []; // List of selected Arabic symptoms

  @override
  void initState() {
    super.initState();
    _fetchSymptoms();
  }

  Future<void> _fetchSymptoms() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:5000/symptoms'));
    if (response.statusCode == 200) {
      List<dynamic> symptomsList = jsonDecode(response.body);
      setState(() {
        allSymptoms = symptomsList
            .cast<String>()
            .map((symptom) => symptomMap.keys.firstWhere(
                (key) => symptomMap[key] == symptom,
                orElse: () => symptom))
            .toList();
      });
    } else {
      _showErrorDialog(
          'فشل في تحميل الأعراض. الرجاء المحاولة مرة أخرى لاحقاً.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('حسناً'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر الأعراض'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allSymptoms.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(allSymptoms[index]),
                  value: selectedSymptoms.contains(allSymptoms[index]),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedSymptoms.add(allSymptoms[index]);
                      } else {
                        selectedSymptoms.remove(allSymptoms[index]);
                      }
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: selectedSymptoms.isEmpty
                    ? null
                    : () {
                        _makePrediction(
                            selectedSymptoms
                                .map((symptom) => symptomMap[symptom]!)
                                .toList(),
                            context);
                      },
                child: Text(
                  'ابحث عن متخصص',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _makePrediction(
      List<String> symptoms, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'symptoms': symptoms}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String recommendedSpecialist = responseData['predictions'][0];
      final String specialistInArabic =
          _translateSpecialistToArabic(recommendedSpecialist);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('المتخصص الموصى به'),
            content: Text(
                'بناءً على الأعراض المدخلة، يوصى بمراجعة $specialistInArabic.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('حسناً'),
              ),
            ],
          );
        },
      );
    } else {
      _showErrorDialog(
          'فشل في تحديد المتخصص. الرجاء المحاولة مرة أخرى لاحقاً.');
    }
  }

  String _translateSpecialistToArabic(String specialist) {
    return specialistMap[specialist] ?? specialist;
  }
}
