{include file="orderforms/standard_cart/common.tpl"}

<div id="order-standard_cart">

    <div class="row">

        <div class="pull-md-right col-md-9">

            <div class="header-lined">
                <h1>
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h1>
                {if $productGroup.tagline}
                    <p>{$productGroup.tagline}</p>
                {/if}
            </div>
            {if $errormessage}
                <div class="alert alert-danger">
                    {$errormessage}
                </div>
            {/if}
        </div>

        <div class="col-md-3 pull-md-left sidebar hidden-xs hidden-sm">
            {include file="orderforms/standard_cart/sidebar-categories.tpl"}
        </div>

        <div class="col-md-9 pull-md-right">

            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}

            {foreach $hookAboveProductsOutput as $output}
                <div>
                    {$output}
                </div>
            {/foreach}

            <div class="products" id="products">
                <div class="row row-eq-height">
                    {foreach $products as $key => $product}
                        <div class="col-md-6">
                            <div class="product clearfix" id="product{$product@iteration}">
                                <header>
                                    <span id="product{$product@iteration}-name">{$product.name}</span>
                                    {if $product.qty}
                                        <span class="qty">
                                            {$product.qty} {$LANG.orderavailable}
                                        </span>
                                    {/if}
                                </header>
                                <div class="product-desc">
    <!--START Product Image-->         
                                    {if $product.bid}
<div class="productimage-wrapper" style="margin: 0; border: 5px solid #fff; width:85px; height:85px;"> <!--Note: Wrapper width/height should equal double the border width/height plus the image width/height.-->
{if $productimageid["bundle"][$product.bid]|@count < 2}
<img id="{$productimageid["bundle"][$product.bid][0]}" src="modules/addons/productimage/product_images/{$productimageid["bundle"][$product.bid][0]}.png" style="width: 75px; height: 75px;" onclick="productImageOpenModal(this.id);" onerror="productImageError(this);">
{else}
<div class="jcarousel-auto">
<ul>
{foreach $productimageid["bundle"][$product.bid] as $image}
<li><img id="{$image}" src="modules/addons/productimage/product_images/{$image}.png" style="width: 75px; height: 75px;" onclick="productImageOpenModal(this.id);" onerror="productImageError(this);"></li>
{/foreach}
</ul>
</div>
{/if}
</div><br>
{else}
<div class="productimage-wrapper" style="margin: 0; border: 5px solid #fff; width:85px; height:85px;"> <!--Note: Wrapper width/height should equal double the border width/height plus the image width/height.-->
{if $productimageid["product"][$product.pid]|@count < 2}
<img id="{$productimageid["product"][$product.pid][0]}" src="modules/addons/productimage/product_images/{$productimageid["product"][$product.pid][0]}.png" style="width: 75px; height: 75px;" onclick="productImageOpenModal(this.id);" onerror="productImageError(this);">
{else}
<div class="jcarousel-auto">
<ul>
{foreach $productimageid["product"][$product.pid] as $image}
<li><img id="{$image}" src="modules/addons/productimage/product_images/{$image}.png" style="width: 75px; height: 75px;" onclick="productImageOpenModal(this.id);" onerror="productImageError(this);"></li>
{/foreach}
</ul>
</div>
{/if}
</div><br>
{/if}
<!--END Product Image-->                            
                                    {if $product.featuresdesc}
                                        <p id="product{$product@iteration}-description">
                                            {$product.featuresdesc}
                                        </p>
                                    {/if}
                                    <ul>
                                        {foreach $product.features as $feature => $value}
                                            <li id="product{$product@iteration}-feature{$value@iteration}">
                                                <span class="feature-value">{$value}</span>
                                                {$feature}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>
                                <footer>
                                    <div class="product-pricing" id="product{$product@iteration}-price">
                                        {if $product.bid}
                                            {$LANG.bundledeal}<br />
                                            {if $product.displayprice}
                                                <span class="price">{$product.displayprice}</span>
                                            {/if}
                                        {else}
                                            {if $product.pricing.hasconfigoptions}
                                                {$LANG.startingfrom}
                                                <br />
                                            {/if}
                                            <span class="price">{$product.pricing.minprice.price}</span>
                                            <br />
                                            {if $product.pricing.minprice.cycle eq "monthly"}
                                                {$LANG.orderpaymenttermmonthly}
                                            {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                                {$LANG.orderpaymenttermquarterly}
                                            {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                                {$LANG.orderpaymenttermsemiannually}
                                            {elseif $product.pricing.minprice.cycle eq "annually"}
                                                {$LANG.orderpaymenttermannually}
                                            {elseif $product.pricing.minprice.cycle eq "biennially"}
                                                {$LANG.orderpaymenttermbiennially}
                                            {elseif $product.pricing.minprice.cycle eq "triennially"}
                                                {$LANG.orderpaymenttermtriennially}
                                            {/if}
                                            <br>
                                            {if $product.pricing.minprice.setupFee}
                                                <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                            {/if}
                                        {/if}
                                    </div>
                                    <a href="cart.php?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn btn-success btn-sm" id="product{$product@iteration}-order-button">
                                        <i class="fas fa-shopping-cart"></i>
                                        {$LANG.ordernowbutton}
                                    </a>
                                </footer>
                            </div>
                        </div>
                        {if $product@iteration % 2 == 0}
                            </div>
                            <div class="row row-eq-height">
                        {/if}
                    {/foreach}
                </div>
            </div>

            {foreach $hookBelowProductsOutput as $output}
                <div>
                    {$output}
                </div>
            {/foreach}

        </div>
    </div>
</div>
