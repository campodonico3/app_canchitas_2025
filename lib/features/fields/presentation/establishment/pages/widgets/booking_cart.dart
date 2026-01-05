import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String time;
  final String duration;
  final String service;
  final String customer;
  final String customerImage;
  final bool isToday;
  final VoidCallback? onTap;

  const BookingCard({
    super.key,
    required this.time,
    required this.duration,
    required this.service,
    required this.customer,
    required this.customerImage,
    this.isToday = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .all(8),
      decoration: BoxDecoration(color: Color(0xFF203D3F)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Columna de tiempo (izquierda)
            Column(
              children: [
                Container(
                  width: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isToday
                        ? const Color(0xFF203D3F)
                        : Colors.transparent,
                    /* border: Border.all(
                      color: isToday ? const Color(0xFFE8B44D) : Colors.white,
                      width: 2,
                    ), */
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${time.split(':')[0]}:${time.split(':')[1].split(' ')[0]}',
                        style: TextStyle(
                          color: isToday ? Colors.white : Colors.white,
                          fontSize: 14,
                          fontWeight: .w700,
                        ),
                      ),
                      Text(
                        time.split(' ')[1],
                        style: TextStyle(
                          color: isToday ? Colors.white : Colors.white,
                          fontSize: 14,
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: isToday
                        ? const Color(0xFF203D3F)
                        : Colors.transparent,
                    /* border: Border.all(
                      color: isToday ? const Color(0xFFE8B44D) : Colors.white,
                      width: 2,
                    ), */
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${time.split(':')[0]}:${time.split(':')[1].split(' ')[0]}',
                        style: TextStyle(
                          color: isToday ? Colors.white : Colors.white,
                          fontSize: 14,
                          fontWeight: .w700,
                        ),
                      ),
                      Text(
                        time.split(' ')[1],
                        style: TextStyle(
                          color: isToday ? Colors.white : Colors.white,
                          fontSize: 14,
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(width: 1),
            /* Card de información (derecha) */
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A292B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: .start,
                        children: [
                          Expanded(
                            child: Container(
                              height: 30,
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.amber,
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      alignment: .center,
                                      child: Text(
                                        '11:45 am',
                                        style: TextStyle(color: Colors.black),
                                        textAlign: .center,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      alignment: .center,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        boxShadow: [
                                          BoxShadow(
                                            // ignore: deprecated_member_use
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            blurRadius: 4,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Hoy',
                                        style: TextStyle(color: Colors.black),
                                        textAlign: .center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            padding: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: .end,
                              crossAxisAlignment: .start,
                              children: [
                                Column(
                                  crossAxisAlignment: .end,
                                  children: [
                                    Text(
                                      'Kevin Camp.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Jugador',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/images/perfil.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('50min', style: TextStyle(color: Colors.white)),
                          Text(
                            'w01 Services',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
