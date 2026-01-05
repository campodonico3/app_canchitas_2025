import 'package:app_canchitas_2025/features/fields/presentation/establishment/pages/widgets/appointment_card.dart';
import 'package:app_canchitas_2025/features/fields/presentation/establishment/pages/widgets/booking_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EstablishmentDetail extends StatelessWidget {
  const EstablishmentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF203D3F),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _MyEstablishmentDetailHeader(),
            pinned: true,
          ),
          SliverToBoxAdapter(child: Column(children: [ContentDetailField()])),
        ],
      ),
    );
  }
}

class ContentDetailField extends StatefulWidget {
  const ContentDetailField({super.key});

  @override
  State<ContentDetailField> createState() => _ContentDetailFieldState();
}

class _ContentDetailFieldState extends State<ContentDetailField> {
  int _selectedDatIndex = 0;

  List<Map<String, String>> _generateTwoWeeks() {
    final now = DateTime.now();
    final days = ['DOM', 'LUN', 'MAR', 'MIE', 'JUE', 'VIE', 'SAB'];

    return List.generate(14, (index) {
      final date = now.add(Duration(days: index));
      final dayLabel = index == 0 ? 'HOY' : days[date.weekday % 7];
      final dateStr =
          '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';

      return {'label': dayLabel, 'date': dateStr};
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    final twoWeeks = _generateTwoWeeks();
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          width: size,
          height: 185,
          margin: .only(top: 30, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Color(0xFF1A292B),
            borderRadius: .circular(20),
          ),
          padding: .symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: .circular(50),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text('En Juego', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 5),
              Text(
                '00:45',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(height: 5),
              Container(
                margin: .symmetric(horizontal: 4),
                width: size,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(50),
                ),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF32BC81),
                        borderRadius: .circular(50),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFF203D3F),
                        borderRadius: .circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          Text(
                            'Alquilado por:',
                            style: TextStyle(
                              color: Color(0xFFB5AEAE),
                              fontSize: 10,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/User.svg',
                            color: Colors.white,
                          ),
                          Text(
                            'Kevin C.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFF203D3F),
                        borderRadius: .circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          Text(
                            'Horas alquiladas',
                            style: TextStyle(
                              color: Color(0xFFB5AEAE),
                              fontSize: 10,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/Alarm Clock.svg',
                            color: Colors.white,
                          ),
                          Text(
                            '2 horas',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        Container(
          margin: .only(left: 10),
          child: Text(
            'Día de la reserva',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: twoWeeks.length,
            itemBuilder: (context, index) {
              final day = twoWeeks[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDatIndex = index;
                  });
                },
                child: DayCard(
                  dayLabel: day['label']!,
                  date: day['date']!,
                  isSelected: _selectedDatIndex == index,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: .only(left: 10),
          child: Text(
            'Todas las reservas',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 5,),
        // Lista de Reservas o para poder realziar una reserva
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookingCard(
            time: '9:30 am',
            duration: '50min',
            service: 'w01 Services',
            customer: 'Scape_J',
            customerImage: '',
            isToday: true,
            onTap: () {
              debugPrint('Ver detalles de reserva');
            },
          ),
        ),  
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookingCard(
            time: '9:30 am',
            duration: '50min',
            service: 'w01 Services',
            customer: 'Scape_J',
            customerImage: '',
            isToday: true,
            onTap: () {
              debugPrint('Ver detalles de reserva');
            },
          ),
        ),  
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookingCard(
            time: '9:30 am',
            duration: '50min',
            service: 'w01 Services',
            customer: 'Scape_J',
            customerImage: '',
            isToday: true,
            onTap: () {
              debugPrint('Ver detalles de reserva');
            },
          ),
        ),        
      ],
    );
  }
}

class DayCard extends StatelessWidget {
  final String dayLabel;
  final String date;
  final bool isSelected;
  const DayCard({
    super.key,
    required this.dayLabel,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: .all(8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF32BC81) : Color(0xFF1A292B),
        borderRadius: .circular(18),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          Text(
            dayLabel,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? .bold : .normal,
            ),
          ),
          SizedBox(height: 4),
          Text(date, style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}

const _maxHeaderExtent = 350.0; // Altura máxima del header (expandido)
const _minHeaderExtent = 130.0; // Altura mínima del header (colapsado)

const _maxTitleSize = 32.0;
const _minTitleSize = 18.0;

// shrinkOffset: cuántos píxeles se ha colapsado el header(0 cuando está expandido, aumenta al hacer scroll)
// maxExtent: altura máxima del header (350px)
// percentage: valor de 0 a 1 que represeneta que tan colapsado está
//   -> 0 = completamente expandido
//   -> 1 = completamente colapsado

class _MyEstablishmentDetailHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final size = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: .none,
      children: [
        ClipRRect(
          borderRadius: .only(
            bottomLeft: .circular(20),
            bottomRight: .circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/campo1.png',
                  fit: BoxFit.cover,
                  width: size,
                  height: 350.0,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Text(
                  'Damker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _maxTitleSize,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Botón "¿Cómo llegar?" FUERA del ClipRRect
        Positioned(
          bottom: -12,
          left: 230,
          child: Container(
            padding: .symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: .circular(20),
              border: .all(color: Colors.white),
              color: Color(0xFF203D3F),
            ),
            child: Text('¿Cómo llegar?', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
