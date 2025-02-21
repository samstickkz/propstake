// import 'dart:async';
// import 'dart:convert';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:get_storage/get_storage.dart';
//
// import '../../../locator.dart';
// import '../../model/default.model.dart';
// import '../../model/get-chat-response.dart';
// import '../../model/sent-message-response.dart';
// import '../../repository/repository.service.dart';
// import 'base.api.service.dart';
//
// Repository _repository = locator<Repository>();
//
// class ChatServices extends ChangeNotifier {
//
//   String matchId= "";
//
//   bool inUserInChat = false;
//
//   changeUserInChatToTrue(){
//     inUserInChat = true;
//     notifyListeners();
//   }
//
//   changeUserInChatToFalse(){
//     inUserInChat = false;
//     notifyListeners();
//   }
//
//   var messageStream = StreamController<List<GetChatResponse>>.broadcast();
//
//   addToSocket(List<GetChatResponse> chat)async{
//     messageStream.sink.add(chat);
//     notifyListeners();
//   }
//
//   Future<bool> getChatLocal(String matchID)async{
//     matchId = matchID;
//     var res = await _repository.getLocalChatsForMatch(matchID: matchID);
//     if(res != null){
//       List<GetChatResponse> chatResponse = res;
//       addToSocket(chatResponse);
//       List<GetChatResponse> otherList = chatResponse.where((element) => element.senderId != userService.user.id).toList();
//       List<GetChatResponse> unViewedChat = otherList.where((element) => element.viewed != true).toList();
//       List<String> unread = unViewedChat.map((e) => e.sId??"").toList();
//       locator<ChatServices>().markMessagesViewed(messageIds: unread);
//       notifyListeners();
//
//       List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//       if(allChats.any((element) => element.matchId == matchID)){
//         int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == matchID));
//         allChats[index] = ChatResponse(
//             matchId: matchID,
//             chats: chatResponse
//         );
//       }else{
//         allChats.add(ChatResponse(
//             matchId: matchID,
//             chats: chatResponse
//         ));
//       }
//
//       await _repository.storeAllChats(response: allChats);
//
//       return true;
//     }else{
//       notifyListeners();
//       return false;
//     }
//   }
//
//   Future<void> getUndeliveredMessages(String matchID) async {
//     List<GetChatResponse> chat = [];
//
//     var res = await _repository.getLocalChatsForMatch(matchID: matchID);
//     if (res != null) {
//       chat = res;
//     }
//
//     if (chat.isEmpty) return;
//
//     List<GetChatResponse> unsent = chat.where((element) => element.tempId != null && element.sId == null).toList();
//     Map<String, int> tempIdMap = {};
//
//     for (var chit in unsent) {
//       if (chit.tempId != null) {
//         if (!tempIdMap.containsKey(chit.tempId)) {
//           tempIdMap[chit.tempId!] = chat.indexOf(chit);
//         } else {
//           int existingIndex = tempIdMap[chit.tempId!]!;
//           chat.removeAt(chat.indexOf(chit));  // Remove duplicate entries
//           unsent.remove(chit);  // Also remove from unsent list
//         }
//       }
//     }
//
//     for (var chit in unsent) {
//       int index = chat.indexOf(chit);
//
//       if (chit.content?.message != null && chit.recipientId != null && chit.tempId != null && chit.matchId != null) {
//         try {
//           await locator<ChatServices>().sendMessageChange(
//             message: chit.content!.message!,
//             recipientId: chit.recipientId!,
//             tempId: chit.tempId!,
//             matchID: chit.matchId!,
//             index: index,
//           );
//         } catch (e) {
//           print('Failed to send message: $e');
//         }
//       } else {
//         print('Missing required fields for message with tempId: ${chit.tempId}');
//       }
//     }
//   }
//
//
//   Future<bool> getOnlineChats(String matchID)async{
//     matchId = matchID;
//     try{
//       var res = await _repository.getChat(matchId: matchID);
//       if(res.isRight()){
//
//         List<GetChatResponse> finalList  = [];
//
//         List<GetChatResponse> chatResponse = res.asRight();
//
//         List<GetChatResponse> response = await _repository.getLocalChatsForMatch(matchID: matchID)??[];
//
//         // Create a set of existing IDs to check for existence efficiently
//         Set<String?> responseIds = response.map((item) => item.sId).toSet();
//
//         // Add items from the response list to the finalList
//         finalList.addAll(response);
//
//         // Iterate through chatResponse and add items that are not in the response list
//         for (var chatItem in chatResponse) {
//           if (!responseIds.contains(chatItem.sId)) {
//             finalList.add(chatItem);
//           }
//         }
//
//         // Sort the finalList by the timestamp
//         finalList.sort((a, b) => a.timestamp?.compareTo(b.timestamp ?? 0) ?? 0);
//
//
//         addToSocket(finalList);
//
//         List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//         if(allChats.any((element) => element.matchId == matchID)){
//           int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == matchID));
//           allChats[index] = ChatResponse(
//             matchId: matchID,
//             chats: finalList
//           );
//         }else{
//           allChats.add(ChatResponse(
//             matchId: matchID,
//             chats: finalList
//           ));
//         }
//
//         await _repository.storeAllChats(response: allChats);
//
//         await storageService.storeItem(
//             key: "${StorageKey.CHAT_RESPONSE_USER}$matchID",
//             value: getChatResponseDataListToJson(finalList)
//         );
//
//         notifyListeners();
//         return true;
//       }
//       return false;
//     }catch(err){
//       AppLogger.debug(err.toString());
//       notifyListeners();
//       return false;
//     }
//   }
//
//   IO.Socket? socket;
//
//   initSocket() {
//
//     String? value = box.read(StorageKey.TOKEN_TABLE_NAME); // Replace with your actual token table name
//
//     if (socket != null || value == null) {
//       socket?.close();
//       return;
//     }
//
//     // Headers map
//     Map<String, dynamic> headers = {
//       'Authorization': "Bearer $value",
//       'Connection':'Upgrade',
//       'Upgrade':'websocket',
//     };
//
//     // Initializing socket with headers
//     socket = IO.io(
//       'wss://chat.r4m.io',
//       IO.OptionBuilder()
//           .setTransports(['websocket'])
//           .enableAutoConnect()
//           .enableReconnection()
//           .setExtraHeaders(headers)
//           .build(),
//     );
//
//     socket?.auth = headers;
//
//     socket!.connect();
//
//     socket!.onConnect((_) async {
//       print("CONNECTION SUCCESSFUL");
//       if(matchId.isNotEmpty){
//         getUndeliveredMessages(matchId);
//       }
//       // await getAllMessagesSocket();
//     });
//
//     socket!.on('messageSent', (data) async {
//       if (data != null) {
//         print('messageSent: $data');
//         SentMessageResponse _sentMessageResponse = SentMessageResponse.fromJson(data);
//         List<GetChatResponse> chats = await _repository.getLocalChatsForMatch(matchID: _sentMessageResponse.matchId ?? "") ?? [];
//         int index = chats.indexWhere((chat) => chat.tempId == _sentMessageResponse.tempId);
//         if (index != -1) {
//           GetChatResponse old = chats[index];
//           GetChatResponse newMessage = GetChatResponse(
//             content: old.content,
//             recipientId: old.recipientId,
//             sId: _sentMessageResponse.messageId,
//             senderId: userService.user.id,
//             viewed: old.viewed,
//             tempId: null,
//             type: old.type,
//             matchId: old.matchId,
//             timestamp: old.timestamp,
//             received: old.received
//           );
//           chats[index] = newMessage;
//
//           print("NEW LENGTH:::  ${chats.length}");
//
//           messageStream.sink.add(chats);
//
//           List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//           if(allChats.any((element) => element.matchId == old.matchId)){
//             int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == old.matchId));
//             allChats[index] = ChatResponse(
//                 matchId: old.matchId,
//                 chats: chats
//             );
//           }else{
//             allChats.add(ChatResponse(
//                 matchId: old.matchId,
//                 chats: chats
//             ));
//           }
//
//           await _repository.storeAllChats(response: allChats);
//
//           await storageService.storeItem(
//               key: "${StorageKey.CHAT_RESPONSE_USER}${_sentMessageResponse.matchId}",
//               value: getChatResponseDataListToJson(chats)
//           );
//
//           notifyListeners();
//
//         }
//       }
//     });
//
//     socket!.on('messageReceived', (data) async {
//       if (data != null) {
//         GetChatResponse chat = GetChatResponse.fromJson(data);
//         List<GetChatResponse> chats = await _repository.getLocalChatsForMatch(matchID: chat.matchId??"")??[];
//         print(chats.length);
//         chats.add(chat);
//         messageStream.sink.add(chats);
//         await _repository.storeChats(response: chats, matchID: chat.matchId??"");
//
//         List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//         if(allChats.any((element) => element.matchId == chat.matchId)){
//           int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == chat.matchId));
//           allChats[index] = ChatResponse(
//               matchId: chat.matchId,
//               chats: chats
//           );
//         }else{
//           allChats.add(ChatResponse(
//               matchId: chat.matchId,
//               chats: chats
//           ));
//         }
//
//         await _repository.storeAllChats(response: allChats);
//
//         print('messageReceived: $data');
//         if(!inUserInChat){
//           NotificationService.showBigTextNotification(title: "New Message", body: chat.content?.message??"");
//         }
//       }
//     });
//
//     socket!.on('messageDelivered', (data) async {
//       if (data != null) {
//         print('messageDelivered: $data');
//         SentMessageResponse _sentMessageResponse = SentMessageResponse.fromJson(data);
//         List<GetChatResponse> chats = await _repository.getLocalChatsForMatch(matchID: _sentMessageResponse.matchId??"")??[];
//         int index = chats.indexWhere((chat) => chat.sId == _sentMessageResponse.messageId);
//         GetChatResponse? old = chats.firstWhere((chat) => chat.sId == _sentMessageResponse.messageId);
//         GetChatResponse newMessage = GetChatResponse(
//           content: old.content,
//           recipientId: old.recipientId,
//           sId: _sentMessageResponse.messageId,
//           senderId: userService.user.id,
//           viewed: old.viewed,
//           type: old.type,
//           matchId: old.matchId,
//           timestamp: old.timestamp,
//           received: true,
//         );
//         chats.removeAt(index);
//         chats.insert(index, newMessage);
//
//         print("NEW LENGTH:::  ${chats.length}");
//
//         messageStream.sink.add(chats);
//
//         await storageService.storeItem(
//             key: "${StorageKey.CHAT_RESPONSE_USER}${_sentMessageResponse.matchId}",
//             value: getChatResponseDataListToJson(chats)
//         );
//
//         List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//         if(allChats.any((element) => element.matchId == old.matchId)){
//           int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == old.matchId));
//           allChats[index] = ChatResponse(
//               matchId: old.matchId,
//               chats: chats
//           );
//         }else{
//           allChats.add(ChatResponse(
//               matchId: old.matchId,
//               chats: chats
//           ));
//         }
//
//         await _repository.storeAllChats(response: allChats);
//
//         notifyListeners();
//
//       }
//     });
//
//     socket!.on('messageViewed', (data) async {
//       if (data != null) {
//         print('messageViewed: $data');
//
//         SentMessageResponse _sentMessageResponse = SentMessageResponse.fromJson(data);
//         List<GetChatResponse> chats = await _repository.getLocalChatsForMatch(matchID: _sentMessageResponse.matchId??"")??[];
//         int index = chats.indexWhere((chat) => chat.sId == _sentMessageResponse.messageId);
//         GetChatResponse? old = chats.firstWhere((chat) => chat.sId == _sentMessageResponse.messageId);
//         GetChatResponse newMessage = GetChatResponse(
//           content: old.content,
//           recipientId: old.recipientId,
//           sId: _sentMessageResponse.messageId,
//           senderId: userService.user.id,
//           viewed: true,
//           type: old.type,
//           matchId: old.matchId,
//           timestamp: old.timestamp,
//           received: true,
//         );
//         chats.removeAt(index);
//         chats.insert(index, newMessage);
//
//         messageStream.sink.add(chats);
//
//         List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//         if(allChats.any((element) => element.matchId == old.matchId)){
//           int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == old.matchId));
//           allChats[index] = ChatResponse(
//               matchId: old.matchId,
//               chats: chats
//           );
//         }else{
//           allChats.add(ChatResponse(
//               matchId: old.matchId,
//               chats: chats
//           ));
//         }
//
//         await _repository.storeAllChats(response: allChats);
//
//         await storageService.storeItem(
//             key: "${StorageKey.CHAT_RESPONSE_USER}${_sentMessageResponse.matchId}",
//             value: getChatResponseDataListToJson(chats)
//         );
//
//         notifyListeners();
//       }
//     });
//
//     socket!.onError((data) => {
//       print("ERROR MESSAGE::: $data")
//     });
//
//     socket!.onDisconnect((_) {
//       print("DISCONNECTED");
//     });
//   }
//
//   closeSocket() {
//     socket?.close();
//   }
//
//   Future<void> sendMessageChange({
//     required String message,
//     required String matchID,
//     required String recipientId,
//     required String tempId,
//     String? type,
//     String? url,
//     int? index
//   }) async {
//     Map<String, dynamic> datas = {
//       "tempId": tempId,
//       "recipientId": recipientId,
//       "type": type ?? "text",
//       "content": {
//         "message": message
//       }
//     };
//
//     socket!.emit('sendMessage', datas);
//
//     GetChatResponse res = GetChatResponse(
//         content: Content(message: message),
//         recipientId: recipientId,
//         tempId: tempId,
//         senderId: userService.user.id,
//         viewed: false,
//         type: type ?? "text",
//         matchId: matchID,
//         timestamp: Utils.dateTimeToUtcTimestamp(DateTime.now()),
//         received: false
//     );
//
//     List<GetChatResponse> chats = await _repository.getLocalChatsForMatch(matchID: matchID) ?? [];
//
//     if (index != null) {
//       chats[index] = res;  // Replace the item at the given index
//       await storageService.storeItem(
//           key: "${StorageKey.CHAT_RESPONSE_USER}$matchID",
//           value: getChatResponseDataListToJson(chats)
//       );
//     } else {
//       await _repository.storeChats(response: [res], matchID: matchID);
//     }
//
//     List<GetChatResponse> updatedChat = await _repository.getLocalChatsForMatch(matchID: matchID) ?? [];
//     messageStream.sink.add(updatedChat);
//
//     List<ChatResponse> allChats = await _repository.getAllLocalChats()??[];
//
//     if(allChats.any((element) => element.matchId == matchID)){
//       int index = allChats.indexOf(allChats.firstWhere((element) => element.matchId == matchID));
//       allChats[index] = ChatResponse(
//           matchId: matchID,
//           chats: chats
//       );
//     }else{
//       allChats.add(ChatResponse(
//           matchId: matchID,
//           chats: chats
//       ));
//     }
//
//     await _repository.storeAllChats(response: allChats);
//
//     FocusManager.instance.primaryFocus?.unfocus();
//
//     notifyListeners();
//   }
//
//
//
//   markMessagesViewed({required List<String> messageIds}) async {
//     if(messageIds.isNotEmpty){
//       socket!.emit('markMessagesViewed', messageIds);
//     }
//   }
//
//   iAmTyping({required String recipientId, required bool isTyping}) async {
//     Map<String, dynamic> datas = {
//       "typing": isTyping,
//       "recipientId": recipientId
//     };
//     socket!.emit('typing', datas);
//   }
//
//   static Future<Either<ResModel, List<GetChatResponse>>> getChat({required String matchId}) async {
//     try {
//       Response response = await connect().get("chat/messages/$matchId");
//       return Right(getGetChatResponseDataListFromJson(response.data));
//     } on DioError catch (e) {
//       return Left(resModelFromJson(e.response?.data));
//     } catch (e) {
//       return Left(ResModel(message: e.toString()));
//     }
//   }
//
//
// }