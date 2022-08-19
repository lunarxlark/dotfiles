#------------------------------------------------------------------------------#
# Options                                                                      #
#------------------------------------------------------------------------------#
setopt prompt_subst          # プロンプトに escape sequence (環境変数) を通す

setopt append_history        # 履歴を追加 (毎回 .zhistory を作るのではなく)
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_space     # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt share_history
