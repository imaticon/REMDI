{include file="$template/pageheader.tpl" title=$LANG.rcdom_clientareachangedomaincontact desc=$domain}

{if $is_v6 eq "true"}
	<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
{else}
	<script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
{/if}

<script language="javascript" type="text/javascript">
	function confirmDelete(){literal}{{/literal}return confirm("{$LANG.rcdom_contactdeletewarn}");{literal}}{/literal}
</script>

<div id="tabs">
    <ul class="nav nav-tabs">
		<li class="active" id="tab1nav"><a href="#tab1">{$LANG.rcdom_contactinfomodtitle}</a></li>
       	<li id="tab2nav"><a href="#tab2">{$LANG.rcdom_contactinfochangetitle}</a></li>
		<li id="tab3nav"><a href="#tab3">{$LANG.rcdom_contactinfodeltitle}</a></li>
		<li id="tab4nav"><a href="#tab4">{$LANG.rcdom_contactinfocreatetitle}</a></li>
    </ul>
</div>

<div data-toggle="tab" id="tab1" class="tab-content active">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_contactinfomodtitle}</h2>
					<p>{$LANG.rcdom_contactinfomoddesc}</p>
					<p>{$LANG.rcdom_contactinfomoddescnote}</p>
					<br />
					<form method="post" action="domainmanagement.php?action=domaincontacts">
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
					</form>					
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
			{if $canmod neq "false"}
				<form method="post" action="domainmanagement.php?action=moddomaincontacts#tab1">
					<table class="table table-striped table-framed">
						<thead>
							<tr>
								<th class="textcenter" colspan="2">
									<h3>{$LANG.rcdom_contactinfomodtitle}</h3>
								</th>
							</tr>
						</thead>
						<tbody>	
							<tr>
								<td><strong>{$LANG.rcdom_domaincontactinfo}&nbsp;</strong></td>
								<td>&nbsp;
									<select name="contactId" id="contactId">
									{foreach from=$contacts key=value item=id}
										<option value="{$id.contactid}" {if $smarty.request.contactId eq $id.contactid} selected="selected" style="background-color:#DFF0D8;"{/if}>
										{foreach from=$id key=key item=item}
											{$item}
										{/foreach}
										</option>
									{/foreach}
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="hidden" name="productkey" value="{$contactproductkey}"/>
									<input type="hidden" name="irtprule" value="{$irtprule}"/>									
									<input type="hidden" name="domainid" value="{$domainid}"/>
									<input type="hidden" name="domain" value="{$domain}"/>
									<p align="center"><input class="btn btn-info" type="submit" value="{$LANG.rcdom_contactinfomodbutton}"/></p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			{else}
				<div class="alert alert-warn">
					<ul>
						{$LANG.rcdom_nocontactmod}
					</ul>
				</div>
			{/if}
			</div>
		</div>
	</div>
</div>

