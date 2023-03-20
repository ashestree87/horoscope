import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(HoroscopeApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class HoroscopeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horoscope App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HoroscopeScreen(),
    );
  }
}

class HoroscopeScreen extends StatefulWidget {
  @override
  _HoroscopeScreenState createState() => _HoroscopeScreenState();
}

class _HoroscopeScreenState extends State<HoroscopeScreen> {
  final List<String> starSigns = [
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn',
    'Aquarius',
    'Pisces'
  ];

  final List<String> horoscopes = [
    'Today is a great day to start a new project. Your hard work will pay off in the end.',
    'You might encounter some challenges today, but don\'t let them discourage you. Keep pushing forward.',
    'Your communication skills will come in handy today. Use them to your advantage.',
    'You might be feeling emotional today. Take some time to reflect on your feelings and try to find a positive outlet.',
    'You\'re a natural leader and today is your day to shine. Don\'t be afraid to take charge.',
    'You\'re a hard worker, but make sure you take some time for yourself today. You deserve it.',
    'You might find yourself in a disagreement with someone today. Remember to stay calm and try to find a compromise.',
    'Your intuition will be strong today. Trust your instincts and you\'ll make the right decisions.',
    'You might encounter some unexpected obstacles today, but don\'t give up. You\'re stronger than you think.',
    'Your focus will be on your career today. Keep your eyes on the prize and success will come.',
    'You might be feeling a little rebellious today. Embrace your individuality and don\'t be afraid to stand out.',
    'You might be feeling a little overwhelmed today. Take a deep breath and remember that everything will work out in the end.',
    'Today is a good day to try something new. Step out of your comfort zone and explore.',
    'You might be feeling a little nostalgic today. Take some time to reflect on your past and how far you\'ve come.',
    'You might find yourself in a creative rut today. Take a break and come back to it with fresh eyes.',
    'Your confidence will be high today. Use it to your advantage and take on any challenges that come your way.',
    'You might be feeling a little scattered today. Take some time to organize your thoughts and make a plan.',
    'You might find yourself in a situation that tests your patience today. Stay calm and remember that this too shall pass.',
    'Your energy will be high today. Use it to tackle any tasks that you\'ve been putting off.',
    'You might be feeling a little indecisive today. Take some time to weigh your options and make a choice.',
    'You might find yourself feeling a little insecure today. Remember that you are capable and worthy of success.',
    'Your focus will be on your relationships today. Take some time to connect with those who matter most.',
    'You might encounter some unexpected changes today. Embrace them and see where they take you.',
    'Your creative energy will be high today. Use it to express yourself in new and exciting ways.',
    'You might be feeling a little overwhelmed by your responsibilities today. Take it one step at a time and you\'ll get through it.',
    'Your intuition will be strong today. Listen to it and trust that it will guide you in the right direction.',
    'You might find yourself feeling a little discouraged today. Remember that setbacks are just opportunities to learn and grow.',
    'Your focus will be on your personal growth today. Take some time to reflect on your goals and how you can achieve them.',
    'You might encounter some resistance from others today. Stay true to yourself and don\'t let them bring you down.',
    'Your energy will be high today. Use it to pursue your passions and make the most of your day.',
    'You might be feeling a little disconnected from those around you today. Reach out and connect with loved ones.',
    'You might be feeling a little restless today. Take a break and do something fun to recharge your batteries.',
    'Your analytical mind will be in overdrive today. Use it to solve problems and find solutions.',
    'You might find yourself feeling a little bored today. Challenge yourself to try something new and exciting.',
    'Your focus will be on your health today. Take some time to prioritize self-care and well-being.',
    'You might encounter some roadblocks today. Remember to stay positive and keep pushing forward.',
    'Your creativity will be on fire today. Use it to bring your ideas to life and inspire others.',
    'You might be feeling a little overwhelmed by your emotions today. Take some time to process them and find a positive outlet.',
    'Your energy will be magnetic today. Use it to attract positivity and abundance into your life.',
    'You might be feeling a little disorganized today. Take some time to declutter and simplify your life.',
    'Your focus will be on your finances today. Take some time to evaluate your budget and make smart investments.',
    'You might encounter some opposition today. Stand up for what you believe in and stay true to your values.',
    'Your determination will be unstoppable today. Use it to overcome any obstacles that come your way.',
    'You might be feeling a little anxious today. Practice mindfulness and find calm in the present moment.',
    'Your intuition will be your guide today. Trust it to lead you in the right direction.',
    'You might be feeling a little lonely today. Reach out to loved ones and surround yourself with positivity.',
    'Your career will be in focus today. Take some time to evaluate your goals and make a plan for success.',
    'You might find yourself feeling a little stuck today. Take a step back and evaluate your options.',
    'Your strength will be your superpower today. Use it to overcome any challenges that come your way.',
    'You might be feeling a little conflicted today. Take some time to find clarity and make decisions that align with your values.',
    'Your focus will be on your personal development today. Take some time to learn new skills and grow as an individual.',
    'You might find yourself in a creative flow today. Use this energy to express yourself in new and exciting ways.',
    'Your hard work and dedication will pay off today. Keep pushing forward and you will achieve your goals.',
    'You might encounter some unexpected opportunities today. Seize them and see where they take you.',
    'Your positive attitude will be your strength today. Keep smiling and radiate positivity.',
    'You might be feeling a little impulsive today. Take some time to think things through before making any big decisions.',
    'Your relationships will be a focus today. Take some time to connect with loved ones and show them how much you care.',
    'You might encounter some setbacks today, but don\'t let them discourage you. Keep moving forward.',
    'Your intuition will be strong today. Trust it to guide you in the right direction.',
    'You might be feeling a little self-critical today. Remember to be kind to yourself and focus on your strengths.',
    'Your focus will be on your personal relationships today. Show your love and appreciation for those who matter most.',
    'You might encounter some unexpected challenges today, but don\'t let them get you down. You are capable of overcoming anything.',
    'Your energy will be contagious today. Use it to inspire those around you and spread positivity.',
    'You might be feeling a little overwhelmed by your emotions today. Take some time to process them and find a healthy outlet.',
    'Your productivity will be high today. Use it to accomplish your goals and tackle any tasks on your to-do list.',
    'You might find yourself in a position of leadership today. Use your skills to inspire and guide others.',
    'Your creative energy will be on fire today. Use it to bring your ideas to life and make an impact.',
    'You might be feeling a little indecisive today. Take some time to reflect on your values and priorities.',
    'Your determination will be your superpower today. Use it to overcome any obstacles that come your way.',
    'You might encounter some resistance from others today. Remember to stay true to yourself and your beliefs.',
    'Your focus will be on personal growth and development today. Take some time to learn and expand your knowledge.',
    'You might be feeling a little restless today. Try something new and exciting to break out of your routine.',
    'Your energy will be high today. Use it to take on any challenges that come your way.',
    'You might find yourself in a creative block today. Take a break and come back to it with fresh eyes.',
    'Your communication skills will come in handy today. Use them to resolve any conflicts that may arise.',
    'You might encounter some unexpected changes today. Embrace them and see where they take you.',
    'Your confidence will be on fire today. Use it to pursue your passions and take risks.',
    'You might be feeling a little drained today. Take some time to prioritize self-care and recharge your batteries.',
    'Your analytical mind will be in overdrive today. Use it to problem-solve and find solutions.',
    'You might encounter some setbacks today, but don\'t let them get you down. Remember that every failure is an opportunity to learn.',
    'Your focus will be on your career today. Take some time to evaluate your goals and make a plan for success.',
    'You might be feeling a little disconnected from others today. Reach out and connect with loved ones to rekindle your relationships.',
    'Your focus will be on your personal relationships today. Take some time to connect with loved ones and show them how much you care.',
    'You might encounter some unexpected challenges today, but don\'t let them get you down. You are capable of overcoming anything.',
    'Your energy will be contagious today. Use it to inspire those around you and spread positivity.',
    'You might be feeling a little overwhelmed by your emotions today. Take some time to process them and find a healthy outlet.',
    'Your productivity will be high today. Use it to accomplish your goals and tackle any tasks on your to-do list.',
    'You might find yourself in a position of leadership today. Use your skills to inspire and guide others.',
    'Your creative energy will be on fire today. Use it to bring your ideas to life and make an impact.',
    'You might be feeling a little indecisive today. Take some time to reflect on your values and priorities.',
    'Your determination will be your superpower today. Use it to overcome any obstacles that come your way.',
    'You might encounter some resistance from others today. Remember to stay true to yourself and your beliefs.',
    'Your focus will be on personal growth and development today. Take some time to learn and expand your knowledge.',
    'You might be feeling a little restless today. Try something new and exciting to break out of your routine.',
    'Your energy will be high today. Use it to take on any challenges that come your way.',
    'You might find yourself in a creative block today. Take a break and come back to it with fresh eyes.',
    'Your communication skills will come in handy today. Use them to resolve any conflicts that may arise.',
    'You might encounter some unexpected changes today. Embrace them and see where they take you.',
    'Your confidence will be on fire today. Use it to pursue your passions and take risks.',
    'You might be feeling a little drained today. Take some time to prioritize self-care and recharge your batteries.',
    'Your analytical mind will be in overdrive today. Use it to problem-solve and find solutions.',
    'You might encounter some setbacks today, but don\'t let them get you down. Remember that every failure is an opportunity to learn.',
    'Your focus will be on your career today. Take some time to evaluate your goals and make a plan for success.',
    'You might be feeling a little disconnected from others today. Reach out and connect with loved ones to rekindle your relationships.',
    'Your intuition will be your guide today. Trust it to lead you in the right direction.',
    'You might be feeling a little overwhelmed by your responsibilities today. Take a deep breath and tackle one task at a time.',
    'Your creativity will be in full force today. Use it to express yourself and bring joy to others.',
    'You might find yourself in a power struggle today. Remember to stay true to your values and don\'t compromise your integrity.',
    'Your energy will be magnetic today. Use it to attract positive people and experiences into your life.',
    'You might be feeling a little insecure today. Remember that you are worthy and capable of success.',
    'Your focus will be on personal growth and healing today. Take some time to address any emotional wounds and work on healing them.',
    'You might encounter some unexpected opportunities today. Be open to new experiences and seize them when they arise.',
    'Your strength and resilience will be your superpower today. Use them to overcome any challenges that come your way.',
  ];

