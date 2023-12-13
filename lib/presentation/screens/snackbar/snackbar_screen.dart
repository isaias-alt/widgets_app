import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola, soy un snackbar'),
      action: SnackBarAction(label: 'OK!!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialogue(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Estás Seguro?'),
              content: const Text(
                  'Enim ut tempor occaecat aliquip esse culpa ut officia ut dolor amet commodo labore Lorem. Reprehenderit cupidatat quis et eiusmod dolor Lorem laboris nostrud sint ipsum ullamco incididunt. Nisi incididunt pariatur nostrud laborum aute consectetur exercitation commodo do eiusmod. Cillum adipisicing incididunt occaecat laborum culpa voluptate anim nisi culpa occaecat et. Aliqua ipsum irure minim elit ullamco dolor dolor sit eiusmod aliquip do. Dolore laborum ad in adipisicing sunt tempor.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogues'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Sit dolore sit pariatur nisi enim eu consectetur laboris laboris nostrud et do. Eu dolore in sint aliqua ea reprehenderit. Aute nulla adipisicing officia in aute esse ullamco elit proident ea. Pariatur ex sint adipisicing enim esse.')
                  ]);
                },
                child: const Text('Used Licenses')),
            FilledButton.tonal(
                onPressed: () => openDialogue(context),
                child: const Text('Show screen dialogue')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
