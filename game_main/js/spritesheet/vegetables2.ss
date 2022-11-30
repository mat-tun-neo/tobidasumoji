const DEBUG_MODE = 0;              // 0: OFF, 1: ON
const CHARACTER_SPEED_MIN = 500;   // キャラクターの移動スピード（MIN）
const CHARACTER_SPEED_MAX = 1200;  // キャラクターの移動スピード（MAX）
const FADEIN_TIME = 1000;          // キャラクターのフェードイン時間
const FADEOUT_TIME = 1000;         // キャラクターのフェードアウト時間
const CHARACTER_MOVE_LIMIT = true; // キャラクターの移動制限
const MOVE_LIMIT_X_MIN = 200;
const MOVE_LIMIT_X_MAX = 440;
const MOVE_LIMIT_Y_MIN = 200;
const MOVE_LIMIT_Y_MAX = 760;
const LABEL_FONTSIZE = 40;         // ラベルのフォントサイズ
const LABEL_OFFSET = -200;         // ラベルのオフセット
const LABEL_FILL = "red";          // ラベルのFILL色
const LABEL_STROKE = "white";      // ラベルのSTROKE色
const LABEL_STROKE_WIDTH = 5;      // ラベルのSTROKE幅
const LABEL_TIME = 0  // フェードイン中のラベル表示時間（単位：フレーム）
const TITLE_FONTSIZE = 40;         // タイトルのフォントサイズ
const TITLE_FILL = "white";        // タイトルのFILL色
const TITLE_STROKE = "black";      // タイトルのSTROKE色
const TITLE_STROKE_WIDTH = 5;      // タイトルのSTROKE幅
const TITLE_WAIT = "画像を読込中";      // 待機タイトル


// tweener定義
const CHAR_SET = (x, y, w, h, t) => ({
    tweens: [
    ['to', {x:x, y:y, width:w, height:h}, t, 'easeOutElastic']
    ]
});
const LABEL_SET = (x, y, w, h, t) => ({
    tweens: [
    ['to', {x:x, y:y - LABEL_OFFSET, width:w, height:h}, t, 'easeOutElastic']
    ]
});
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

ASSETS.image["mainwindow"] = "./images/question/vegetables.jpg" + datestr;

