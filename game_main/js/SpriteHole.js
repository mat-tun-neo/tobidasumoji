phina.define("SpriteHole", {
  superClass: "SpriteBase",

  // コンストラクタ
  init: function(key, animation) {
    //console.log("SpriteHoleクラスinit");
    // キー情報
    this.key = key;
    // アニメーション状態
    this.animation = animation;
    // 押下状態
    this.pushed = false;
    // スプライト描画
    this.superInit("hole", animation, QUESTION[this.key].x, QUESTION[this.key].y, QUESTION[this.key].hole_size, QUESTION[this.key].hole_size);
  },
  // スプライト変更
  change: function() {
    //console.log("before this.animation", this.animation);
    if (this.pushed == false) {
      this.animation = this.key;
      this.pushed = true;
    } else {
      this.animation = "999";
      this.pushed = false;
    }
    // スプライト変更
    //console.log("after this.animation", this.animation);
    this.changeAnimation("hole", this.animation);
  },
  // 更新
  update: function(app) {
  }
});