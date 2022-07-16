import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime('Europe/London','London','uk.png'),
    WorldTime('Europe/Berlin','Athens','greece.png'),
    WorldTime('Africa/Cairo','Cairo','egypt.png'),
    WorldTime('Africa/Nairobi','Nairobi','kenya.png'),
    WorldTime('America/Chicago','Chicago','usa.png'),
    WorldTime('America/New_York','New York','usa.png'),
    WorldTime('Asia/Seoul','Seoul','south_korea.png'),
    WorldTime('Asia/Jakarta','Jakarta','indonesia.png'),
    WorldTime('Asia/Karachi','Karachi','pakistan.png'),
  ];

  void updateTime(index) async
  {
    WorldTime vinay1=locations[index];
    await vinay1.getTime();
    Navigator.pop(context,{
    'time':vinay1.time,'location':vinay1.location,'flag':vinay1.flag,'isDay':vinay1.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.blue[900],title: Text('Choose a Location'),
      centerTitle: true,elevation: 0,),
      body: ListView.builder(itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