<div data-toggle="tab" id="tab2" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_contactinfochangetitle}</h2>
					<p>{$LANG.rcdom_contactinfochangedesc}</p>
					<br />
					<form method="post" action="domainmanagement.php?action=domaincontacts">
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
					</form>	
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
			{if $canchange neq "false"}
				{if $contactseterror}
				<br />
				<div class="alert alert-error">
					<p class="bold">{$LANG.clientareaerrors}</p>
					<ul>
						{$contactseterror}
					</ul>
				</div>
				{/if}
				
				{if $contactsetsuccess}
				<br />
				<div class="alert alert-success">
					<p class="bold">{$LANG.moduleactionsuccess}</p>
					<ul>
						{$contactsetsuccess}
					</ul>
				</div>
				{/if}

				<form method="post" action="domainmanagement.php?action=changedomaincontacts#tab2">
					<table class="table table-striped table-framed">
						<thead>
							<tr>
								<th class="textcenter" colspan="2">
									<h3>{$LANG.rcdom_contactinfochangetitle}</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><strong>{$LANG.rcdom_regc}</strong><br />(reg-c)</td>
								<td>&nbsp;
									<select name="registrantContactId" id="registrantContactId">
										{foreach from=$contacts key=value item=id}
											<option value="{$id.contactid}" {if $smarty.request.regcontactid eq $id.contactid || $smarty.request.registrantContactId eq $id.contactid || $regcContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>

											{foreach from=$id key=key item=item}
												{$item}
											{/foreach}
											</option>
										{/foreach}
									</select>
								</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_adminc}</strong><br />(admin-c)</td>
								<td>&nbsp;
									<select name="adminContactId" id="adminContactId">
										{foreach from=$contacts key=value item=id}
											<option value="{$id.contactid}" {if $smarty.request.admincontactid eq $id.contactid || $smarty.request.adminContactId eq $id.contactid || $admincContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
											{foreach from=$id key=key item=item}
												{$item}
											{/foreach}
											</option>
										{/foreach}
									</select>
								</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_techc}</strong><br />(tech-c)</td>
								<td>&nbsp;
									<select name="techContactId" id="techContactId">
										{foreach from=$contacts key=value item=id}
											<option value="{$id.contactid}" {if $smarty.request.techcontactid eq $id.contactid || $smarty.request.techContactId eq $id.contactid || $techcContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
											{foreach from=$id key=key item=item}
												{$item}
											{/foreach}
											</option>
										{/foreach}
									</select>
								</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_billc}</strong><br />(bill-c)</td>
								<td>&nbsp;
									<select name="billingContactId" id="billingContactId">
										{foreach from=$contacts key=value item=id}
											<option value="{$id.contactid}" {if $smarty.request.billcontactid eq $id.contactid || $smarty.request.billingContactId eq $id.contactid || $billcContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
											{foreach from=$id key=key item=item}
												{$item}
											{/foreach}
											</option>
										{/foreach}
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p>
										<input name="da" type="radio" value="true" checked /> {$LANG.rcdom_datitle1}
										<br />
										<small>
											{$LANG.rcdom_dadesc1}
										</small>
									</p>
									<p>
										<input name="da" type="radio" value="false" {if $da_value eq "false"}checked{/if} /> {$LANG.rcdom_datitle2}
										<br />
										<small>
											{$LANG.rcdom_dadesc2}
										</small>
									</p>
								</td>
							</tr>					
							<tr>
								<td colspan="2" align="center">
									<input type="hidden" name="request" value="dochange"/>
									<input type="hidden" name="domain" value="{$domain}"/>
									<input type="hidden" name="domainid" value="{$domainid}"/>
									<input type="hidden" name="productkey" value="{$contactproductkey}"/>
									<input type="hidden" name="irtprule" value="{$irtprule}"/>
									<input type="hidden" name="contactId" value="{$smarty.request.contactId}"/>
									<p align="center"><input class="btn btn-success" type="submit" value="{$LANG.clientareasavechanges}"/></p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			{else}
				<div class="alert alert-warn">
					<ul>
						{$LANG.rcdom_nocontactchange}
					</ul>
				</div>
			{/if}
			</div>
		</div>
	</div>
</div>

<div data-toggle="tab" id="tab3" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_contactinfodeltitle}</h2>
					<p>{$LANG.rcdom_contactinfodeldesc}</p>				
					<p>{$LANG.rcdom_contactinfodelnote}</p>
					<br />
					<form method="post" action="domainmanagement.php?action=domaincontacts">
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
					</form>
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
			{if $candelete neq "false"}
				{if $contactdeleteerror}
				<br />
				<div class="alert alert-error">
					<p class="bold">{$LANG.clientareaerrors}</p>
					<ul>
						{$contactdeleteerror}
					</ul>
				</div>
				{/if}
				
				{if $contactdeletesuccess}
				<br />
				<div class="alert alert-success">
					<p class="bold">{$LANG.moduleactionsuccess}</p>
					<ul>
						{$contactdeletesuccess}
					</ul>
				</div>
				{/if}

				<form method="post" action="domainmanagement.php?action=changedomaincontacts#tab3">
					<table class="table table-striped table-framed">
						<thead>
							<tr>
								<th class="textcenter" colspan="2">
									<h3>{$LANG.rcdom_contactinfodeltitle}</h3>
								</th>
							</tr>
						</thead>
						<tbody>	
							<tr>
								<td><strong>{$LANG.rcdom_domaincontactinfo}&nbsp;</strong></td>
								<td>&nbsp;
									<select name="contactId" id="contactId">
									{foreach from=$contacts key=value item=id}
										<option value="{$id.contactid}" {if $smarty.request.contactId eq $id.contactid} selected="selected" style="background-color:#DFF0D8;"{/if}>
										{foreach from=$id key=key item=item}
											{$item}
										{/foreach}
										</option>
									{/foreach}
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="hidden" name="request" value="dodelete"/>
									<input type="hidden" name="productkey" value="{$contactproductkey}"/>
									<input type="hidden" name="irtprule" value="{$irtprule}"/>
									<input type="hidden" name="domainid" value="{$domainid}"/>
									<input type="hidden" name="domain" value="{$domain}"/>
									<p align="center"><input class="btn btn-danger" type="submit" value="{$LANG.rcdom_contactinfodelbutton}" onclick="return confirmDelete();"/>	</p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			{else}
				<div class="alert alert-warn">
					<ul>
						{$LANG.rcdom_nocontactdel}
					</ul>
				</div>
			{/if}
			</div>
		</div>
	</div>
