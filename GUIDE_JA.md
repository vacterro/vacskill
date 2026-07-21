<p align="center">
  <img src="assets/SAIPEN_design1.png" alt="SAIPEN Guide Title" width="800"/>
</p>

# SAIPEN ガイド (日本語)

おい新兵、問題は単純だ。AIエージェントの記憶力は金魚並みだ。昨日アーキテクチャの説明に半日費やしたのに、今日新しいチャットを開くとゼロから構築し始める。

**SAIPEN**はプロジェクト内の `.saipen/` フォルダに存在するノートだ。

## クイックスタート

1. **マシンごとに1回インストール:**
```bash
git clone https://github.com/vacterro/saipen
cd saipen
powershell -ExecutionPolicy Bypass -File .\bootstrap\inject.ps1     # Windows
bash bootstrap/inject.sh                                            # macOS / Linux
```

2. **プロジェクトで開始:**
> `saipen set`

3. **作業:**
> `saipen`

## コマンド

| コマンド | アクション |\n|---|---|\n| `saipen set` | メモリフォルダ `.saipen/` の初期化 |\n| `saipen continue` | ノートから作業を再開 |\n| `saipen stop` | 進捗を保存して停止 |\n| `saipen status` | ボードと状態を読み取る |\n| `saipen goal <text>` | 新しい目標へピボット |\n| `saipen clean` | リポジトリのディープクリーン |\n| `saipen translate` | 分離された22言語の翻訳ビルド |\n| `saipen ship` | リリースフローのトリガー |
