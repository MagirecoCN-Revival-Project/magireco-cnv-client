nativeCallback = function (pram) {
  console.log(pram);
}

getBaseData = function (pram) {
  console.log(pram);
  JSON.parse(pram, function(key, value) {
    var name = "image" + key;
    var base64 = value;
    var image = "url(data:image/png;base64," + base64 + ")";
    document.getElementById(name).style.backgroundImage = image;
  });
}

function command(id, pram) {
  var message = "game:" + id + "," + pram;
  console.log("message: ", message);
  try {
    webkit.messageHandlers.gameCommand.postMessage(message);
  } catch (e) {
    alert(message);
  }
}

document.body.addEventListener('touchstart', function(e){
  console.log(e);
  var json = [];
  for (var i = 0; i < e.touches.length; i++){
    var identifier = e.touches[i].identifier;
    if (identifier < 0) {
      identifier = -identifier;
    }
    json[i] = {
      "identifier" : identifier,
      "clientX"    : e.touches[i].clientX,
      "clientY"    : e.touches[i].clientY
    }
  }
  command(Config["DATA_CALL_TOUCHES_BEGIN"], JSON.stringify(json));
});

document.body.addEventListener('touchmove', function(e){
  console.log(e);
  var json = [];
  for (var i = 0; i < e.touches.length; i++){
    var identifier = e.touches[i].identifier;
    if (identifier < 0) {
      identifier = -identifier;
    }
    json[i] = {
      "identifier" : identifier,
      "clientX"    : e.touches[i].clientX,
      "clientY"    : e.touches[i].clientY
    }
  }
  command(Config["DATA_CALL_TOUCHES_MOVE"], JSON.stringify(json));
});

