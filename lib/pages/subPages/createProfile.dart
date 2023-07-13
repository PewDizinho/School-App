import 'package:flutter/material.dart';
import 'package:schoolapp/pages/subPages/profile.dart';

import 'package:schoolapp/util/StudentModel.dart';

import '../../util/PewUtil.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => CreateProfileState();
}

PewUtil pu = PewUtil();
PewText pt = pu.getText();
PewInput pi = pu.getInput();
Student stu = pu.getStudent();

class CreateProfileState extends State<CreateProfile> {
  TextEditingController nome = TextEditingController();
  TextEditingController escola = TextEditingController();
  TextEditingController media = TextEditingController();
  TextEditingController ano = TextEditingController();
  TextEditingController sala = TextEditingController();
  String? err_nome;
  String? err_escola;
  String? err_media;
  String? err_ano;
  String? err_sala;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pu.getConfig().getBackgroundColor(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: Center(
          child: Column(
            children: [
              pt.isTitle().get("Cadastre-se"),
              const Spacer(
                flex: 4,
              ),
              pi
                  .setLabel("Nome")
                  .setHintText("Paulo Eduardo")
                  .setErrorText(err_nome)
                  .setTextController(nome)
                  .get(),
              const SizedBox(
                height: 15,
              ),
              pi
                  .setLabel("Escola")
                  .setHintText("Dona Branca")
                  .setErrorText(err_escola)
                  .setTextController(escola)
                  .get(),
              const SizedBox(
                height: 15,
              ),
              pi
                  .setLabel("Média")
                  .setHintText("60")
                  .setErrorText(err_media)
                  .setTextController(media)
                  .get(),
              const SizedBox(
                height: 15,
              ),
              pi
                  .setLabel("Ano")
                  .setHintText("3")
                  .setErrorText(err_ano)
                  .setTextController(ano)
                  .get(),
              const SizedBox(
                height: 15,
              ),
              pi
                  .setLabel("Sala")
                  .setHintText("3°B")
                  .setErrorText(err_sala)
                  .setTextController(sala)
                  .get(),
              const SizedBox(
                height: 20,
              ),
              PewButton()
                  .setIcon(Icons.check)
                  .setOnTap(() {
                    var valuesToCheck = [nome, escola, media, ano, sala];
                    var changes = [
                      (String? v) => {err_nome = v},
                      (String? v) => {err_escola = v},
                      (String? v) => {err_media = v},
                      (String? v) => {err_ano = v},
                      (String? v) => {err_sala = v},
                    ];
                    for (var reset in changes) {
                      reset(null);
                    }
                    bool aight = true;
                    for (int i = 0; i < valuesToCheck.length; i++) {
                      if (valuesToCheck[i].text.isEmpty) {
                        aight = false;
                        setState(() {
                          changes[i]("Você precisa por algo aqui");
                        });
                      }
                    }
                    if (aight) {
                      stu.name = nome.text;
                      stu.escola = escola.text;
                      stu.media = media.text;
                      stu.ano = ano.text;
                      stu.sala = sala.text;
                      stu.save();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                          ModalRoute.withName('/'));
                    }
                  })
                  .setText(null)
                  .getButton(context),
              const Spacer(
                flex: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
