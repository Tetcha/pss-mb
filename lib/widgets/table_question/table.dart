import 'package:flutter/material.dart';
import 'package:pss_m/core/models/Question/question.dart';

class TableQuestion extends StatelessWidget {
  final List<Question>? data;
  const TableQuestion({super.key, required this.data});

  TableRow _renderTableHeader() {
    return const TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Question',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Answer',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _renderTableRow({required Question question}) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question.content,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Not answered yet",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 1, color: Colors.black),
      children: [
        _renderTableHeader(),
        ...(data ?? [])
            .map(
              (question) => _renderTableRow(question: question),
            )
            .toList(),
      ],
    );
  }
}
