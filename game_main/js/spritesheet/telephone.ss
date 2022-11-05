const DEBUG_MODE = 0;              // 0: OFF, 1: ON
const GAME_START_TIMER = 2000      // ゲーム開始までのタイマー（ms）
const CHARACTER_SPEED_MIN = 500;   // キャラクターの移動スピード（MIN）
const CHARACTER_SPEED_MAX = 1200;  // キャラクターの移動スピード（MAX）
const CHARACTER_MOVE_LIMIT = false;// キャラクターの移動制限
const FADEIN_TIME = 1000;          // キャラクターのフェードイン時間
const FADEOUT_TIME = 1000;         // キャラクターのフェードアウト時間
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
const CHAR_FADEIN = {
    tweens: [
    ['to', {width:80, height:80, alpha: 0.0}, 1],
    ['to', {width:150, height:150, alpha: 1.0}, FADEIN_TIME, 'easeInQuad']
    ]
};
const CHAR_FADEOUT = {
    tweens: [
    ['to', {alpha: 1.0}, 1],
    ['to', {width:80, height:80, alpha: 0.0}, FADEOUT_TIME, 'easeOutQuad']
    ]
};


ASSETS.image["mainwindow"] = "./images/question/telephone.jpg" + datestr;

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
    "009": {"frames": [1],  "next": "009", "frequency": 1 }
  }
}

TITLE = { x: 80, y: 125, char_size: 120, label_offset_x: 280, label_offset_y: 0, regex:"_hiyoko-01", update_frame: 200, 
    label:{
        0:"すうじをみつけて\nタッチしてみよう！",
        1:"もういちどタッチすると\nもどっていくよ"
    }
};

QUESTION["000"] = { x: 350, y: 558, char_size: 150, hole_size: 60, regex:"ic-0", label:"ぜろ"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["001"] = { x: 322, y: 352, char_size: 150, hole_size: 60, regex:"ic-1", label:"いち"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["002"] = { x: 397, y: 365, char_size: 150, hole_size: 60, regex:"ic-2", label:"に"    , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["003"] = { x: 473, y: 378, char_size: 150, hole_size: 60, regex:"ic-3", label:"さん"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["004"] = { x: 306, y: 412, char_size: 150, hole_size: 60, regex:"ic-4", label:"よん"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["005"] = { x: 381, y: 425, char_size: 150, hole_size: 60, regex:"ic-5", label:"ご"    , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["006"] = { x: 459, y: 441, char_size: 150, hole_size: 60, regex:"ic-6", label:"ろく"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["007"] = { x: 288, y: 474, char_size: 150, hole_size: 60, regex:"ic-7", label:"なな"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["008"] = { x: 367, y: 490, char_size: 150, hole_size: 60, regex:"ic-8", label:"はち"  , label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
QUESTION["009"] = { x: 446, y: 507, char_size: 150, hole_size: 60, regex:"ic-9", label:"きゅう", label_in:"みつかっちゃった！", label_out:"ばいば～い！" };
