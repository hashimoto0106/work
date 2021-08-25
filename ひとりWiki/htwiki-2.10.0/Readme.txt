=====================================================================
【ひとりWiki】 version 2.10.0 --- 増田 隆(t-masuda@mvd.biglobe.ne.jp)
=====================================================================

ダウンロードありがとうございます。

【ひとりWiki】
　ウェブブラウザを利用してWeb上のドキュメントを編集する仕組みのひとつ
としてWikiというものがあります。ひとりWikiはWeb上ではなくローカルの
ドキュメントを対象にしたソフトです。
　一般的なWikiはウェブブラウザ経由での編集／閲覧となるためWebサーバの
設定が必要ですが、本プログラムでは個人向け利用に的を絞ることでサーバの
設定が必要なく、簡単に導入することができます。

【動作環境】
　Windows10(64bit)。

【基本的な使い方】
　１．データ保存用のフォルダ(Wikiファイル保存フォルダ)を作っておきます。
　２．ひとりWikiを起動します。
　３．[ファイル][新Wiki作成]を選び、Wikiファイル保存フォルダの選択、
　　　タイトルの入力を行います。
　４．編集ウィンドウが開くので、データを入力します。
　５．編集ウィンドウの[ファイル][保存]でデータを保存します。
　６．メインウィンドウに保存したデータの内容が表示されます。

【インストール】
　収録ファイルをディレクトリ構造を崩さないように展開して下さい。

【実行方法】
　htwiki.exeを実行して下さい。

【アンインストール】
　インストールしたファイルを全て削除してください。
　HKEY_CURRENT_USER\Software\Mas\HitoriWikiというキーをレジストリに
作成するので気になる方は各自で削除してください(削除しなくても問題は
ありません)。

【収録ファイル】
├BREGEXP.DLL       正規表現ライブラリ(馬場達夫氏作成)
├htwiki.exe        実行ファイル
├Readme.txt        このファイル
├css               デザイン用CSS
│├dark-red
││└wiki.css
│├default
││└wiki.css
│├drop-cap-gray
││└wiki.css
│├pink-heart
││├images
│││├heart12.png
│││├heart18.png
│││├heart24.png
│││└heart-list.png
││└wiki.css
│├simple-line
││└wiki.css
│├star
││├images
│││├star12.png
│││├star18.png
│││├star24.png
│││└star-list.png
││└wiki.css
│└watery-blue
│  ├images
│  │├12.png
│  │├18.png
│  │└24.png
│  └wiki.css
├help              ヘルプ
│└japanese.html
├language          表記文字設定ファイル
│├English.txt
│└日本語.txt
├notation          テキスト整形のルール
│└japanese.html
├plugin            プラグイン
│├link.dll
│├ruby.dll
│└verb.dll
├sample            サンプル
│├57696B69A5EAA5F3A5AF.txt
│├57696B69CBDC.txt
│├A5B5A5F3A5D7A5EB28A4CFA4C6A4CA29.txt
│├A5B5A5F3A5D7A5EB284D61726B646F776E29.txt
│├A5B5A5F3A5D7A5EB284D6564696157696B6929.txt
│├A5B5A5F3A5D7A5EB2850756B6957696B6929.txt
│├A5B5A5F3A5D7A5EB286C697665646F6F722057696B6929.txt
│├A5B5A5F3A5D7A5EB2874657874696C6529
│├A5B5A5F3A5D7A5EB2859756B6957696B6929.txt
│├A5B5A5F3A5D7A5EB28467265655374796C6557696B6929.txt
│└A5D7A5E9A5B0A5A4A5F3.txt
└template            テンプレート
  ├export
  │├default.html
  │├default-contents.html
  │├default-menubar.html
  │├default-menubar-contents.html
  │├default-utf8.html
  │└no-title.html
  ├list
  │└default.html
  └main
    ├default.html
    ├default-contents.html
    ├default-menubar.html
    ├default-menubar-contents.html
    ├default-utf8.html
    └no-title.html

【セキュリティー】
　本プログラムはInternet Explorerの部品を使用しています。そのため
Internet Explorerのセキュリティーホールの影響を受けます。
　ご利用の際にはMicrosoft Update等を利用してセキュリティーホールを
ふさぐようにしてください。

【配布に関して】
　本プログラムはフリーソフトです。著作権は私がもってます(除BREGEXP.DLL)。
配布は自由です。ただしダウンロードした状態のままで手を加えず配布して下さい。
　本プログラムの使用によるいかなる損害についても、作者は責任を負いません。
また、作者はバグを修正する義務も負いません。
　スタイルシートおよびスタイルシートが参照する画像ファイルについては、
スタイルシート内に記載しているライセンスに従い利用をお願いします。

【関連ソフト】
・ひとりWikiプラグイン集
　　本ソフトで利用可能なプラグイン集。

※上記ソフトは作者Webページ(URLは下記参照)にてダウンロードできます。

【作者Webページ】
　http://www2u.biglobe.ne.jp/~MAS/
