import 'dart:io';

import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  // Ruta local de la imagen subida (el sistema la convertirá a URL si es necesario)
  final String imagePath = '/mnt/data/51b35731-b5d0-465f-9e69-9975da242217.png';

  @override
  Widget build(BuildContext context) {
    // Dimensiones pensadas para una tarjeta tipo timeline horizontal
    return SizedBox(
      width: 360,
      height: 120,
      child: Stack(
        children: [
          // Tarjeta principal
          Positioned.fill(
            left: 8,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF181818),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              padding: const EdgeInsets.fromLTRB(18, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: pills and avatar
                  Row(
                    children: [
                      // Pill group (Today + time)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0x00FFFFFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            // Today pill
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD500),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Text(
                                'Today',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Time pill
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD500),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Text(
                                '11:45am',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Avatar + small label
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              // Nombre corto
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Scape_J',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Customer',
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              // Avatar (si el archivo existe se usa FileImage)
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.grey[800],
                                backgroundImage: _fileExists(imagePath)
                                    ? FileImage(File(imagePath)) as ImageProvider
                                    : null,
                                child: _fileExists(imagePath)
                                    ? null
                                    : const Icon(Icons.person, size: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Bottom row: duration / service + Details
                  Row(
                    children: [
                      // Left: duration and service name
                      Expanded(
                        child: Row(
                          children: const [
                            Text(
                              '50min',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'w01 Services',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right: Details label + chevron
                      Row(
                        children: const [
                          Text(
                            'Details',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white60,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Dashed yellow bar at the left edge (visual timeline marker)
          Positioned(
            left: 0,
            top: 8,
            bottom: 8,
            child: SizedBox(
              width: 12,
              child: CustomPaint(
                painter: _LeftDashPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _fileExists(String path) {
    try {
      return File(path).existsSync();
    } catch (_) {
      return false;
    }
  }
}

// Painter para dibujar una línea punteada vertical con esquinas redondeadas
class _LeftDashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFFD500)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double dashHeight = 8;
    final double dashSpace = 6;
    double y = 6; // top padding for the dash line

    final centerX = size.width / 2;

    while (y < size.height - 6) {
      canvas.drawLine(Offset(centerX, y), Offset(centerX, y + dashHeight), paint);
      y += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
