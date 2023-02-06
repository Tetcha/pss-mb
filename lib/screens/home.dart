import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pss_m/core/constants/enum.dart';
import 'package:pss_m/core/models/Doctor/doctor.dart';
import 'package:pss_m/interface/carousel/carouselData.dart';
import 'package:pss_m/widgets/Doctor/doctor_intro.dart';
import 'package:pss_m/widgets/carousel/carousel.dart';
import 'package:pss_m/widgets/title/title.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomeScreen extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Doctor doctor = const Doctor(
      id: "1",
      createAt: "",
      updateAt: "",
      birthday: "01/01/2001",
      phone: "",
      gender: Gender.MALE,
      balance: 9999,
      status: true,
      name: "Dau Le Duc",
      email: "dauleduc2@gmail.com",
      photoUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Gatto_europeo4.jpg/250px-Gatto_europeo4.jpg",
      introduction: "Hello, I'm Dau Le Duc. Nice to meet you! ",
    );
    List<Doctor> availableDoctor = [
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor,
      doctor
    ];
    return Column(
      children: [
        const SizedBox(height: 20),
        Carousel(
          data: [
            CarouselItem(
              title: "Slide 1",
              imageUrl:
                  "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
            ),
            CarouselItem(
              title: "Slide 2",
              imageUrl:
                  "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
            ),
            CarouselItem(
              title: "Slide 3",
              imageUrl:
                  "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80",
            ),
            CarouselItem(
              title: "Slide 4",
              imageUrl:
                  "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80",
            ),
            CarouselItem(
              title: "Slide 5",
              imageUrl:
                  "https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80",
            ),
            CarouselItem(
              title: "Slide 6",
              imageUrl:
                  "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80",
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(label: "Available now:"),
              const SizedBox(height: 20),
              ...availableDoctor.map((doctor) {
                return Column(
                  children: [
                    DoctorIntro(doctor: doctor),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("See more"),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
