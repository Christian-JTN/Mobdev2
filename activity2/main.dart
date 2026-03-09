import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobDev Assignment',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2F7),
      appBar: AppBar(
        title: const Text(
          'Mobile Development 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // 1. MY PROFILE HEADER (PURPLE) - From your screenshot
              const InfoCard(
                cardColor: Colors.indigo,
                title: 'My Profile',
                subtitle: 'Student Information Card',
                isHeader: true,
                details: [],
              ),
              const SizedBox(height: 12),

              // 2. PROFILE PHOTO (RED) - Now moved to the top
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFC62828), 
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text('Profile Photo', 
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/jacob.jpg',
                        height: 200,
                        width: 250,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => 
                          const Icon(Icons.person, size: 100, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // 3. PERSONAL DETAILS (RED)
              const InfoCard(
                cardColor: Color(0xFFC62828),
                title: 'Personal Details',
                details: [
                  'Full Name: Christian Jacob T. Nera',
                  'Birthday: November 16, 2004',
                  'Age: 21',
                  'Gender: Male',
                  'Address: San Fernando City, La Union',
                ],
              ),
              const SizedBox(height: 12),

              // 4. ACADEMIC INFORMATION (GREEN)
              const InfoCard(
                cardColor: Color(0xFF2E7D32),
                title: 'Academic Information',
                details: [
                  'School: Lorma Colleges',
                  'Course & Year: BSIT - 2nd Year',
                  'Student No.: 2402497',
                  'Subject: Mobile Development 2',
                  'Instructor: John Verz',
                ],
              ),
              const SizedBox(height: 12),

              // 5. MY FAVORITES (BLUE)
              const InfoCard(
                cardColor: Color(0xFF1976D2),
                title: 'My Favorites',
                details: [
                  'Food: Porkcops',
                  'Game: Lobotomy Corporation',
                  'Music: Jazz',
                  'Anime: Fate/Strange Fake',
                  'Hobby: Reading, Gaming, Watching shows, Coding(somewhat)',
                ],
              ),
              const SizedBox(height: 12),

              // 6. FUN FACTS (BROWN)
              const InfoCard(
                cardColor: Color(0xFF8D6E63),
                title: 'Fun Facts About Me',
                details: [
                  'Skill: N/A',
                  'Dream Job: Anything thats high paying',
                  'Quote: Thats that and this is this',
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String? subtitle;
  final List<String> details;
  final bool isHeader;

  const InfoCard({
    super.key,
    required this.cardColor,
    required this.title,
    required this.details,
    this.subtitle,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: isHeader ? 32 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 5),
            Text(subtitle!, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          ],
          if (details.isNotEmpty) ...[
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details.map((detail) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  detail,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              )).toList(),
            ),
          ],
        ],
      ),
    );
  }
}