# wp-theme

### bower, grunt / coffeescript, sassで爆速快適wordpress theme開発

## どこに書くの?
### coffeescript
``assets/coffee``フォルダ内
### sass
``assets/styles``フォルダ内

## どこに吐き出されるの?
### coffeescript
``public/javascripts``フォルダ内
### sass
``styles.css``
``public/styles``フォルダ内

## コンパイル
### sass, coffeeの監視&自動コンパイル
```
grunt watch
```
### 本番 or ``bower install``後
```
grunt compile
```

## 他
- javascriptプラグインは``bower install hogehoge``でインストールして``Gruntfile.coffee``に追記してね<3
- bootstrapとjqueryがすでに``bower.json``, ``Gruntfile.coffee``に入ってしまっているのはご愛嬌
- コンパイルするとcoffescriptとsassがjsとcssとなって``assets``フォルダに放り込まれます
