{include file="$template/pageheader.tpl" title=$LANG.domainregisterns desc=$domain}

<script language="javascript" type="text/javascript">
	function confirmDelete(){literal}{{/literal}return confirm("{$LANG.rcdom_childnsdeletewarn}");{literal}}{/literal}
</script>

{if $modifydnshosterror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$modifydnshosterror}
    </ul>
</div>
{/if}

{if $modifydnshostsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$modifydnshostsuccess}
    </ul>
</div>
{/if}

{if $modifydnsiperror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$modifydnsiperror}
    </ul>
</div>
{/if}

{if $modifydnsipsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$modifydnsipsuccess}
    </ul>
</div>
{/if}

{if $deletednshosterror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$deletednshosterror}
    </ul>
</div>
{/if}

{if $deletednshostsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$deletednshostsuccess}
    </ul>
</div>
{/if}

{if $addchildnserror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$addchildnserror}
    </ul>
</div>
{/if}

{if $addchildnssuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$addchildnssuccess}
    </ul>
</div>
{/if}

<p>{$LANG.domainregisternsexplanation}</p>

<form method="post" action="{$smarty.server.PHP_SELF}?action=childns">
	<input type="hidden" name="addregchildns" value="true"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter"  colspan="2">
					<h3>{$LANG.rcdom_newregisterns}</h3>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>&nbsp;{$LANG.rcdom_dnsnametitle}:</td>
				<td><input name="cnsname" type="text" value="{$smarty.post.cnsname}" size="10"/>&nbsp;<strong>.{$domain}</strong></td>
			</tr>
			<tr>
				<td>&nbsp;{$LANG.rcdom_dnsiptitle}:</td>
				<td><input name="cnsip" type="text" value="{$smarty.post.cnsip}" size="15"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="{$LANG.rcdom_regcnsbutton}" class="btn btn-success"/></td>
			</tr>
		</tbody>
	</table>
</form>

<br/>

{if !empty($childnsarray.dns0.0)}

<table class="table table-striped table-framed">
	<thead>
		<tr>
			<th class="textcenter"  colspan="2"><h3>{$LANG.rcdom_registeredchildnstitle}</h3></th>
		</tr>
	</thead>
	{foreach key=dnskey item=dnsname from=$childnsarray}
	<tbody>
		<tr>
			<td width="50%" valign="top">
				<strong>{$LANG.rcdom_changenshostnametitle}</strong>
				<p>{$LANG.rcdom_changenshostnamedesc}</p>
				<form method="post" action="{$smarty.server.PHP_SELF}?action=childns">
					<input type="hidden" name="modifydnshost" value="true"/>
					<input type="hidden" name="oldcns" value="{$dnsname.0}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="newcns" type="text" class="textinput" value="{$dnsname.0}" size="25"/>
					<input name="submit" type="submit" class="btn btn-success" value="{$LANG.rcdom_modcnsbutton}"/>
				</form>
			</td>
			<td width="50%" valign="top">
				{foreach key=ipkey item=dnsip from=$dnsname.1}
				<strong>{$LANG.rcdom_changenshostiptitle}</strong>
				<p>{$LANG.rcdom_changenshostipdesc}</p>
				<form method="post" action="{$smarty.server.PHP_SELF}?action=childns">
					<input type="hidden" name="modifydnsip" value="true"/>
					<input type="hidden" name="currentcns" value="{$dnsname.0}"/>
					<input type="hidden" name="oldip" value="{$dnsip}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input class="textinput" name="newip" type="text" value="{$dnsip}" size="15"/>
					<input class="btn btn-success" type="submit" value="{$LANG.rcdom_modcnsipbutton}"/>
				</form>
				<br />
				<strong>{$LANG.rcdom_deletednsiptitle}</strong>
				<p>{$LANG.rcdom_deletednsipdesc}</p>
				<form method="post" action="{$smarty.server.PHP_SELF}?action=childns">
					<input type="hidden" name="delregchildns" value="true"/>
					<input type="hidden" name="currentcns" value="{$dnsname.0}"/>
					<input type="hidden" name="currentip" value="{$dnsip}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<p align="left"><input class="btn btn-danger" type="submit" value="{$LANG.rcdom_delcnsbutton}" onclick="return confirmDelete();" /></p>
				</form>
				<br /><br />
				{/foreach}
			</td>
		</tr>
	</tbody>
	{/foreach}
</table>

{/if}

<form method="post" action="clientarea.php?action=domaindetails">
	<input type="hidden" name="id" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}">
	<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
</form>
