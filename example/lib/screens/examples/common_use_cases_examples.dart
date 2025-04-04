import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view_example/screens/common/app_bar.dart';
import 'package:photo_view_example/screens/common/common_example_wrapper.dart';
import 'package:photo_view_example/screens/common/example_button.dart';

class CommonUseCasesExamples extends StatelessWidget {
  const CommonUseCasesExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return ExampleAppBarLayout(
      title: "Common use cases",
      showGoBack: true,
      child: ListView(
        children: <Widget>[
          ExampleButtonNode(
            title: "Large Image contained",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonExampleRouteWrapper(
                    imageProvider: const AssetImage("assets/large-image.jpg"),
                    minScale: const PhotoViewScale.contained(),
                    maxScale: const PhotoViewScale.covered() * 2.5,
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Large Image covered",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonExampleRouteWrapper(
                    imageProvider: const AssetImage("assets/large-image.jpg"),
                    initialScale: const PhotoViewScale.covered(),
                    minScale: const PhotoViewScale.contained(),
                    maxScale: const PhotoViewScale.covered() * 2.5,
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Large Image",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: AssetImage("assets/large-image.jpg"),
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Large Image (filter quality: medium)",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: AssetImage("assets/large-image.jpg"),
                    filterQuality: FilterQuality.medium,
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Small Image (custom background)",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: AssetImage("assets/small-image.jpg"),
                    backgroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Colors.white, Colors.grey],
                        stops: [0.1, 1.0],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Small Image (custom alignment)",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: AssetImage("assets/small-image.jpg"),
                    backgroundDecoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    basePosition: Alignment(0.5, 0.0),
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Animated GIF",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: AssetImage("assets/neat.gif"),
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Limited scale",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonExampleRouteWrapper(
                    imageProvider: const AssetImage("assets/large-image.jpg"),
                    minScale: const PhotoViewScale.contained() * 0.8,
                    maxScale: const PhotoViewScale.covered() * 1.1,
                    initialScale: const PhotoViewScale.covered() * 1.1,
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Custom Initial scale",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommonExampleRouteWrapper(
                    imageProvider: const AssetImage("assets/large-image.jpg"),
                    initialScale: const PhotoViewScale.contained() * 0.7,
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "One tap to dismiss",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OneTapWrapper(
                    imageProvider: AssetImage("assets/large-image.jpg"),
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "No gesture ",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonExampleRouteWrapper(
                    imageProvider: AssetImage("assets/large-image.jpg"),
                    disableGestures: true,
                  ),
                ),
              );
            },
          ),
          ExampleButtonNode(
            title: "Double Tap to Zoom",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoubleTapZoomWrapper(
                    imageProvider: AssetImage("assets/large-image.jpg"),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OneTapWrapper extends StatelessWidget {
  const OneTapWrapper({
    super.key,
    required this.imageProvider,
  });

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: GestureDetector(
          onTapDown: (_) {
            Navigator.pop(context);
          },
          child: PhotoView(
            imageProvider: imageProvider,
          ),
        ),
      ),
    );
  }
}

class DoubleTapZoomWrapper extends StatelessWidget {
  const DoubleTapZoomWrapper({
    super.key,
    required this.imageProvider,
  });

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Double Tap to Zoom"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: PhotoView(
          imageProvider: imageProvider,
          minScale: PhotoViewScale.contained(),
          maxScale: PhotoViewScale.covered() * 2.0,
          decoration: const PhotoViewDecoration(
            backgroundDecoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
