# TDDBC仙台07課題：ポーカー

## ポーカー

ポーカー(poker)は、トランプを使って行うゲームのジャンルである。 プレイヤー達は5枚の札でハンド（役、手役）を作って役の強さを競う

( https://ja.wikipedia.org/wiki/%E3%83%9D%E3%83%BC%E3%82%AB%E3%83%BC より抜粋)

## トランプ

トランプは、日本ではカードを使用した室内用の玩具を指すために用いられている用語で、もっぱら4種各13枚の計52枚(+α)を1セットとするタイプのものを指して言うことが多い。

( https://ja.wikipedia.org/wiki/%E3%83%88%E3%83%A9%E3%83%B3%E3%83%97 より抜粋)

- カード (card)
  - スートとランクを持つ
- スート (suit) - 以下の４種類を持つ
  - ♠ (スペード/spade)
  - ♥ (ハート/heart)
  - ♣ (クラブ/club)
  - ♦︎ (ダイヤ/diamond)
- ランク (rank) - 以下の１３種類を持つ
  - A (エース/ace), 2, 3, 4, 5, 6, 7, 8, 9, 10, J(ジャック/jack), Q(クイーン/queen), K(キング/king)
- カードひと組(4スート x 13ランク = 52枚)のことをデッキ(deck)と呼ぶ

## 課題1 トランプのカード

### 課題1-1 カードの文字列表記

任意のカード1枚について、その文字列表記を取得してください

- スート (suit) と ランク (rank) を与えて カード (card) を生成してください
- 生成したカードから文字列表記 (notation) を取得してください

```
【例】
// スートにスペード, ランクに3を与えてカードを生成
Card threeOfSpades = new Card("♠", "3");
// 「スペードの3」の文字列表記は「3♠」
String notation = threeOfSpades.getNotation(); // => "3♠"
 // スートにハート, ランクにJを与えてカードを生成
 Card jackOfHearts = new Card("♥", "J");
 // 「ハートのJ」の文字列表記は「J♥」
 String notation = jackOfHearts.getNotation(); // => "J♥"
```

## 課題1-2 カードの比較

任意のカード2枚について、同じスート／ランクを持つか判断してください

- カード (card) がもう1枚のカードと同じスートを持つか (has same suit) を判断してください
- カード (card) がもう1枚のカードと同じランクを持つか (has same rank) を判断してください
```
【例】
Card threeOfSpades = new Card("♠", "3"); // スペードの3
Card aceOfSpades = new Card("♠", "A"); // スペードのA
Card aceOfHearts = new Card("♥", "A") // ハートのA
// スペードの3とスペードのAは同じスートを持つ
threeOfSpades.hasSameSuit(aceOfSpades) // => true
// スペードの3とハートのAは異なるスートを持つ
threeOfSpades.hasSameSuit(aceOfHearts) // => false
// スペードの3とスペードのAは異なるランクを持つ
threeOfSpades.hasSameRank(aceOfSpades) // => false
// スペードのAとハートのAは同じランクを持つ
aceOfSpades.hasSameRank(aceOfHearts) // => true
```

## 課題2 ツーカードポーカー (two card poker) の役を判定

1デッキのトランプの内、任意の2枚から構成される手札を使ったポーカー

## 課題2-1 ツーカードポーカーの役を判定

ツーカードボーカーの任意の 手札 (cards) について、その 役 (hand) を判定してください

ツーカードポーカーには以下の役があります

- ペア (pair)
  - 2枚のカードが同じランクを持つ
- フラッシュ (flush)
  - 2枚のカードが同じスートを持つ
- ハイカード (high card)
  - 2枚のカードが異なるランク/スートを持つ

## 課題2-2 ツーカードポーカーの役を判定(役の追加)

ツーカードポーカーに新たな役が追加されます

ツーカードボーカーの任意の手札について、その役を判定してください (複数の役が成立している場合は、より上位の役が成立しているとみなしてください)

- ストレートフラッシュ (straight flush)
  - ストレートとフラッシュが成立している
- ペア (pair)
  - 2枚のカードが同じランクを持つ
- ストレート (straight)
  - 2枚のカードのランクが連続している
  - A は 2 と K の両方と連続しているとみなす (A-K および 2-A のランクの組み合わせはいずれもストレートである)
- フラッシュ (flush)
  - 2枚のカードが同じスートを持つ
- ハイカード (high card)
  - 上記の役が1つも成立していない