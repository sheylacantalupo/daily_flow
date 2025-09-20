import 'package:flutter/material.dart';

class AddHabitDialog extends StatefulWidget {

  const AddHabitDialog({super.key});

  @override
  State<AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final _formKey = GlobalKey<FormState>();
  final _habitNameController = TextEditingController();

  @override
  void dispose() {
    _habitNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Novo Hábito',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),
              Text('Nome do hábito',
                style: TextStyle(
                  color: Colors.grey, 
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: _habitNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white, // Sua cor de fundo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF71BED2), // Cor da borda
                        width: 0.8, // Espessura mais fina
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF71BED2),// Cor quando não está focado
                        width: 0.8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF71BED2), // Cor azul quando focado
                        width: 0.8, // Levemente mais espesso no foco
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, digite um nome para o hábito';
                    }
                    return null;
                  },
                ),
              ),
              Text('Categoria',
                style: TextStyle(
                    color: Colors.grey, 
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                  ),
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: _habitNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white, // Sua cor de fundo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF71BED2), // Cor da borda
                        width: 0.8, // Espessura mais fina
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF71BED2),// Cor quando não está focado
                        width: 0.8,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFF71BED2), // Cor azul quando focado
                        width: 0.8, // Levemente mais espesso no foco
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, digite um nome para o hábito';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _addHabit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF1D35B),
                      foregroundColor: Color(0xFF171717),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addHabit() {
    if (_formKey.currentState!.validate()) {
      
      Navigator.pop(context);
    }
  }
}