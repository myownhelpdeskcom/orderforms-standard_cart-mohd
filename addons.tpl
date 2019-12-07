{include file="orderforms/standard_cart/common.tpl"}

<div id="order-standard_cart">

    <div class="row">

        <div class="pull-md-right col-md-9">

            <div class="header-lined">
                <h1>{$LANG.cartproductaddons}</h1>
            </div>

        </div>

        <div class="col-md-3 pull-md-left sidebar hidden-xs hidden-sm">

            {include file="orderforms/standard_cart/sidebar-categories.tpl"}

        </div>

        <div class="col-md-9 pull-md-right">

            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}

            {if count($addons) == 0}
                <div id="noAddons" class="alert alert-warning text-center" role="alert">
                    {$LANG.cartproductaddonsnone}
                </div>
                <p class="text-center">
                    <a href="clientarea.php" class="btn btn-default">
                        <i class="fas fa-arrow-circle-left"></i>
                        {$LANG.orderForm.returnToClientArea}
                    </a>
                </p>
            {/if}

            <div class="products">
                <div class="row row-eq-height">
                    {foreach $addons as $num => $addon}
                        <div class="col-md-6">
                            <div class="product clearfix" id="product{$num}">
                                <form method="post" action="{$smarty.server.PHP_SELF}?a=add" class="form-inline">
                                    <input type="hidden" name="aid" value="{$addon.id}" />
                                    <header>
                                        <span>{$addon.name}</span>
                                        {if $product.qty}
                                            <span class="qty">
                                                {$product.qty} {$LANG.orderavailable}
                                            </span>
                                        {/if}
                                    </header>
                                    <div class="product-desc">
                                        <p>{$addon.description}</p>
    <!--START Product Image-->                                        
                                        <div class="productimage-wrapper" style="margin: 0; border: 5px solid #fff; width:85px;"> <!--Note: Wrapper width should equal double the border width plus the image width.-->
{if $productimageid["addon"][$addon.id]|@count < 2}
<img id="{$productimageid["addon"][$addon.id][0]}" src="modules/addons/productimage/product_images/{$productimageid["addon"][$addon.id][0]}.png" style="width: 75px; height: 75px;" onclick="productImageOpenModal(this.id);" onerror="productImageError(this);">
{else}
<div class="jcarousel-auto">
<ul>
{foreach $productimageid["addon"][$addon.id] as $image}
<li><img id="{$image}" src="modules/addons/productimage/product_images/{$image}.png" style="width: 75px; height: 75px;" onclick="productImageOpenModal(this.id);" onerror="productImageError(this);"></li>
{/foreach}
</ul>
</div>
{/if}
</div>
 <!--END Product Image-->                                                                   
                                        <div class="form-group">
                                            <select name="productid" id="inputProductId{$num}" class="field">
                                                {foreach $addon.productids as $product}
                                                    <option value="{$product.id}">
                                                        {$product.product}{if $product.domain} - {$product.domain}{/if}
                                                    </option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                    <footer>
                                        <div class="product-pricing">
                                            {if $addon.free}
                                                {$LANG.orderfree}
                                            {else}
                                                <span class="price">{$addon.recurringamount} {$addon.billingcycle}</span>
                                                {if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
                                            {/if}
                                        </div>
                                        <button type="submit" class="btn btn-success btn-sm">
                                            <i class="fas fa-shopping-cart"></i>
                                            {$LANG.ordernowbutton}
                                        </button>
                                    </footer>
                                </form>
                            </div>
                        </div>
                        {if $num % 2 != 0}
                            </div>
                            <div class="row row-eq-height">
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>
