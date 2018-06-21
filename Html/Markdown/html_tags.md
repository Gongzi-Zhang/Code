Markdown is not an alternative of HTML, just to make writing HTML more 
easier. HTML is a publishing format while Markdown is a writing format.
Thus, Markdown's formatting syntax only addresses issures that can be 
conveyed in plain text.

For any markup that is not covered by Markdown's syntax, you simply use
HTML itself, no need to preface it or delimit it except the 
**block-level** HTML elements -- e.g. <div>, <table>, <pre>, <p>, etc. -- 
must be separated from surrounding content by blank lines, and the start 
and end tags of the block should not be indented with tabs or spaces.

For example:

-------------------------------------------------------
This is a regular paragraph

<table>
    <tr>
	<td> Foo </td>
    </tr>
</table>

This is another regular paragraph.
-------------------------------------------------------

**Span-level** HTML tags -- e.g. <span>, <cite>, or <del> -- can be used
anywhere in a Markdown paragraph, list item or header. If you want, 
you can even use HTML tags instead of Markdown formatting; e.g. if you'd
prefer to use HTML <a> or <img> tags instead of Markdown's link or image
syntax, go right ahead.

Unlike **block-level** HTML tags, Markdown syntax is precessed within
**span-level** tags.

## escape 
<   ==> &lt;	(don't forget the ending semi-colon)
&   ==> &amp;	(ampersands)
even in URLs and anchor tag *href*

e.g.

-------------------------------------------------------
http://images.google.com/images?num=30&q=larry+bird
-------------------------------------------------------

should be write as:

-------------------------------------------------------
http://images.google.com/images?num=30&amp;q=larry+bird
-------------------------------------------------------
