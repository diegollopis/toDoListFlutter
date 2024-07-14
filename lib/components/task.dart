import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task_rating.dart';

class Task extends StatefulWidget {
  final String name;
  final String img;
  final int rating;

  Task(this.name, this.img, this.rating, {super.key});

  int level = 0;

  bool checkImage() {
    return img.contains('http');
  }

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 80,
                        height: 100,
                        child: widget.checkImage()
                            ? Image.network(
                                widget.img,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.img,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: widget.level == 10 ? true : false,
                              child: const Icon(
                                Icons.done,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TaskRating(
                              rating: widget.rating,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (widget.level < 10) {
                                widget.level++;
                              }
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(Colors.blue),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  'UP',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.white38,
                          value: widget.level / 10,
                        ),
                      ),
                      Text(
                        'Nível: ${widget.level}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
