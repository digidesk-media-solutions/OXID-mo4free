[{if count($Errorlist)>0 }]
    <div class="box error errorbox[{if $errdisplay == 'inbox'}] inbox[{/if}]">
        [{foreach from=$Errorlist item=oEr key=key }]
            <p><strong>[{ $oEr->getOxMessage()}]</strong></p>
        [{/foreach}]
    </div>
[{/if}]
