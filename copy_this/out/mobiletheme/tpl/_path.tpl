
[{strip}]
[{ oxmultilang ident="INC_HEADER_YOUAREHERE" }] / [{ $location }]
[{foreach from=$tree_path item=oTreeItem }]
    [{ $_path_separator }]
    [{assign var="_path_link" value=$oTreeItem->getLink() }]
    [{ if $_path_link }]<a href="[{ $_path_link }]">[{/if}][{ $oTreeItem->oxcategories__oxtitle->value }][{ if $_path_link }]</a>[{/if}]
    [{assign var="_path_separator" value=" / " }]
[{/foreach}]

[{/strip}]
