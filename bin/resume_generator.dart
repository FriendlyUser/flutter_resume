import 'package:resume_generator/resume_generator.dart' as resume_generator;

void main(List<String> arguments) {
  print('Hello world: ${resume_generator.calculate()}!');

  resume_generator.generatePdf();
}
