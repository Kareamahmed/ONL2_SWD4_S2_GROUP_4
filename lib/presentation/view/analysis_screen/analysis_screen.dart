import 'package:flutter/material.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/presentation/view/workOut/widgets/chart.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          "Activity Tracker",
          style: TextStyle(
            color: Colors.black,
            fontSize: isSmallScreen ? 18 : 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today's Target",
                              style:
                                  TextStyle(fontSize: isSmallScreen ? 16 : 18)),
                          Icon(Icons.add_box, size: isSmallScreen ? 28 : 32),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: _buildTargetBox(context, Icons.local_drink,
                                "8L", "Water Intake", Colors.blue),
                          ),
                          Flexible(
                            child: _buildTargetBox(
                                context,
                                Icons.directions_walk,
                                "2400+",
                                "Foot Steps",
                                Colors.amber),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Activity Progress",
                        style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 18,
                            fontWeight: FontWeight.bold)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Weekly",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: isSmallScreen ? 14 : 16)),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
                Container(
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Chart(),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Latest Activity",
                      style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: screenHeight * 0.01),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: screenHeight * 0.01),
                  itemBuilder: (context, index) => _buildActivityTile(
                      context,
                      _getActivityTitle(index),
                      "assets/png/2022170114.png",
                      _getActivityTime(index)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getActivityTitle(int index) {
    final titles = [
      "Drinking 300ml Water",
      "Eat Snack (Ritzbar)",
      "Morning Walk",
      "Yoga Session",
      "Breakfast",
      "Reading Session"
    ];
    return titles[index];
  }

  String _getActivityTime(int index) {
    final times = [
      "about 10 minutes ago",
      "about 30 minutes ago",
      "about 2 hours ago",
      "about 3 hours ago",
      "about 4 hours ago",
      "about 5 hours ago"
    ];
    return times[index];
  }

  Widget _buildTargetBox(BuildContext context, IconData icon, String value,
      String label, Color color) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 10 : 12),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: isSmallScreen ? 30 : 36),
          SizedBox(width: isSmallScreen ? 8 : 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isSmallScreen ? 14 : 16)),
              SizedBox(height: 4),
              Text(label,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: isSmallScreen ? 10 : 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTile(
      BuildContext context, String title, String imagePath, String time) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: isSmallScreen ? 18 : 20,
          ),
          SizedBox(width: isSmallScreen ? 8 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: isSmallScreen ? 14 : 16)),
                Text(time,
                    style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 12,
                        color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}