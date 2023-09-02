import 'package:flutter/material.dart';
import 'package:hostels/archetypes/room_types.dart';
import 'package:hostels/archetypes/rooms.dart';
import 'package:hostels/helpers/filter_rooms.dart';
import 'package:hostels/layouts/view_layout.dart';
import 'package:hostels/resources/string_resources.dart';
import 'package:hostels/setup/setup.dart';
import 'package:hostels/theme/theme.dart';
import 'package:hostels/views/room_type_widget_model/show_room_type_widget_modal.dart';
import 'package:hostels/widgets/room_type_widget.dart';
import 'package:hostels/widgets/room_widget.dart';
import 'package:hostels/widgets/search_input.dart';
import 'package:hostels/widgets/space.dart';

void main() {
  setup().then((_) {
    return runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: StringResources.appName,
      home: const RoomsView(),
    );
  }
}

class RoomsView extends StatefulWidget {
  const RoomsView({super.key});

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  final serachKey = GlobalKey();

  late TextEditingController controller = TextEditingController()
    ..addListener(() => setState(() {}));

  get rooms => filter(
        roomsByFloor,
        controller.text,
      ).entries;

  @override
  Widget build(BuildContext context) {
    return ViewLayout(
      //...

      title: StringResources.availableRooms,

      applyPadding: false,

      children: [
        //...

        const Space(16),

        ...[
          //...

          buildSectionTitle("Search"),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SearchInput(
              key: serachKey,
              controller: controller,
              hint: "room number, room type, floor",
            ),
          ),
        ],

        if (controller.text.isEmpty) ...[
          const Space(64),
          buildSectionTitle("Room Type"),
          buildRoomTypeListing(),
        ],

        const Space(64),

        for (var v in rooms) ...[
          //...

          buildSectionTitle(v.key.name ?? ""),

          ...v.value
              .map(
                (room) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RoomWidget(room),
                ),
              )
              .toList(),

          const Space(64),
        ]
      ],
    );
  }

  Builder buildRoomTypeListing() {
    return Builder(
      builder: (context) {
        const height = 200.0;
        const width = 160.0;

        return Container(
          constraints: const BoxConstraints(
            maxHeight: height,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var roomType in RoomTypes.all)
                GestureDetector(
                  onTap: () {
                    showRoomTypeWidgetModal(
                      context,
                      roomType,
                    );
                  },
                  child: RoomTypeWidget(
                    roomType,
                    height: height,
                    width: width,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
