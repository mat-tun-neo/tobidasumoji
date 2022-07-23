phina.define("SpriteCharacter", {
  superClass: "SpriteBase",

  // コンストラクタ
  init: function(key) {
    //console.log("SpriteCharacterクラスinit");
    // キー情報
    this.key = key;
    // スプライト描画
    this.superInit(key, "000", QUESTION[this.key].x, QUESTION[this.key].y, QUESTION[this.key].char_size, QUESTION[this.key].char_size);
    // 初期位置
    this.sprite.x = QUESTION[this.key].x;
    this.sprite.y = QUESTION[this.key].y;
    // サイズ
    this.width = QUESTION[this.key].char_size;
    this.height = QUESTION[this.key].char_size;
    // 文字
    this.nameLabel = Label().addChildTo(this);
    this.nameLabel.text = "";
    this.addMoji();
    // スピード
    this.speed = rand(CHARACTER_SPEED_MIN, CHARACTER_SPEED_MAX);
    // 出現フレーム
    this.frame = 0;
    // フェードアウトのフラグ
    this.fadeout_status = false;
  },
  // 文字追加
  addMoji: function(str="") {
    this.nameLabel.text = str;
    this.nameLabel.x = this.sprite.x;
    this.nameLabel.y = this.sprite.y - LABEL_OFFSET;
    this.nameLabel.fontSize = LABEL_FONTSIZE;
    this.nameLabel.fill = LABEL_FILL;
    this.nameLabel.stroke = LABEL_STROKE;
    this.nameLabel.strokeWidth = LABEL_STROKE_WIDTH;
  },
  // 文字変更
  changeMoji: function(str="") {
    this.nameLabel.text = str;
  },
  // フェードイン
  fadein: function() {
    this.sprite.tweener.fromJSON(CHAR_FADEIN);
    this.nameLabel.tweener.fromJSON(CHAR_FADEIN);
  },
  // フェードアウト
  fadeout: function() {
    this.fadeout_status = true;
    this.sprite.tweener.fromJSON(CHAR_FADEOUT);
    this.nameLabel.tweener.fromJSON(CHAR_FADEOUT);
  },
  // 通常移動（ランダム）
  walk: function(app) {
    let label = QUESTION[this.key].label;
    if (app.frame < this.frame + LABEL_TIME) {
      label = QUESTION[this.key].label_in;
    }
    if (this.fadeout_status) {
      label = QUESTION[this.key].label_out;
    }
    this.changeMoji(label);
    let x = this.sprite.x + rand(-CHARACTER_MOVE, CHARACTER_MOVE);
    let y = this.sprite.y + rand(-CHARACTER_MOVE, CHARACTER_MOVE);
    this.move(x, y);
  },
  // 通常移動（戻る）
  back: function() {
    this.sprite.tweener.clear();
    this.nameLabel.tweener.clear();
    this.move(QUESTION[this.key].x, QUESTION[this.key].y);
  },
  // 移動
  move: function(x, y) {
    this.sprite.tweener.fromJSON(CHAR_MOVE(x, y, this.width, this.height, this.speed));
    this.nameLabel.tweener.fromJSON(LABEL_MOVE(x, y, this.width, this.height, this.speed));
  },
  // 更新
  update: function(app) {
    if ( this.frame == 0) {
      this.frame = app.frame;
    }
    this.walk(app);
  }
});