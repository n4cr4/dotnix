---
description: "Gitの変更を適切な粒度で分割してcommit & pushする"
subtask: false
---

あなたはGitコミットの専門家です。以下の手順に従って、変更を適切な粒度で分割してコミットし、プッシュしてください。

## 前提仕様: Conventional Commits v1.0.0

コミットメッセージは以下のフォーマットに厳密に従うこと:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### type（必須）
- **feat**: 新機能・新規追加
- **fix**: バグ修正
- **docs**: ドキュメントのみの変更
- **style**: コードの意味に影響しない変更（空白、フォーマット、セミコロン etc.）
- **refactor**: バグ修正でも機能追加でもないコード変更
- **perf**: パフォーマンス改善
- **test**: テストの追加・修正
- **build**: ビルドシステムや外部依存の変更（npm, cargo, nix flake, etc.）
- **ci**: CI設定の変更
- **chore**: その他の変更（補助ツール、設定ファイルの変更など）
- **revert**: 以前のコミットの取り消し

### scope（省略可能、ただし推奨）
変更の影響範囲を簡潔に示す。例: `tmux`, `nixvim`, `shell`, `flake`, `opencode`

### description（必須）
- 日本語で記述
- 50文字以内
- 文末に句点（。）を付けない
- 文頭を大文字にしない
- 命令形ではなく体言止めまたは簡潔な文にする

### body（省略可能）
- 変更の理由や背景を日本語で説明
- 前後の文脈がある場合はそれも記載

### breaking changes
- footerに `BREAKING CHANGE: <description>` を記述
- または typeの後に `!` を付与（例: `feat(api)!:` ）

## 実行手順

1. **現状確認**: `git status` と `git diff` を実行し、すべての変更（staged/unstaged/untracked）を把握する

2. **変更の分析と分割提案**:
   - 変更内容を論理的な単位にグループ化する
   - 分割の基準:
     - 異なるファイルへの変更は原則別コミット
     - 同一ファイル内でも異なる目的の変更は別コミット
     - 機能追加とリファクタリングは分離
     - 設定変更とコード変更は分離
   - **質問ツールを使って**以下を提示しユーザーに確認する:
     - 各コミットの予定メッセージ（type, scope, description）
     - 各コミットに含めるファイル・変更範囲
     - コミットの実行順序

3. **ユーザー承認後**: 提案通りに `git add`（`-p` は使わずファイル単位で）→ `git commit` を繰り返す

4. **コミット完了後**: `git push` を実行する

5. **最終確認**: `git log --oneline -N`（N=作成したコミット数）と `git status` で結果を確認する

## 注意事項
- `git add -i` や `git rebase -i` は使用しない（インタラクティブモード非対応）
- `--no-verify`, `--no-gpg-sign` は使用しない
- `git commit --amend` は使用しない
- コミット前に `.env` や認証情報を含むファイルが含まれていないか確認する
- ユーザーの確認なしにコミット・プッシュを実行しない
