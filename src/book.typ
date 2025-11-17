#import "../themes/index.typ" : * // 导入主题设置模块 / Import theme settings module

// A utility function to check if an element is a heading / 判断元素是否为标题
#let is-heading(it) = {
  it.func() == heading
}

/// A show rule that wrap everything between two headings of the same level / / 包装两个相同级别标题之间的所有内容
///
/// Usage: 
/// ```
/// #show: wrapp-section.with(
///   depth: 1, // optional
///   wrapper: (heading: none, section: none) => {
///    rect[
///      heading: #box[#rect[#heading]]
///      
///      section: #box[#rect[#section]]
///    ]
///  }
/// )
/// ```
///
/// Note: `#set` rules (like `#set text(lang: "fr")`) must be declared before calling `#show: wrapp-section` /  注意: `#set` 规则（如 `#set text(lang: "fr")`）必须在调用 `#show: wrapp-section` 之前声明

// 主函数 / Wrapper function
#let wrapp-section(
  body,
  depth: 1,
  wrapper: none,
) = {
  // The heading of the current section / 当前部分的标题
  let heading = none
  // The content of the current section / 当前部分的内容
  let section = ()

  for it in body.children {
    let x = it.func();
    
    if (is-heading(it) and it.fields().at("depth") < depth) {
      if heading != none {
        // Complete the last section
        wrapper(heading: heading, section: section.join())
        heading = none
        section = ()
      }
      it
    } else if is-heading(it) and it.fields().at("depth") == depth {
      if heading != none {
        // Complete the last section
        wrapper(heading, section.join())
        heading = none
        section = ()
      }

      heading = it
    } else if heading != none {
      // Continue the current section
      section.push(it)
    } else {
      it // if not in any section (before the first heading of the appropriate depth) / 如果不在任何部分内（在适当深度的第一个标题之前)
    }
  }

  // Complete the last section / 完成最后一部分
  if heading != none {
    wrapper(heading, section.join())
  }
}

#let nest-block(body, depth: 1) = {
  wrapp-section(
    depth: depth,
    wrapper: (heading, content) => {
      block(
        stroke: (left: black),
        inset: (left: 1em),
      )[
        #heading
        #nest-block(depth: depth + 1, content)
      ]
    }
  )[#body]
}

// Main function / 主函数
#let book(
  body,
  theme: "light",
) = {
  let background-color = themes(theme: theme, setting: "background-color")
  let text-color = themes(theme: theme, setting: "text-color")
  let stroke-color = themes(theme: theme, setting: "stroke-color")
  let fill-color = themes(theme: theme, setting: "fill-color")
  let cover-image = themes(theme: theme, setting: "cover-image")
  let preface-image = themes(theme: theme, setting: "preface-image")
  let content-image = themes(theme: theme, setting: "content-image")

  // Apply theme settings to the document / 将主题设置应用于文档
  set page(
    background: background-color,
    text: text-color,
  )

  body
}
