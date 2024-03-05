import 'package:flutter/material.dart';

class IT_CS_College extends StatefulWidget {
  const IT_CS_College({super.key});

  @override
  State<IT_CS_College> createState() => _IT_CS_CollegeState();
}

class _IT_CS_CollegeState extends State<IT_CS_College> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'کۆلێجی زانست و تەکنەلۆجیا',
          style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 580,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "بەخێربێن بۆ کۆلێژی زانست و تەکنەلۆجیا. شانازییەکی گەورەیە بۆ ئێمە کە لەگەڵ ئێوەین، پێکەوە بۆ بنیاتنانی داهاتوویەکی گەش و ژیانێکی باشتر. کۆلێژەکەمان لە دوو بەشی تەکنەلۆژیای زانیاری و زانستی کۆمپیوتەر پێکهاتووە. خوێندن لە کۆلێژەکەمان هەمیشە دەبێتە هۆی دامەزراندنێکی ئەگەری لە هەریەکێک لە هەزاران کارە جیاوازەکانی پەیوەست بە شیکاری، دیزاین، جێبەجێکردن، بڵاوکردنەوە و بەڕێوەبردنی سیستەمی بنەمای کۆمپیوتەر. ئێمە کارامەیی پراکتیکی پێشکەش دەکەین کە بنەمای تێگەیشتنێکی تیۆری دروستە لە شیکاری، دیزاین و پەرەپێدانی سیستەمەکانی بنەمای کۆمپیوتەر؛ تێگەیشتن لە ڕەقەکاڵا، نەرمەکاڵا و ژێرخانی تۆڕ کە پشتگیریان دەکات؛ تێڕوانینێکی بنەڕەتی بۆ ئەو چوارچێوەیانەی کە تێیدا سەرهەڵدەدەن و کاردەکەن و پێزانینی پرسە کۆمەڵایەتی و ئەخلاقی و پیشەییەکانی پەیوەست بە گەشەکردن و کارکردنیان. خوێندکارەکانمان زانیارییەکی دروست لەسەر بنەماکانی تەکنەلۆژیای زانیاری و زانستی کۆمپیوتەر پەرەپێدەدەن، بە گرنگیدان بە کارلێکەکانی ڕەقەکاڵا و نەرمەکاڵا؛ تێگەیشتن لە کارلێکی مرۆڤ و کۆمپیوتەر و کاریگەرییە کۆمەڵناسیەکانی تەکنەلۆژیای زانیاری؛ و زانیاری لەسەر ستانداردە پیشەییەکان و هەروەها ئەخلاقی پیشەسازی کۆمپیوتەر، لەگەڵ لێهاتوویی و متمانە بەخۆبوون بۆ کاردانەوە بەرامبەر بە ڕێژەی گۆڕانکارییەکانی کە هەمیشە لە زیادبووندایە.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  'بەشەکان',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IT(),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue.shade900.withOpacity(0.3),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 150,
                        child: Text(
                          "IT بەشی",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          height: 280,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/IT.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 350,
                        left: 100,
                        child: Text(
                          "تەکنەلۆجیای زانیاری",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CS(),
                        ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue.shade900.withOpacity(0.3),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 150,
                        child: Text(
                          "CS بەشی",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        child: Container(
                          height: 280,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/CS.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 350,
                        left: 100,
                        child: Text(
                          "زانستی کۆمپیتەر",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IT extends StatelessWidget {
  const IT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'بەشی تەکنەلۆجیای زانیاری',
          style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class CS extends StatelessWidget {
  const CS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "بەشی زانستی کۆمپیتەر",
          style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        )),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: Colors.amber.withOpacity(0.8),
      ),
      backgroundColor: Colors.black.withOpacity(0.1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
