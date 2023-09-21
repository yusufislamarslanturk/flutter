part of './part_of_learn.dart';

class _PartOfAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _PartOfAppBar({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Part Of'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