ASSETS.image["hole"] = "./images/question/hole2.png" + datestr;
ASSETS.spritesheet["hole"] = 
{
  "frame": { "width": 163, "height": 163, "cols": 5, "rows": 28 },
  "animations" : {
    "999": {"frames": [ 39],  "next": "999", "frequency": 1 },
    "000": {"frames": [  5],  "next": "000", "frequency": 1 },
    "001": {"frames": [  5],  "next": "001", "frequency": 1 },
    "002": {"frames": [  5],  "next": "002", "frequency": 1 },
    "003": {"frames": [ 55],  "next": "003", "frequency": 1 },
    "004": {"frames": [ 55],  "next": "004", "frequency": 1 },
    "005": {"frames": [ 55],  "next": "005", "frequency": 1 },
    "006": {"frames": [ 21],  "next": "006", "frequency": 1 },
    "007": {"frames": [ 21],  "next": "007", "frequency": 1 },
    "008": {"frames": [ 21],  "next": "008", "frequency": 1 },
    "009": {"frames": [ 20],  "next": "009", "frequency": 1 },
    "010": {"frames": [ 20],  "next": "010", "frequency": 1 },
    "011": {"frames": [ 20],  "next": "011", "frequency": 1 },
    "012": {"frames": [ 10],  "next": "012", "frequency": 1 },
    "013": {"frames": [ 10],  "next": "013", "frequency": 1 },
    "014": {"frames": [ 10],  "next": "014", "frequency": 1 },
    "015": {"frames": [ 51],  "next": "015", "frequency": 1 },
    "016": {"frames": [ 51],  "next": "016", "frequency": 1 },
    "017": {"frames": [ 51],  "next": "017", "frequency": 1 },
    "018": {"frames": [ 49],  "next": "018", "frequency": 1 },
    "019": {"frames": [ 49],  "next": "019", "frequency": 1 },
    "020": {"frames": [ 49],  "next": "020", "frequency": 1 },
    "021": {"frames": [ 23],  "next": "021", "frequency": 1 },
    "022": {"frames": [ 23],  "next": "022", "frequency": 1 },
    "023": {"frames": [ 23],  "next": "023", "frequency": 1 },
    "024": {"frames": [ 65],  "next": "024", "frequency": 1 },
    "025": {"frames": [ 65],  "next": "025", "frequency": 1 },
    "026": {"frames": [ 65],  "next": "026", "frequency": 1 },
    "027": {"frames": [ 66],  "next": "027", "frequency": 1 },
    "028": {"frames": [ 66],  "next": "028", "frequency": 1 },
    "029": {"frames": [ 66],  "next": "029", "frequency": 1 },
    "030": {"frames": [ 62],  "next": "030", "frequency": 1 },
    "031": {"frames": [ 62],  "next": "031", "frequency": 1 },
    "032": {"frames": [ 62],  "next": "032", "frequency": 1 },
    "033": {"frames": [  0],  "next": "033", "frequency": 1 },
    "034": {"frames": [  0],  "next": "034", "frequency": 1 },
    "035": {"frames": [  0],  "next": "035", "frequency": 1 },
    "036": {"frames": [  4],  "next": "036", "frequency": 1 },
    "037": {"frames": [  4],  "next": "037", "frequency": 1 },
    "038": {"frames": [  4],  "next": "038", "frequency": 1 },
    "039": {"frames": [  3],  "next": "039", "frequency": 1 },
    "040": {"frames": [  3],  "next": "040", "frequency": 1 },
    "041": {"frames": [  3],  "next": "041", "frequency": 1 },
    "042": {"frames": [ 29],  "next": "042", "frequency": 1 },
    "043": {"frames": [ 29],  "next": "043", "frequency": 1 },
    "044": {"frames": [ 29],  "next": "044", "frequency": 1 },
    "045": {"frames": [  9],  "next": "045", "frequency": 1 },
    "046": {"frames": [  9],  "next": "046", "frequency": 1 },
    "047": {"frames": [  9],  "next": "047", "frequency": 1 },
    "048": {"frames": [ 15],  "next": "048", "frequency": 1 },
    "049": {"frames": [ 15],  "next": "049", "frequency": 1 },
    "050": {"frames": [ 15],  "next": "050", "frequency": 1 },
    "051": {"frames": [ 19],  "next": "051", "frequency": 1 },
    "052": {"frames": [ 19],  "next": "052", "frequency": 1 },
    "053": {"frames": [ 19],  "next": "053", "frequency": 1 },
    "054": {"frames": [ 49],  "next": "054", "frequency": 1 },
    "055": {"frames": [ 49],  "next": "055", "frequency": 1 },
    "056": {"frames": [ 49],  "next": "056", "frequency": 1 },
    "057": {"frames": [  6],  "next": "057", "frequency": 1 },
    "058": {"frames": [  6],  "next": "058", "frequency": 1 },
    "059": {"frames": [  6],  "next": "059", "frequency": 1 },
    "060": {"frames": [ 52],  "next": "060", "frequency": 1 },
    "061": {"frames": [ 52],  "next": "061", "frequency": 1 },
    "062": {"frames": [ 52],  "next": "062", "frequency": 1 },
    "063": {"frames": [ 15],  "next": "063", "frequency": 1 },
    "064": {"frames": [ 15],  "next": "064", "frequency": 1 },
    "065": {"frames": [ 15],  "next": "065", "frequency": 1 },
    "066": {"frames": [ 19],  "next": "066", "frequency": 1 },
    "067": {"frames": [ 19],  "next": "067", "frequency": 1 },
    "068": {"frames": [ 19],  "next": "068", "frequency": 1 },
    "069": {"frames": [  6],  "next": "069", "frequency": 1 },
    "070": {"frames": [  6],  "next": "070", "frequency": 1 },
    "071": {"frames": [  6],  "next": "071", "frequency": 1 },
    "072": {"frames": [ 43],  "next": "072", "frequency": 1 },
    "073": {"frames": [ 43],  "next": "073", "frequency": 1 },
    "074": {"frames": [ 43],  "next": "074", "frequency": 1 },
    "075": {"frames": [ 25],  "next": "075", "frequency": 1 },
    "076": {"frames": [ 25],  "next": "076", "frequency": 1 },
    "077": {"frames": [ 25],  "next": "077", "frequency": 1 },
    "078": {"frames": [  5],  "next": "078", "frequency": 1 },
    "079": {"frames": [  5],  "next": "079", "frequency": 1 },
    "080": {"frames": [  5],  "next": "080", "frequency": 1 },
  }
}

TITLE = { x: 140, y: 140, char_size: 120, label_offset_x: 180, label_offset_y: 0, regex:"_clear", update_frame: 200, 
    label:{
        0:"とびだす食べ物ずかん",
        1:"食べ物をタッチしよう"
    }
};

