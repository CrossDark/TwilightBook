#import "../themes/index.typ" : * // 导入主题设置模块 / Import theme settings module

#import "models.typ" : * // 导入模块 / Import models module

// 用于弥补缺少 `std` 作用域的工作区。
// Workaround for missing `std` scope in workspace.
#let std-bibliography = bibliography
#let std-smallcaps = smallcaps
#let std-upper = upper
