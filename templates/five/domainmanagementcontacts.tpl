{include file="$template/pageheader.tpl" title=$LANG.domaincontactinfo desc=$domain}

{if $raasuccess}
	<br />
	<div class="alert alert-success">
		<p class="bold">{$LANG.moduleactionsuccess}</p>
		<ul>
			<p>{$LANG.rcdom_raasuccess} <strong>{$regcEmailaddr}</strong></p>
		</ul>
	</div>
	<br />
{/if}

{if $raaverifystatus eq "Pending"}
	<div class="alert alert-warn">
		<p class="bold">{$LANG.rcdom_raapendingtitle}</p>
		<ul>
			<p>{$LANG.rcdom_raaverifybefore1} <strong>{$regcEmailaddr}</strong>. {$LANG.rcdom_raaverifybefore2} <strong>{$verifyenddate}</strong>{$LANG.rcdom_raaverifybefore3}</p>
			<form method="post" action="domainmanagement.php?action=domaincontacts">
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="irtprule" value="{$irtprule}"/>
				<input type="hidden" name="raa" value="resend"/>
				<p><input class="btn btn-info" type="submit" value="{$LANG.rcdom_raasendbutton}"/></p>
			</form>
		</ul>
	</div>
{/if}

<div id="tabs">
    <ul class="nav nav-tabs">
        {if $onlyregc eq "true"}
			<li class="active" id="tab1nav"><a href="#tab1">{$LANG.rcdom_regc}</a></li>
		{else}
			<li class="active" id="tab1nav"><a href="#tab1">{$LANG.rcdom_regc}</a></li>
        	<li id="tab2nav"><a href="#tab2">{$LANG.rcdom_adminc}</a></li>
			{if $notechc}
				<li id="tab3nav"><a href="#tab3">{$LANG.rcdom_techc}</a></li>
			{/if}
			{if $nobillc}
				<li id="tab4nav"><a href="#tab4">{$LANG.rcdom_billc}</a></li>
			{/if}
		{/if}
		
		{if $enableidprotection && $idprotectionaddon}
			<li id="tab5nav"><a style="color:#CC0000;" href="#tab5">{$LANG.rcdom_idwhoistitle}</a></li>
		{/if}
    </ul>
</div>