QUESTION["000"] = { x:  48, y: 144, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-カブ-"              , label:""                      , move_flg: false };
QUESTION["001"] = { x:  48, y: 144, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-カブ-"              , label:"かぶ"                  , move_flg: false };
QUESTION["002"] = { x:  48, y: 144, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-カブ-"        , label:""                      , wait_time: 1000 };
QUESTION["003"] = { x:  48, y: 240, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ダイコン-"          , label:""                      , move_flg: false };
QUESTION["004"] = { x:  48, y: 240, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ダイコン-"          , label:"だいこん"              , move_flg: false };
QUESTION["005"] = { x:  48, y: 240, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ダイコン-"    , label:""                      , wait_time: 1000 };
QUESTION["006"] = { x:  48, y: 336, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ニンジン-"          , label:""                      , move_flg: false };
QUESTION["007"] = { x:  48, y: 336, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ニンジン-"          , label:"にんじん"              , move_flg: false };
QUESTION["008"] = { x:  48, y: 336, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ニンジン-"    , label:""                      , wait_time: 1000 };
QUESTION["009"] = { x:  48, y: 432, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ナス-"              , label:""                      , move_flg: false };
QUESTION["010"] = { x:  48, y: 432, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ナス-"              , label:"なす"                  , move_flg: false };
QUESTION["011"] = { x:  48, y: 432, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ナス-"        , label:""                      , wait_time: 1000 };
QUESTION["012"] = { x:  48, y: 528, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-サツマイモ-"        , label:""                      , move_flg: false };
QUESTION["013"] = { x:  48, y: 528, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-サツマイモ-"        , label:"さつまいも"            , move_flg: false };
QUESTION["014"] = { x:  48, y: 528, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-サツマイモ-"  , label:""                      , wait_time: 1000 };
QUESTION["015"] = { x:  48, y: 624, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ジャガイモ-"        , label:""                      , move_flg: false };
QUESTION["016"] = { x:  48, y: 624, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ジャガイモ-"        , label:"じゃがいも"            , move_flg: false };
QUESTION["017"] = { x:  48, y: 624, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ジャガイモ-"  , label:""                      , wait_time: 1000 };
QUESTION["018"] = { x:  48, y: 720, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ゴボウ-"            , label:""                      , move_flg: false };
QUESTION["019"] = { x:  48, y: 720, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ゴボウ-"            , label:"ごぼう"                , move_flg: false };
QUESTION["020"] = { x:  48, y: 720, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ゴボウ-"      , label:""                      , wait_time: 1000 };
QUESTION["021"] = { x:  48, y: 816, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ネギ-"              , label:""                      , move_flg: false };
QUESTION["022"] = { x:  48, y: 816, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ネギ-"              , label:"ねぎ"                  , move_flg: false };
QUESTION["023"] = { x:  48, y: 816, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ネギ-"        , label:""                      , wait_time: 1000 };
QUESTION["024"] = { x: 592, y: 144, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-パプリカ-"          , label:""                      , move_flg: false };
QUESTION["025"] = { x: 592, y: 144, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-パプリカ-"          , label:"ぱぷりか"              , move_flg: false };
QUESTION["026"] = { x: 592, y: 144, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-パプリカ-"    , label:""                      , wait_time: 1000 };
QUESTION["027"] = { x: 592, y: 240, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ピーマン-"          , label:""                      , move_flg: false };
QUESTION["028"] = { x: 592, y: 240, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ピーマン-"          , label:"ぴーまん"              , move_flg: false };
QUESTION["029"] = { x: 592, y: 240, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ピーマン-"    , label:""                      , wait_time: 1000 };
QUESTION["030"] = { x: 592, y: 336, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ブロッコリー-"      , label:""                      , move_flg: false };
QUESTION["031"] = { x: 592, y: 336, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ブロッコリー-"      , label:"ぶろっこりー"          , move_flg: false };
QUESTION["032"] = { x: 592, y: 336, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ブロッコリー-", label:""                      , wait_time: 1000 };
QUESTION["033"] = { x: 592, y: 432, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-アスパラガス-"      , label:""                      , move_flg: false };
QUESTION["034"] = { x: 592, y: 432, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-アスパラガス-"      , label:"あすぱらがす"          , move_flg: false };
QUESTION["035"] = { x: 592, y: 432, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-アスパラガス-", label:""                      , wait_time: 1000 };
QUESTION["036"] = { x: 592, y: 528, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-オクラ-"            , label:""                      , move_flg: false };
QUESTION["037"] = { x: 592, y: 528, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-オクラ-"            , label:"おくら"                , move_flg: false };
QUESTION["038"] = { x: 592, y: 528, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-オクラ-"      , label:""                      , wait_time: 1000 };
QUESTION["039"] = { x: 592, y: 624, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-エダマメ-"          , label:""                      , move_flg: false };
QUESTION["040"] = { x: 592, y: 624, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-エダマメ-"          , label:"えだまめ"              , move_flg: false };
QUESTION["041"] = { x: 592, y: 624, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-エダマメ-"    , label:""                      , wait_time: 1000 };
QUESTION["042"] = { x: 592, y: 720, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ホウレンソウ-"      , label:""                      , move_flg: false };
QUESTION["043"] = { x: 592, y: 720, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ホウレンソウ-"      , label:"ほうれんそう"          , move_flg: false };
QUESTION["044"] = { x: 592, y: 720, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ホウレンソウ-", label:""                      , wait_time: 1000 };
QUESTION["045"] = { x: 592, y: 816, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-コマツナ-"          , label:""                      , move_flg: false };
QUESTION["046"] = { x: 592, y: 816, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-コマツナ-"          , label:"こまつな"              , move_flg: false };
QUESTION["047"] = { x: 592, y: 816, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-コマツナ-"    , label:""                      , wait_time: 1000 };
QUESTION["048"] = { x: 112, y:  48, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-タケノコ-"          , label:""                      , move_flg: false };
QUESTION["049"] = { x: 112, y:  48, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-タケノコ-"          , label:"たけのこ"              , move_flg: false };
QUESTION["050"] = { x: 112, y:  48, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-タケノコ-"    , label:""                      , wait_time: 1000 };
QUESTION["051"] = { x: 208, y:  48, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-トウモロコシ-"      , label:""                      , move_flg: false };
QUESTION["052"] = { x: 208, y:  48, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-トウモロコシ-"      , label:"とうもろこし"          , move_flg: false };
QUESTION["053"] = { x: 208, y:  48, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-トウモロコシ-", label:""                      , wait_time: 1000 };
QUESTION["054"] = { x: 304, y:  48, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ゴーヤ-"            , label:""                      , move_flg: false };
QUESTION["055"] = { x: 304, y:  48, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ゴーヤ-"            , label:"ごーや"                , move_flg: false };
QUESTION["056"] = { x: 304, y:  48, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ゴーヤ-"      , label:""                      , wait_time: 1000 };
QUESTION["057"] = { x: 400, y:  48, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-キュウリ-"          , label:""                      , move_flg: false };
QUESTION["058"] = { x: 400, y:  48, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-キュウリ-"          , label:"きゅうり"              , move_flg: false };
QUESTION["059"] = { x: 400, y:  48, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-キュウリ-"    , label:""                      , wait_time: 1000 };
QUESTION["060"] = { x: 496, y:  48, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ズッキーニ-"        , label:""                      , move_flg: false };
QUESTION["061"] = { x: 496, y:  48, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ズッキーニ-"        , label:"ずっきーに"            , move_flg: false };
QUESTION["062"] = { x: 496, y:  48, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ズッキーニ-"  , label:""                      , wait_time: 1000 };
QUESTION["063"] = { x:  80, y: 912, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-タマネギ-"          , label:""                      , move_flg: false };
QUESTION["064"] = { x:  80, y: 912, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-タマネギ-"          , label:"たまねぎ"              , move_flg: false };
QUESTION["065"] = { x:  80, y: 912, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-タマネギ-"    , label:""                      , wait_time: 1000 };
QUESTION["066"] = { x: 176, y: 912, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-トマト-"            , label:""                      , move_flg: false };
QUESTION["067"] = { x: 176, y: 912, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-トマト-"            , label:"とまと"                , move_flg: false };
QUESTION["068"] = { x: 176, y: 912, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-トマト-"      , label:""                      , wait_time: 1000 };
QUESTION["069"] = { x: 272, y: 912, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-キャベツ-"          , label:""                      , move_flg: false };
QUESTION["070"] = { x: 272, y: 912, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-キャベツ-"          , label:"きゃべつ"              , move_flg: false };
QUESTION["071"] = { x: 272, y: 912, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-キャベツ-"    , label:""                      , wait_time: 1000 };
QUESTION["072"] = { x: 368, y: 912, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-レタス-"            , label:""                      , move_flg: false };
QUESTION["073"] = { x: 368, y: 912, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-レタス-"            , label:"れたす"                , move_flg: false };
QUESTION["074"] = { x: 368, y: 912, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-レタス-"      , label:""                      , wait_time: 1000 };
QUESTION["075"] = { x: 464, y: 912, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-ハクサイ-"          , label:""                      , move_flg: false };
QUESTION["076"] = { x: 464, y: 912, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-ハクサイ-"          , label:"はくさい"              , move_flg: false };
QUESTION["077"] = { x: 464, y: 912, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-ハクサイ-"    , label:""                      , wait_time: 1000 };
QUESTION["078"] = { x: 560, y: 912, fixed_x: 320, fixed_y: 320, char_size: 448, hole_size: 86, regex:"野菜-カボチャ-"          , label:""                      , move_flg: false };
QUESTION["079"] = { x: 560, y: 912, fixed_x: 320, fixed_y: 640, char_size: 448, hole_size: 86, regex:"収穫-カボチャ-"          , label:"かぼちゃ"              , move_flg: false };
QUESTION["080"] = { x: 560, y: 912, fixed_x: 320, fixed_y: 480, char_size: 250, hole_size: 86, regex:"もぐもぐら-カボチャ-"    , label:""                      , wait_time: 1000 };
