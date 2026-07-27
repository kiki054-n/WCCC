# WCCC v13 — actors.json スキーマ (多主体乖離可視化)

## 設計原則
1. **基準進路は差し替え可能なパラメータ** — 既定は Planetary Boundaries だが、baseline を切り替えられる
2. **建前と本音を必ず分離** — declared(宣言) と actual(実測プロキシ) を別フィールドに持ち、差分が内部乖離
3. **すべての実測値に source を義務付け** — 出典なき数値は入力できない構造にする
4. **風の帰属は相関で書く** — 「〜のせい」と断定せず、correlation として保持する

## トップレベル構造

```json
{
  "meta": {
    "version": "13.0",
    "scope": "japan-national",
    "date": "2026-07-27",
    "baseline_id": "planetary_boundaries"
  },
  "baselines": [ Baseline ],
  "actors": [ Actor ],
  "winds": [ Wind ],
  "attributions": [ Attribution ]
}
```

## Baseline(基準進路)

```json
{
  "id": "planetary_boundaries",
  "name": "生物圏持続進路 (Planetary Boundaries)",
  "type": "biophysical",
  "vector": {
    "climate": 10, "biodiversity": 10, "resource_cycle": 10,
    "equity": 8, "resilience": 9
  },
  "sources": ["Stockholm Resilience Centre PB 2023", "Living Planet Index"],
  "note": "宇宙的針路の科学的近似。真の針路は不可知であることを明記"
}
```

- vector は 5軸 (0–10)。軸は分野展開時に差し替え可
  - climate: 気候安定寄与 / biodiversity: 生物多様性寄与
  - resource_cycle: 資源循環(窒素・リン・淡水) / equity: 世代間・地域間公平
  - resilience: 危機耐性
- 代替 baseline 例: `sdg_index`, `constitution_jp`(憲法的価値), `un_declared`

## Actor(主体)

```json
{
  "id": "executive_jp",
  "name": "行政 (内閣・省庁)",
  "category": "state",
  "declared": {
    "vector": { "climate": 8, "biodiversity": 6, "...": "..." },
    "sources": ["施政方針演説 2026", "第6次環境基本計画"]
  },
  "actual": {
    "vector": { "climate": 4, "biodiversity": 3, "...": "..." },
    "proxies": [
      { "metric": "環境関連予算比率", "value": "1.2%", "source": "令和8年度予算書" },
      { "metric": "化石燃料補助 vs 再エネ予算比", "value": "推計", "source": "要調査" }
    ]
  },
  "internal_gap_deg": null,
  "baseline_gap_deg": null
}
```

- category: `sovereign` | `state`(司法/立法/行政) | `capital` | `corporate` | `media` | `citizen`
- internal_gap_deg = declared と actual のなす角(建前と本音)
- baseline_gap_deg = actual と baseline のなす角(基準からの乖離)
- 角度は5次元ベクトルのコサイン類似度から算出: θ = arccos(cos_sim)

## Wind(風 = 偏向要因の候補)

```json
{
  "id": "wind_donation",
  "name": "政治献金風",
  "observable": "政治資金収支報告書の業界別献金額",
  "source": "総務省 政治資金収支報告書",
  "affects": ["legislative_jp", "executive_jp"]
}
```

国レベルの風候補: 政治献金風 / 天下り風 / 広告主風 / 株主風 / 系列資本風 / 世論(SNS)風 / 外圧風

## Attribution(帰属 = 風の逆算結果)

```json
{
  "actor_id": "media_jp",
  "wind_id": "wind_advertiser",
  "correlation": 0.72,
  "evidence": "気候報道量とエネルギー系広告収入比率の負の相関",
  "confidence": "estimated",
  "lever": {
    "action": "広告収入構成の開示請求・購読による読者主権の回復",
    "who": "citizen",
    "precedent": "英Guardianの化石燃料広告停止 (2020)"
  }
}
```

- confidence: `measured`(実データ) | `estimated`(推計) | `hypothesis`(仮説)
- **lever が国民向け出力の核**: 乖離→原因→具体的行為を一本で結ぶ

## 計算規則

```
cos_sim(a, b) = Σ(aᵢbᵢ) / (|a||b|)
gap_deg = arccos(cos_sim) × 180/π
```

- 全アクターの actual を baseline に対して計算 → コンパス表示の角度
- アクター間乖離(例: 国民 vs 行政)も同式でペア計算可能
