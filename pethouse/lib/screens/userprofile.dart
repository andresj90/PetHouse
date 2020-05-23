import 'package:flutter/material.dart';
import 'package:pethouse/widgets/bottomnavigationbar.dart';
import '../widgets/appbar.dart';
import '../models/user.dart';

class UserProfile extends StatefulWidget {
  User user = new User("Firulais Franco", "Pug", "Bogotá DC",
      "Instagram.com/francof", 'assets/images/pugprofile.jpg', 23, 40, 56, [
    'assets/images/puppy1.jpg',
    'assets/images/puppy2.jpg',
    'assets/images/puppy3.jpg',
    'assets/images/puppy4.jpg',
    'assets/images/puppy5.jpg',
    'assets/images/puppy6.jpg',
    'assets/images/puppy7.jpg',
    'assets/images/puppy8.jpg',
    'assets/images/puppy9.jpg'
  ]);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    Widget view;

    if (screenSize.size.width <= 600) {
      view = buildPortraitLayout(widget.user);
    } else {
      view = buildLanscapeLayout(widget.user);
    }

    return Scaffold(
      appBar: ApplicationBar.generateAppBar(widget.user.name, true),
      body: view,
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context, 4),
      // buildPortraitLayout(widget.user),
    );
  }
}

//portrait layout

Widget buildPortraitLayout(User user) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 70,
              // backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(user.avatar),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(user.name),
                  SizedBox(
                    height: 5,
                  ),
                  Text(user.breed),
                  SizedBox(
                    height: 5,
                  ),
                  Text(user.city),
                  SizedBox(
                    height: 5,
                  ),
                  Text(user.socialurl),
                ],
              ))
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Divider(
        height: 1,
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                Text('Pet Friends', style: ThemeData.light().textTheme.headline6),
                SizedBox(
                  height: 5,
                ),
                Text(user.posts.toString()),
              ],
            )),
            Expanded(
                child: Column(
              children: <Widget>[
                Text('Following'),
                SizedBox(
                  height: 5,
                ),
                Text(user.following.toString()),
              ],
            )),
            Expanded(
                child: Column(
              children: <Widget>[
                Text('Followers'),
                SizedBox(
                  height: 5,
                ),
                Text(user.followers.toString()),
              ],
            ))
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Divider(
        height: 1,
      ),
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: RaisedButton(child: Text('Follow'), color: Colors.blue, onPressed: null),
            ),
            new IconButton(icon: new Icon(Icons.add_circle), onPressed: null),
            new IconButton(icon: new Icon(Icons.message), onPressed: null),
            new IconButton(icon: new Icon(Icons.grade), onPressed: null),
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),

      Flexible(
        child: buildPhotoGrid(user),
      )
      // Text(user.photos.length.toString())
    ],
  );
}

//build dual panel

Widget buildLanscapeLayout(User user) {
  return Row(
    children: <Widget>[
      Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 80,
                // backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(user.avatar),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(user.name),
              SizedBox(
                height: 5,
              ),
              Text(user.breed),
              SizedBox(
                height: 5,
              ),
              Text(user.city),
              SizedBox(
                height: 5,
              ),
              Text(user.socialurl),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Text('Pet Friends'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.posts.toString()),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Text('Following'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.following.toString()),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Text('Followers'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(user.followers.toString()),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: RaisedButton(
                            child: Text('Follow'), onPressed: null),
                      ),
                      new IconButton(
                          icon: new Icon(Icons.add_circle), onPressed: null),
                      new IconButton(
                          icon: new Icon(Icons.message), onPressed: null),
                      new IconButton(
                          icon: new Icon(Icons.grade), onPressed: null),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )),
      Expanded(
        flex: 4,
        child: buildPhotoGrid(user),
      )
    ],
  );
}

//build grid layout

Widget buildPhotoGrid(User user) {
  return GridView.count(
    // Create a grid with 2 columns. If you change the scrollDirection to
    // horizontal, this produces 2 rows.
    crossAxisCount: 3,
    // Generate 100 widgets that display their index in the List.
    children: List.generate(user.photos.length, (index) {
      return Center(
          child: Image.asset(
        user.photos[index],
      ));
    }),
  );
}
