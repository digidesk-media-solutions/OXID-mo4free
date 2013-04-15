

[{if $name}]
	[{assign var="textboxname" value=$name}]
[{else}]
	[{assign var="textboxname" value="am"}]
[{/if}]


<input type="text"  value="[{if $amount}][{$amount}][{else}]1[{/if}]" name="[{$textboxname}]" size="2"  maxlength="2" />
<input type="submit" class="refresh" value="" name="update"/>
