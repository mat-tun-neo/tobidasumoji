/*
 * メインシーン
 */
phina.define("SceneMain", {
  // 継承
  superClass: "DisplayScene",
  // コンストラクタ
  init: function(param) {
    console.log("SceneMainクラスinit");
    // 親クラス初期化
    this.superInit();
    // 背景スプライト
    this.mainwindow = Sprite("mainwindow").addChildTo(this);
    this.mainwindow.setPosition(this.gridX.center(), this.gridY.center());
    // スプライトグループ
    this.background = DisplayElement().addChildTo(this);
    this.buttonGroup = DisplayElement().addChildTo(this);
    this.holeGroup = DisplayElement().addChildTo(this);
    this.mojiGroup = DisplayElement().addChildTo(this);
    // ラベル描画
    this.titleLabel;
    // Xボタン描画
    this.drawXButton();
    // ロード完了数
    this.loadCount = 0;
    // タイトル描画
    this.title;
    this.drawTitle();
    // 問題の作成
    this.createQuestion();
    this.response;
  },
  // 画面更新
  update: function(app) {
  },
  // Xボタン描画
  drawXButton: function() {
    //console.log("SceneMainクラスdrawXButton");
    let xbutton = SpriteButtonX(
      "000", SCREEN_WIDTH - BUTTON_SIZE / 2, BUTTON_SIZE / 2
    ).addChildTo(this.background);
    //console.log(this.xbutton.x + "/" + this.xbutton.y);
    // Xボタン押下時の処理
    xbutton.sprite.setInteractive(true);
    xbutton.sprite.onpointstart = function() {
      console.log("xbutton.onpointstart");
      this.exit("Exit");
    }.bind(this);
  },
  // タイトル画像をアセットへ読込
  drawTitle: function() {
    //console.log("SceneMainクラスdrawTitle");
    // 待機タイトル
    this.drawWaitTitle();
    // アセットローダー
    let loader = phina.asset.AssetLoader();
    let key = "title";
    let char_regex = TITLE.regex;
    let post_data= {"char_regex":char_regex };
    axios.post("./apiGetFileInfo.php", post_data)
    .then(function (response) {
      //console.log("response", response);
      this.response = response;
      // アセット追加読み込み
      let image = {
        [key] : "./images/character/" + response.data.answer + ".png" + datestr
      };
      let spritesheet = {
        [key]:
        {
          "frame": { "width": response.data.size[0], "height": response.data.size[1], "cols": 1, "rows": 1 },
          "animations" : {
            "000" : {"frames": [0],  "next": "000", "frequency": 1 }
          }
        }
      };
      // console.log("image", image);
      // console.log("spritesheet", spritesheet);
      loader.load({ image, spritesheet })
      .then(function (){
        // タイトル描画
        this.title = SpriteTitle().addChildTo(this.buttonGroup);
        if (DEBUG_MODE == 1) {
          this.title.sprite.setInteractive(true);
          this.title.sprite.on('pointmove', function(e) {
            this.title.sprite.x += e.pointer.dx;
            this.title.sprite.y += e.pointer.dy;
            console.log("title_x:", Math.round(this.title.sprite.x), "title_y:", Math.round(this.title.sprite.y));
          }.bind(this));
        }
      }.bind(this));

    }.bind(this))
    .catch(function (error) { console.log(error); })
    .finally(function () {});
  },
  // 待機タイトル描画
  drawWaitTitle: function() {
    console.log("SceneMainクラスdrawWaitTitle");
    this.waitTitleLabel = Label({text: TITLE_WAIT + "\n(" + this.loadCount + "/" + Object.keys(QUESTION).length + ")"}).addChildTo(this);
    this.waitTitleLabel.setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    this.waitTitleLabel.fontSize = TITLE_FONTSIZE;
    this.waitTitleLabel.fill = TITLE_FILL;
    this.waitTitleLabel.stroke = TITLE_STROKE;
    this.waitTitleLabel.strokeWidth = TITLE_STROKE_WIDTH;
  },
  // 問題の作成
  createQuestion: function() {
    //console.log("SceneMainクラスcreateQuestion");
    //console.log("QUESTION", QUESTION);

    // アセットローダーのセット
    for (let i = 0; i < Object.keys(QUESTION).length; i++){
      let loader = phina.asset.AssetLoader();
      let key = zeroPadding(i, 3);
      let char_regex = QUESTION[key].regex;
      let post_data= {"char_regex":char_regex };
      axios.post("./apiGetFileInfo.php", post_data)
      .then(function (response) {
        //console.log("response", response);
        this.response = response;
        // アセット追加読み込み
        let image = {
          [key] : "./images/character/" + response.data.answer + ".png" + datestr
        };
        //console.log("image", image);
        let spritesheet = {
          [key]:
          {
            "frame": { "width": response.data.size[0], "height": response.data.size[1], "cols": 1, "rows": 1 },
            "animations" : {
              "000" : {"frames": [0],  "next": "000", "frequency": 1 }
            }
          }
        };
        loader.load({ image, spritesheet })
        .then(function (){
          // タッチ位置に穴の画像
          let animation = "999";
          if (DEBUG_MODE == 1) animation = key;

          let hole = SpriteHole( key, animation ).addChildTo(this.holeGroup);
          hole.sprite.setInteractive(true);
          if (DEBUG_MODE == 1) {
            hole.sprite.on('pointmove', function(e) {
              hole.sprite.x += e.pointer.dx;
              hole.sprite.y += e.pointer.dy;
              console.log(key + "_x:", Math.round(hole.sprite.x), key + "_y:", Math.round(hole.sprite.y));
            }.bind(this));
          } else {
            hole.sprite.onpointstart = function() {
              if (this.loadCount == Object.keys(QUESTION).length) {
                // 穴の画像を変更
                hole.change();
                if (hole.pushed == true) {
                  // キャラクター描画
                  let wait_time = 0;
                  if (QUESTION[key].wait_time != null) { wait_time = QUESTION[key].wait_time };
                  sleep( wait_time ).then( ()=>{
                    this.drawCharacter(key);
                  })
                } else {
                  // キャラクター消去
                  this.eraseCharacter(key);
                }
              }
            }.bind(this);
          }
          // ロード完了数
          this.loadCount++;
          this.title.loadCount = this.loadCount;
          // 待機タイトルカウンタ
          this.waitTitleLabel.text = TITLE_WAIT + "\n(" + this.loadCount + "/" + Object.keys(QUESTION).length + ")";
          // 待機タイトル消去
          if (this.loadCount == Object.keys(QUESTION).length) {
            this.waitTitleLabel.remove();
          }
        }.bind(this));
      }.bind(this))
      .catch(function (error) { console.log(error); })
      .finally(function () {});
    }
  },
  // キャラクター描画
  drawCharacter: function(key) {
    this.mojiGroup.children.forEach(char=> {
      if (key == char.key) {
        char.removeSprite();
      }
    });
    let moji = SpriteCharacter(key).addChildTo(this.mojiGroup);
    moji.fadein();
  },
  // プレイヤーオブジェクト消去
  eraseCharacter: function(key) {
    this.mojiGroup.children.forEach(moji=> {
      if (key == moji.key) {
        //console.log(child.key);
        moji.back();
        moji.fadeout();
      }
    })
  }
});
