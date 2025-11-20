#import "/src/book.typ" : *

#show: book.with(
  theme: "abyss",
  depth: 1,
  wrapper: (heading, content) => {
    heading
    nest-block(depth: 2, content)
  }
)


= heading 1 - a

== heading 2 - a

some
text _and_ 
more

wef

wef

wef

=== heading 3 - a

stuffewf

efw

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
  align: (left, left, center, center, center, left, left, center, center),
  inset: 5pt,
  table.header(
    [货号], [产品名称], [价格], [销售方式], [供货方式], [简介], [备注], [交货概率], [生值率]
  ),
  [`AHX-T`], [实验型高端深渊人], [*停产*], [*停产*], [*停产*], [内部测试用,已停产], [], [*停产*], [*停产*],
  [`AHX-B`], [基本型高端深渊人], [5], [代理商], [现货], [基本型号.无特殊需求就选这个], [], [99%], [1%],
  [`AHX-Tl`], [工具型高端深渊人], [20], [劳务派遣公司], [现货], [工业生产用], [], [95%], [5%],
  [`AHX-Ty-M`], [男性玩具型高端深渊人], [30], [俱乐部], [现货/租赁/体验卡], [满足绝大部分娱乐需求], [], [90%], [1%],
  [`AHX-Ty-F`], [女性玩具型高端深渊人], [300], [俱乐部], [现货/租赁/体验卡], [满足几乎全部娱乐需求,可生育], [], [80%], [0.2%],
  [`AHX-U-M`], [男性通用型高端深渊人], [100], [直销], [预定], [生产生活均可], [一旦预定则不支持退换,且强制收货], [99%], [0.05%],
  [`AHX-U-F`], [女性通用型高端深渊人], [1200], [直销], [预定], [生产生活均可], [一旦预定则不支持退换,且强制收货], [100%], [0.01%],
)

== heading 2 - b
test


= heading 1 - c

== heading 2 - c

some

=== heading 3 - b

some
text _and_ 
more

=== heading 3 - c

stuff

== heading 2 - d
test
