{*
* 2007-2011 PrestaShop 
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2011 PrestaShop SA
*  @version  Release: $Revision: 1.4 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{capture name=path}{l s='Our stores'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}
<div class="search_stores">
<ul id="left_side">
<h1>{l s='Our stores'}</h1>
 <p>{l s='Enter a location (eg.: a zip/postal code, an address, a city or a country) in order to find the nearest stores.'}</p>
</ul>
<div id="store_search_options">
{if $simplifiedStoresDiplay}
	{if $stores|@count}
	<p>{l s='Here are the details of our stores, feel free to contact us:'}</p>
	{foreach from=$stores item=store}
		<div class="store-small">
			{if $store.has_picture}<p><img src="{$img_store_dir}{$store.id_store}-medium.jpg" alt="" width="{$mediumSize.width}" height="{$mediumSize.height}" /></p>{/if}
			<p>
				<b>{$store.name|escape:'htmlall':'UTF-8'}</b><br />
				{$store.address1|escape:'htmlall':'UTF-8'}<br />
				{if $store.address2}{$store.address2|escape:'htmlall':'UTF-8'}{/if}<br />
				{$store.postcode} {$store.city|escape:'htmlall':'UTF-8'}{if $store.state}, {$store.state}{/if}<br />
				{$store.country|escape:'htmlall':'UTF-8'}<br />
				{if $store.phone}Phone: {$store.phone}{/if}
			</p>
		</div>
	{/foreach}
	{/if}
{else}
	<script type="text/javascript">
		// <![CDATA[
		var map;
		var markers = [];
		var infoWindow;
		var locationSelect;

		var defaultLat = '{$defaultLat}';
		var defaultLong = '{$defaultLong}';
		
		var translation_1 = '{l s='No store found, try to select a wider radius' js=1}';
		var translation_2 = '{l s='store found - see details:' js=1}';
		var translation_3 = '{l s='stores found - see all results:' js=1}';
		var translation_4 = '{l s='Phone:' js=1}';
		var translation_5 = '{l s='Get Directions' js=1}';
		var translation_6 = '{l s='Not found' js=1}';
		
		var hasStoreIcon = '{$hasStoreIcon}';
		var distance_unit = '{$distance_unit}';
		var img_store_dir = '{$img_store_dir}';
		var img_ps_dir = '{$img_ps_dir}';
		//]]>
	</script>

	<p>
     {l s='Your location:'} <input type="text" name="location" id="addressInput" value="{l s='Address, zip/postal code, city, state or country'}" onclick="this.value='';" />    </p>
	<p style="margin-top:5px;">
	 <label>{l s='Radius:'}</label> 
	 <select name="radius" id="radiusSelect">
	  <option value="15">15</option>
	  <option value="25">25</option>
	  <option value="50">50</option>
	  <option value="100">100</option>
	 </select> <em>{$distance_unit}</em>
	</p>
    <div class="clear"></div>
	<p>
     <input type="button" id="searchLocations" onclick="searchLocations();" value="{l s='Search'}" style="display: inline;" /> 
	 <img src="{$img_ps_dir}loader.gif" class="middle" alt="" id="stores_loader" />
    </p>
   <div><select id="locationSelect"></select></div>
</div>    
    <div id="map"></div>
	<table cellpadding="0" cellspacing="0" id="stores-table">
		<tr>
			<th>{l s='#'}</th>
			<th>{l s='Store'}</th>
			<th>{l s='Address'}</th>
			<th>{l s='Distance'}</th>
		</tr>		
	</table>
{/if}
</div>
