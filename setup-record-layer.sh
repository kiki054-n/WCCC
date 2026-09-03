#!/usr/bin/env bash
# 記録層 段階1 のセットアップ
#   署名付き git コミット + Zenodo DOI
# 一行ずつ確認しながら実行してください。まとめて走らせないこと。
set -euo pipefail

echo "=== 0. git のバージョン確認 (SSH署名は 2.34 以降) ==="
git --version

echo
echo "=== 1. 署名用の SSH 鍵 ==="
echo "既存の鍵を使う場合はこの手順を飛ばしてください。"
echo "  ssh-keygen -t ed25519 -C 'signing key for kiki054-n' -f ~/.ssh/id_ed25519_signing"

echo
echo "=== 2. git に署名を設定 ==="
cat <<'CMD'
  git config --global gpg.format ssh
  git config --global user.signingkey ~/.ssh/id_ed25519_signing.pub
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
CMD

echo
echo "=== 3. ローカルで署名を検証できるようにする (任意だが推奨) ==="
cat <<'CMD'
  mkdir -p ~/.config/git
  echo "yvy@kjkg.org $(cat ~/.ssh/id_ed25519_signing.pub)" >> ~/.config/git/allowed_signers
  git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers
CMD

echo
echo "=== 4. GitHub 側 ==="
echo "  Settings -> SSH and GPG keys -> New SSH key"
echo "  Key type を **Signing Key** にすること (Authentication Key では Verified が付きません)"
echo "  さらに Settings -> SSH and GPG keys -> Vigilant mode を有効にすると、"
echo "  署名のないコミットが Unverified と表示されます。"

echo
echo "=== 5. 動作確認 ==="
cat <<'CMD'
  git commit --allow-empty -m "chore: verify signed commit"
  git log --show-signature -1
  # -> "Good \"git\" signature" と出れば成功
CMD

echo
echo "=== 6. Zenodo 連携 ==="
echo "  1) zenodo.org に GitHub アカウントでログイン"
echo "  2) プロフィールメニュー -> GitHub"
echo "  3) 'Sync now' でリポジトリ一覧を更新"
echo "  4) 対象リポジトリのスライダーを ON"
echo "  5) GitHub で Release を作成すると、以後の Release が自動で保存され DOI が付きます"
echo
echo "  注意: スライダーを ON にした **後** の Release から有効です。"
echo "        Concept DOI (全バージョン) と Version DOI (各版) の2つが発行されます。"
echo "        README にはふつう Concept DOI を貼ります。"

echo
echo "=== 7. 最初の記録 ==="
cat <<'CMD'
  git add RECORD-LAYER.md CITATION.cff .zenodo.json
  git commit -S -m "docs: record-layer design — two-layer ledger, no claims in the record layer

記録層と決済層を分離する設計決定。記録層は請求権を生成しない。
撤退不変性と四指標(可搬性/複製可能性/撤退の対称性/終期の明示)を判定基準とする。
著作権(排他的請求権)は記録層に載せない。"
  git tag -s v0.1.0 -m "Record layer, stage 1"
  git push && git push --tags
  # GitHub で Release を作成 -> Zenodo が DOI を発行
CMD
