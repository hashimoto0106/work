# -*- coding: utf-8 -*-
"""
Created on Tue Apr 28 16:47:37 2020

@author: sample
"""

import gettext
import os
import config


def init():
    # 翻訳ファイルを配置するディレクトリ
    path_to_locale_dir = os.path.abspath(
        os.path.join(
            os.path.dirname(__file__),
            config.translation_dictionary_dir
        )
    )
    print(path_to_locale_dir)
    # 翻訳用クラスの設定
    translater = gettext.translation(
        config.translation_dictionary_file,  # domain: 辞書ファイルの名前
        localedir=path_to_locale_dir,  # 辞書ファイル配置ディレクトリ
        languages=[config.translation_language],  # 翻訳に使用する言語
        fallback=True  # .moファイルが見つからなかった時は未翻訳の文字列を出力
    )

    # Pythonの組み込みグローバル領域に_という関数を束縛する
    translater.install()
