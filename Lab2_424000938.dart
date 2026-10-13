class Student {
  String fullName;
  String idNumber;
  List<double> grades;

  Student(this.fullName, this.idNumber, this.grades);

  void displayInfo(double average, String status) {
    print('\n====================================');
    print('          STUDENT REPORT            ');
    print('====================================');
    print('Student Name: $fullName');
    print('Student ID  : $idNumber');
    print('------------------------------------');
    
    print('Grades:');
    for (int i = 0; i < grades.length; i++) {
      print('  Subject ${i + 1}: ${grades[i]}');
    }
    
    print('------------------------------------');
    print('Average Grade : ${average.toStringAsFixed(2)}');
    print('Final Status  : $status');
    print('====================================\n');
  }
}

Map<String, dynamic> computeGrade(List<double> grades) {
  double sum = 0;
  for (double g in grades) {
    sum += g;
  }
  double average = sum / grades.length;

  String status;
  if (average >= 75) {
    status = 'Passed';
  } else if (average >= 70) {
    status = 'Conditional';
  } else {
    status = 'Failed';
  }

  return {
    'average': average,
    'status': status,
  };
}

void main() {
  print('=== Student Grade Calculator ===\n');

  String fullName = 'Glenbert Cahanding';
  String idNumber = '123456';
  List<double> grades = [85.5, 72.0, 90.0];

  Student student = Student(fullName, idNumber, grades);

  var result = computeGrade(student.grades);

  student.displayInfo(result['average'], result['status']);
}