<div data-toggle="tab" id="tab1" class="tab-content active">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_regc}</h2>
					<p>{$LANG.rcdom_contactdesc}</p>
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/>
						</form>
					</div>
					{if $canmod neq "false"}
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$regcContactid}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/>
						</form>
					</div>
					{/if}
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
				<table class="table table-striped table-framed">
					<thead>
						<tr>
							<th class="textcenter" colspan="2">
								<h3>{$LANG.rcdom_regcdetails}</h3>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><strong>{$LANG.rcdom_contactidtitle}&nbsp;</strong></td>
							<td>{$regcContactid}&nbsp;</td>
					    </tr>
						<tr>
							<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}&nbsp;</strong></td>
							<td>{$regcName}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacompanyname}&nbsp;</strong></td>
							<td>{$regcCompany}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.loginemail}&nbsp;</strong></td>
							<td>{$regcEmailaddr}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress1}&nbsp;</strong></td>
							<td>{$regcAddress1}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress2}&nbsp;</strong></td>
							<td>{$regcAddress2}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaaddress3}&nbsp;</strong></td>
							<td>{$regcAddress3}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareapostcode}&nbsp;</strong></td>
							<td>{$regcZip}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacity}&nbsp;</strong></td>
							<td>{$regcCity}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareastate}&nbsp;</strong></td>
							<td>{$regcState}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacountry}&nbsp;</strong></td>
							<td>{$regcCountry}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}&nbsp;</strong></td>
							<td>{$regcTelnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaphonenumber}&nbsp;</strong></td>
							<td>{$regcTelno}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}&nbsp;</strong></td>
							<td>{$regcFaxnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumber}&nbsp;</strong></td>
							<td>{$regcFaxno}&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div data-toggle="tab" id="tab2" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_adminc}</h2>
					<p>{$LANG.rcdom_contactdesc}</p>
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/>
						</form>
					</div>
					{if $canmod neq "false"}
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$admincContactid}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/>
						</form>
					</div>
					{/if}
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
				<table class="table table-striped table-framed">
					<thead>
						<tr>
							<th class="textcenter" colspan="2">
								<h3>{$LANG.rcdom_admincdetails}</h3>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><strong>{$LANG.rcdom_contactidtitle}&nbsp;</strong></td>
							<td>{$admincContactid}&nbsp;</td>
					    </tr>
						<tr>
							<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}&nbsp;</strong></td>
							<td>{$admincName}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacompanyname}&nbsp;</strong></td>
							<td>{$admincCompany}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.loginemail}&nbsp;</strong></td>
							<td>{$admincEmailaddr}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress1}&nbsp;</strong></td>
							<td>{$admincAddress1}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress2}&nbsp;</strong></td>
							<td>{$admincAddress2}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaaddress3}&nbsp;</strong></td>
							<td>{$admincAddress3}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareapostcode}&nbsp;</strong></td>
							<td>{$admincZip}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacity}&nbsp;</strong></td>
							<td>{$admincCity}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareastate}&nbsp;</strong></td>
							<td>{$admincState}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacountry}&nbsp;</strong></td>
							<td>{$admincCountry}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}&nbsp;</strong></td>
							<td>{$admincTelnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaphonenumber}&nbsp;</strong></td>
							<td>{$admincTelno}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}&nbsp;</strong></td>
							<td>{$admincFaxnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumber}&nbsp;</strong></td>
							<td>{$admincFaxno}&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div data-toggle="tab" id="tab3" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_techc}</h2>
					<p>{$LANG.rcdom_contactdesc}</p>
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/>
						</form>
					</div>
					{if $canmod neq "false"}
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$techcContactid}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/>
						</form>
					</div>
					{/if}
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
				<table class="table table-striped table-framed">
					<thead>
						<tr>
							<th class="textcenter" colspan="2">
								<h3>{$LANG.rcdom_techcdetails}</h3>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><strong>{$LANG.rcdom_contactidtitle}&nbsp;</strong></td>
							<td>{$techcContactid}&nbsp;</td>
					    </tr>
						<tr>
							<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}&nbsp;</strong></td>
							<td>{$techcName}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacompanyname}&nbsp;</strong></td>
							<td>{$techcCompany}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.loginemail}&nbsp;</strong></td>
							<td>{$techcEmailaddr}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress1}&nbsp;</strong></td>
							<td>{$techcAddress1}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress2}&nbsp;</strong></td>
							<td>{$techcAddress2}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaaddress3}&nbsp;</strong></td>
							<td>{$techcAddress3}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareapostcode}&nbsp;</strong></td>
							<td>{$techcZip}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacity}&nbsp;</strong></td>
							<td>{$techcCity}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareastate}&nbsp;</strong></td>
							<td>{$techcState}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacountry}&nbsp;</strong></td>
							<td>{$techcCountry}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}&nbsp;</strong></td>
							<td>{$techcTelnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaphonenumber}&nbsp;</strong></td>
							<td>{$techcTelno}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}&nbsp;</strong></td>
							<td>{$techcFaxnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumber}&nbsp;</strong></td>
							<td>{$techcFaxno}&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div data-toggle="tab" id="tab4" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_billc}</h2>
					<p>{$LANG.rcdom_contactdesc}</p>
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/>
						</form>
					</div>
					{if $canmod neq "false"}
					<div style="float:right;margin-right:3px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$billcContactid}"/>
							<input class="btn btn-info" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/>
						</form>
					</div>
					{/if}
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
				<table class="table table-striped table-framed">
					<thead>
						<tr>
							<th class="textcenter" colspan="2">
								<h3>{$LANG.rcdom_billcdetails}</h3>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><strong>{$LANG.rcdom_contactidtitle}&nbsp;</strong></td>
							<td>{$billcContactid}&nbsp;</td>
					    </tr>
						<tr>
							<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}&nbsp;</strong></td>
							<td>{$billcName}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacompanyname}&nbsp;</strong></td>
							<td>{$billcCompany}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.loginemail}&nbsp;</strong></td>
							<td>{$billcEmailaddr}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress1}&nbsp;</strong></td>
							<td>{$billcAddress1}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaaddress2}&nbsp;</strong></td>
							<td>{$billcAddress2}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaaddress3}&nbsp;</strong></td>
							<td>{$billcAddress3}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareapostcode}&nbsp;</strong></td>
							<td>{$billcZip}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacity}&nbsp;</strong></td>
							<td>{$billcCity}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareastate}&nbsp;</strong></td>
							<td>{$billcState}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareacountry}&nbsp;</strong></td>
							<td>{$billcCountry}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}&nbsp;</strong></td>
							<td>{$billcTelnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.clientareaphonenumber}&nbsp;</strong></td>
							<td>{$billcTelno}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}&nbsp;</strong></td>
							<td>{$billcFaxnocc}&nbsp;</td>
						</tr>
						<tr>
							<td><strong>{$LANG.rcdom_clientareafaxnumber}&nbsp;</strong></td>
							<td>{$billcFaxno}&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