document.body.addEventListener('touchend', function(e){
  console.log(e);
  var json = [];
  for (var i = 0; i < e.changedTouches.length; i++){
    var identifier = e.changedTouches[i].identifier;
    if (identifier < 0) {
      identifier = -identifier;
    }
    json[i] = {
      "identifier" : identifier,
      "clientX"    : e.changedTouches[i].clientX,
      "clientY"    : e.changedTouches[i].clientY
    }
  }
  command(Config["DATA_CALL_TOUCHES_END"], JSON.stringify(json));

  var key = e.target.id;
  console.log(key);

  if (key == "DATA_GET_BASE64") {
    command(Config[key], obj);
  }
  if (key == "DATA_GET_DEVICE_INFO") {
    command(Config[key], "");
  }
   if (key == "DATA_CLOSE_APP") {
    command(Config[key], "");
   }
  if (key == "DATA_OPEN_EDIT_BOX") {
    command(Config[key], "{}");
  }
  if (key == "DATA_SET_CLIPBOARD") {
    command(Config[key], "\"a\\iueo");
  }
  if (key == "DATA_GET_CLIPBOARD") {
    var json = {
      "callback" : "clipboard",
    };
    command(Config[key], JSON.stringify(json));
  }
  if (key == "NOTI_GET_CONF_PNOTE") {
    command(Config[key], "{}");
  }
  if (key == "NOTI_AWAKE_PNOTE") {
    command(Config[key], JSON.stringify(NOTI_AWAKE_PNOTE_OBJ_1));
  }
  if (key == "NOTI_TURN_ON_PNOTE") {
    command(Config[key], JSON.stringify(NOTI_AWAKE_PNOTE_OBJ_2));
  }
  if (key == "NOTI_TURN_OFF_PNOTE") {
    command(Config[key], "{}");
  }
  if (key == "NOTI_GET_CONF_WEEKLY_QUEST") {
    command(Config[key], "{}");
  }
  if (key == "NOTI_TURN_ON_WEEKLY_QUEST") {
    command(Config[key], JSON.stringify(noti_turn_on_weekly_quest_obj));
  }
  if (key == "NOTI_TURN_OFF_WEEKLY_QUEST") {
    command(Config[key], JSON.stringify(noti_turn_off_weekly_quest_obj));
  }
  if (key == "NOTI_GET_CONF_AP_FULL") {
    command(Config[key], "{}");
  }
  if (key == "NOTI_TURN_ON_AP_FULL") {
    command(Config[key], "10");
  }
  if (key == "NOTI_TURN_OFF_AP_FULL") {
    command(Config[key], "{}");
  }
  if (key == "DISPLAY_ADD_MOVIE") {
    command(Config[key], "movie_1001.usm");
  }
  if (key == "DISPLAY_PLAY_COMPOSE_EFFECT") {
    command(400, "false");
    command(Config[key], "");
  }
  if (key == "DISPLAY_SHOW_COMPOSE_RESULT") {
    command(400, "false");
    command(Config[key], "");
  }
  if (key == "DISPLAY_HIDE_COMPOSE") {
    command(400, "false");
    command(Config[key], "");
  }
  if (key == "DISPLAY_PLAY_COMPOSE_MAGIA") {
    command(400, "false");
    command(Config[key], "");
  }
  if (key == "DISPLAY_PLAY_AWAKE_ABILITY") {
    var json = {
      "type" : "CHARGE",
      "value" : 66,
      "x" : 400,
      "y" : 200,
      "scale" : 1.2,
    };
    command(400, "false");
    command(Config[key], JSON.stringify(json));
  }
  if (key == "DISPLAY_PLAY_NORMAL_GACHA_TOP") {
    command(400, "false");
    command(Config[key], "{\"x\":512, \"y\":288, \"memoriaIdList\":[200302,290006,490102]}");
  }
  if (key == "DISPLAY_STOP_NORMAL_GACHA_TOP") {
    command(Config[key], "");
  }
  if (key == "DISPLAY_PLAY_MEMORIA_TOP") {
    command(400, "false");
    command(Config[key], "[200302,290006,490102]");
  }
  if (key == "DISPLAY_STOP_MEMORIA_TOP") {
    command(Config[key], "");
  }
  if (key == "SCENE_PUSH_TOP") {
    command(Config[key], "");
  }
  if (key == "SCENE_PUSH_ANOTHER_QUEST") {
    var json = [2001,2002,2004,2005,2006];
    command(Config[key], JSON.stringify(json));
  }
  if (key == "SCENE_POP_ANOTHER_QUEST") {
    command(Config[key], "");
  }
  if (key == "SCENE_PLAY_ANOTHER_QUEST") {
    var json = {
      "foucusId" : 2004,
      "isRightRotation" : false
    }
    command(Config[key], JSON.stringify(json));
  }
  if (key == "SCENE_PUSH_EVENT_TEST") {
    command(Config[key], "");
  }
  if (key == "DISPLAY_PLAY_FORMATION") {
    var json = [
      {
        "miniCharId" : 100100,
        "positionId" : 0,
        "isLeader" : true,
        "isSupport" : false
      },
      {
        "miniCharId" : 100200,
        "positionId" : 1,
        "isLeader" : false,
        "isSupport" : false
      },
      {
        "miniCharId" : 100300,
        "positionId" : 2,
        "isLeader" : false,
        "isSupport" : true
      },
      {
        "miniCharId" : 100400,
        "positionId" : 3,
        "isLeader" : true,
        "isSupport" : true,
        "isUnknown" : true
      },
      {
        "miniCharId" : 100500,
        "positionId" : 4,
        "isLeader" : false,
        "isSupport" : true
      }];
    command(400, "false");
    command(Config[key], JSON.stringify(json));
    command(400, "true");
  }
  if (key == "DISPLAY_STOP_FORMATION") {
    command(Config[key], "");
  }
  if (key == "DISPLAY_PLAY_WEEKLY_QUEST_TOP") {
    var json = [
        "resource/image_native/gift/item_gift_a_111.png",
        "resource/image_native/gift/item_gift_a_121.png",
        "resource/image_native/gift/item_gift_a_131.png",
        "resource/image_native/gift/item_gift_a_211.png",
      ];
    command(Config[key], JSON.stringify(json));
  }
  if (key == "DISPLAY_STOP_WEEKLY_QUEST_TOP") {
    command(Config[key], "");
  }
  if (key == "DISPLAY_PLAY_FORMATION_ENEMY") {
    var json = {
      "displayAlignIcon" : false,
      "enemyList" : [
      {
        "miniCharId" : 710500,
        "pos" : 1,
        "bossType": 0,
        "align": "WATER",
        "hp": 10000
      },
      {
        "miniCharId" : 710500,
        "pos" : 2,
        "bossType": 0,
        "align": "FIRE",
        "hp": 10000
      },
     {
        "miniCharId" : 710500,
        "pos" : 3,
        "bossType": 0,
        "align": "TIMBER",
        "hp": 10000
      },
      {
        "miniCharId" : 710500,
        "pos" : 4,
        "bossType": 0,
        "align": "DARK",
        "hp": 10000
      },
     {
        "miniCharId" : 600100,
        "pos" : 5,
        "bossType": 3,
        "align": "VOID",
        "hp": 10000
      },
      {
        "miniCharId" : 710500,
        "pos" : 6,
        "bossType": 0,
        "align": "FIRE",
        "hp": 10000
      },
     {
        "miniCharId" : 710500,
        "pos" : 7,
        "bossType": 0,
        "align": "WATER",
        "hp": 10000
      },
      {
        "miniCharId" : 710500,
        "pos" : 8,
        "bossType": 0,
        "align": "LIGHT",
        "hp": 10000
      },
      {
        "miniCharId" : 710500,
        "pos" : 9,
        "bossType": 0,
        "align": "DARK",
        "hp": 10000
      }]};
    command(400, "false");
    command(Config[key], JSON.stringify(json));
    command(400, "true");
  }
  if (key == "DISPLAY_STOP_FORMATION_ENEMY") {
    command(Config[key], "");
  }
  if (key == "SCENE_PUSH_MOVIE") {
    command(Config[key], "resource/movie/other/op_movie.usm");
  }
  if (key == "SCENE_PUSH_MOVIE_CHAR") {
    command(Config[key], "movie_1001.usm");
  }
  if (key == "DATA_GET_QUEST_REPLAY_DATA_ID") {
    command(Config[key], "");
  }
  if (key == "DATA_DELETE_QUEST_REPLAY_DATA") {
    command(Config[key], "");
  }
  if (key == "DATA_GET_QUEST_REPLAY_VERSION") {
    command(Config[key], "");
  }
  if (key == "DATA_GET_PURCHASE_STATE") {
    command(Config[key], "");
  }
  if (key == "SCENE_PUSH_QUEST_REPLAY") {
    var json ={"userQuestBattleResultId":"00000000-0000-0000-0000-000000000000","replayId":"0000000000000000","replayVersion":"3.0.0","replayData":"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"};
    command(Config[key], JSON.stringify(json));  }
  if (key == "SCENE_SEND_QUEST_REPLAY_DATA") {
    var json ={"userQuestBattleResultId":"00000000-0000-0000-0000-000000000000"};
    command(Config[key], JSON.stringify(json));  }
}, false);

command(Config["DISPLAY_SET_WEBVIEW_VISIBLE"], "true");
