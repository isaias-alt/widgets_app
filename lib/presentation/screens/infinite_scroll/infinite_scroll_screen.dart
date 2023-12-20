import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'Infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final double currentPosition = scrollController.position.pixels;
      final double lastPosition = scrollController.position.maxScrollExtent;
      if (currentPosition + 500 >= lastPosition) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    final double currentPosition = scrollController.position.pixels;
    final double lastPosition = scrollController.position.maxScrollExtent;
    if (currentPosition + 100 <= lastPosition) return;
    scrollController.animateTo(currentPosition + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: _ListViewBuilder(
              scrollController: scrollController, imagesIds: imagesIds),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: imagesIds.length,
      itemBuilder: (context, index) {
        final networkImage = NetworkImage(
            'https://picsum.photos/id/${imagesIds[index]}/500/300');
        return FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: const AssetImage('assets/images/jar-loading.gif'),
          image: networkImage,
          imageErrorBuilder: (BuildContext context, error, stackTrace) =>
              Image.asset(
            'assets/images/image-not-aviable.png',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
