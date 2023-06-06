import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/avatar_widget.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/button_save.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/dropdown_custom.dart';
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
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: white,
        title: Text("Dados Pessoais",
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvatarWidget(),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              TextFieldCustom(
                label: "Como quer que lhe chame?",
                iconPrefix: Image.asset('assets/images/Profile.png'),
              ),
              const SizedBox(height: 20),
              TextFieldCustom(
                label: "E-mail",
                iconPrefix: Image.asset('assets/images/Message.png'),
              ),
              const SizedBox(height: 20),
              TextFieldCustom(
                label: "Data de Nascimento",
                iconPrefix: Image.asset('assets/images/Exclude.png'),
              ),
              const SizedBox(height: 20),
              DropdownCustom<String>(
                  listOfItems: const ["1", "2"],
                  hint: "Estado",
                  initialValue: "",
                  onChanged: (value) => print(value)),
              const SizedBox(height: 20),
              DropdownCustom<String>(
                  listOfItems: const ["1", "2"],
                  hint: "Cidade",
                  initialValue: "",
                  onChanged: (value) => print(value)),
              const SizedBox(height: 20),
              const TextFieldCustom(
                label: "Sobre você ",
                height: 100,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: ButtonSave()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
