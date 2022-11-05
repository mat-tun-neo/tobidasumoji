const DEBUG_MODE = 0;              // 0: OFF, 1: ON
const GAME_START_TIMER = 3000      // ゲーム開始までのタイマー（ms）
const CHARACTER_SPEED_MIN = 500;   // キャラクターの移動スピード（MIN）
const CHARACTER_SPEED_MAX = 1200;  // キャラクターの移動スピード（MAX）
const FADEIN_TIME = 1000;          // キャラクターのフェードイン時間
const FADEOUT_TIME = 1000;         // キャラクターのフェードアウト時間
const CHARACTER_MOVE_LIMIT = true; // キャラクターの移動制限
const MOVE_LIMIT_X_MIN = 200;
const MOVE_LIMIT_X_MAX = 440;
const MOVE_LIMIT_Y_MIN = 200;
const MOVE_LIMIT_Y_MAX = 760;
const LABEL_FONTSIZE = 30;         // ラベルのフォントサイズ
const LABEL_OFFSET = -100;         // ラベルのオフセット
const LABEL_FILL = "yellow";       // ラベルのFILL色
const LABEL_STROKE = "black";      // ラベルのSTROKE色
const LABEL_STROKE_WIDTH = 5;      // ラベルのSTROKE幅
const LABEL_TIME = 0  // フェードイン中のラベル表示時間（単位：フレーム）
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


ASSETS.image["mainwindow"] = "./images/question/animals.jpg" + datestr;

ASSETS.image["hole"] = "./images/question/hole2.png" + datestr;
ASSETS.spritesheet["hole"] = 
{
  "frame": { "width": 163, "height": 163, "cols": 5, "rows": 28 },
  "animations" : {
    "999": {"frames": [ 39],  "next": "999", "frequency": 1 },
    "000": {"frames": [ 77],  "next": "000", "frequency": 1 },
    "001": {"frames": [ 75],  "next": "001", "frequency": 1 },
    "002": {"frames": [ 76],  "next": "002", "frequency": 1 },
    "003": {"frames": [135],  "next": "003", "frequency": 1 },
    "004": {"frames": [ 75],  "next": "004", "frequency": 1 },
    "005": {"frames": [ 89],  "next": "005", "frequency": 1 },
    "006": {"frames": [ 81],  "next": "006", "frequency": 1 },
    "007": {"frames": [ 71],  "next": "007", "frequency": 1 },
    "008": {"frames": [ 97],  "next": "008", "frequency": 1 },
    "009": {"frames": [119],  "next": "009", "frequency": 1 },
    "010": {"frames": [124],  "next": "010", "frequency": 1 },
    "011": {"frames": [ 96],  "next": "011", "frequency": 1 },
    "012": {"frames": [ 72],  "next": "012", "frequency": 1 },
    "013": {"frames": [ 86],  "next": "013", "frequency": 1 },
    "014": {"frames": [ 79],  "next": "014", "frequency": 1 },
    "015": {"frames": [ 72],  "next": "015", "frequency": 1 },
    "016": {"frames": [ 70],  "next": "016", "frequency": 1 },
    "017": {"frames": [ 76],  "next": "017", "frequency": 1 },
    "018": {"frames": [110],  "next": "018", "frequency": 1 },
    "019": {"frames": [ 80],  "next": "019", "frequency": 1 },
    "020": {"frames": [ 85],  "next": "020", "frequency": 1 },
    "021": {"frames": [110],  "next": "021", "frequency": 1 },
    "022": {"frames": [132],  "next": "022", "frequency": 1 },
    "023": {"frames": [ 71],  "next": "023", "frequency": 1 },
    "024": {"frames": [ 93],  "next": "024", "frequency": 1 },
    "025": {"frames": [ 72],  "next": "025", "frequency": 1 },
    "026": {"frames": [138],  "next": "026", "frequency": 1 }
  }
}

