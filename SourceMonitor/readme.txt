■SouceMonitor使用方法

1.準備
  (1)gcov_exe.bat内の"GCOVEXE"を環境に合わせて書き換えてください。
     "GCOVEXE"には gcov.exe のパスを指定します。
     gcov.exeは通常、Eclipseインストールフォルダの"eclipse\mingw\bin\gcov.exe"に
     あるはずです。
  (2)gcov_list.txtを環境に合わせて書き換えてください。
     gcov_list.txtにはgcovに入力するソースファイルパスを指定します。
     例）workspace\XXXX\SRC\P_LOOP\配下の3つのファイルを指定する場合
         －gcov_list.txtの内容－
         workspace\XXXX\SRC\P_LOOP\aaa
         workspace\XXXX\SRC\P_LOOP\bbb
         workspace\XXXX\SRC\P_LOOP\ccc
         (※)拡張子を含まないようにしてください。
  (3)GCCオプション
     Eclipseの[プロジェクト][プロパティー]の[C/C++ ビルド][設定][ツール設定]と開き、
     [GCC C Compiler][その他][その他のフラグ]と、
     [MinGW C Linker][その他][リンカー・フラグ]に以下を追加してください。
     -fprofile-arcs -ftest-coverage
  (4)resultフォルダ
     resultフォルダ下のファイルはgcov出力結果です。
     新規project環境を構築した際にはこの中身を全て削除して下さい。

2.実行
  gcov_exe_all.bat を実行します。
  結果ファイル"*.c.gcov"はresultフォルダ下に出力されます。

3.gcov_clear.batについて
  gcov_clear.bat を実行するとgcovの中間ファイル(*.gcda)を削除します。

  gcovは実行する試験対象のexeが同じ版であれば*.gcdaを更新するため、試験を繰り返し
  ながらカバレッジを100%に近づけるということが可能となっています。ただしソースファ
  イルを変更して再ビルドし、exeを実行すると*.gcdaと実行結果が合わない旨のエラーが
  表示されます。この場合*.gcdaファイルを削除し、カバレッジの統計をリセットする必要
  があります。
  通常、ACUの単体試験ではデバッガで値を書き換えるような手動式の試験ではなく、毎回
  全ルートを通すような試験ドライバを記述しているはずなので、再ビルドした際には自動
  でgcov_clear.batを実行するようにしておけばよいかと思います。
  その方法は、
  Eclipseの[プロジェクト][プロパティー]の[C/C++ ビルド][設定][ビルド・ステップ]と開き、
  [コマンド]に以下を記述します。
  "${workspace_loc:/${ProjName}/gcov/gcov_clear.bat}"

