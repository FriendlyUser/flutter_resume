import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

import 'package:pdf/widgets.dart';

int calculate() {
  return 6 * 7;
}

void generatePdf() async {
  final pdf = pw.Document();

  final page = pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context) {
      return pw.Column(children: <pw.Widget>[
        pw.Container(
          child: pw.Header(
            level: 0,
            child: pw.Text('FriendlyUser Resume'),
          ),
          // width 100%
          // width: double.infinity,
          alignment: pw.Alignment.center,
        ),
        // hr rule
        // address information
        pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Column(children: [
              pw.Text('John Smith 123 Main St USA 12345'),
              pw.Text('(234) 345-4567'),
              pw.Text('jogn_smith@kage.com'),
            ])),
        // hr rule
        pw.Divider(),
        // professional experience section
        pw.Container(
          child: pw.Header(
            level: 1,
            child: pw.Text('Professional Experience'),
          ),
          alignment: pw.Alignment.center,
        ),
        // to left job title and company to the right
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          // max width
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Column(
              // left align

              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Dli invest'),
                pw.Text('Software Engineer'),
              ],
            ),
            pw.Column(
              // right align
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Canada, Remote'),
                pw.Text('August 2020 - Current'),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 10),
        // bullet points
        pw.Column(children: [
          pw.Bullet(text: 'Developed code in python and golang.'),
          pw.Bullet(text: 'Built out cutting edge software.'),
          pw.Bullet(text: 'Backtesting trades.'),
        ]),
        pw.SizedBox(height: 10),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          // max width
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Column(
              // left align

              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Sample org'),
                pw.Text('Software Kid'),
              ],
            ),
            pw.Column(
              // right align
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Canada, Remote'),
                pw.Text('August 2018 - Current'),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Column(children: [
          pw.Bullet(text: 'Grinded Java.'),
          pw.Bullet(text: 'Grinded css.'),
          pw.Bullet(text: 'Job Applications.'),
        ]),

        // pw.Footer(
        //   pw.
        // ),
        // education column
        pw.Container(
          child: pw.Header(
            level: 1,
            child: pw.Text('Education'),
          ),
          alignment: pw.Alignment.center,
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          // max width
          mainAxisSize: pw.MainAxisSize.max,
          children: [
            pw.Column(
              // left align

              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('University of Victoria'),
                pw.Text('Bachelor of Computer Engineering (with distinction)'),
              ],
            ),
            pw.Column(
              // right align
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text("GPA: 6.9/9.0"),
                pw.Text('August 2000 - 2006'),
              ],
            ),
          ],
        ),
        // course work points
        pw.SizedBox(height: 10),
        pw.Column(children: [
          pw.Bullet(text: 'Software Engineering'),
          pw.Bullet(text: 'Data Structures'),
          pw.Bullet(text: 'Algorithms'),
        ]),
        // list of skills section
        pw.Container(
          child: pw.Header(
            level: 1,
            child: pw.Text('Skills'),
          ),
          alignment: pw.Alignment.center,
        ),
        pw.SizedBox(height: 10),
        // fancy widget for skills, badge like
        pw.Wrap(
          children: [
            // pw.ClipRect(
            //   child: pw.Text('Python',
            //       style: pw.TextStyle(color: PdfColors.green)),
            // ),
            // pw.SizedBox(width: 10),
            // pw.ClipRect(
            //   child: pw.Text('Golang',
            //       style: pw.TextStyle(color: PdfColors.green)),
            // ),
            pw.SizedBox(width: 10),
           pw.ClipOval(
              // curved edges
              child: pw.Padding(
                padding: pw.EdgeInsets.all(10),
                child: Text('Java',
                  style: pw.TextStyle(
                      // padding
                      
                      color: PdfColors.cyan,
                      background: BoxDecoration(
                        color: PdfColors.purple900,
                        border: Border.all(
                          color: PdfColors.brown50,
                          width: 50,
                        ),
                      )))),
            ),
            pw.SizedBox(width: 10),
           pw.ClipOval(
              // curved edges
              child: pw.Padding(
                padding: pw.EdgeInsets.all(10),
                child: Text('C++',
                  style: pw.TextStyle(
                      // padding
                      
                      color: PdfColors.pink,
                      background: BoxDecoration(
                        color: PdfColors.red900,
                        border: Border.all(
                          color: PdfColors.black,
                          width: 50,
                        ),
                      )))),
            ),
            pw.SizedBox(width: 10),
            pw.ClipOval(
              // curved edges
              child: pw.Padding(
                padding: pw.EdgeInsets.all(10),
                child: Text('Dart',
                  style: pw.TextStyle(
                      // padding
                      
                      color: PdfColors.cyan,
                      background: BoxDecoration(
                        color: PdfColors.blue900,
                        border: Border.all(
                          color: PdfColors.brown50,
                          width: 50,
                        ),
                      )))),
            )
          ],
        ),
      ]);
    },
  );
  pdf.addPage(page);
  // save pdf as file
  final file = File("example.pdf");
  await file.writeAsBytes(await pdf.save());
  pdf.save();
}
