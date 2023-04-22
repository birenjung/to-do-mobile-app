import 'package:flutter/material.dart';
// import 'package:flutter_crud_api/screens/single_post_screen.dart';

import '../api_service.dart';
import '../models/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // key: _formKey,
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController _titleController = TextEditingController();
  // TextEditingController _bodyController = TextEditingController();

  bool _isLoading = true;
  List<Todo> _posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });
    final posts = await ApiService.getTodos();
    setState(() {
      _posts = posts;
      _isLoading = false;
    });
  }

  // void clear() {
  //   _titleController.clear();
  //   _bodyController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 237, 239),
      appBar: _buildAppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (ctx, id) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    tileColor: Colors.white,
                    leading: Icon(
                      Icons.check_box,
                      color: Colors.blue[500],
                    ),
                    title: Text(
                      _posts[id].todo,
                      style: TextStyle(
                          fontSize: 17, decoration: TextDecoration.lineThrough),
                    ),
                    trailing: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        iconSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // Create show dialog with form
            // AddorUpdatePost(context, false, null);
          }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Color.fromARGB(255, 235, 237, 239),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Color.fromARGB(255, 76, 75, 75),
              size: 40,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                child: Image.network(
                    'https://med.gov.bz/wp-content/uploads/2020/08/dummy-profile-pic.jpg'),
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ));
  }

  //  Future<dynamic> AddorUpdatePost(
  //     BuildContext context, bool isUpdate, Post? post) {
  //       clear();
  //   if (isUpdate) {
  //     _titleController.text = post!.title;
  //     _bodyController.text = post.body;
  //   }
  //   return showDialog(
  //       context: context,
  //       builder: (ctx) {
  //         return AlertDialog(
  //           title: isUpdate ? const Text("Update Post") : const Text("Create Post"),
  //           content: Form(
  //             key: _formKey,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextFormField(
  //                   controller: _titleController,
  //                   decoration: const InputDecoration(labelText: "Title"),
  //                   validator: (value) =>
  //                       value!.isEmpty ? "Title is required" : null,
  //                 ),
  //                 TextFormField(
  //                   controller: _bodyController,
  //                   decoration: const InputDecoration(
  //                     labelText: "Body",
  //                   ),
  //                   validator: (value) =>
  //                       value!.isEmpty ? "Body is required" : null,
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 ElevatedButton(
  //                     onPressed: () async {
  //                       if (_formKey.currentState!.validate()) {
  //                         // id doesnot have any work
  //                       if(isUpdate){
  //                           Post updatedPost = await ApiService.updatePost(
  //                             Post(
  //                               title: _titleController.text,
  //                               body: _bodyController.text,
  //                               userId: 1,
  //                               id: post!.id
  //                             )
  //                           );
  //                           setState(() {
  //                             _posts[_posts.indexWhere((element) => element.id == post.id)] = updatedPost;
  //                           });

  //                       }else{
  //                           Post post = Post(
  //                             title: _titleController.text,
  //                             body: _bodyController.text,
  //                             userId: 1,
  //                             id: 1);
  //                         Post data = await ApiService.createPost(post);
  //                         setState(() {
  //                           _posts.add(data);
  //                         });
  //                       }
  //                         clear();
  //                         Navigator.pop(context);
  //                       }
  //                     },
  //                     child: isUpdate ? const Text("Update") : const Text("Create"))
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //}
}
