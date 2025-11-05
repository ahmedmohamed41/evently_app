import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static Future<UserCredential> register(String email, String password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> login(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static CollectionReference<UserModel> _getUserCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollection = _getUserCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel?> getUserFromFireStore(
    String uid,
  ) async {
    CollectionReference<UserModel> usersCollection = _getUserCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
    return documentSnapshot.data();
  }

  static CollectionReference<EventModel> _getEventCollection(
    BuildContext context,
  ) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromJson(snapshot.data()!, context),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = _getEventCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.eventId = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<void> updateEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = _getEventCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc(
      event.eventId,
    );

    return eventDocument.update(event.toJson());
  }
  static Future<void> deleteEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference<EventModel> eventsCollection = _getEventCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc(
      event.eventId,
    );

    return eventDocument.delete();
  }

  static Future<List<EventModel>> getEventFromFireStore(
    BuildContext context, [
    CategoryModel? category,
  ]) async {
    CollectionReference<EventModel> eventsCollection = _getEventCollection(
      context,
    );

    QuerySnapshot<EventModel> querySnapshot = await eventsCollection
        .where(
          'categoryId',
          isEqualTo: category?.id == "0" ? null : category?.id,
        )
        .orderBy(
          'dateTime',
        )
        .get();
    List<EventModel> events = querySnapshot.docs
        .map(
          (documentSnapshot) => documentSnapshot.data(),
        )
        .toList();
    return events;
  }

  static Stream<List<EventModel>> getEventFromFireStoreRealTimeUpdates(
    BuildContext context,
    CategoryModel category,
  ) async* {
    CollectionReference<EventModel> eventsCollection = _getEventCollection(
      context,
    );

    Stream<QuerySnapshot<EventModel>> collectionSnapshot = eventsCollection
        .where('categoryId', isEqualTo: category.id == "0" ? null : category.id)
        .orderBy(
          'dateTime',
        )
        .snapshots();
    Stream<List<EventModel>> events = collectionSnapshot.map(
      (querySnapshot) => querySnapshot.docs
          .map(
            (documentSnapshot) => documentSnapshot.data(),
          )
          .toList(),
    );
    yield* events;
  }

  static Future<void> addEventToFavourite(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;

    currentUser.favouritesIds.add(event.eventId);
    CollectionReference<UserModel> collectionReference = _getUserCollection();
    DocumentReference<UserModel> documentReference = collectionReference.doc(
      currentUser.id,
    );
    return documentReference.set(currentUser);
  }

  static Future<void> removeEventToFavourite(EventModel event) {
    UserModel currentUser = UserModel.currentUser!;

    currentUser.favouritesIds.remove(event.eventId);
    CollectionReference<UserModel> collectionReference = _getUserCollection();
    DocumentReference<UserModel> documentReference = collectionReference.doc(
      currentUser.id,
    );
    return documentReference.set(currentUser);
  }

  static Future<List<EventModel>> getFavouriteEvent(
    BuildContext context,
  ) async {
    List<EventModel> events = await getEventFromFireStore(context);
    List<EventModel> favEvents = events
        .where(
          (event) =>
              UserModel.currentUser!.favouritesIds.contains(event.eventId),
        )
        .toList();
    return favEvents;
  }

  // static Stream<List<EventModel>> getFavouriteEventRealTimeUpdate(
  //   BuildContext context,
  //   [CategoryModel? category,]
  // ) async* {
  //   CollectionReference<EventModel> eventsCollection = _getEventCollection(
  //     context,
  //   );
  //   Stream<QuerySnapshot<EventModel>> collectionSnapshot = eventsCollection
  //       .where('categoryId', isEqualTo: category?.id == "0" ? null : category?.id)
  //       .orderBy(
  //         'dateTime',
  //       )
  //       .snapshots();
  //   Stream<List<EventModel>> events = collectionSnapshot.map(
  //     (querySnapshot) => querySnapshot.docs
  //         .map(
  //           (documentSnapshot) => documentSnapshot.data(),
  //         )
  //         .toList(),
  //   );
  //   events.where(
  //     (event) =>
  //         UserModel.currentUser!.favouritesIds.contains(event.first.eventId),
  //   );
  //   yield* events;
  // }
  // static Stream<List<EventModel>> getFavouriteEventRealTimeUpdate(
  //   BuildContext context, [
  //   CategoryModel? category,
  // ]) async* {
  //   CollectionReference<EventModel> eventsCollection = _getEventCollection(
  //     context,
  //   );
  //   // 🔹 نجيب كل الأحداث اللي بتحصل عليها تحديثات مباشرة
  //   Stream<QuerySnapshot<EventModel>> collectionSnapshot = eventsCollection
  //       .orderBy('dateTime')
  //       .snapshots();
  //   // 🔹 نحولها لقائمة من الأحداث ونفلتر حسب المفضلات
  //   yield* collectionSnapshot.map((querySnapshot) {
  //     final allEvents = querySnapshot.docs.map((doc) => doc.data()).toList();
  //     // 🔹 نفلتر المفضلات فقط
  //     final favEvents = allEvents.where((event) {
  //       return UserModel.currentUser!.favouritesIds.contains(event.eventId);
  //     }).toList();
  //     return favEvents;
  //   });
  // }
}
