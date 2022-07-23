// グローバルに展開
phina.globalize();

// 画面・スプライトサイズ
const SCREEN_WIDTH           = 640;
const SCREEN_HEIGHT          = 960;
const PADDING                = 10;
const BUTTON_SIZE            = 80;
const START_BUTTON_WIDTH     = 250;
const START_BUTTON_HEIGHT    = 125;

// URL
const HREF = document.getElementById("HTTP_REFERER").innerText;

const date = new Date();
const Y = date.getFullYear();
const M = ("00" + (date.getMonth()+1)).slice(-2);
const D = ("00" + date.getDate()).slice(-2);
const h = ("00" + date.getHours()).slice(-2);
const m = ("00" + date.getMinutes()).slice(-2);
const s = ("00" + date.getSeconds()).slice(-2);
const datestr = "?" + Y + M + D + h + m + s;

// 各セッティング値
const UPDATE_FRAME = 10;          // 同期フレーム
const CHARACTER_MOVE = document.getElementById("CHARACTER_MOVE").innerText;         // キャラクターの移動距離

// アセット
const ASSETS = {
  // 画像
  image: {
    "start_button":    "./images/startbutton.png" + datestr,
    "x_button":        "./images/xbutton.png" + datestr
  },
  // スプライトシート
  spritesheet: {
    "start_button":
    {
      "frame": { "width": 800, "height": 354, "cols": 1, "rows": 2 },
      "animations" : {
        "000": {"frames": [0, 1] , "next": "000", "frequency": 30 }
      }
    },
    "x_button":
    {
      "frame": { "width": 220, "height": 210, "cols": 1, "rows": 1 },
      "animations" : {
        "000": {"frames": [0] , "next": "000", "frequency": 1 }
      }
    }
  }
};

// 問題
const QUESTION = {
}

// 0パディング（NUM=値 LEN=桁数）
function zeroPadding(NUM, LEN) {
	return ( Array(LEN).join("0") + NUM ).slice( -LEN );
};

// 文字列挿入
function strIns(str, idx, val) {
  return str.slice(0, idx) + val + str.slice(idx);
}

// 配列ランダムソート（シャッフル）関数
function shuffleArray(arr) {
    var n = arr.length;
    var temp = 0, i = 0;
    while (n) {
        i = Math.floor(Math.random() * n--);
        temp = arr[n];
        arr[n] = arr[i];
        arr[i] = temp;
    }
    return arr;
}

// 乱数
const rand = (from, to) =>
  ~~(from + Math.random() * (to - from + 1))

// 重なったspriteの最前を判定
var listSemaphore = [];
function getSemaphore(obj) {
  currentFront = listSemaphore.findIndex(elem=> elem==1);
  //console.log("currentFront", currentFront);
  if (currentFront == null || obj.index > currentFront) {
    for (let i = 0; i < listSemaphore.length; i++) listSemaphore[i] = 0;
    listSemaphore[obj.index] = 1;
  }
  //console.log("getSemaphore", listSemaphore);
}
function releaseSemaphore(obj) {
  for (let i = 0; i < listSemaphore.length; i++) listSemaphore[i] = 0;
  //console.log("releaseSemaphore", listSemaphore);
}

/*
 * メイン処理
 */
phina.main(function() {
  console.log("main");
  // アプリケーションを生成
  var app = GameApp({
    width: SCREEN_WIDTH,
    height: SCREEN_HEIGHT,
    assets: ASSETS,
  });
  // fps表示
  //app.enableStats();
  // 実行
  app.replaceScene(SceneSequence());
  app.run();
});

// SceneSequenceクラス
phina.define("SceneSequence", {
  superClass: "phina.game.ManagerScene",

  // 初期化
  init: function() {
    console.log("SceneSequenceクラスinit");
    this.superInit({
      scenes: [
        { label: "Loading", className: "SceneLoading" },
        { label: "Main",    className: "SceneMain" },
        { label: "Exit",    className: "SceneExit" },
      ]
    });
  }
});
  
phina.define("SceneLoading", {
  superClass: "phina.game.LoadingScene",

  init: function(options) {
    console.log("SceneLoadingクラスinit");

    this.superInit({
      // アセット読み込み
      assets: ASSETS,
    });

    this.backgroundColor = "BLACK";

    // view
    var baseLayer = DisplayElement(options).addChildTo(this);

    // ラベル
    var label = Label({
      text: "NOW LOADING...",
    })
    .addChildTo(baseLayer)
    .setPosition(this.width*0.5, this.height*0.5)
    label.tweener.clear()
    .setLoop(1)
    .to({alpha:0}, 500)
    .to({alpha:1}, 500)
    ;
    label.fill = "white";
    label.fontSize = 40;

    this.exit("Main");
  }
});
