StackEdit
=========

StackEdit是一个开放源码免费使用的 MarkDown 编辑器, 基于 [PageDown](http://www.oschina.net/p/pagedown)，使用了 Stack Overflow 和其他 Stack Exchange 网站的 MarkDown 库，stackoverflow出品。

展示页面: https://stackedit.io/.

# 一、介绍

## 简介

![](https://stackedit.io/static/landing/logo.svg)

这款在线markdown编辑器，是一款很赞的应用。如果你是markdown的用户，那么你要试一下这款应用；如果你是chrome用户，那么你更要安装这款应用。我是把它作为chrome的一个插件应用来使用的。下面来看一下这款应用的特点及使用技巧。

## 功能

- 管理多个 MarkDown 文档，可在线或离线编辑
- 通过模板导出 MarkDown 或 HTML 格式文件
- 云同步 MarkDown 文档
- 支持 Google Drive,  Dropbox 和本地硬盘驱动器等备份
- Post MarkDown 文档到 Blogger 、Blogspot、WordPress和Tumblr
- 发布 MarkDown 文档在GitHub，GIST，Google Drive，Dropbox或任何SSH服务器
- 分享一个及时渲染的 MarkDown 文档链接
- 文档信息统计显示
- 转换HTML到 MarkDown
- 以GIst发布后支持分享（可以在线使用[StackEdit](http://benweet.github.io/stackedit/)阅读）

## 支持

- 实时编辑、HTML预览并自动滚动定位到编辑处
- Markdown Extra 支持 Prettify/Highlight.js 的语法高亮
- LaTeX 数学表达式使用MathJax
- 所见即所得的控制按钮
- 可配置的布局
- 支持多个主题
- A la carte extensions
- 离线编辑
- Google Drive和Dropbox在线同步
- 一键发布支持 Blogger，Dropbox，GIST，GitHub，Google Drive，SSH server，Tumblr，WordPress

# 二、使用技巧

## 安装

作为chrome应用，就需要有这个浏览器。然后编辑右上角菜单->工具->扩展程序->获取更多扩展程序->输入StackEdit搜索安装即可。

或者可以直接访问网站：https://stackedit.io/

## 备份及教程

因为是在线编辑器，没有实时保存文件，可能会遇到各种状况导致文档缺失。所以就需要备份，这边我推荐用“Export to Google Drive”做备份，也就是谷歌硬盘。文档的数据，使用localstorage存储的，所以切忌在清除浏览器应用数据之前要备份编写的文档，不然会全部不见。

1. 首先去[谷歌硬盘](https://drive.google.com/)新建个分类目录，起名如markdown，用于存放在StackEdit编写的备份文档。如果不新建文件夹将会保存在根目录。

2. 打开要备份的文档，点击左上角导出到“ Google Drive”选项。

3. 点击在Folder ID (optional)选项的最右边图标，选择文件夹来存放备份的文件。

4. 点击OK后即可备份。这时候在每次更新文档时，CTRL+S实现备份，都会自动备份至谷歌硬盘

5.  如果想取消同步，选择Synchronization，删除对应文件夹即可。

注意：您可以移动或重命名文件之后谷歌驱动器内。实时协作文档无法打开外StackEdit。实时协作文档不能有多个同步的位置。

## MD语法教程

刚安装应用的时候，会有welcome document文档，里面就是介绍了这个语法，如果突然不记得怎么写了。可以通过这个方法找到welcome document：左上角菜单->settings->Utils->welcome document。或者简易版教程在右上角的问号图标那Markdown Syntax。

## 其他技巧

如果觉得该编辑器有什么需要改进的地方，欢迎去github上的项目提出，我之前提出的一些体验上的操作，包括无序列表后回车还是无序列表，双次回车后取消的建议已实现。他们还是很热情的，一群热爱开发的外国盆友~

GitHub project：https://github.com/benweet/stackedit/

提建议：https://github.com/benweet/stackedit/issues

其他功能

比如文章可发布到wordpress等功能，可以自行研究下。现在也支持把HTML转化为MD文档，双向转换很方便。其他功能敬请研究发现。
