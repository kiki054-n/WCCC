
# WCCC Core Logic - 永続化マスタードキュメント
# Tama #000 - すべての玉の母

Version: 1.0 | Date: 2026-07-27 | Author: Naoyuki Kawakami
Location: 山裏 Vineyard 山西, Shiojiri, Nagano

## 0. 思想の核 (Philosophy Core)

**一文で:**
> 小さな貢献が世界に届き、感謝が情報になる

**原理:**
1.  針路は常に2つある：公式針路（建前）と実際の針路（本音・風に流された結果）
2.  風は見えないが、測れる：メディア風、既得権風、国風
3.  台座が傾けば針は狂う：司法・立法・行政府という台座の傾きが、すべてのズレの根
4.  ランキングではなく玉の交換：優劣ではなく、相互学習

## 1. コンパスロジック (Compass Logic) - 汎用フレームワーク

```
WCCC_Compass = {
  base_tilt: {
    judicial: 0-10,   // 司法・ルールの独立性 (WJP) / 条例独立性
    legislative: 0-10, // 立法・多様性 / 議会多様性
    executive: 0-10,   // 行政・透明性 / 市役所透明性
  },
  sovereignty: {
    judicial: 0-10,    // 司法主権 / データ主権
    legislative: 0-10, // 立法主権 / 財政自立
    executive: 0-10,   // 行政主権 / エネルギー自立
    people: 0-10,      // 住民主権 / 酵母主権
  },
  winds: {
    media: 0-10,       // メディア風 / 市場風 / 観光バズ風
    privilege: 0-10,   // 既得権風 / 大資本風 / ゼネコン風
    central: 0-10,     // 国風 / 中央依存風 (地域版で追加)
  },
  divergence_angle: calculated // 公式と実際のズレ角
}

Divergence = f(base_tilt_avg, sovereignty_inverse, winds_avg)
例: Japan = (司法2.2 + 主権逆5.5 + 風6.5) / 3 * 係数 = 28°
```

## 2. 応用展開マトリクス (Application Matrix)

このロジックは入れ替えるだけで何にでも応用できる。

| レイヤー | Base Tilt | Sovereignty | Winds | 乖離角の意味 |
|---------|-----------|-------------|-------|--------------|
| 国レベル (v7) | 司法・立法・行政 | 司法・立法・行政・住民主権 | メディア・既得権 | 民主主義の健康度 |
| ワイン (v8) | 土壌・伝統・蔵 | 土壌主権・酵母主権 | 市場・パーカー・大資本 | テロワールからの乖離 |
| 地域行政 (v9) | 条例独立・議会多様・市役所透明 | データ・財政・エネ主権 | 国風・観光バズ・ゼネコン | 計画と暮らしのズレ |
| 教育 (v10案) | 学習指導要領の自由度 | 子ども主権・教師主権 | 受験産業風・SNS風 | 本来の学びからのズレ |
| 企業 (v11案) | 就業規則・理念の独立 | 社員主権・データ主権 | 株主風・広告風 | 理念と現場のズレ |

## 3. データソース対応表 (Data Source Mapping)

| WCCC変数 | 国レベル指標 | 地域行政指標 | ワイン指標 |
|---------|-------------|-------------|-----------|
| judicial | WJP Rule of Law | 条例独立性スコア | 土壌健康度 |
| legislative | V-Dem LDI | 議会多様性・女性比率 | 醸造自由度 |
| executive | EIU Functioning | 市役所情報公開度 | 醸造家介入度 |
| people | EIU Participation | 市民参加率 | 天然酵母率 |
| media wind | RSF Press Freedom (逆) | 観光バズ依存度 | 市場トレンド依存 |
| privilege wind | CPI (逆) | 大型開発依存 | 大資本依存 |

## 4. 保存方法 (Preservation)

### Layer 1: GitHub (世界の記憶)
- Repo: https://github.com/kiki054-n/WCCC
- Files:
  - /core/WCCC_Core_Logic.md (このファイル)
  - /data/countries.json (本物データ)
  - /data/events.json (歴史的風)
  - /docs/Annex_A.pdf
  - /demos/v7, v8, v9

### Layer 2: ローカルKADOサーバー (地域の記憶)
- 塩尻市振興公社 KADO サーバーに /wccc/ フォルダ
- 住民データはここにのみ置く (データ主権)
- バックアップ: 山裏Vineyard NAS

### Layer 3: 分散保存 (人類の記憶)
- IPFSにハッシュ保存 (今後)
- Internet Archiveに登録

### Layer 4: 物理保存 (畑の記憶)
- 年1回、A4で印刷して蔵に保存
- ワインボトルにQRコード

## 5. 応用展開の手順 (How to Apply)

新しい分野に展開したい時、以下のワークシートを埋めるだけで良い。

```
1. あなたの分野の「公式針路」と「実際の針路」は何ですか？
2. 台座（司法・立法・行政に相当する土台）は何ですか？
3. 主権（誰が決めるべきか）は何ですか？
4. 見えない風（メディア風・既得権風）は何ですか？
5. 乖離角が小さい理想形はどこですか？
6. 玉を交換したい相手は誰ですか？
```

例：教育版なら
1. 公式：生きる力を育む / 実際：受験で疲弊
2. 台座：学習指導要領・校則・評価制度
3. 主権：子ども主権
4. 風：受験産業風、SNS風
5. 理想：フィンランド 6°
6. 相手：長野県のイエナプラン校と塩尻の小学校

## 6. ライセンス
BFOL (Buddhist Fellowship Open License) + MIT
- 商用利用可、改変可、但し「小さな貢献が世界に届く」思想を継承すること
- 感謝が情報になる仕組みを1つ含めること

---
このドキュメント自体がTama #000。すべての玉の母。

From Nagano vineyard to the world.
