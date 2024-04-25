import 'doctor_detail_controller.dart';

class DoctorDetailScreen extends GetWidget<DoctorDetailController> {
  DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> loadData() async {
      // Simulate data loading
      await Future.delayed(Duration(seconds: 1));
      return true; // Return true when data is loaded
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: FutureBuilder<bool>(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 31.v),
                child: Column(
                  children: [
                    _buildWidget(),
                    SizedBox(height: 25.v),
                    _buildDescription(),
                    SizedBox(height: 25.v),
                    _build_time_calendar(),
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: _buildTf(),
    );
  }

// Other methods remain unchanged...
}
