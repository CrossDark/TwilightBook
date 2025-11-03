#let theme_setting_heading = (
    "background-color", // 主题背景颜色 / Theme background color
    "text-color", // 主题文字颜色 / Theme text color
    "stroke-color", // 主题描边颜色 / Theme stroke color
    "fill-color", // 主题填充颜色 / Theme fill color

    "cover-image", // 主题封面图片路径 / Theme cover image paths
    "preface-image", // 主题前言图片路径 / Theme preface image paths
    "content-image" // 主题图片路径 / Theme image paths
)

#let theme_settings = (
  abyss: (rgb("#000000"), rgb("#ffffff"), rgb("#4b5358"), rgb("#1f2833"), "../themes/abyss/cover.svg", "../themes/abyss/preface.svg", "../themes/abyss/content.svg"),
)

#let index(
  theme: "abyss",
  setting: "bakground-color",
) = {
  let searcher(it) = {return it = setting}
  text(theme_setting_heading.position(searcher(setting)))
}
