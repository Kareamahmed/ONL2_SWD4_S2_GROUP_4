import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button
          },
        ),
        title: const Text(
          "Activity Tracker",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            onPressed: () {
              // Handle right-side icon
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black), // make icons black
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Todays Target"),
                      SizedBox(
                        width: 100,
                      ),
                      Icon(Icons.add_box),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTargetBox(
                          Icons.local_drink, "8L", "Water Intake", Colors.blue),
                      _buildTargetBox(Icons.directions_walk, "2400+",
                          "Foot Steps", Colors.amber),
                    ],
                  ),
                ]),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Activity Progress",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                        Text("Weekly", style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/placeholder.png', // Replace with your placeholder image
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Latest Activity",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildActivityTile("Drinking 300ml Water",
                  "assets/png/2022170114.png", "about 10 minutes ago"),
              _buildActivityTile("Eat Snack (Ritzbar)",
                  "assets/png/2022170114.png", "about 30 minutes ago"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTargetBox(
      IconData icon, String value, String label, Color color) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20), // ✅ Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // So it wraps the content
        children: [
          Icon(icon, color: color, size: 36),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Text(label,
                  style: TextStyle(color: Colors.black54, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTile(String title, String imagePath, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
              Text(time, style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
