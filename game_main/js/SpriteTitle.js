phina.define("SpriteTitle", {
  superClass: "SpriteBase",

  // コンストラクタ
  init: function() {
    //console.log("SpriteTitleクラスinit");
    // スプライト描画
    this.superInit("title", "000", TITLE.x, TITLE.y, TITLE.char_size, TITLE.char_size);
    // 文字
    this.nameLabel = Label().addChildTo(this);
    this.addMoji("");
    // 開始フラグ
    this.loadCount = 0;
  },
  // 文字追加
  addMoji: function(str="") {
    this.nameLabel.text = str;
    this.nameLabel.x = this.sprite.x + TITLE.label_offset_x;
    this.nameLabel.y = this.sprite.y + TITLE.label_offset_y;
    this.nameLabel.fontSize = TITLE_FONTSIZE;
    this.nameLabel.fill = TITLE_FILL;
    this.nameLabel.stroke = TITLE_STROKE;
    this.nameLabel.strokeWidth = TITLE_STROKE_WIDTH;
  },
  // 更新
  update: function(app) {
    if (this.loadCount == Object.keys(QUESTION).length) {
      if (this.nameLabel.text == "") {
        this.nameLabel.text = TITLE.label[0];
      }
      if (app.frame % TITLE.update_frame == 0) {
        this.nameLabel.text = TITLE.label[rand(0, Object.keys(TITLE.label).length - 1)];
      };
    }
  }
});