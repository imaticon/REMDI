{include file="$template/pageheader.tpl" title=$LANG.rcdom_modifydomaincontact desc=$domain}

{if $contactmoderror}
	<br />
	<div class="alert alert-error">
		<p class="bold">{$LANG.clientareaerrors}</p>
		<ul>
			{$contactmoderror}
		</ul>
	</div>
{/if}

{if $contactmodsuccess}
	<br />
	<div class="alert alert-success">
		<p class="bold">{$LANG.moduleactionsuccess}</p>
		<ul>
			{$contactmodsuccess}
		</ul>
	</div>
{/if}

<p>{$LANG.rcdom_contactinfomoddesc2}</p>

<p>{$LANG.rcdom_contactinfomodnote}</p>

<form method="post" action="domainmanagement.php?action=moddomaincontacts">
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="2">
					<h3>{$LANG.rcdom_modifydomaincontactinfo}</h3>
			 		{if $irtprule eq "true"}
						<div class="alert alert-warn">
							<p class="bold">{$LANG.rcdom_contactinfomoddesc3}</p>
						</div>
					{/if}
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><strong>{$LANG.rcdom_contactidtitle}</strong></td>
				<td>{$contactId}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}&nbsp;</strong></td>
				<td>
					{if $namemod eq "false"}
						&nbsp;{$contactName}<input name="name" value="{$contactName}" type="hidden"/>
					{else}
						&nbsp;<input name="name" value="{$contactName}" type="text" id="name" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacompanyname}&nbsp;</strong></td>
				<td>
					{if $companymod eq "false"}
						&nbsp;{$contactCompany}<input name="company" value="{$contactCompany}" type="hidden"/>
					{else}
						&nbsp;<input name="company" value="{$contactCompany}" type="text" id="company" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.loginemail}&nbsp;</strong></td>
				<td>
					{if $emailmod eq "false"}
						{$contactEmailaddr}<input name="emailAddr" value="{$contactEmailaddr}" type="hidden"/>
					{else}
						&nbsp;<input name="emailAddr" value="{$contactEmailaddr}" type="text" id="company" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress1}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactAddress1}<input name="address1" value="{$contactAddress1}" type="hidden"/>
					{else}
						&nbsp;<input name="address1" value="{$contactAddress1}" type="text" id="address1" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress2}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactAddress2}<input name="address2" value="{$contactAddress2}" type="hidden"/>
					{else}
						&nbsp;<input name="address2" value="{$contactAddress2}" type="text" id="address2" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaaddress3}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactAddress3}<input name="address3" value="{$contactAddress3}" type="hidden"/>
					{else}
						&nbsp;<input name="address3" value="{$contactAddress3}" type="text" id="address3" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareapostcode}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactZip}<input name="zip" value="{$contactZip}" type="hidden"/>
					{else}
						&nbsp;<input name="zip" value="{$contactZip}" type="text" id="zip" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacity}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactCity}<input name="city" value="{$contactCity}" type="hidden"/>
					{else}
						&nbsp;<input name="city" value="{$contactCity}" type="text" id="city" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareastate}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactState}<input name="state" value="{$contactState}" type="hidden"/>
					{else}
						&nbsp;<input name="state" value="{$contactState}" type="text" id="state" size="30"/>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacountry}&nbsp;</strong></td>
				<td>
					{if $restricted eq "false"}
						&nbsp;{$contactCountry}<input name="country" value="{$contactCountry}" type="hidden"/>
					{else}
						&nbsp;{$dropdowncountries}
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}&nbsp;</strong></td>
				<td>&nbsp;<input name="telNoCc" type="text" id="telNoCc" value="{$contactTelnocc}" size="3" maxlength="3"/></td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaphonenumber}&nbsp;</strong></td>
				<td>&nbsp;<input name="telNo" value="{$contactTelno}" type="text" id="telNo" size="10"/></td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}&nbsp;</strong></td>
				<td>&nbsp;<input name="faxNoCc" type="text" id="faxNoCc" value="{$contactFaxnocc}" size="3" maxlength="3"/></td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumber}&nbsp;</strong></td>
				<td>&nbsp;<input name="faxNo" value="{$contactFaxno}" type="text" id="faxNo" size="10"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="request" value="domodify">
					<input type="hidden" name="contactId" value="{$contactId}">
					<input type="hidden" name="domainid" value="{$domainid}">
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="productkey" value="{$contactproductkey}">
					<input type="hidden" name="irtprule" value="{$irtprule}">					
					<p align="center"><input class="btn btn-success" type="submit" value="{$LANG.clientareasavechanges}"></p>
				</td>
			</tr>
		</tbody>
	</table>
	<br />
</form>

<br />

<form method="post" action="domainmanagement.php?action=changedomaincontacts">
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="productkey" value="{$contactproductkey}">
	<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
</form>
