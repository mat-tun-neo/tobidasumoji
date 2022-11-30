const DEBUG_MODE = 0;              // 0: OFF, 1: ON
const CHARACTER_SPEED_MIN = 500;   // キャラクターの移動スピード（MIN）
const CHARACTER_SPEED_MAX = 1200;  // キャラクターの移動スピード（MAX）
const FADEIN_TIME = 1000;          // キャラクターのフェードイン時間
const FADEOUT_TIME = 1000;         // キャラクターのフェードアウト時間
const CHARACTER_MOVE_LIMIT = false;// キャラクターの移動制限
const LABEL_FONTSIZE = 30;         // ラベルのフォントサイズ
const LABEL_OFFSET = 70;           // ラベルのオフセット
const LABEL_FILL = "yellow";       // ラベルのFILL色
const LABEL_STROKE = "black";      // ラベルのSTROKE色
const LABEL_STROKE_WIDTH = 5;      // ラベルのSTROKE幅
const LABEL_TIME = FADEIN_TIME/20  // フェードイン中のラベル表示時間（単位：フレーム）
const TITLE_FONTSIZE = 40;         // タイトルのフォントサイズ
const TITLE_FILL = "white";        // タイトルのFILL色
const TITLE_STROKE = "black";      // タイトルのSTROKE色
const TITLE_STROKE_WIDTH = 5;      // タイトルのSTROKE幅
const TITLE_WAIT = "画像を読込中"; // 待機タイトル


// tweener定義
const CHAR_MOVE = (x, y, w, h, t) => ({
    tweens: [
    ['to', {width:w*1.25, height:h*0.4}, 1, 'easeOutElastic'],
    ['to', {x:x, y:y, width:w, height:h}, t, 'easeOutElastic']
    ]
});
const LABEL_MOVE = (x, y, w, h, t) => ({
    tweens: [
    ['to', {width:w*1.25, height:h*0.4}, 1, 'easeOutElastic'],
    ['to', {x:x, y:y - LABEL_OFFSET, width:w, height:h}, t, 'easeOutElastic']
    ]
});
const CHAR_FADEIN = (w, h) => ({
    tweens: [
    ['to', {width:80, height:80, alpha: 0.0}, 1],
    ['to', {width:w, height:h, alpha: 1.0}, FADEIN_TIME, 'easeInQuad']
    ]
});
const CHAR_FADEOUT = {
    tweens: [
    ['to', {alpha: 1.0}, 1],
    ['to', {width:80, height:80, alpha: 0.0}, FADEOUT_TIME, 'easeOutQuad']
    ]
};


ASSETS.image["mainwindow"] = "./images/question/calc2.jpg" + datestr;

ASSETS.image["hole"] = "./images/question/hole.png" + datestr;
ASSETS.spritesheet["hole"] = 
{
  "frame": { "width": 200, "height": 200, "cols": 2, "rows": 1 },
  "animations" : {
    "999": {"frames": [0],  "next": "999", "frequency": 1 },
    "000": {"frames": [1],  "next": "000", "frequency": 1 },
    "001": {"frames": [1],  "next": "001", "frequency": 1 },
    "002": {"frames": [1],  "next": "002", "frequency": 1 },
    "003": {"frames": [1],  "next": "003", "frequency": 1 },
    "004": {"frames": [1],  "next": "004", "frequency": 1 },
    "005": {"frames": [1],  "next": "005", "frequency": 1 },
    "006": {"frames": [1],  "next": "006", "frequency": 1 },
    "007": {"frames": [1],  "next": "007", "frequency": 1 },
    "008": {"frames": [1],  "next": "008", "frequency": 1 },
    "009": {"frames": [1],  "next": "009", "frequency": 1 },
    "010": {"frames": [1],  "next": "010", "frequency": 1 }
  }
}

TITLE = { x: 80, y: 125, char_size: 120, label_offset_x: 280, label_offset_y: 0, regex:"_hiyoko-01", update_frame: 200, 
    label:{
        0:"すうじをみつけて\nタッチしてみよう！",
        1:"もういちどタッチすると\nもどっていくよ"
    }
};

QUESTION["000"] = { x:   0, y:   0, char_size: 150, hole_size:  1, regex:"to-％", label:"ぱーせんと"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["001"] = { x: 324, y: 704, char_size: 150, hole_size: 60, regex:"to-1", label:"いち"        , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["002"] = { x: 409, y: 652, char_size: 200, hole_size: 60, regex:"to-2", label:"に"          , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["003"] = { x: 491, y: 604, char_size: 150, hole_size: 60, regex:"to-3", label:"さん"        , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["004"] = { x: 273, y: 627, char_size: 150, hole_size: 60, regex:"to-4", label:"よん"        , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["005"] = { x: 359, y: 574, char_size: 150, hole_size: 60, regex:"to-5", label:"ご"          , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["006"] = { x: 438, y: 527, char_size: 150, hole_size: 60, regex:"to-6", label:"ろく"        , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["007"] = { x: 209, y: 539, char_size: 200, hole_size: 60, regex:"to-7", label:"なな"        , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["008"] = { x: 298, y: 493, char_size: 150, hole_size: 60, regex:"to-8", label:"はち"        , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["009"] = { x: 380, y: 449, char_size: 200, hole_size: 60, regex:"to-9", label:"きゅう"      , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["010"] = { x:   0, y:   0, char_size: 150, hole_size:  1, regex:"to-＋", label:"ぷらす"      , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
