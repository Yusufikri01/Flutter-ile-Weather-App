import 'package:flutter/material.dart';

class ContainerPro extends StatelessWidget {
  String text;
  double detay;
  IconData icon;
  ContainerPro(
    this.text,
    this.detay,
    this.icon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: 175,
        decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "$text  :  $detay",
                  style: TextStyle(color: Colors.white, fontSize: 18.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  icon,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
