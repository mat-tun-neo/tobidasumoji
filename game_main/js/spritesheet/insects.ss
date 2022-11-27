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
const TITLE_WAIT = "しばらくおまちください";      // 待機タイトル


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


ASSETS.image["mainwindow"] = "./images/question/insects.jpg" + datestr;

ASSETS.image["hole"] = "./images/question/hole2.png" + datestr;
ASSETS.spritesheet["hole"] = 
{
  "frame": { "width": 163, "height": 163, "cols": 5, "rows": 28 },
  "animations" : {
    "999": {"frames": [ 39],  "next": "999", "frequency": 1 },
    "000": {"frames": [ 75],  "next": "000", "frequency": 1 },
    "001": {"frames": [ 75],  "next": "001", "frequency": 1 },
    "002": {"frames": [ 96],  "next": "002", "frequency": 1 },
    "003": {"frames": [ 70],  "next": "003", "frequency": 1 },
    "004": {"frames": [ 83],  "next": "004", "frequency": 1 },
    "005": {"frames": [101],  "next": "005", "frequency": 1 },
    "006": {"frames": [ 82],  "next": "006", "frequency": 1 },
    "007": {"frames": [ 70],  "next": "007", "frequency": 1 },
    "008": {"frames": [ 75],  "next": "008", "frequency": 1 },
    "009": {"frames": [ 75],  "next": "009", "frequency": 1 },
    "010": {"frames": [ 88],  "next": "010", "frequency": 1 },
    "011": {"frames": [ 89],  "next": "011", "frequency": 1 },
    "012": {"frames": [ 77],  "next": "012", "frequency": 1 },
    "013": {"frames": [107],  "next": "013", "frequency": 1 },
    "014": {"frames": [ 75],  "next": "014", "frequency": 1 },
    "015": {"frames": [ 98],  "next": "015", "frequency": 1 },
    "016": {"frames": [ 79],  "next": "016", "frequency": 1 },
    "017": {"frames": [ 82],  "next": "017", "frequency": 1 },
    "018": {"frames": [ 99],  "next": "018", "frequency": 1 },
    "019": {"frames": [ 77],  "next": "019", "frequency": 1 },
    "020": {"frames": [ 75],  "next": "020", "frequency": 1 },
    "021": {"frames": [ 81],  "next": "021", "frequency": 1 },
    "022": {"frames": [ 89],  "next": "022", "frequency": 1 },
    "023": {"frames": [104],  "next": "023", "frequency": 1 },
    "024": {"frames": [ 70],  "next": "024", "frequency": 1 },
    "025": {"frames": [ 80],  "next": "025", "frequency": 1 },
    "026": {"frames": [107],  "next": "026", "frequency": 1 }
  }
}

TITLE = { x: 140, y: 140, char_size: 120, label_offset_x: 180, label_offset_y: 0, regex:"_clear", update_frame: 200, 
    label:{
        0:"とびだす昆虫ずかん",
        1:"昆虫をタッチしよう"
    }
};

QUESTION["000"] = { x:  48, y: 144, char_size: 250, hole_size: 86, regex:"-蚊-"                    , label:"カ"                    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["001"] = { x:  48, y: 240, char_size: 150, hole_size: 86, regex:"-カナブン-"              , label:"カナブン"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["002"] = { x:  48, y: 336, char_size: 250, hole_size: 86, regex:"-ヒグラシ-"              , label:"ヒグラシ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["003"] = { x:  48, y: 432, char_size: 250, hole_size: 86, regex:"-アブラゼミ-"            , label:"アブラゼミ"            , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["004"] = { x:  48, y: 528, char_size: 150, hole_size: 86, regex:"-セミのぬけがら-"        , label:"セミのぬけがら"        , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["005"] = { x:  48, y: 624, char_size: 250, hole_size: 86, regex:"-ミツバチ-"              , label:"ミツバチ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["006"] = { x:  48, y: 720, char_size: 250, hole_size: 86, regex:"-スズメバチ-"            , label:"スズメバチ"            , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["007"] = { x:  48, y: 816, char_size: 250, hole_size: 86, regex:"-アリ-"                  , label:"アリ"                  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["008"] = { x: 592, y: 144, char_size: 250, hole_size: 86, regex:"-カマキリ-"              , label:"カマキリ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["009"] = { x: 592, y: 240, char_size: 250, hole_size: 86, regex:"-カミキリムシ-"          , label:"カミキリムシ"          , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["010"] = { x: 592, y: 336, char_size: 150, hole_size: 86, regex:"-テントウムシ-"          , label:"テントウムシ"          , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["011"] = { x: 592, y: 432, char_size: 250, hole_size: 86, regex:"-トンボ-"                , label:"トンボ"                , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["012"] = { x: 592, y: 528, char_size: 250, hole_size: 86, regex:"-クワガタ-"              , label:"クワガタ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["013"] = { x: 592, y: 624, char_size: 150, hole_size: 86, regex:"-ヨウチュウ-"            , label:"ヨウチュウ"            , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["014"] = { x: 592, y: 720, char_size: 250, hole_size: 86, regex:"-カブトムシ-"            , label:"カブトムシ"            , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["015"] = { x: 592, y: 816, char_size: 300, hole_size: 86, regex:"-ヘラクレスオオカブト-"  , label:"ヘラクレスオオカブト"  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["016"] = { x: 112, y:  48, char_size: 250, hole_size: 86, regex:"-コオロギ-"              , label:"コオロギ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["017"] = { x: 208, y:  48, char_size: 250, hole_size: 86, regex:"-スズムシ-"              , label:"スズムシ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["018"] = { x: 304, y:  48, char_size: 250, hole_size: 86, regex:"-ホタル-"                , label:"ホタル"                , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["019"] = { x: 400, y:  48, char_size: 250, hole_size: 86, regex:"-クモ-"                  , label:"クモ"                  , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["020"] = { x: 496, y:  48, char_size: 150, hole_size: 86, regex:"-カメムシ-"              , label:"カメムシ"              , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["021"] = { x:  80, y: 912, char_size: 250, hole_size: 86, regex:"-ショウリョウバッタ-"    , label:"ショウリョウバッタ"    , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["022"] = { x: 176, y: 912, char_size: 250, hole_size: 86, regex:"-トノサマバッタ-"        , label:"トノサマバッタ"        , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["023"] = { x: 272, y: 912, char_size: 150, hole_size: 86, regex:"-モンシロチョウ-"        , label:"モンシロチョウ"        , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["024"] = { x: 368, y: 912, char_size: 250, hole_size: 86, regex:"-アゲハチョウ-"          , label:"アゲハチョウ"          , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["025"] = { x: 464, y: 912, char_size: 250, hole_size: 86, regex:"-サナギ-"                , label:"サナギ"                , label_in:"こんにちは！", label_out:"ばいば～い！" };
QUESTION["026"] = { x: 560, y: 912, char_size: 250, hole_size: 86, regex:"-イモムシ-"              , label:"ヨウチュウ（イモムシ）", label_in:"こんにちは！", label_out:"ばいば～い！" };
