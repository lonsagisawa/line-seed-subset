# LINE seed font subset builder

## What's this?

Subsetting LINE seed web fonts to mitigate performance concerns.

## Usage

We need fonttools, which brotli enabled. If you are on macOS, binary from homebrew is fine:

```
brew install fonttools
```

Then install npm package here, and run script:

```
npm install
bash subset.sh
```

copy output folder into your project, import `100.css`, `300.css`, `700.css`, `900.css`.

```
<link rel="stylesheet" href="/output/100.css">
<link rel="stylesheet" href="/output/300.css">
<link rel="stylesheet" href="/output/700.css">
<link rel="stylesheet" href="/output/900.css">
```

You can use LINE seed font as `LINE Seed JP`.

```
font-family: "LINE Seed JP", sans-serif;
```

## Wait, I need to install npm package here??!?!?

Yes, we steal subsetting range from [Fontsource Noto Sans JP package](https://fontsource.org/fonts/noto-sans-jp).
