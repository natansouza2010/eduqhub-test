import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/avatar_widget.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/text_field_custom.dart';
import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateOrEditUserPage extends StatefulWidget {
  final String? id;
  const CreateOrEditUserPage({super.key, this.id});

  @override
  State<CreateOrEditUserPage> createState() => _CreateOrEditUserPageState();
}

class _CreateOrEditUserPageState extends State<CreateOrEditUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("Dados Pessoais",
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AvatarWidget(),
          Divider(),
          Text("Teste"),
          SizedBox(height: 20),
          TextFieldCustom()
        ],
      ),
    );
  }
}
