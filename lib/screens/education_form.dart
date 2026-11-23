import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _institution = "";
  String _degree = "S1 (Sarjana)";
  String _fieldOfStudy = "";
  DateTime? _startDate;
  DateTime? _endDate;
  String _grade = "";

  final List<String> _degrees = [
    'SMA / SMK',
    'D3 (Diploma)',
    'S1 (Sarjana)',
    'S2 (Magister)',
    'S3 (Doktor)',
    'Lainnya',
  ];

  String _formatDate(DateTime? date) {
    if (date == null) return "Belum dipilih";
    return "${date.day.toString().padLeft(2, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.year}";
  }

  Future<void> _selectDate(BuildContext context, {required bool isStart}) async {
    final DateTime initialDate = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Education Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === 1. Nama Institusi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Nama Institusi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama institusi tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Nama institusi minimal 3 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // === 2. Jenjang / Gelar ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenjang / Gelar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _degree,
                  items: _degrees
                      .map((degree) => DropdownMenuItem(
                    value: degree,
                    child: Text(degree),
                  ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _degree = newValue!;
                    });
                  },
                ),
              ),

              // === 3. Bidang Studi / Jurusan ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: "Contoh: Ilmu Komputer",
                    labelText: "Bidang Studi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _fieldOfStudy = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Bidang studi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === 4. Tanggal Mulai (FormField + showDatePicker) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormField<DateTime>(
                  validator: (_) {
                    if (_startDate == null) {
                      return "Tanggal mulai wajib dipilih!";
                    }
                    return null;
                  },
                  builder: (FormFieldState<DateTime> field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _selectDate(context, isStart: true);
                            field.didChange(_startDate);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Tanggal Mulai",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorText: field.errorText,
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            child: Text(_formatDate(_startDate)),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // === 5. Tanggal Selesai (FormField + Validasi Urutan Tanggal) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormField<DateTime>(
                  validator: (_) {
                    if (_endDate != null &&
                        _startDate != null &&
                        _endDate!.isBefore(_startDate!)) {
                      return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                    }
                    return null;
                  },
                  builder: (FormFieldState<DateTime> field) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _selectDate(context, isStart: false);
                            field.didChange(_endDate);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Tanggal Selesai (Opsional)",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorText: field.errorText,
                              suffixIcon: const Icon(Icons.calendar_today),
                            ),
                            child: Text(
                              _endDate == null
                                  ? "Masih berlangsung / Belum dipilih"
                                  : _formatDate(_endDate),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // === 6. IPK / Nilai (Opsional dengan Validasi Rentang) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Contoh: 3.90 (opsional)",
                    labelText: "IPK / Nilai Akhir",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _grade = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value != null && value.trim().isNotEmpty) {
                      final parsed = double.tryParse(value.trim());
                      if (parsed == null) {
                        return "IPK/Nilai harus berupa angka!";
                      }
                      if (parsed < 0 || parsed > 100) {
                        return "Nilai harus berada di antara 0 hingga 100!";
                      }
                    }
                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edukasi berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institusi: ${_institution.trim()}'),
                                    Text('Jenjang: $_degree'),
                                    Text('Bidang Studi: ${_fieldOfStudy.trim()}'),
                                    Text('Tanggal Mulai: ${_formatDate(_startDate)}'),
                                    Text(
                                      'Tanggal Selesai: ${_endDate == null ? "Masih berlangsung" : _formatDate(_endDate)}',
                                    ),
                                    Text(
                                      'IPK / Nilai: ${_grade.trim().isEmpty ? "-" : _grade.trim()}',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _institution = "";
                                      _degree = "S1 (Sarjana)";
                                      _fieldOfStudy = "";
                                      _startDate = null;
                                      _endDate = null;
                                      _grade = "";
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}