{if $enableidprotection && $idprotectionaddon}
<div data-toggle="tab" id="tab5" class="tab-content">
    <div class="row">
        <div class="col30">
            <div class="internalpadding">
                <div class="styled_title">
					<h2>{$LANG.rcdom_idwhoistitle}</h2>
					<p>{$LANG.rcdom_idprotectiondesc}</p>
				</div>
            </div>
        </div>
        <div class="col70">
            <div class="internalpadding">
				{if $idprotecterror}
				<br />
				<div class="alert alert-error">
					<p class="bold">{$LANG.clientareaerrors}</p>
					<ul>
						{$idprotecterror}
					</ul>
				</div>
				{/if}
				
				{if $idprotectsuccess}
				<br />
				<div class="alert alert-success">
					<p class="bold">{$LANG.moduleactionsuccess}</p>
					<ul>
						{$idprotectsuccess}
					</ul>
				</div>
				{/if}

				{if $isprivacyallowed neq "true"}
				<table class="table table-striped table-framed">
					<thead>
						<tr>
							<th class="textcenter">
								<h3>{$LANG.rcdom_idwhoistitle}</h3>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center"><strong>{$LANG.rcdom_idprotectionnotavailable}</strong></td>
						</tr>
					</tbody>
				</table>
				{else}
				<form method="post" action="domainmanagement.php?action=domaincontacts#tab5">
					<input type="hidden" name="request" value="doidprotect"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="irtprule" value="{$irtprule}"/>						
					<table class="table table-striped table-framed">
						<thead>
							<tr>
								<th class="textcenter" colspan="2">
									<h3>
										{$LANG.rcdom_idwhoistitle}
										{$LANG.rcdom_idprotectioncurrentstatus}:&nbsp;
										{if $isprivacyon eq "true"}
											<span style="color:#006633;">{$LANG.rcdom_idprotectionenabled}&nbsp;</span>
										{else}
											<span style="color:#CC0000;">{$LANG.rcdom_idprotectiondisabled}&nbsp;</span>
										{/if}
									</h3>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="vertical-align: middle;">
									<input name="privacystatus" type="checkbox" {if $isprivacyon eq "true"} checked="checked"{/if}/>&nbsp;
								</td>
								<td>
									{$LANG.rcdom_idprotectioncheck}<br />{$LANG.rcdom_idprotectionuncheck}
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<p align="center"><input type="submit" class="btn btn-success" value="{$LANG.clientareasavechanges}"/></p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				{/if}
			</div>
		</div>
	</div>
</div>
{/if}

<br />

<form method="post" action="clientarea.php?action=domaindetails">
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="id" value="{$domainid}"/>
	<p align="center"><input class="btn" type="submit" value="{$LANG.clientareabacklink}"/></p>
</form>
