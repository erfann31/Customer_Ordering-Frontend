import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/information_section.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/profile_app_bar.dart';
import 'package:customer_ordering_frontend/view_model/comment_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../model/entity/comment.dart';
import 'components/comment_section.dart';

class StoreProfile extends StatefulWidget {
  const StoreProfile({super.key, required this.storeId});

  final int storeId;

  @override
  State<StoreProfile> createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  final _viewModelComment = CommentViewModel();
  final List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    _viewModelComment.getComments(widget.storeId);
    _viewModelComment.comments.stream.listen((commentsList) {
      setState(() {
        _comments.addAll(commentsList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: Material(
        child: DefaultTabController(
          length: 2,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: RedColor,
                  padding: const EdgeInsets.all(16.0),
                  child: TabBar(
                    tabs: const [
                      Tab(
                        child: Text(
                          'اطلاعات',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'نظرات',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      color: Colors.white,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      informationSection(),
                      commentSection(_comments),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