  String selectedStarSign = '';
  bool isStarSignSelected = false;
  DateTime _currentDate = DateTime.now();

  void _updateHoroscope() {
    final now = DateTime.now();
    if (_currentDate.day != now.day) {
      setState(() {
        _currentDate = now;
        // Shuffle the list of horoscopes for each star sign
        for (var i = 0; i < starSigns.length; i++) {
          final startIndex = i * 100;
          final endIndex = (i + 1) * 100;
          horoscopes.replaceRange(startIndex, endIndex,
              _shuffleHoroscopes(horoscopes.sublist(startIndex, endIndex)));
        }
      });
    }

    // Calculate the number of seconds until midnight
    final midnight =
        DateTime(now.year, now.month, now.day + 1).millisecondsSinceEpoch;
    final secondsToMidnight =
        DateTime.fromMillisecondsSinceEpoch(midnight).difference(now).inSeconds;

    // Schedule the next update for midnight
    Timer(Duration(seconds: secondsToMidnight), _updateHoroscope);
  }

  List<String> _shuffleHoroscopes(List<String> horoscopes) {
    final random = Random();
    for (var i = horoscopes.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = horoscopes[i];
      horoscopes[i] = horoscopes[j];
      horoscopes[j] = temp;
    }
    return horoscopes;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateHoroscope();
    });
    Timer(const Duration(seconds: 1), () {
      final midnight = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
      final secondsToMidnight = midnight.difference(DateTime.now()).inSeconds;
      Timer(Duration(seconds: secondsToMidnight), () {
        setState(() {
          _currentDate = DateTime.now();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: isStarSignSelected
            ? _buildSelectedStarSign(context)
            : _buildStarSignsList(context),
      ),
    );
  }

  Widget _buildStarSignsList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Select your star sign:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: List.generate(starSigns.length, (index) {
            final starSign = starSigns[index];
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedStarSign = starSign;
                  isStarSignSelected = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  starSign,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSelectedStarSign(BuildContext context) {
    final index = starSigns.indexOf(selectedStarSign);
    if (index < 0 || index >= horoscopes.length) {
      return const Text('Invalid star sign selected');
    }

    final horoscope = horoscopes[index];
    final date = DateFormat.yMMMMd().format(_currentDate);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedStarSign,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          date,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          horoscope,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              isStarSignSelected = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(32),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 42,
            ),
          ),
        ),
      ],
    );
  }
}
