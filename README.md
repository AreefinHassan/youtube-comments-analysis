# YouTube Comments Analysis

Comparing viewer reactions to two of the most talked-about TV series — **Game of Thrones** and **Breaking Bad** — by collecting their YouTube comments through the YouTube Data API, mining the text in R, and visualizing the most frequent words as word clouds.

## What was done

1. **Data collection** — Authenticated with the YouTube Data API (via the `tuber` package) and pulled comment threads from the two videos, along with video statistics and details.
2. **Text mining** — Built a text corpus from the comments and a document–term matrix with the `tm` package, removing punctuation, numbers, and stopwords, then ranked terms by frequency.
3. **Word clouds** — Rendered word clouds with `wordcloud` and `wordcloud2` (diamond-shaped, frequency-ordered) for each show.
4. **Comparison** — Read the frequent words side by side to contrast what viewers talk about for each series.

## Key findings

| Show | Most frequent words | What viewers focus on |
| --- | --- | --- |
| **Breaking Bad** | watched, ever, series, bad, breaking, greatest, season | The viewing experience itself — rewatchability, specific seasons and episodes, and the show's standing as one of the greatest series |
| **Game of Thrones** | books, winter, best, games, thrones, first, popular | Comparisons with the original books, the show's themes and lore ("winter", "games"), and its widespread acclaim |

**Common ground:** both audiences use superlatives — "greatest", "best", "popular" — showing both series are highly regarded.

**Divergence:** Breaking Bad comments center on *watchability* (seasons, rewatching), while Game of Thrones comments center on *adaptation and lore* (the books, the world of Westeros). In short, the word clouds mirror two different kinds of engagement: Breaking Bad as a gripping, unforgettable viewing experience; Game of Thrones as a rich book-to-screen discussion.

## Data

`data/YouTubeVideoComments.csv` — 100 comments collected from the Game of Thrones video (`J7JYw5kQg_Y`), with comment text, author, like count, and timestamps. The Breaking Bad comments were collected with the same script; the supplied dataset covers the Game of Thrones thread.

## How to run it

Requires R with the `tuber`, `tm`, `SnowballC`, `wordcloud`, and `wordcloud2` packages. Put your own YouTube API credentials in `code/youtube_comments_analysis.R` (the published script has placeholders where the client ID and secret go), then run it — it authenticates, fetches the comment threads, and builds the word clouds.

## Layout

```
├── README.md
├── code/
│   └── youtube_comments_analysis.R   # API collection + text mining + word clouds (R)
├── data/
│   └── YouTubeVideoComments.csv      # 100 Game of Thrones video comments
├── images/
│   ├── breaking_bad_wordcloud.jpg
│   └── game_of_thrones_wordcloud.jpg
└── report/
    ├── YouTube_Comments_Report.pdf
    └── YouTube_Comments_Report.docx
```
