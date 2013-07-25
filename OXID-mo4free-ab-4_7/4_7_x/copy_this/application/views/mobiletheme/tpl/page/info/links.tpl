[{assign var="template_title" value="LINKS_TITLE"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=content"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink}]
<div id="content">


  [{assign var="isFirst" value=true}]

  [{foreach from=$oView->getLinksList() item=link name=linksList}]
        <div class="box" [{if $smarty.foreach.linksList.last}]class="last"[{/if}]>
        [{ $link->oxlinks__oxinsert->value|date_format:"%d.%m.%Y" }] - <a href="[{ $link->oxlinks__oxurl->value }]" class="links_link">[{ $link->oxlinks__oxurl->value }]</a><br/>
        <div>[{ $link->oxlinks__oxurldesc->value }]</div>
        </div>
  [{ /foreach }]


</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