TITLE = { x: 140, y: 140, char_size: 120, label_offset_x: 180, label_offset_y: 0, regex:"_clear", update_frame: 200, 
    label:{
        0:"とびだすどうぶつずかん",
        1:"どうぶつをタッチしよう"
    }
};

QUESTION["000"] = { x:  48, y: 144, char_size: 250, hole_size: 86, regex:"-クマ-"      , label:"クマ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["001"] = { x:  48, y: 240, char_size: 250, hole_size: 86, regex:"-カバ-"      , label:"カバ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["002"] = { x:  48, y: 336, char_size: 250, hole_size: 86, regex:"-キリン-"    , label:"キリン"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["003"] = { x:  48, y: 432, char_size: 250, hole_size: 86, regex:"-パンダ-"    , label:"パンダ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["004"] = { x:  48, y: 528, char_size: 250, hole_size: 86, regex:"-カンガルー-", label:"カンガルー", label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["005"] = { x:  48, y: 624, char_size: 250, hole_size: 86, regex:"-トラ-"      , label:"トラ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["006"] = { x:  48, y: 720, char_size: 250, hole_size: 86, regex:"-シカ-"      , label:"シカ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["007"] = { x:  48, y: 816, char_size: 250, hole_size: 86, regex:"-イノシシ-"  , label:"イノシシ"  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["008"] = { x: 592, y: 144, char_size: 250, hole_size: 86, regex:"-フラミンゴ-", label:"フラミンゴ", label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["009"] = { x: 592, y: 240, char_size: 250, hole_size: 86, regex:"-ゴリラ-"    , label:"ゴリラ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["010"] = { x: 592, y: 336, char_size: 250, hole_size: 86, regex:"-ゾウ-"      , label:"ゾウ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["011"] = { x: 592, y: 432, char_size: 250, hole_size: 86, regex:"-ヒツジ-"    , label:"ヒツジ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["012"] = { x: 592, y: 528, char_size: 250, hole_size: 86, regex:"-ウシ-"      , label:"ウシ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["013"] = { x: 592, y: 624, char_size: 250, hole_size: 86, regex:"-チーター-"  , label:"チーター"  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["014"] = { x: 592, y: 720, char_size: 250, hole_size: 86, regex:"-コアラ-"    , label:"コアラ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["015"] = { x: 592, y: 816, char_size: 250, hole_size: 86, regex:"-ウマ-"      , label:"ウマ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["016"] = { x: 112, y:  48, char_size: 250, hole_size: 86, regex:"-アルパカ-"  , label:"アルパカ"  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["017"] = { x: 208, y:  48, char_size: 250, hole_size: 86, regex:"-キツネ-"    , label:"キツネ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["018"] = { x: 304, y:  48, char_size: 250, hole_size: 86, regex:"-ラクダ-"    , label:"ラクダ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["019"] = { x: 400, y:  48, char_size: 250, hole_size: 86, regex:"-サル-"      , label:"サル"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["020"] = { x: 496, y:  48, char_size: 250, hole_size: 86, regex:"-タヌキ-"    , label:"タヌキ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["021"] = { x:  80, y: 912, char_size: 250, hole_size: 86, regex:"-ライオン-"  , label:"ライオン"  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["022"] = { x: 176, y: 912, char_size: 250, hole_size: 86, regex:"-ブタ-"      , label:"ブタ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["023"] = { x: 272, y: 912, char_size: 250, hole_size: 86, regex:"-イヌ-"      , label:"イヌ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["024"] = { x: 368, y: 912, char_size: 250, hole_size: 86, regex:"-ネコ-"      , label:"ネコ"      , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["025"] = { x: 464, y: 912, char_size: 250, hole_size: 86, regex:"-ウサギ-"    , label:"ウサギ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["026"] = { x: 560, y: 912, char_size: 250, hole_size: 86, regex:"-ペンギン-"  , label:"ペンギン"  , label_in:"こんにちは！", label_out:"ばいば～い！" };
