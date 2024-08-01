import 'package:asasiyat/sqlite_db/database_helper.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isLoading = true;
  List<Map<String, dynamic>> validStages = [];
  Future<void> _refreshItemList() async {
    isLoading = true;
    validStages = await DBHelper.getValidStages();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshItemList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: AppBar(
        title: Text('Todo APP'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: validStages.length,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(validStages[index]['title']),
                    subtitle: Text(validStages[index]['description']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _showFormDialog(validStages[index]['id']);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                deleteItem(validStages[index]['id']);
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showFormDialog(null);
        },
      ),
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void _showFormDialog(int? id) {
    if (id != null) {
      final selectedItem =
          validStages.firstWhere((element) => element['id'] == id);
      titleController.text = selectedItem['title'];
      descriptionController.text = selectedItem['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id != null) {
                        await updateItem(id);
                      } else {
                        await addItem();
                      }

                      titleController.text = '';
                      descriptionController.text = '';
                      Navigator.pop(context);
                    },
                    child: Text('Submit'))
              ],
            ),
          );
        });
  }

  Future<void> addItem() async {
    // ignore: unused_local_variable
    int id = await DBHelper.validStage(
        guest: 112, host: 0, souraName: 'Arra3d', souraNb: 13, grid: 3);
    await _refreshItemList();
  }

  Future<void> updateItem(int id) async {
    await DBHelper.updateStages(
        id, titleController.text, descriptionController.text);
    await _refreshItemList();
    print('result: ${id}');
  }

  Future<void> deleteItem(int id) async {
    await DBHelper.deleteStage(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Item deleted successfully')));
    await _refreshItemList();
  }
}
