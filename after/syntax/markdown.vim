" markdownWikiLink is a new region
syn region markdownWikiLink matchgroup=markdownLinkDelimiter start="\[\[" end="\]\]" contains=markdownUrl keepend oneline concealends
" markdownLinkText is copied from runtime files with 'concealends' appended
syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends
" markdownLink is copied from runtime files with 'conceal' appended
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal


syn region markdownHeading1 start="^# " end="$" contains=@Spell,markdownInline skipwhite concealends
syn region markdownHeading2 start="^## " end="$" contains=@Spell,markdownInline skipwhite concealends
syn region markdownHeading3 start="^### " end="$" contains=@Spell,markdownInline,@markup.heading.3.markdown skipwhite concealends
syn region markdownHeading4 start="^#### " end="$" contains=@Spell,markdownInline skipwhite concealends
syn region markdownHeading5 start="^##### " end="$" contains=@Spell,markdownInline skipwhite concealends
syn region markdownHeading6 start="^###### " end="$" contains=@Spell,markdownInline skipwhite concealends
