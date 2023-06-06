import 'package:eduqhub_test/app/modules/user/domain/model/states_brazil.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/state/city_state.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/store/create_or_edit_store.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/avatar_widget.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/button_save.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/dropdown_custom.dart';
import 'package:eduqhub_test/app/modules/user/modules/create_or_edit/presentation/pages/widgets/text_field_custom.dart';
import 'package:eduqhub_test/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateOrEditUserPage extends StatefulWidget {
  final String? id;
  const CreateOrEditUserPage({super.key, this.id});

  @override
  State<CreateOrEditUserPage> createState() => _CreateOrEditUserPageState();
}

class _CreateOrEditUserPageState extends State<CreateOrEditUserPage> {
  final createOrEditUserStore = Modular.get<CreateOrEditUserStore>();
  final _formKey = GlobalKey<FormState>();
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarWidget(),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  return TextFieldCustom(
                      label: "Como quer que lhe chame?",
                      iconPrefix: Image.asset('assets/images/Profile.png'),
                      onChange: (value) {
                        createOrEditUserStore.setUsername(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite o seu nome';
                        }
                        return null;
                      });
                }),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  return TextFieldCustom(
                      label: "E-mail",
                      iconPrefix: Image.asset('assets/images/Message.png'),
                      onChange: (value) {
                        createOrEditUserStore.setEmail(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite um e-mail';
                        }
                        if (!createOrEditUserStore.validateEmail(value)) {
                          return 'E-mail inválido';
                        }
                        return null;
                      });
                }),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  var maskFormatter = MaskTextInputFormatter(
                    mask: '##/##/####',
                    filter: {"#": RegExp(r'[0-9]')},
                  );
                  return TextFieldCustom(
                      mask: [maskFormatter],
                      label: "Data de Nascimento",
                      iconPrefix: Image.asset('assets/images/Exclude.png'),
                      onChange: (value) {
                        createOrEditUserStore.setBirthdate(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite sua data de aniversário';
                        }
                        return null;
                      });
                }),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  return DropdownCustom<String>(
                      listOfItems:
                          brazilianStates.map((e) => e.abbreviation).toList(),
                      hint: "Estado",
                      initialValue: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Escolha um estado';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        createOrEditUserStore.setState(value);
                        createOrEditUserStore.setCity("");
                      });
                }),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  final cityState = createOrEditUserStore.cityState;
                  if (cityState is SucessCityState) {
                    return DropdownCustom<String>(
                      listOfItems: cityState.city,
                      hint: "Cidade",
                      initialValue: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Escolha uma cidade';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        createOrEditUserStore.setCity(value);
                      },
                    );
                  }
                  return DropdownCustom<String>(
                    listOfItems: const [],
                    hint: "Cidade",
                    initialValue: "",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Escolha uma cidade';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      createOrEditUserStore.setCity(value);
                    },
                  );
                }),
                const SizedBox(height: 20),
                Observer(builder: (context) {
                  return TextFieldCustom(
                      label: "Sobre você ",
                      height: 100,
                      onChange: (value) => createOrEditUserStore.setObs(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Digite sobre você';
                        }
                        return null;
                      });
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: ButtonSave(
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          createOrEditUserStore.createUser();
                        }
                      },
                    )),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
