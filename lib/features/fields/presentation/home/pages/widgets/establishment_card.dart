import 'package:app_canchitas_2025/features/fields/presentation/home/pages/widgets/time_slots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EstablishmentCard extends StatelessWidget {
  final String name;
  final String location;
  final int qualification;
  final String imageUrl;
  final String openTime;
  final String closeTime;
  final VoidCallback? onBookPressed;
  final VoidCallback? onImageTap;

  const EstablishmentCard({
    super.key,
    required this.name,
    required this.location,
    required this.qualification,
    required this.imageUrl,
    required this.openTime,
    required this.closeTime,
    this.onBookPressed, 
    this.onImageTap,
  });

  // Función para generar las horas disponibles
  List<String> _generateTimeSlots() {
    List<String> slots = [];
    try {
      final openHour = int.parse(openTime.split(':')[0]);
      final closeHour = int.parse(closeTime.split(':')[0]);

      for (int hour = openHour; hour <= closeHour; hour++) {
        String formattedHour = hour.toString().padLeft(2, '0');
        slots.add('$formattedHour:00');
      }
    } catch (e) {
      debugPrint('Error generando time slots: $e');
    }
    return slots;
  }

  @override
  Widget build(BuildContext context) {
    final timeSlots = _generateTimeSlots();
    return Column(
      children: [
        Container(
          height: 171,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 61,
                child: GestureDetector(
                  onTap: onImageTap,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 171,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 60,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 39,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF203D3F),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/copa.svg',
                            // ignore: deprecated_member_use
                            color: Colors.white,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        onPressed: onBookPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8C42),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          'SEPARAR',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/pin.svg',
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  location,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                qualification.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset(
                                'assets/icons/rayo.svg',
                                // ignore: deprecated_member_use
                                color: Colors.white,
                                width: 14,
                                height: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        timeSlots.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: timeSlots.map((time) {
                    return TimeSlots(hourStart: time);
                  }).toList(),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
