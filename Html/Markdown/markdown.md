# HEAD
    two different syntax is allowed
* atx style
# first class head
## second class head
...
###### sixth class head

* Setext style

A First Level Header
====================

A Second Level Header
---------------------

# Quotation
> quotation: quote some words here
>
> This is the second paragraph in the blockquote
> ## This is an H2 in a blockquote
>
> > quotation nesting

# Emphasis
*emphasized*	**strong emphasis**
_another way to emphasized_	__this is also strong emphasis__ ___italic and bold___
**Bold** and *italic* ***both*** ~~delete line~~ 
==highlight text==  ~subscript~ ^Superscript^

If you surround an * or _ with spaces, it'll be treated as a literal asterisk
or underscore.

# seperate line (rule)
use at least three * , -, or _ to produce a seperatation line, no other chars is allowed within the 
seperatation line, except space
* * * 
-- -
_ __

# Code Section
To produce a code block in Markdown, simply indent every line of the block
by at least 4 spaces or 1 tab. One level of indentation will be removed
when converted to HTML. Within a code block, ampersands (&) and angle
brackets ('<' and '>') are automatically converted to HTML entries.
`code inline`
    code section 
    four space or a tab 
    <blink>	==> <code>&lt;blink&gt;</code>
    &mdash	==> <code>&amp;mdash</code>

`` to include backtick ` in code, use multiple backtick  ``
`` `add space after begining and before end to start or end code with ` ``
## Code highlight
```python
@requires_authorization
class SomeClass:
    pass

if __name__ == '__main__'
    # A comment
    print 'hello world'
```

# Link, Reference
Inline:
[a text style hypertext](www.google.com)
This is an [example link](http://google.com/ "With an optional Title").

Reference-style labels (titles are optional)
An [example][id].
reference link [Google][1],[Yahoo][a] the reference name can be numeric-alphabetic, case-insensitive 
Implicit reference link [Google][], [Yahoo][]

The point of reference-style links is not that they're easier to write, 
the point is that your source document is vastly more readable.

[id]: google.com
[1]: http://google.com/ "Google"
[A]: http://search.yahoo.com/ "Yahoo Search"
[Google]: http://google.com 'Google'
[Yahoo]:  http://search.yahoo.com (Yahoo Search)

## automate link
<http://google.com>

# List
* unordered list
    1. nested item1
    2. nested item2
    3. nested item3
		* nested depth: 2
* another item

- unordered list item 1
- item 2

+ unordered list item 1
+ item 2
+ an list item includes more than one paragraph

    each paragraph under this list item must indent 4 space or 1 tab.


1. ordered list
    You can use any numbers in your ordered lists, but you still need
    to start the list with the number 1.
2. second item
	* nested item
8. the number index doesn't matters
3. this is fourth item

You may trigger an ordered list by accident by typing something as:
>   1982\. what a great season

1982. what a great season

To avoid it, you should backslash-escape the period.


## Images
Inline:
![add a graph here](/home/weibin/Pictures/USTC_logo/USTC_1.jpg "Title")(google.com)

Reference-style:
![alt text][id]

[id]:	/path/to/img.jpg "Optional Title"

# Plots
## Flowchart
```flow
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```

## Sequence Diagram
```seq
Alice->Bob: Hello Bob, how are you ?
Note right of Bob: Bob thinks
Bob->Alice: I am good thanks!
```

## Gantt
```gantt
title 项目开发流程
section 项目确定
    需求分析	:a1, 2016-06-22, 3d
    可行性报告	:after a1, 5d
    概念验证	: 5d
section 项目实施
    概要设计	:2016-07-05, 5d
    详细设计    :2016-07-08, 10d
    编码	:2016-07-15, 10d
    测试	:2016-07-22, 5d
section 发布验收
    发布    : 2d
    验收    : 3d
```
## Tables
|Item	| price	| count |
| ----- | ----: | :---: |
|computer|  $1600 | 5	|
|phone	|   $12   | 12 |
|pipeline|  $1	   | 234|

# LaTeX
$$E=mc^2$$

# backslash
to insert chars with special meaning, use backslash before them. The following chars are supported:
\
`
*
_
{}
[]
()
#
+
-
.
!

# Todo list
- [ ] export to PDF
- [x] new to do list function
- [x] fix LaTex formula problem
- [x] new LaTex formula number function
