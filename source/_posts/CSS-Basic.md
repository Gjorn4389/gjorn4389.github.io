---
title: CSS Basic
date: 2023-12-10 12:14:02
categories: Web
tags:
  - Web
---

# CSS

> 整合自
> + [Web前端零基础入门HTML5+CSS3基础教程](https://www.bilibili.com/video/BV1XJ411X7Ud?p=27&spm_id_from=pageDriver)
> + [MDN WEb Docs CSS](https://developer.mozilla.org/zh-CN/docs/Web/CSS)

层叠样式表，通过CSS可以设置网页中元素的样式

# 1 CSS语句
## 1.1 基本语法

**编写位置**
1. 行内样式
    > 只对一个标签生效
    ```html
    <p style="color: red;">red</p>
    ```
2. head标签中style标签
    > 仅对于当前页面生效
    ```css
    p {
        color: yellow;
    }
    ```
3. 外部样式表
    > 引入外部css文件，可以在不同页面中生效，推荐使用
    >
    > 可以利用浏览器的缓存机制，加快网页的加载速度
    ```html
    <link rel="stylesheet" href="./css/xxx.css">
    ```

**句法**
```css
selectorList {
    propertyList
}
```
selectorList: 选择器，通过选择其选中页面中的指定元素
propertyList: 申明块，指定元素设置的样式

## 1.2 选择器

### 1.2.1 常用选择器
1. 通配选择器
    + 选择所有元素
    + \* { }
2. 元素选择器
    + 指定某种标签类型所有的元素，不便修改
    + 标签名 { }
3. **类选择器**（推荐使用）
    + 针对class指定相同样式
    + .class { }
4. id选择器
    + 只能选择一个元素
    + #id { }
5. 属性选择器
    + 根据标签属性选择
    + [attr] { }
      + [attr]：表示带有以*attr*命名的属性的元素。
      + [attr=value]：表示带有以*attr*命名的属性，且属性值为*value*的元素。
      + [attr~=value]：表示带有以*attr*命名的属性的元素，并且该属性是一个以空格作为分隔的值列表，其中至少有一个值为*value*。
      + [attr|=value]：表示带有以*attr*命名的属性的元素，属性值为“value”或是以“value-”为前缀（"-"为连字符，Unicode 编码为 U+002D）开头。典型的应用场景是用来匹配语言简写代码（如 zh-CN，zh-TW 可以用 zh 作为 value）。
      + [attr^=value]：表示带有以*attr*命名的属性，且属性值是以*value*开头的元素。
      + [attr$=value]：表示带有以*attr*命名的属性，且属性值是以*value*结尾的元素。
      +  [attr*=value]：表示带有以*attr*命名的属性，且属性值至少包含一个*value*值的元素。
      + [attr operator value i]：在属性选择器的右方括号前添加一个用空格隔开的字母 i（或 I），可以在匹配属性值时忽略大小写（支持 ASCII 字符范围之内的字母）。
      + [attr operator value s]：在属性选择器的右方括号前添加一个用空格隔开的字母 s（或 S），可以在匹配属性值时区分大小写（支持 ASCII 字符范围之内的字母）。(会报错)

### 1.2.2 组合选择器
1. 选择器列表（并集）
    + 选中符合*任一选择器*的元素
    + 语法: 用`,`连接选择器
        ```css
        h1, h2 {
            color: red;
        }
        ```
2. 交集选择器
   + 选中符合*所有选择器*的元素
   + 语法: 选择器直接相连
        ```css
        /* p标签中class为red的元素 */
        p.red {
            color: red;
        }
        ```
   + 可以用属性选择器替代
        ```css
        p[class="red"] {
            color: red;
        }
        ```
3. 后代选择器
    + 选择器1的**所有后代**中满足选择器2的元素
    + 语法
        ```css
        selector1 selector2 {
            /* property declarations */
        }
        ```

4. 子选择器
    + 选择器1的**子元素**中满足选择器2的元素
    + 语法
        ```css
        selector1 > selector2 {
            /* property declarations */
        }
        ```
5. 通用兄弟选择器
    + **选择器1选择的元素的之后的兄弟元素**中满足选择器2的元素
    + 语法
        ```css
        selector1 ~ selector2 {
            /* property declarations */
        }
        ```
6. 相邻兄弟选择器
    + 第二个元素紧跟在第一个元素之后，并且两个元素都是属于同一个父元素的子元素
    + 语法
        ```css
        selector1 + selector2 {
            /* property declarations */
        }
        ```

### 1.2.3 伪类选择器
伪类: 不存在的类，描述一个元素的特殊状态

[标准伪类参考](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Pseudo-classes)

**语法**
```css
selector:pseudo-class {
  property: value;
}
```

+ 第n个子元素
  + 所有元素次序（包含不同类型）
    + `:first-child`：第一个子元素
    + `:first-child`：最后一个子元素
    + `:nth-child()`：第n个子元素
      + `:nth-child(n)`：所有子元素
      + `:nth-child(2n)`/`:nth-child(even)`：所有偶数个元素
      + `:nth-child(2n+1)`/`:nth-child(odd)`：所有奇数个元素
  + 相同类型元素排序 （同类型中的元素进行排序）
    + `:first-of-type`
    + `:last-of-type`
    + `:nth-of-type()`
+ `:not(selector)`：否定伪类
+ 超链接
  + `:link`：正常的连接
  + `visited`：访问过的链接，出于保护隐私，只能修改链接的颜色
  + `:hover`：鼠标移入
  + `:active`：鼠标点击
+ ...

### 1.2.4 伪元素选择器
伪元素：对被选择元素的**特定部分**修改样式

[标准伪元素参考](https://developer.mozilla.org/zh-CN/docs/Web/CSS/Pseudo-elements)

**语法**
```css
selector::pseudo-element {
  property: value;
}
```

+ 选取部分元素
  + `::first-letter`：第一个字母
  + `::first-line`：第一行
  + `::selection`：选中的内容
+ 元素内容修改：结合`content`使用
  + `::before`：元素的开始
  + `::after`：元素的结束

### 1.2.5 餐厅练习
[选择器练习](https://flukeout.github.io/#)


### 1.3 选择器机制

### 1.3.1 样式继承
子元素会继承父元素的样式。

利用继承的机制，将通用的样式设置到父元素中，实现对子元素的全覆盖。

但是有一些样式(`background-color`)并不会继承。


### 1.3.2 选择器权重
当样式发生冲突时，会根据选择器的权重大小选择样式。

以下的选择器权重依次降低
+ 内联样式：1000
+ id选择器：0100
+ class、伪类选择器、属性选择器：0010
+ 元素选择器、伪元素选择器：0001
+ 通配符、子选择器、相邻选择器：0000
+ 继承：无权值


比较权重时，会对选择器的权重相加计算，优先级越高，优先显示，累加不会进位

当权重相同时，后面的样式会覆盖前面的样式

`!important`：说明该样式优先级最高
```html
<style>
    p {
        color:red !important;
    }
</style>
<p style="color:blue;">我显示红色</p>　
```

## 1.4 申明块

1. 长度
    + 像素：像素点长度，不同设备显示效果不同
    + 百分比：父元素属性的百分比长度，子元素跟随父元素改变
    + `em`：当前元素的font-size长度，一个字体一般16px
    + `rem`：根元素的font-size长度
2. 颜色
    + 颜色名：`red`、`blue`...
    + `RGB(x, y, z)`
    + `RGBA`：添加不透明度为第四个参数，0-1从完全透明到完全不透明
    + 十六进制的`RGB：#xxyyzz`(xx可以是00-ff)
    + `HSL`值：
      + H：色相（0 - 360）
      + S：饱和度（0% - 100%）0就是灰色
      + L：亮度（0% - 100%）0就是黑色

# 2 页面布局

## 2.1 文档流
网页是多层的结构，用户只能看到最顶层。在这些层中，最底层的是文档流，我们创建的元素默认都是在文档流中进行排列。

元素有两个状态
+ 在文档流中
  + 块元素
    + 在页面中独占一行
    + 默认宽度是父元素的100%
    + 默认高度是子元素的高度
  + 行内元素
    + 一行中占据自身大小
    + 自左向右排列
    + 默认宽度和高度由内容决定
+ 不在文档流中

## 2.2 盒模型
CSS将所有元素都设置为一个矩形的盒子，通过改变盒子的位置完成对页面的布局。

+ 内容（content）
  + `width`、`height`设置内容区的长度
+ 内边距（padding）：介于内容与边框之间
+ 边框（border）
+ 外边距（margin）：两个盒模型之间的距离


### 2.2.1 边框
1. `border-width`：指定边框的宽度
    + 存在默认值
    + 分别指定各个边框的宽度
      + 四个值：上 右 下 左
      + 三个值：上 左右 下
      + 两个值：上下 左右
      + 一个值： 上下左右
    + `border-xxx-width`：指定某一边框
2. `border-color`
    + 默认值：该元素的`color`
    + 类似`width`分别指定各个边框
3. `border-style`：指定边框样式
    + 默认值：`none`，表示没有边框
4. 简写：`border: [width] [color] [style]`
    + `border-top、border-bottom、border-left、border-right`

### 2.2.2 内边距
内容区和边框之间的距离是内边距

+ 使用`padding`设定四个内边距
+ 存在四个方向的内边距
  + `padding-top`
  + `padding-right`
  + `padding-bottom`
  + `padding-left`
+ 内容区的背景颜色会延伸至内边距
+ 简写：`padding: [top] [right] [bottom] [left]`

### 2.2.3 外边距

+ 不会改变盒子的大小，会影响盒子的位置
+ 类似内边距，有四个方向的外边距
  + `margin-top`：正值，该元素会往下移动
  + `margin-right`：默认不会产生任何效果
  + `margin-bottom`：下面的元素会向下移动
  + `margin-left`：正值，该元素会往右移动
+ 元素在页面中自左向右排列
  + 移动 左、上外边距 会移动元素自身
  + 移动 右、下外边距 会移动其他元素
+ 边距设定为负值，会往相反方向移动
+ 简写：`margin: [top] [right] [bottom] [left]`

### 2.2.4 水平布局
> 在[绝对定位](#421-水平布局)中有拓展
元素在父元素中水平方向的位置由以下属性决定
1. `margin-left`
2. `border-left`
3. `padding-left`
4. `width`
5. `padding-right`
6. `border-right`
7. `margin-right`

父元素的内容区宽度=上述属性之和

`parent width = margin-left + border-left + padding-left + width + padding-right + border-right + margin-right`

若等式不成立，那么就是**过度约束**。等式会自动调整
1. 如果属性中没有`auto`，浏览器会自动调整`margin-right`使等式满足
2. `width`（默认是auto的）、`margin-left`、`margin-right`可以设置为`auto`，浏览器会调整`auto`的值使等式成立
    + 某个值为`auto`，则会自动调整`auto`的值
    + 若`width`为`auto`，那么会将**外边距**设置为`auto`的值视为`0`，将`width`拉到最大。
    + 若两个外边距都为`auto`，那么会调整两个外边距设置为相同值，常用于**水平居中**
        ```css
        width: npx;
        margin: 0 auto;
        ```
3. `margin`为使等式成立，可以为负值

### 2.2.5 垂直布局
> 在[绝对定位](#422-垂直布局)中有拓展
父元素高度由`height`决定，如果没有设定，那么会由子元素高度决定。
+ `weight`
+ `margin-top`
+ `margin-bottom`
+ `padding-top`
+ `padding-bottom`

如果子元素的高度 **大于** 父元素的高度，那么会发生 **溢出**。
可以使用`overflow`来设置父元素处理溢出的子元素
+ `visivle`：默认，可见
+ `hidden`：隐藏
+ `scroll`：滚动条（上下、左右），可以查看完整内容
+ `auto`：根据需要生成滚动条

还有`overflow-x`、`overflow-y`单独处理某一方向的溢出

### 2.2.6 外边距折叠
**相邻的垂直方向外边距**会发生折叠现象
+ 兄弟元素
  + 两者都是正值：会取两个外边距的较大值
  + 一正一负：取和
  + 两者都是负值：取绝对值较大的外边距
+ 父子元素
  + 父子元素间相邻外边距，子元素会传递给父元素
  + 解决方案：父元素加一个`border`，父元素`width`减去`border`的宽度，`border`颜色匹配。其他的子元素也得更改。

### 2.2.7 行内元素盒模型
1. 行内元素不支持设置宽度和高度，由内容区决定
2. 可以设置`padding`、`border`、`margin`，但是垂直方向的`padding`、`border`、`margin`不会影响页面布局
3. `display`：设置元素显示类型
    + `inline`：行内元素
    + `block`：块元素
    + `inline-block`：行内块元素，可以设置宽度和高度，也不会独占一行
    + `table`：表格
    + `none`：隐藏，不占据位置
4. `visibility`
    + `visible`：默认值，正常显示
    + `hidden`：元素在页面中隐藏不显示，依然占据位置

### 2.2.8 默认样式
浏览器会为元素设置一些默认样式，影响页面的布局。一般会去除浏览器的默认样式

1. 选择具体标签，设定样式
   + `body` 存在 `margin: 8`
   + `p` 存在 `margin: 16 0`
   + `ul` 存在 `margin: 16 0`、`padding-left: 40`、`list-style: ...`
   + ....
2. 使用 `*` 通配选择器，去除所有样式的`margin`、`padding`
3. 引入外部css文件，覆盖默认样式


## 2.3 盒模型细节

### 2.3.1 盒子尺寸
默认情况：盒子可见框的大小由内容区、内边距、边框共同决定
`box-sizing`：设置盒子尺寸的计算方式（设置`width`和`height`的作用）
  + `content-box`：默认值，内容区
  + `border-box`：设置盒子可见框的大小



### 2.3.2 轮廓、阴影、圆角
1. **轮廓**：
   `ouline`用法与`border`类似，作用不同于`border`，不会影响页面布局，
2. **阴影**：
    `box-shadow: [left] [top] [blur-radius] [color]`
   + left：水平偏移量
   + top：垂直偏移量
   + blur-radius：模糊度
   + color：阴影颜色，常用rgba表现透明阴影
3. **圆角**
   `border-radius`：可见框的圆角。会影响`border`、`box-shadow`，但不会影响`outline`
   + 可以分别指定四个圆角，其中双值代表椭圆
     + `border-top-left-radius`
     + `border-top-right-radius`
     + `border-bottom-left-radius`
     + `border-bottom-right-radius`
   + 也可以通过`border-radius`实现多个圆角设置（顺时针排序）
     + 四个值：左上 右上 右下 左下
     + 三个值：左上 右上/左下 右下
     + 两个值：左上/右下 右上/左下
     + 一个值：四个角
     + `x / y`：表示为椭圆
   + 圆形：`border-radius: 50%;`

# 3 浮动
通过 **浮动** 可以使一个元素向其父元素的左侧或右侧移动

使用 `float` 属性来设置元素的浮动
+ `none`：默认值，不浮动
+ `left`：向左浮动
+ `right`：向右浮动

## 3.1 浮动的特点

元素设置浮动后，水平布局的等式便不需要强制成立。

1. 浮动元素会脱离文档流，不再占据文档流中的位置，会改变一些特点
   1. 行内元素和块元素相同特点
   2. 不再独占一行
   3. 脱离文档流后，元素的宽度和高度由元素内容决定
2. 设置浮动以后，元素会向父元素的左侧或右侧移动
3. 浮动元素默认不会从父元素中移除
4. 浮动元素移动时，不会覆盖之前的浮动元素
5. 如果浮动元素上边是一个没有浮动的块元素，则浮动元素无法上移
6. 浮动元素不会超过**同行的浮动的兄弟元素**
7. 浮动元素不会盖住文字，蚊子会自动环绕在浮动元素的周围

## 3.2 高度塌陷
在浮动不居中，父元素的高度是由子元素决定的。如果子元素也浮动后，会脱离文档流，导致父元素高度塌陷。下面的元素会自动上移，导致页面的混乱。

**解决方案**

BFC（Block Formatting Context）块级格式化环境
可以为一个元素开启BFC，会变成一个独立的布局区域。

**特点**
1. 开启BFC的元素，元素不会被浮动元素所覆盖
2. 开启BFC的元素，子元素和父元素的外边距不会折叠。
3. 开启BFC的元素，可以包含浮动的子元素。

**开启BFC**
1. 设置元素的浮动
2. 设置为行内块元素
3. 将元素的`overflow`设置为一个非`visible`值(常用`hidden`)


## 3.2 clear
通过`clear`属性清除浮动元素对当前元素所产生的影响。
+ `left`：清除左侧浮动元素对当前元素的影响
+ `right`：清除右侧浮动元素对当前元素的影响
+ `both`：清除两侧中最大影响的那侧

**原理**
浏览器会自动为元素添加一个上外边距

**解决高度塌陷**
在父元素中新增一个块元素，对该元素添加`clear:both`，由该元素决定父元素的高度

如果想要使用css解决，可以通过`::after`添加元素
```css
.box1::after {
  content: '';
  display: block;
  clear: both;
}
```


## 3.3 ckearfix
一种自定义类，解决高度塌陷和外边距重叠问题
```css
.clearfix::before, .clearfix::after {
  content: '';
  display: table;
  clear: both;
}
```


# 4 定位
更细致的布局手段

`position`
+ `static`：默认值，没有开启定位
+ `relative`：相对定位
+ `absolute`：绝对定位
+ `fixed`：固定定位
+ `sticky`：粘滞定位

## 4.0 包含块
1. 初始包含块：`html`
2. 一般情况：包含块是离当前元素最近的祖先块元素
3. 绝对定位：包含块是离当前元素最近的**开启定位**的祖先块元素，直到`html`元素

## 4.1 相对定位
`position: relative`
1. 开启相对定位，需要设置偏移量，否则没有任何变化
  + `top`
  + `bottom`
  + `left`
  + `right`
2. 将文档流中**原位置**做为参考系
3. 相对定位会提高元素的层级，覆盖文档流
4. 不会脱离文档流
5. 不会改变元素的性质，仍是块或行内元素


## 4.2 绝对定位（常用）
`position: absolute`
1. 开启绝对定位，本元素不会发生变化，但会影响到其他元素
2. 会提高元素的层级
3. 元素会从文档流中脱离
4. 改变元素性质，都会变成快，宽度、高度由内容决定
5. 绝对定位元素是以[包含块](#40-包含块)为参考系

### 4.2.1 水平布局
不同于之前的[水平定位](#224-水平布局)，加入`left`和`right`进行计算 **包含块的宽度**
`parent width = left + margin-left + border-left + padding-left + width + padding-right + border-right + margin-right + right`

可以设置`auto`的值：`margin width left right`
1. 没有`auto`的值，那么会自动调整`right`使等式满足。
2. 如果有`auto`，会自动调整`auto`的值
3. `width left right` 默认是`auto`的
    + 如果`left right` 固定，会调整`width`
    + 如果`left right` 中某一个是`auto`，那么会调整该值，占据整一行
    + 如果`left right` 两个都是`auto`，那么会优先调整`right`

### 4.2.2 垂直布局
不同于之前的[垂直布局](#225-垂直布局)，加入`top`和`bottom`进行计算 **包含块的高度**


### 4.2.3 完全居中
```css
.class {
  /* 外边距相同 */
  margin: auto;
  /* 绝对定位控制其在包含块中的位置 */
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}
```

## 4.3 固定定位
`position: fixed`
特殊的绝对定位，永远以浏览器的**视口**为参考系，固定的元素不会随着网页的滚动而滚动
> 视口：可视窗口，滚动的窗口中可见的部分


## 4.4 粘滞定位
`position: sticky`
元素根据正常文档流进行定位，然后相对它的**最近滚动祖先** 和 **包含块** ，包括`table-related`元素，基于`top`, `right`, `bottom`, `left`的值进行偏移。

粘滞定位和相对定位特定一致，不同的是粘滞定位可以再元素到达某个位置时将其固定。

## 4.5 元素层级
`z-index`：指定属性的层级
+ 层级越高越优先显示
+ 层级一样，优先显示后来的元素
+ 父元素不会覆盖子元素


# 5 字体
## 5.1 简单设置
1. `color`：字体颜色
2. `font-size`：字体大小
   > [字体长度](#14-申明块)
    + `em`：当前元素字体的长度
    + `rem`：根元素字体的长度
3. `font-weight: normal | bold`：加粗
4. `font-style: normal | italic`：斜体


## 5.2 字体族
`font-family`
  + `serif`：衬线字体（印刷体？）
  + `sans-serif`：非衬线字体
  + `monospace`：等宽字体

**提供字体**
```css
@font-face {
  font-family: ...;
  src: ...;
}
```

## 5.3 图标字体
> [Font Awesome](https://fontawesome.com/)
>
> [阿里巴巴矢量图标库](https://www.iconfont.cn/)

`Font Awesome`
1. [下载](https://fontawesome.com/v5.15/how-to-use/on-the-web/setup/hosting-font-awesome-yourself)
2. 解压并复制`css`和`webfonts`子文件夹至项目
3. `all.josn`引入到网页
    ```html
    <link rel="iconfont" href="./css/all.css">
    ```
4. 使用图标字体
    + 类名
        ```html
        <i class="fas fa-user"></i>
        ```
    + 伪元素，在`all.json`中查找`before`或`after`中的字体编码
        ```css
        li::before {
            content: '\f5cc';
            font-family: 'Font Awesome 5 Brands';
            font-weight: 400;
        }
        ```
    + 实体：`&#x编码;`创建
      ```html
      <div class="fas">&#xf5cc;</div>
      ```


`iconfont`
1. 拷贝项目下的`@font-face`，定义使用`.iconfont`的样式，在`iconfont.css`，如果要类名使用，也需要自定义类样式
    ```css
    <style>
        @font-face {
            font-family: 'iconfont';
            src: url('./iconFont/iconfont.ttf') format('truetype');
        }

        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
    ```
2. 也可以导入`css`文件
    ```html
    <link rel="stylesheet" href="./iconFont/iconfont.css">
    ```
3. 挑选图标并获取字体编码，也可以是类名
    ```html
    <i class="iconfont">&#xe664;</i>

    <i class="iconfont icon-add-circle"></i>
    ```


## 5.4 行高
`line-height`：文字占有的实际高度，可以指定大小（px、em），也可以是`font-size`的倍数

`font-size`：字体框，字体存在的格子

字体框在行高的范围中上下居中：根据该特性将`line-height`与`height`相同，那么字体会上下居中

由于字体在一行中上下居中，那么**行距**就是`line-height - font-size`

## 5.5 简写
`font: [bold] [italic] [size[/line-height]] [family]` 设置属性

行高可以省略不写，默认2倍

## 5.6 文本对齐
### 5.6.1 水平对齐
`text-align`
+ `left`：左侧
+ `right`：右侧
+ `center`：居中
+ `justify`：两端对齐


### 5.6.2 垂直对齐
`vertical-align`
+ `baseline`：默认值，基线对齐（英文的第三条线？）
+ `top`：顶部对齐
+ `bottom`：底部对齐
+ `middle`：居中对齐

在图片对齐的时候，通常会将`vertical-align: top`

## 5.7 文本样式
`text-decoration: decoration [color] [style]`：文本修饰
+ `none`：默认，无
+ `underline`：下划线
+ `line-through`：删除线
+ `overline`：上划线

`white-space`：设置网页处理空白方式
+ `normal`：默认，正常
+ `nowrap`：不换行
+ `pre`：保留空白

`text-overflow`：文本溢出处理方式
+ `clip`：裁切
+ `ellipsis`：省略号


# 6 背景
## 6.1 背景颜色
`background-color`：背景颜色

## 6.2 背景图片
`background-iamge`：背景图片
+ 如果图片小于元素，那么会**平铺**图片
+ 如果图片大于元素，那么部分图片无法正常显示

## 6.3 背景图片重复方式
`background-repeat`：背景重复方式
+ `repeat`：默认值，沿着x轴和y轴双方向重复
+ `repeat-x`：沿着x轴方向重复
+ `repeat-y`：沿着y轴方向重复
+ `no-repeat`：不重复

## 6.4 背景图片位置
`background-position`：图片的位置，类似九宫格
+ `top left right bottom center`
  + `center-center`：正中心
+ 偏移量：`..px`

## 6.5 背景图片范围
`background-clip`：背景范围
+ `border-box`：默认值，边框内
+ `padding-box`：内边距
+ `content-box`：内容区

## 6.6 背景图片的偏移量原点
`background-origin`：背景图片的偏移量计算的原点
+ `padding-box`：默认值，从内边距处计算
+ `content-box`：内容区计算
+ `border-box`：边框处

## 6.7 背景图片大小
`background-size`：图片大小
+ 偏移量：可以是`auto`
  + `width height`：宽度 高度
  + `width [auto]`：只写一个，第二个默认是`auto`
+ `cover`：图片比例不变
+ `contain`：图片完整显示

## 6.8 背景图片视口固定
`background-attachment`：背景是否随着元素移动
+ `local`：背景相对于元素的内容固定
+ `scroll`：背景相对于元素本身固定
+ `fixed`：固定

## 6.9 CSS-Sprite
图片闪烁：因为http请求图片是分段的，只有在需求的时候才会请求。

不同状态的图片合成同一张图片（雪碧图），对于不同状态调整`background-position`，显示对应状态的那部分图片片段。

## 6.10 渐变
渐变是由`background-image: ...`来实现的，渐变背景是一张图片

### 6.10.1 线形渐变
> [linear-gradient()](https://developer.mozilla.org/en-US/docs/Web/CSS/gradient/linear-gradient())


`linear-gradient([angle, ]color[ ..px] [, color, ...])`
+ `angle`：渐变的方向
  + `to left, to right, to bottom, to top`
  + `..deg`：度数
  + `.turn`：圈
+ `colors`：参与渐变的颜色
  + 默认多种颜色平均分布
  + 可以指定纯色开始的位置

```css
.box1 {
  background-image: linear-gradient(45deg, red, yellow);
}
```

**可重复的线形渐变**
`repeating-linear-gradient`：指定纯色


### 6.10.2 径向渐变
> [radial-gradient()](https://developer.mozilla.org/en-US/docs/Web/CSS/gradient/radial-gradient())


`radial-gradient(circle at center, red 0, blue, green 100%)`：从中心向四周放射
+ `position`：渐变的中心
+ `ending-shape`：渐变的形状
  + `ellipse`：椭圆，默认值
  + `circle`：圆
+ `size`：渐变的大小，默认由元素大小决定
+ `color`：渐变颜色，可以设置纯色位置`0 - 100%`，从中心到边缘


# 7 表格

## 7.1 table
`border-spacing`：边框距离
`border-collapse`：合并边框


## 7.2 tr
利用伪类实现不同行的背景颜色
> 如果表格中没有使用`tbody`而是直接使用`tr`，那么浏览器会自动创建一个`tbody`，并将全部`tr`放入`tbody`
>
> **`tr`并不是`table`的子元素**
```css
tbody > tr:nth-child(even) {
    background-color: red;
}

tbody > tr:nth-child(odd) {
    background-color: blue;
}
```

## 7.3 td
`vertical-align`：垂直居中
`text-align`：水平居中

## 7.4 table-cell
`display: table-cell`



# 8 动画

## 8.1 过渡
过渡指定属性发生变化时的切换方式
`transition`
+ `transition-property`：指定要执行过渡的属性
  + `width | height | ... | all`
  + 可以指定多个属性值，用`all`关键字
+ `transition-duration`：过渡效果的持续时间
+ `transition-timing-function`：过渡的时序函数，过渡的执行方式
  + `ease`：默认，加速再减速
  + `linear`：匀速
  + `ease-in`：加速运动
  + `ease-out`：减速运动
  + `cubic-bezier()`：指定时序函数，[贝塞尔曲线](cubic-bezier.com)
  + `steps(n[, direction])`：分步执行
    + `n`：分`n`步完成
    + `direction`：决定函数是左连续还是右连续
  > [Easing Function](https://developer.mozilla.org/zh-CN/docs/Web/CSS/easing-function)
+ `transition-delay`：过渡效果的延迟

## 8.2 动画
动画可以自动触发动态效果。设置动画效果，必须要设置一个关键帧，关键帧设置了动画执行的每一个步骤。

### 8.2.1 常用属性
+ `animation-name`：动画名字
+ `animation-duration`：动画持续时间
+ `animation-delay`：动画延迟时间
+ `animation-iteration-count`：动画执行次数
+ `animation-direction`：动画运行的方向
  + `normal`：默认值，从`from`到`to`
  + `reverse`：从`to`到`from`
  + `alternate`：`from`到`to`到`from`
+ `animation-play-state`：动画执行状态
  + `running`
  + `pause`
+ `animation-fill-mode`：动画填充模式
  + `none`：默认值，回到原来位置
  + `forwards`：停在动画结束为止
  + `backwards`：动画延时等待时，元素会处于开始位置
  + `both`：结合`forwards`和`backwards`


```css
.box2 {
  background-color: #bfa;

  animation: test 2s;
}

@keyframes test {
  from {
    margin-left: 0;
  }

  to {
    margin-left: 100%;
  }
}
```

### 8.2.2 关键帧
可以加入`20% {}`等关键帧，令动画更自然


## 8.3 变形
`transform`：通过css改变元素的位置，不会影响页面的布局

## 8.3.1 平移
`transform: translate?()`：设置元素的平移效果，如果单位是百分比，那么是相对于自身计算的
+ `translateX()`：沿着x轴方向平移
+ `translateY()`：沿着y轴方向平移
+ `translateZ()`：沿着z轴方向平移

**XY轴平移**
可用于元素居中
```css
.box {
  background-color: orange;
  position: absolute;
  left: 50%;
  top: 50%
  transform: translateX(-50%) translateY(-50%);
}
```

**Z轴平移**
调整元素在Z轴的位置，正常情况就是调整元素和人眼之间的距离

Z轴平移属于立体效果，默认效果下网页是不支持。必须要设置网页的视距。
```css
html {
  perspective: 800px;
}
```

### 8.3.2 旋转
`transform: rotate?()`
+ `rotateX()`：按X轴旋转
+ `rotateY()`：按Y轴旋转
+ `rotateZ()`：按Z轴旋转


`backface-visibility`：是否显示元素的背面


### 8.3.3 缩放
`transform: scale?()`
+ `scaleX()`：水平方向
+ `scaleY()`：垂直方向
+ `scale()`：XY双方向
+ `scaleZ()`：Z轴缩放，不常用


### 8.3.4 变形原点
`transform-origin`
+ `center`
+ `bottom`
+ `top`


# 9 Less

> [英文官网](https://lesscss.org/)
>
> [中文官网](https://less.bootcss.com/)
>
> 使用`vscode`的`Easy LESS`插件，`less`保存后会生成`css`

Less（Leaner Style Sheets 的缩写）是一门向后兼容的 CSS 扩展语言。通过Less可以编写更少的代码实现更强大的样式。
+ Less添加了许多新特性，变量、混合、嵌套、运算、转义······
+ Less语法和css相似，上手容易。

## 9.1 变量（Variables）

```less
@width: 10px;
@height: @width + 10px;

#header {
  width: @width;
  height: @height;
}
```

```css
#header {
  width: 10px;
  height: 20px;
}
```


## 9.2 混合（Mixins）
将一组属性从一个规则集包含（或混入）到另一个规则集。原先CSS中需要新建一个`class`，然后元素引入该`class`

```less
.bordered {
  border-top: dotted 1px black;
  border-bottom: solid 2px black;
}
#menu a {
  color: #111;
  .bordered();
}

.post a {
  color: red;
  .bordered();
}
```

```css
.bordered {
  border-top: dotted 1px black;
  border-bottom: solid 2px black;
}
#menu a {
  color: #111;
  border-top: dotted 1px black;
  border-bottom: solid 2px black;
}
.post a {
  color: red;
  border-top: dotted 1px black;
  border-bottom: solid 2px black;
}
```


## 9.3 嵌套（Nesting）
Less 提供了使用嵌套（nesting）代替层叠或与层叠结合使用的能力。可以使用此方法将伪选择器（pseudo-selectors）与混合（mixins）一同使用

```less
.box1 {
    background-color: red;

    .box2 {
        background-color: orange;

        .box3 {
            background-color: yellow;
        }
    }
}
```

```css
.box1 {
  background-color: red;
}
.box1 .box2 {
  background-color: orange;
}
.box1 .box2 .box3 {
  background-color: yellow;
}
```

**伪选择器**
`&`表示当前选择器的父级
```less
.clearfix {
  display: block;
  zoom: 1;

  &:after {
    content: " ";
    display: block;
    font-size: 0;
    height: 0;
    clear: both;
    visibility: hidden;
  }
}
```


## 9.4 运算（Operations）
算术运算符 +、-、*、/ 可以对任何数字、颜色或变量进行运算。

为了与 CSS 保持兼容，calc() 并不对数学表达式进行计算，但是在嵌套函数中会计算变量和数学公式的值。


## 9.5 转义（Escaping）
转义（Escaping）允许你使用任意字符串作为属性或变量值。
```less
@min768: ~"(min-width: 768px)";
.element {
  @media @min768 {
    font-size: 1.2rem;
  }
}
```

```css
@media (min-width: 768px) {
  .element {
    font-size: 1.2rem;
  }
}
```

## 9.6 函数（Functions）
Less 内置了多种函数用于转换颜色、处理字符串、算术运算等。

利用 percentage 函数将 0.5 转换为 50%，将颜色饱和度增加 5%，以及颜色亮度降低 25% 并且色相值增加 8
```less
@base: #f04615;
@width: 0.5;

.class {
  width: percentage(@width); // returns `50%`
  color: saturate(@base, 5%);
  background-color: spin(lighten(@base, 25%), 8);
}
```

## 9.7 命名空间和访问符（Namespace）
出于组织结构或仅仅是为了提供一些封装的目的，希望对混合（mixins）进行分组。
```less
#bundle() {
  .button {
    display: block;
    border: 1px solid black;
    background-color: grey;
    &:hover {
      background-color: white;
    }
  }
  .tab { ... }
  .citation { ... }
}
```
如果我们希望把 .button 类混合到 #header a 中，我们可以这样做：
```less
#header a {
  color: orange;
  #bundle.button();  // 还可以书写为 #bundle > .button 形式
}
```
注意：如果不希望它们出现在输出的 CSS 中，例如 `#bundle .tab`，请将`()`附加到命名空间（例如 `#bundle()`）后面。


## 9.8 映射（Maps）
将混合（mixins）和规则集（rulesets）作为一组值的映射（map）使用
```less
#colors() {
  primary: blue;
  secondary: green;
}

.button {
  color: #colors[primary];
  border: 1px solid #colors[secondary];
}
```

```css
.button {
  color: blue;
  border: 1px solid green;
}
```


## 9.9 作用域（Scope）
Less 中的作用域与 CSS 中的作用域非常类似。首先在本地查找变量和混合（mixins），如果找不到，则从“父”级作用域继承。
```less
@var: red;

#page {
  @var: white;
  #header {
    color: @var; // white
  }
}
```


## 9.10 注释（Comments）
```less
// 单行注释
/* 多行注释 */
```

## 9.11 导入（Importing）
可以导入一个`.less`文件，此文件中的所有变量就可以全部使用了。

如果导入的文件是`.less`扩展名，则可以将扩展名省略掉
```less
@import "library"; // library.less
@import "typo.css";
```

# 10 Flex
CSS中一种布局手段，代替浮动来完成页面的布局。`flex`使得元素具有弹性，让元素可以跟随页面大小而改变。

1. 设置元素为弹性容器：`display`
  + `flex`
  + `inline-flex`
2. 弹性元素：弹性容器的子元素，不包含后代

## 10.1 弹性容器

### 10.1.1 排列方向
`flex-direction`：指定容器中弹性元素的排列方式
+ `row`：默认值，水平排列
+ `row-reverse`
+ `column`
+ `column-reverse`

主轴：弹性元素的排列方向
交叉轴：与主轴垂直的方向

### 10.1.2 是否换行
`flex-wrap`
+ `nowrap`：默认值，不会自动换行
+ `wrap`：沿着交叉轴换行
+ `wrap-reverse`：沿着交叉轴反方向

**方向和换行的简写**
`flex-flow: direction wrap`

### 10.1.3 分配主轴空白空间
`justify-content`
+ `flex-start`：沿着主轴起始边
+ `flex-end`：沿着主轴终止边
+ `center`：元素居中排列
+ `sapce-around`：空白分布到每个元素两侧
+ `space-between`：空白均匀分布到元素间
+ `space-evenly`：空白分不到元素的单侧


### 10.1.4 交叉轴对齐
`align-items`
+ `stretch`：默认值，每行的不同列高度相同
+ `flex-start`：元素不会拉伸，沿着交叉轴起始边对齐
+ `flex-end`：元素不会拉伸，沿着交叉轴终止边对齐
+ `center`：居中
+ `baseline`：基线对齐

### 10.1.5 分配交叉轴空白空间
`align-content`：
类似[分配主轴空白空间](#1013-分配主轴空白空间)


## 10.2 弹性元素
### 10.2.1 伸展系数
`flex-grow`
+ 父元素空间多余，子元素按比例伸展

### 10.2.2 收缩系数
`flex-shrink`
+ 父元素空间不足，子元素按比例收缩

### 10.2.3 基础长度
`flex-basis`：指定元素在主轴上的基础长度
+ `auto`：默认值，类似`width height`

### 10.2.4 flex简写
`flex: grow shrink basis`：不能改变顺序
+ `initial`：`flex: 0 1 auto`
+ `auto`：`flex: 1 1 auto`
+ `none`：`flex: 0 0 auto`

### 10.2.3 交叉轴对齐
`align-self`
+ 用于覆盖当前元素的`align-items`

# 11 响应式布局
根据不同的设备或窗口大小呈现出不同的效果，通过**媒体查询**可以为不同状态来分别设置样式
`@media 查询规则 {}`
+ 媒体类型
  + `all`：所有设备
  + `print`：打印机
  + `screen`：带屏幕的设备
  + `speech`：屏幕阅读器
+ 媒体特性
  + `width`：视口宽度
  + `min-width`：视口大于指定宽度时生效
  + `max-width`：视口小于指定宽度时生效
  + `height`：视口高度

断点：网页样式发生变化的点
+ `max-width: 768px`：超小屏幕
+ `min-width: 768px`：小屏幕
+ `min-width: 992px`：中型屏幕
+ `min-width: 1200px`：大屏幕