</div>

<div data-toggle="tab" id="tab4" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_contactinfocreatetitle}</h2>
					<p>{$LANG.rcdom_contactinfocreatedesc}</p>				
					<p>{$LANG.rcdom_contactinfomodnote}</p>
					<br />
					<form method="post" action="domainmanagement.php?action=domaincontacts">
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
					</form>					
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
			{if $cancreate neq "false"}
				{if $contactcreateerror}
				<br />
				<div class="alert alert-error">
					<p class="bold">{$LANG.clientareaerrors}</p>
					<ul>
						{$contactcreateerror}
					</ul>
				</div>
				{/if}
				
				{if $contactcreatesuccess}
				<br />
				<div class="alert alert-success">
					<p class="bold">{$LANG.moduleactionsuccess}</p>
					<ul>
						{$contactcreatesuccess}
					</ul>
				</div>
				{/if}			

				<form method="post" action="domainmanagement.php?action=changedomaincontacts#tab4">
					<table class="table table-striped table-framed">
						<thead>
							<tr>
								<th class="textcenter" colspan="2">
									<h3>{$LANG.rcdom_contactinfocreatetitle}</h3>
								</th>
							</tr>
						</thead>
						<tbody>	
							<tr>
								<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}&nbsp;</strong></td>
								<td>&nbsp;<input name="name" type="text" id="name" value="{$smarty.post.name}" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareacompanyname}&nbsp;</strong></td>
								<td>&nbsp;<input name="company" type="text" value="{$smarty.post.company}" id="company" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.loginemail}&nbsp;</strong></td>
								<td>&nbsp;<input name="emailAddr" type="text" value="{$smarty.post.emailAddr}" id="emailAddr" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareaaddress1}&nbsp;</strong></td>
								<td>&nbsp;<input name="address1" type="text" id="address1" value="{$smarty.post.address1}" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareaaddress2}&nbsp;</strong></td>
								<td>&nbsp;<input name="address2" type="text" value="{$smarty.post.address2}" id="address2" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_clientareaaddress3}&nbsp;</strong></td>
								<td>&nbsp;<input name="address3" type="text" value="{$smarty.post.address3}" id="address3" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareapostcode}&nbsp;</strong></td>
								<td>&nbsp;<input name="zip" type="text" value="{$smarty.post.zip}" id="zip" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareacity}&nbsp;</strong></td>
								<td>&nbsp;<input name="city" type="text" value="{$smarty.post.city}" id="city" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareastate}&nbsp;</strong></td>
								<td>&nbsp;<input name="state" type="text" value="{$clientstate}" id="state" size="30" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareacountry}&nbsp;</strong></td>
								<td>&nbsp;{$dropdowncountries}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}&nbsp;</strong></td>
								<td>&nbsp;<input name="telNoCc" type="text" value="{$smarty.post.telNoCc}" id="telNoCc" size="3" maxlength="3" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.clientareaphonenumber}&nbsp;</strong></td>
								<td>&nbsp;<input name="telNo" type="text" value="{$smarty.post.telNo}" id="telNo" size="10" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}&nbsp;</strong></td>
								<td>&nbsp;<input name="faxNoCc" type="text" value="{$smarty.post.faxNoCc}" id="faxNoCc" size="3" maxlength="3" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_clientareafaxnumber}&nbsp;</strong></td>
								<td>&nbsp;<input name="faxNo" type="text" value="{$smarty.post.faxNo}" id="faxNo" size="10" /></td>
							</tr>
							{if $contactproductkey eq "dotnl"}
							<tr>
								<td><strong>{$LANG.rcdom_nltldlegalform}&nbsp;</strong></td>
								<td>&nbsp;{$dotnldropdown}</td>
							</tr>
							{/if}
							{if $contactproductkey eq "dotpro"}
							<tr>
								<td><strong>{$LANG.rcdom_profession}&nbsp;</strong></td>
								<td>&nbsp;{$dotprodropdown}</td>
							</tr>
							{/if}
							{if $contactproductkey eq "domus"}
							<tr>
								<td><strong>{$LANG.rcdom_ustldnexuscat}&nbsp;</strong></td>
								<td>&nbsp;{$domusdropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_ustldapppurpose}&nbsp;</strong></td>
								<td>&nbsp;{$uspurposedropdown}</td>
							</tr>
							{/if}
							{if $contactproductkey eq "dotca"}
							<tr>
								<td><strong>{$LANG.rcdom_catldlegaltype}&nbsp;</strong></td>
								<td>&nbsp;{$calegaltypedropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_catldciraagreement}&nbsp;</strong></td>
								<td>
								<div style="border:#CCCCCC solid 1px;width:480px;height:200px;overflow:scroll;">{$ciragreement}</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="hidden" name="attrvalue2" value="{$ciraver}" />
									<input name="attrvalue3" type="checkbox" value="y" id="attrvalue3" />
								</td>
								<td>{$LANG.rcdom_catldciraagreementyn}</td>
							</tr>
							{/if}
							{if $contactproductkey eq "dotes"}
							<tr>
								<td><strong>{$LANG.rcdom_estldlegalentitytype}&nbsp;</strong></td>
								<td>&nbsp;{$eslegaltypedropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_estldidformtype}&nbsp;</strong></td>
								<td>&nbsp;{$estldidformtypedropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_estldidformnum}&nbsp;</strong></td>
								<td>&nbsp;<input name="attrvalue3" type="text" value="{$smarty.post.attrvalue3}" id="attrvalue3" size="10" /></td>
							</tr>
							{/if}
							{if $contactproductkey eq "dotasia"}
							<tr>
								<td><strong>{$LANG.rcdom_asialegalcountry}&nbsp;</strong></td>
								<td>&nbsp;{$asialocalitydropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_asialegalentitytype}&nbsp;</strong></td>
								<td>&nbsp;{$asialegaltypedropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_asiaidentform}&nbsp;</strong></td>
								<td>&nbsp;{$asiaidentformdropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_asiaidentnumber}&nbsp;</strong></td>
								<td>&nbsp;<input name="attrvalue4" type="text" value="{$smarty.post.attrvalue4}" id="attrvalue4" size="10" /></td>
							</tr>
							{/if}
							{if $contactproductkey eq "dotjobs"}
							<tr>
								<td><strong>{$LANG.rcdom_jobscompcontacttitle}&nbsp;</strong></td>
								<td>&nbsp;<input name="attrvalue1" type="text" value="{$smarty.post.attrvalue1}" id="attrvalue1" size="10" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_jobscompwebsite}&nbsp;</strong></td>
								<td>&nbsp;<input name="attrvalue2" type="text" value="{$smarty.post.attrvalue2}" id="attrvalue2" size="10" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_jobstypeclass}&nbsp;</strong></td>
								<td>&nbsp;<input name="attrvalue3" type="text" value="{$smarty.post.attrvalue3}" id="attrvalue3" size="10" /></td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_jobsadmincontact}&nbsp;</strong></td>
								<td>&nbsp;{$jobsadmindropdown}</td>
							</tr>
							<tr>
								<td><strong>{$LANG.rcdom_jobsassocmember}&nbsp;</strong></td>
								<td>&nbsp;{$jobsmemberdropdown}</td>
							</tr>
							{/if}
							<tr>
								<td colspan="2">
									<input type="hidden" name="productkey" value="{$contactproductkey}"/>
									<input type="hidden" name="irtprule" value="{$irtprule}"/>
									<input type="hidden" name="request" value="docreate"/>
									<input type="hidden" name="contacttype" value="{$contacttype}"/>
									<input type="hidden" name="domainid" value="{$domainid}"/>
									<input type="hidden" name="domain" value="{$domain}"/>
									<input type="hidden" name="contactId" value="{$smarty.request.contactId}"/>
									<p align="center"><input class="btn btn-success" type="submit" value="{$LANG.rcdom_contactinfocreatebutton}" ></p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			{else}
				<div class="alert alert-warn">
					<ul>
						{$LANG.rcdom_nocontactcreate}
					</ul>
				</div>
			{/if}
			</div>
		</div>
	</div>
</div>
