<?php echo $header; ?>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><i class="icon-puzzle"></i> <?php echo $heading_title; ?></h1>
      <div class="buttons"><?php if(isset($stores)){ ?>
        <select onChange="location='<?php echo $module_link; ?>&store_id='+$(this).val()">
          <?php foreach($stores as $store){ ?>
          <?php if($store['store_id'] ==  $store_id){ ?>
          <option value="<?php echo $store['store_id']; ?>" selected="selected" ><?php echo $store['name']; ?></option>
          <?php }else{ ?>
          <option value="<?php echo $store['store_id']; ?>" ><?php echo $store['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select><?php } ?><a onClick="saveAndStay()" class="button"><span><?php echo $button_save_and_stay; ?></span></a><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div class="vtabs">
        <ul>
          <li><a href="#home" id="vtab_item_1" class="vtab-item"><i class="icon-home"></i><span>Home</span></a></li>
          <li><a href="#install" id="vtab_item_2" class="vtab-item"><i class="icon-settings"></i><span>Installation</span></a></li>
          <li><a href="#layout" id="vtab_item_2" class="vtab-item"><i class="icon-columns"></i><span>Layout</span></a></li>
          <li><a href="#grid" id="vtab_item_2" class="vtab-item"><i class="icon-view-grid"></i><span>Grid system</span></a></li>
          <li><a href="#typography" id="vtab_item_3" class="vtab-item"><i class="icon-font"></i><span>Typography</span></a></li>
          <li><a href="#tables" id="vtab_item_4" class="vtab-item"><i class="icon-table"></i><span>Tables</span></a></li>
          <li><a href="#forms" id="vtab_item_4" class="vtab-item"><i class="icon-input"></i><span>Forms</span></a></li>
          <li><a href="#tabs" id="vtab_item_4" class="vtab-item"><i class="icon-folder"></i><span>Tabs</span></a></li>
          <li><a href="#images" id="vtab_item_4" class="vtab-item"><i class="icon-image"></i><span>Images</span></a></li>
          <li><a href="#buttons" id="vtab_item_4" class="vtab-item"><i class="icon-check"></i><span>Buttons</span></a></li>
          <li><a href="#icons" id="vtab_item_4" class="vtab-item"><i class="icon-glass"></i><span>Icons</span></a></li>
          <li><a href="#pagination" id="vtab_item_4" class="vtab-item"><i class="icon-page"></i><span>Pagination</span></a></li>
          <li><a href="#alerts" id="vtab_item_4" class="vtab-item"><i class="icon-alert"></i><span>Alerts</span></a></li>
          <li><a href="#tooltips" id="vtab_item_4" class="vtab-item"><i class="icon-question"></i><span>Tooltips</span></a></li>
          <li><a href="#popover" id="vtab_item_4" class="vtab-item"><i class="icon-layers"></i><span>Popover</span></a></li>
          <li><a href="#sliders" id="vtab_item_4" class="vtab-item"><i class="icon-slider"></i><span>Sliders</span></a></li>
          <li><a href="#accordion" id="vtab_item_4" class="vtab-item"><i class="icon-tasks"></i><span>Accordion</span></a></li>
          <li><a href="#graphs" id="vtab_item_4" class="vtab-item"><i class="icon-chart-line"></i><span>Graphs</span></a></li>
      </ul>
      </div>
      <div id="home" class="vtabs-content">
        <div class="tab-title"><i class="icon-home"></i><span>Home</span></div>
        <div class="tab-body dashboard">
        <div class="heading-group">
        <h1>Shopunity</h1>
        <h3>The perfect admin theme</h3>
        </div>
        <div class="row">
<div class="col-sm-6 col-md-4"><a href="#install" class="tab-trigger"><i class="icon-settings icon-large"></i><h3>Installation</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-xs"></div>
  <div class="col-sm-6 col-md-4"><a href="#layout" class="tab-trigger"><i class="icon-columns icon-large"></i><h3>Layout</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-sm visible-xs"></div>
  <div class="col-sm-6 col-md-4"><a href="#grid" class="tab-trigger"><i class="icon-view-grid icon-large"></i><h3>Grid system</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  hidden-sm "></div>
 <div class="col-sm-6 col-md-4"><a href="#typography" class="tab-trigger"><i class="icon-font icon-large"></i><h3>Typography</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>  
   <div class="clear  visible-sm visible-xs"></div>
   <div class="col-sm-6 col-md-4"><a href="#tables" class="tab-trigger"><i class="icon-table icon-large"></i><h3>Table</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-xs"></div>
    <div class="col-sm-6 col-md-4"><a href="#forms" class="tab-trigger"><i class="icon-input icon-large"></i><h3>Forms</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
    <div class="clear  hidden-sm "></div>
    <div class="col-sm-6 col-md-4"><a href="#tabs" class="tab-trigger"><i class="icon-folder icon-large"></i><h3>Tabs</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-xs"></div>
  <div class="col-sm-6 col-md-4"><a href="#images" class="tab-trigger"><i class="icon-image icon-large"></i><h3>Images</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-sm visible-xs"></div>
  <div class="col-sm-6 col-md-4"><a href="#buttons" class="tab-trigger"><i class="icon-check icon-large"></i><h3>Buttons</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  hidden-sm "></div>
 <div class="col-sm-6 col-md-4"><a href="#icons" class="tab-trigger"><i class="icon-glass icon-large"></i><h3>Icons</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>  
   <div class="clear  visible-sm visible-xs"></div>
   <div class="col-sm-6 col-md-4"><a href="#pagination" class="tab-trigger"><i class="icon-page icon-large"></i><h3>Pagination</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-xs"></div>
    <div class="col-sm-6 col-md-4"><a href="#alerts" class="tab-trigger"><i class="icon-alert icon-large"></i><h3>Alerts</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
    <div class="clear  hidden-sm "></div>
 <div class="col-sm-6 col-md-4"><a href="#tooltips" class="tab-trigger"><i class="icon-question icon-large"></i><h3>Tooltips</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>  
   <div class="col-sm-6 col-md-4"><a href="#popover" class="tab-trigger"><i class="icon-layers icon-large"></i><h3>Popover</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  <div class="clear  visible-xs"></div>
    <div class="col-sm-6 col-md-4"><a href="#sliders" class="tab-trigger"><i class="icon-slider icon-large"></i><h3>Sliders</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
    <div class="col-sm-6 col-md-4"><a href="#accordion" class="tab-trigger"><i class="icon-tasks icon-large"></i><h3>Accordion</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
    <div class="col-sm-6 col-md-4"><a href="#graphs" class="tab-trigger"><i class="icon-chart-line icon-large"></i><h3>Graphs</h3><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </span></a></div>
  </div>
  

        </div>
      </div>
      <div id="install" class="vtabs-content">
        <div class="tab-title"><i class="icon-settings"></i><span>Installation</span></div>
        <div class="tab-body">
      
      	<h2>Installing Shopunity Admin Theme</h2>
        <p>You can install the Shopunity Admin Theme by uncommenting the a_vqmod_shopunity.xml_. It will add the required code to the admin/controller/common/header.php.</p>
        <p>Here is the code referance of the vqmod file. you can comment by <code>/*...*/</code> a component you do not need.</p>
      <?php $code = '<?php
	/*This is the google font for PT Sans*/
$this->document->addLink(\'//fonts.googleapis.com/css?family=PT+Sans:400,700,700italic,400italic&subset=latin,cyrillic-ext,latin-ext,cyrillic\', "stylesheet");
	/*Required CSS files*/ 
$this->document->addStyle(\'view/stylesheet/shopunity/normalize.css\');
	/*Extra compontents - CSS files*/
$this->document->addStyle(\'view/stylesheet/shopunity/hyperlight.css\');
$this->document->addStyle(\'view/javascript/shopunity/uniform/css/uniform.default.css\');
	/*Required CSS files*/ 
$this->document->addStyle(\'view/stylesheet/shopunity/icons.css\');
$this->document->addStyle(\'view/stylesheet/shopunity/shopunity.css\');

	/*Required Javascript files*/ 
$this->document->addScript(\'view/javascript/shopunity/uniform/jquery.uniform.min.js\');		
$this->document->addScript(\'view/javascript/shopunity/shopunity.js\');
	/*Shopunity uses .LESS - you need to place the <link href="view/stylesheet/shopunity/styles.less" rel="stylesheet/less"> manualy in your header.tpl file before the first js file is loaded or use the a_vqmod_shopunity.xml*/
$this->document->addScript(\'view/javascript/shopunity/less.js\');
	/*Extra compontents - JS files*/
$this->document->addScript(\'view/javascript/shopunity/jquery.quicksearch.js\');
$this->document->addScript(\'view/javascript/shopunity/jquery.nicescroll.min.js\');
$this->document->addScript(\'view/javascript/shopunity/jquery.nestable.js\');
	/*Compontents: codemirror*/
$this->document->addStyle(\'view/javascript/quickcheckout/codemirror/codemirror.css\');
$this->document->addScript(\'view/javascript/quickcheckout/codemirror/codemirror.js\');
$this->document->addScript(\'view/javascript/quickcheckout/codemirror/css.js\');
?>'; ?>	
      <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
      
      <h2>Create a Module admin theme with Shopunity</h2>
        <p>You can also create separate admin themes for your modules with shopunity. This will rander just the module admin and not change the overall look of the admin.</p>
        <p>In your module controller for admin add the code above directly after the <code>function index(){</code>. This will load the neccessery files just for your module.</p>
        <div class="callout callout-error"> 
        <p> Be aware, that in MijoShop the loading functions are not functioning, so you will need to also install <a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=14451">Mijoshop - Joomla module fix</a></p>
        </div>
      </div>
      </div>
      <div id="layout" class="vtabs-content">
        <div class="tab-title"><i class="icon-columns"></i><span>Layout</span></div>
        <div class="tab-body">
        <h2>One column</h2>
        <p>Many modules do not have a second column - like Featured</p>
        <?php $code= '<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb[\'separator\']; ?><a href="<?php echo $breadcrumb[\'href\']; ?>"><?php echo $breadcrumb[\'text\']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$(\'#form\').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">...</div>
  </div><!-- .box -->
</div><!-- #content -->
<?php echo $footer; ?>'; ?>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
        <h2>Two column</h2>
        <p>This Shopunity module uses 2 columns, like module welcome. The first column is a <code>vtabs</code> and the second column is the content. Simply copy this to the .tpl file of your module and add you code.</p>
        <?php $code= '<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb[\'separator\']; ?><a href="<?php echo $breadcrumb[\'href\']; ?>"><?php echo $breadcrumb[\'text\']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$(\'#form\').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
    	<div class="vtabs">
        <ul>
          <li><a href="#home" id="vtab_item_1" class="vtab-item"><i class="icon-small-home"></i><span>Home</span></a></li>
          <li><a href="#layout" id="vtab_item_2" class="vtab-item">...</a></li>
        </ul>
      </div>
      <div id="home" class="vtabs-content">
        <div class="tab-title"><i class="icon-home"></i><span>Home</span></div>
        <div class="tab-body">...</div>
      </div>
      <div id="layout" class="vtabs-content">
        <div class="tab-title"><i class="icon-home"></i><span>...</span></div>
        <div class="tab-body">...</div>
      </div>
    </div><!-- .content -->
  </div><!-- .box -->
</div><!-- #content -->
<script>
$(\'.vtabs a\').tabs();
</script>
<!-- Vtabs-->
<?php echo $footer; ?>'; ?>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
        </div>
      </div>
      <div id="grid" class="vtabs-content">
        <div class="tab-title"><i class="icon-view-grid"></i><span>Grid system</span></div>
        <div class="tab-body"> 
        	<p>Shopunity ustilizase the full power of .LESS</p>
            <h2>Example: Stacked-to-horizontal</h2>
<p>Using a single set of <code>.col-md-*</code> grid classes, you can create a basic grid system that starts out stacked on mobile devices and tablet devices (the extra small to small range) before becoming horizontal on desktop (medium) devices. Place grid columns in any <code>.row</code>.</p>
            <?php $code= '<div class="row">
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
  <div class="col-md-1"><span>.col-md-1</span></div>
</div>
<div class="row">
  <div class="col-md-8"><span>.col-md-8</span></div>
  <div class="col-md-4"><span>.col-md-4</span></div>
</div>
<div class="row">
  <div class="col-md-4"><span>.col-md-4</span></div>
  <div class="col-md-4"><span>.col-md-4</span></div>
  <div class="col-md-4"><span>.col-md-4</span></div>
</div>
<div class="row">
  <div class="col-md-6"><span>.col-md-6</span></div>
  <div class="col-md-6"><span>.col-md-6</span></div>
</div>'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
       
       <h2>Example: Mobile and desktop</h2>
<p>Don't want your columns to simply stack in smaller devices? Use the extra small and medium device grid classes by adding <code>.col-xs-*</code> <code>.col-md-*</code> to your columns. See the example below for a better idea of how it all works.</p>
       <?php $code= '<!-- Stack the columns on mobile by making one full-width and the other half-width -->
<div class="row">
  <div class="col-xs-12 col-md-8"><span>.col-xs-12 .col-md-8</span></div>
  <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
</div>

<!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
<div class="row">
  <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
  <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
  <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
   <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
  <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
  <div class="col-xs-6 col-md-4"><span>.col-xs-6 .col-md-4</span></div>
</div>

<!-- Columns are always 50% wide, on mobile and desktop -->
<div class="row">
  <div class="col-xs-6"><span>.col-xs-6</span></div>
  <div class="col-xs-6"><span>.col-xs-6</span></div>
</div>'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
       <h2>Available classes</h2>
<p>Use a single or combination of the available classes for toggling content across viewport breakpoints.</p>
       <table class="form">
        <thead>
          <tr>
            <th></th>
            <th>
              Extra small devices
              <small>Phones (&lt;768px)</small>
            </th>
            <th>
              Small devices
              <small>Tablets (=768px)</small>
            </th>
            <th>
              Medium devices
              <small>Desktops (=992px)</small>
            </th>
            <th>
              Large devices
              <small>Desktops (=1200px)</small>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th><code>.visible-xs</code></th>
            <td class="is-visible">Visible</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-hidden">Hidden</td>
          </tr>
          <tr>
            <th><code>.visible-sm</code></th>
            <td class="is-hidden">Hidden</td>
            <td class="is-visible">Visible</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-hidden">Hidden</td>
          </tr>
          <tr>
            <th><code>.visible-md</code></th>
            <td class="is-hidden">Hidden</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-visible">Visible</td>
            <td class="is-hidden">Hidden</td>
          </tr>
          <tr>
            <th><code>.visible-lg</code></th>
            <td class="is-hidden">Hidden</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-visible">Visible</td>
          </tr>
        </tbody>
        <tbody>
          <tr>
            <th><code>.hidden-xs</code></th>
            <td class="is-hidden">Hidden</td>
            <td class="is-visible">Visible</td>
            <td class="is-visible">Visible</td>
            <td class="is-visible">Visible</td>
          </tr>
          <tr>
            <th><code>.hidden-sm</code></th>
            <td class="is-visible">Visible</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-visible">Visible</td>
            <td class="is-visible">Visible</td>
          </tr>
          <tr>
            <th><code>.hidden-md</code></th>
            <td class="is-visible">Visible</td>
            <td class="is-visible">Visible</td>
            <td class="is-hidden">Hidden</td>
            <td class="is-visible">Visible</td>
          </tr>
          <tr>
            <th><code>.hidden-lg</code></th>
            <td class="is-visible">Visible</td>
            <td class="is-visible">Visible</td>
            <td class="is-visible">Visible</td>
            <td class="is-hidden">Hidden</td>
          </tr>
        </tbody>
      </table>
       
        </div>
      </div>
      <div id="typography" class="vtabs-content">
        <div class="tab-title"><i class="icon-font"></i><span>Typography</span></div>
        <div class="tab-body">
        <h2>Headings</h2>
        <p>You can use both h1 and .h1 to style text.</p>
        <?php $code= '
<h1>H1 Heading <small>some small text, could be slogan</small></h1>
<h2>H2 Heading <small>some small text, could be slogan</small></h2>
<h3>H3 Heading <small>some small text, could be slogan</small></h3>
<h4>H4 Heading <small>some small text, could be slogan</small></h4>
<h5>H5 Heading <small>some small text, could be slogan</small></h5>
<h6>H6 Heading <small>some small text, could be slogan</small></h6>'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          <h2>Paragraph</h2>
          <?php $code= '<p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          
          <h2>Small</h2>
          <?php $code= '<small>Lorem ipsum dolor sit amet</small>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          
          <h2>Bold</h2>
          <?php $code= '<strong>Lorem ipsum dolor sit amet</strong>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          
          <h2>Italics</h2>
          <?php $code= '<em>Lorem ipsum dolor sit amet</em>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          
          <h2>Link</h2>
          <?php $code= '<a>Link</a>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          
          <h2>Label</h2>
          <?php $code= '<span class="label label-default">Default</span>
<span class="label label-primary">Primary</span>
<span class="label label-success">Success</span>
<span class="label label-info">Info</span>
<span class="label label-warning">Warning</span>
<span class="label label-danger">Danger</span>'; ?>
          
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
         </div>
      </div>
      <div id="tables" class="vtabs-content">
        <div class="tab-title"><i class="icon-table"></i><span>Tables</span></div>
        <div class="tab-body">
          <h2>Table .Form</h2>
          <?php $code= '<table class="form">
            <thead>
              <tr>
                <td>Heading 1</td>
                <td>Heading 2</td>
                <td>Heading 3</td>
                <td>Heading 4</td>
                <td>Heading 5</td>
                <td>Heading 6</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
                <td>Column 5</td>
                <td>Column 6</td>
              </tr>
              <tr>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
                <td>Column 5</td>
                <td>Column 6</td>
              </tr>
            </tbody>
          </table>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          <h2>Table .List</h2>
          <?php $code= '<table class="list">
            <thead>
              <tr>
                <td>Heading 1</td>
                <td>Heading 2</td>
                <td>Heading 3</td>
                <td>Heading 4</td>
                <td>Heading 5</td>
                <td class="right">Heading 6</td>
              </tr>
            </thead>
            <tbody>
              <tr class="filter">
                <td></td>
                <td></td>
                <td><input type="text" name="filter_name" value="" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true"></td>
                <td><input type="text" name="filter_model" value="" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true"></td>
                <td><select name="filter_status">
                    <option value="*"></option>
                    <option value="1">Enabled</option>
                    <option value="0">Disabled</option>
                  </select></td>
                <td align="right"><a onclick="filter();" class="button">Filter</a></td>
              </tr>
              <tr>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
                <td>Column 5</td>
                <td class="right">Column 6</td>
              </tr>
              <tr>
                <td>Column 1</td>
                <td>Column 2</td>
                <td>Column 3</td>
                <td>Column 4</td>
                <td>Column 5</td>
                <td class="right">Column 6</td>
              </tr>
            </tbody>
          </table>'; ?>
          
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
        </div>
      </div>
      <div id="forms" class="vtabs-content">
        <div class="tab-title"><i class="icon-input"></i><span>Forms</span></div>
        <div class="tab-body">
          <form>
            <h2>Input sizes</h2>

            <?php $code= '<div id="form_input_sizes" >
    <input type="text" class="input-lg" /><select id="form_select_2" class="input-lg" >
            <option>Option 1</option>
            <option>Option 2</option>
            <option>Option 3</option>
        </select><a href="#" class="button btn-lg" onclick="return false">button</a>
    <input type="text" class="input-md"/><select id="form_select_2" class="input-md" >
            <option>Option 1</option>
            <option>Option 2</option>
            <option>Option 3</option>
        </select><a href="#" class="button btn-md" onclick="return false">button</a>
    <input type="text" class="input-sm" /><select id="form_select_2" class="input-sm" >
            <option>Option 1</option>
            <option>Option 2</option>
            <option>Option 3</option>
        </select><a href="#" class="button btn-sm" onclick="return false">button</a>
</div>
'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
            <h2>Vertical form</h2>
            <style>
            #form_vertical_1{
				width:200px;
				padding:30px;
				border:1px solid #E1E1E1}
            </style>
            <?php $code= '<div id="form_vertical_1" class="form-vertical">
    <div class="col-md-12">
        <label for="form_Login_1">Login</label>
        <input id="form_Login_1" type="text" />
    </div>
    <div class="col-md-12">
        <label for="form_password_1">Password</label>
        <input id="form_password_1" type="password" />
    </div>
    <div>
    	<label for="form_select_1">Select an account</label>
    	<select id="form_select_1">
            <option>Option 1</option>
            <option>Option 2</option>
            <option>Option 3</option>
        </select> 
    </div>
    <div>
        <input id="form_checkbox_1" type="checkbox" />
        <label for="form_checkbox_1">remeber me</label>
    </div>
	<button class="button" onclick="return false">Sign in</button>
</div>
'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>

	<h2>Inline form</h2>
    <p>Add this class <code>.sr-only</code> to hide the label. Remeber, that lable is a must for any input.</p>
            <style>
            #form_inline_2{
				width:630px;
				padding:30px;
				border:1px solid #E1E1E1}
            </style>
            <?php $code= '<div id="form_inline_2" class="form-inline">
    <div>
        <label class="sr-only" for="form_Login_2">Login</label>
        <input id="form_Login_2" type="text" placeholder="Login" />
    </div>
    <div>
        <label class="sr-only"  for="form_password_2">Password</label>
        <input id="form_password_2" type="password" placeholder="Password" />
    </div>
    <div>
    	<label class="sr-only" for="form_select_2">Select an account</label>
    	<select id="form_select_2">
            <option>Option 1</option>
            <option>Option 2</option>
            <option>Option 3</option>
        </select> 
    </div>
    <div>
        <input id="form_checkbox_2" type="checkbox" />
        <label for="form_checkbox_2">remeber me</label>
    </div>
	<button class="button" onclick="return false">Sign in</button>
</div>
'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
    <h2>Checkbox and radio</h2>
    <p></p>
    <?php $code= '<div class="form-vertical">
    <div>
        <input id="checkbox_1" type="checkbox" />
        <label for="checkbox_1">checkbox</label>
    </div>
    <div>
        <input id="radio_1" type="radio" />
        <label for="radio_1">radio</label>
    </div>
</div>'; ?>
	<div class="example"><?php echo $code; ?></div>
    <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
    
            <h2>Color picker</h2>
            <p>Color picker button view. use <code>.button</code></p>
            <?php $code= '<label for="color_picker_1">Pick a color</label><input type="text" class="color-picker hide" id="color_picker_1"><label class="sr-only"  for="form_password_1">Password</label>
       
<script>
        $(function() {
            $(\'#color_picker_1\').colorpicker({
                parts: \'simple\',
                showOn: \'both\',
                buttonColorize: true,
                showNoneButton: true,
                alpha: true,
                colorFormat: \'#HEX\'
            });
        });
</script>'; ?>
            <div class="example"><?php echo $code; ?></div>
    		<div class="highlight"><?php hyperlight($code, 'php'); ?></div>
            <p>Color picker input view</p>
            <?php $code= '<input type="text" class="color-picker" id="color_picker_2" >
<script>
        $(function() {
            $(\'#color_picker_2\').colorpicker({
                parts: \'simple\',
                altField: \'#color_picker_2\',
                showOn: \'both\',
                buttonImage: \'\',
                showNoneButton: false,
                alpha: true,
                colorFormat: \'#HEX\'
            });
        });
</script>'; ?>
            <div class="example"><?php echo $code; ?></div>
    		<div class="highlight"><?php hyperlight($code, 'php'); ?></div>

            <h2>Textarea</h2>
            <?php $code= '<div class="form-vertical">
<label for="textarea_1">Pick a color</label>
<textarea id="textarea_1"></textarea>
</div>'; ?>
            <div class="example"><?php echo $code; ?></div>
    		<div class="highlight"><?php hyperlight($code, 'php'); ?></div>
            
            <h2>Editor</h2>
            <?php $code= '<textarea id="description_1"></textarea>'; ?>
            <div class="example"><?php echo $code; ?></div>
            <?php $code= '<textarea id="description_1"></textarea>
            
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
CKEDITOR.replace(\'description_1\', {
	filebrowserBrowseUrl: \'index.php?route=common/filemanager&token=<?php echo $token; ?>\',
	filebrowserImageBrowseUrl: \'index.php?route=common/filemanager&token=<?php echo $token; ?>\',
	filebrowserFlashBrowseUrl: \'index.php?route=common/filemanager&token=<?php echo $token; ?>\',
	filebrowserUploadUrl: \'index.php?route=common/filemanager&token=<?php echo $token; ?>\',
	filebrowserImageUploadUrl: \'index.php?route=common/filemanager&token=<?php echo $token; ?>\',
	filebrowserFlashUploadUrl: \'index.php?route=common/filemanager&token=<?php echo $token; ?>\'
});

//--></script>'; ?>
			
    		<div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          </form>

      </div>
    </div>
    <div id="tabs" class="vtabs-content">
      <div class="tab-title"><i class="icon-folder"></i><span>Tab system</span></div>
       <div class="tab-body"> 
      <?php $code= '<div class="htabs" id="tabs_htabs"> <a href="#htab_1" class="htab-item">Tab 1</a><a href="#htab_2" class="htab-item">Tab 2</a> <a href="#htab_3" class="htab-item">Tab 3</a> </div>
      <div id="htab_1" class="htab-content">
        <div class="tab-title"><i class="icon-settings"></i><span>Tab Heading</span></div>
        <div class="tab-body">
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
      </div>
      <div id="htab_2" class="htab-content">Tab 2</div>
      <div id="text" class="htab-content">Tab 3</div>
      <script>
          $(\'#tabs_htabs a\').tabs();
          </script>
      <!-- htabs-->'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
      </div>
    </div>
    <div id="images" class="vtabs-content">
      <div class="tab-title"><i class="icon-image"></i><span>Images</span></div>
      <div class="tab-body">
      <?php $code= '<img src="http://fpoimg.com/150x150?bg_color=e8e8e8" class="img-rounded"/>
<img src="http://fpoimg.com/150x150?bg_color=e8e8e8" class="img-circle"/>
<img src="http://fpoimg.com/150x150?bg_color=e8e8e8" class="img-thumbnail"/>'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
      </div>
    </div>
    <div id="buttons" class="vtabs-content">
      <div class="tab-title"><i class="icon-check"></i><span>Buttons</span></div>
      <div class="tab-body">
       <h2>Buttons</h2>
            <?php $code= '<a href="#" class="button" onclick="return false">button</a>
<button class="button" onclick="return false">button</button>
<input type="submit" vlaue="submit" class="button" onclick="return false" />
<input type="button" value="input button" class="button" onclick="return false" />'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
            
        <h2>Button Sizes</h2>
       <?php $code= '<a href="#" class="button btn-lg" onclick="return false">button</a>
<a href="#" class="button btn-md" onclick="return false">button</a>
<a href="#" class="button btn-sm" onclick="return false">button</a>
'; ?>
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
        </div>
    </div>
    <div id="icons" class="vtabs-content">
      <div class="tab-title"><i class="icon-glass"></i><span>Icons</span></div>
      <div class="tab-body" id="icons_list">
      <div class="well">
      <label for="icons_list_search">Search</label>
<input type="text" class="search" id="icons_list_search"/>
</div>
      <h2>Administration</h2>
      <?php $icons = array('icon-home',
'icon-settings',
'icon-compatibility',
'icon-config',
'icon-payment',
'icon-cart',
'icon-design',
'icon-filter',
'icon-images',
'icon-currency',
'icon-archive',
'icon-book',
'icon-address-book',
'icon-shipping',
'icon-address',
'icon-dashbord',
'icon-dashbord-full',
'icon-tasks',
'icon-exit',
'icon-user',
'icon-user-female',
'icon-user-add',
'icon-users',
'icon-id-card',
'icon-comment',
'icon-comments',
'icon-rss-square'); ?>
<ul class="icons-exemple">
      <?php foreach($icons as $icon){?>
      <li>
        	<span class="<?php echo $icon; ?>"></span>
            <span class="icon-class">.<?php echo $icon; ?></span>
        </li>
        <?php } ?>
      </ul>
<h2>Editing</h2>
<?php $icons = array(
'icon-mail',
'icon-print',
'icon-paperclip',
'icon-zip',
'icon-install',
'icon-bookmark',
'icon-send',
'icon-reply',
'icon-reply-all',
'icon-refresh',
'icon-return',
'icon-save',
'icon-cancel',
'icon-check',
'icon-plus',
'icon-columns',
'icon-new-window',
'icon-input',
'icon-pencil',
'icon-asterisk',
'icon-pin',
'icon-font',
'icon-info',
'icon-link',
'icon-crop',
'icon-brush',
'icon-paint-bucket',
'icon-quote',
'icon-code',
'icon-code-closed',
'icon-align-center',
'icon-align-justify',
'icon-align-left',
'icon-align-right',
'icon-list',
'icon-list-nested'); ?>
<ul class="icons-exemple">
      <?php foreach($icons as $icon){?>
      <li>
        	<span class="<?php echo $icon; ?>"></span>
            <span class="icon-class">.<?php echo $icon; ?></span>
        </li>
        <?php } ?>
      </ul>
<h2>Actions</h2>
<?php $icons = array(
'icon-cancel-circle',
'icon-approve-circle',
'icon-arr-up-circle',
'icon-arr-down-circle',
'icon-plus-circle',
'icon-minus-circle',
'icon-chevron-up',
'icon-chevron-left',
'icon-chevron-right',
'icon-chevron-down',
'icon-indent-less',
'icon-indent-more',
'icon-arr-up-down',
'icon-fast-forward',
'icon-fast-rewind',
'icon-forward',
'icon-rewind',
'icon-forward-2x',
'icon-rewind-2x',
'icon-play',
'icon-stop',
'icon-pause',
'icon-random',
'icon-open',
'icon-move',
'icon-ban',
'icon-resize-small',
'icon-resize-vertical',
'icon-resize-horisontal',
'icon-transfer',
'icon-resize-full',
'icon-fullscreen',
'icon-drag',
'icon-sort-by-attributes',
'icon-sort-by-attributes-alt',
'icon-sort-za',
'icon-sort-az',
'icon-sort-91',
'icon-sort-19',
'icon-heart',
'icon-star-empty',
'icon-star-full',
'icon-lock-closed',
'icon-lock-open',
'icon-happy-smiley',
'icon-sad-smiley',
'icon-angry-smiley',
'icon-search',
'icon-zoom-in',
'icon-zoom-out',
'icon-eye-open',
'icon-eye-closed',
'icon-warning',
'icon-alert',
'icon-question',
'icon-info-circle',
'icon-hand-right',
'icon-hand-left',
'icon-hand-up',
'icon-hand-down',
'icon-thumbs-up',
'icon-thumbs-down',
'icon-burst',
'icon-burst-new',
'icon-burst-sale',
'icon-signal',
'icon-wifi-1',
'icon-wifi-2',
'icon-wifi-3',
'icon-volume',
'icon-volume-down',
'icon-volume-up',
'icon-page',
'icon-page-search',
'icon-page-export',
'icon-page-copy',
'icon-page-add',
'icon-page-delete',
'icon-page-edit',
'icon-folder',
'icon-folder-open',
'icon-cloud',
'icon-cloud-download',
'icon-cloud-upload',
'icon-cloud-full',
'icon-cloud-full-download',
'icon-cloud-full-upload',
'icon-cloud-upload-full',
'icon-database'); ?>
<ul class="icons-exemple">
      <?php foreach($icons as $icon){?>
      <li>
        	<span class="<?php echo $icon; ?>"></span>
            <span class="icon-class">.<?php echo $icon; ?></span>
        </li>
        <?php } ?>
      </ul>
<h2>Presentation</h2>
<?php $icons = array(
'icon-flow-tree',
'icon-flow-cascade',
'icon-flow-branch',
'icon-chart-area',
'icon-chart-bar',
'icon-chart-line',
'icon-chart-pie',
'icon-stats',
'icon-table',
'icon-grid-list',
'icon-view-grid',
'icon-view-grid-large',
'icon-view-list',
'icon-view-list-info',
'icon-speed',
'icon-monitor',
'icon-teblet',
'icon-mobile'); ?>
<ul class="icons-exemple">
      <?php foreach($icons as $icon){?>
      <li>
        	<span class="<?php echo $icon; ?>"></span>
            <span class="icon-class">.<?php echo $icon; ?></span>
        </li>
        <?php } ?>
      </ul>
<h2>Items</h2>
<?php $icons = array(
'icon-box',
'icon-product',
'icon-trash',
'icon-fire',
'icon-electricity',
'icon-clipboard',
'icon-flag',
'icon-tag',
'icon-tags',
'icon-rocket',
'icon-tools',
'icon-clock',
'icon-stopwatch',
'icon-compass',
'icon-traffic-cone',
'icon-suitcase',
'icon-puzzle',
'icon-bug',
'icon-phone',
'icon-invoice',
'icon-gift',
'icon-trophy',
'icon-megaphone',
'icon-glass',
'icon-music',
'icon-camera',
'icon-film',
'icon-media',
'icon-movie',
'icon-image',
'icon-layers',
'icon-slider',
'icon-ticket',
'icon-lightbulb',
'icon-umbrella',
'icon-car',
'icon-foot',
'icon-graduation-cap',
'icon-calculator',
'icon-key',
'icon-cc',
'icon-calendar',
'icon-world',
'icon-internet',
'icon-map',
'icon-map-pin',
'icon-barcode',
'icon-qrcode'); ?>
<ul class="icons-exemple">
      <?php foreach($icons as $icon){?>
      <li>
        	<span class="<?php echo $icon; ?>"></span>
            <span class="icon-class">.<?php echo $icon; ?></span>
        </li>
        <?php } ?>
      </ul>
<h2>Social</h2>
<?php $icons = array(
'icon-share',
'icon-paypal',
'icon-twitter-bird',
'icon-skype',
'icon-icq',
'icon-dropbox',
'icon-windows',
'icon-apple',
'icon-android',
'icon-linux',
'icon-you-tube',
'icon-picasa',
'icon-google',
'icon-facebook-square',
'icon-twitter-square',
'icon-vkontakte-square',
'icon-pintrest-square',
'icon-git-hub-square',
'icon-instagrem-square',
'icon-google-plus-square',
'icon-linked-in-square'); ?>
      
      <ul class="icons-exemple">
      <?php foreach($icons as $icon){?>
      <li>
        	<span class="<?php echo $icon; ?>"></span>
            <span class="icon-class">.<?php echo $icon; ?></span>
        </li>
        <?php } ?>
      </ul>
      
      <script>
       $('input#icons_list_search').quicksearch('.icons-exemple li');
      </script>
      </div>
    </div>
    <div id="pagination" class="vtabs-content">
      <div class="tab-title"><i class="icon-page"></i><span>Pagination</span></div>
      <div class="tab-body">
      <?php $code ='<div class="pagination clearfix">
	<div class="links">
        <a href="#">&laquo;</a>
    	<b>1</b>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">&raquo;</a>
    </div>
    <div class="results">Showing 1 to 20 of 38 (3 Pages)</div>
</div>'; ?>
      	<div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
      </div>
    </div>
    <div id="alerts" class="vtabs-content">
      <div class="tab-title"><i class="icon-alert"></i><span>Alerts</span></div>
      <div class="tab-body">
		<h2>Notifications</h2>
          <?php $code= '<div class="error">Error! this is a style for error message</div>
<div class="warning">Warning!  this is a style for warning message</div>
<div class="success">Success! this is a style for success message</div>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
          
          <h2>Callouts</h2>
          <?php $code= '<div class="callout"><h4>Default Callout</h4><p>Just a Callout! this is a style for default callout message</p></div>
<div class="callout callout-error"><h4>Error Callout</h4><p>Error! this is a style for error message</p></div>
<div class="callout callout-warning"><h4>Warning Callout</h4><p>Warning!  this is a style for warning message</p></div>
<div class="callout callout-success"><h4>Success Callout</h4><p>Success! this is a style for success message</p></div>'; ?>
          <div class="example"><?php echo $code; ?></div>
          <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
      </div>
    </div>
    <div id="tooltips" class="vtabs-content">
      <div class="tab-title"><i class="icon-question"></i><span>Tooltips</span></div>
      <div class="tab-body"> </div>
    </div>
    <div id="popover" class="vtabs-content">
      <div class="tab-title"><i class="icon-layers"></i><span>Popover</span></div>
      <div class="tab-body"> </div>
    </div>
    <div id="sliders" class="vtabs-content">
      <div class="tab-title"><i class="icon-slider"></i><span>Sliders</span></div>
      <div class="tab-body"> 
      <div class="example">
      <style type="text/css">
#scroll_wrap {
        padding: 40px;
        height: 220px;
        width: 300px;
        border: 1px solid #E1E1E1;
        overflow: auto;
}
#scroll_content {
	width:1000px
}
</style>
<div id="scroll_wrap">
      <div id="scroll_content">
THIS IS A SIMPLE SCROLLABLE DIV
  <h2> Package Description </h2>
  <p>Release Date: August 10, 2010</p>
  <p>The <a title="http://www.openprinting.org/show_driver.cgi?driver=hpijs" rel="nofollow" href="http://www.openprinting.org/show_driver.cgi?driver=hpijs">HPIJS</a> driver is the free, <a title="http://hplipopensource.com/hplip-web/index.html" rel="nofollow" href="http://hplipopensource.com/hplip-web/index.html">open-source driver</a> issued by HP for their DeskJet and LaserJet printers. For most <a title="" href="http://www.linuxfoundation.org/collaborate/workgroups/openprinting/macosx/hpijs#Printers">supported printers</a>,   this driver produces output quality equivalent to the proprietary HP   drivers. In photo mode, with photo paper, the output quality is very   high, especially for the HP DeskJet 990C and later models, which   auto-detect the paper type in hardware. Photo printing is fully   supported in the newer 6- and 7-ink models.</p>
  <p>A major advantage of using this driver over those supplied by HP is   the direct interface between HPIJS and the native CUPS spooler, which   allows printing from any printer over any available connection such as   USB, AppleTalk, TCP/IP (via LPD and IPP), HP JetDirect, and shared   windows printers via SAMBA. Additionally, this driver utilizes the   existing Mac OS X USB &quot;backend&quot; and thus does not install any software   that might interfere with standard USB operation.</p>
  <p>Please note:</p>
  <ul>
    <li>HP does not provide any support for HPLIP or HPIJS on the Mac OS X platform.</li>
    <li><a href="http://www.linuxfoundation.org/en/OpenPrinting/MacOSX/hpijs-USB">Several HP USB devices</a> may not print successfully over the standard Mac OS X USB &quot;backend&quot;. Please <a href="http://www.linuxfoundation.org/en/OpenPrinting/MacOSX/hpijs-USB">see this note</a> for more information.</li>
  </ul>
  <h2>Release Notes</h2>
  <ul>
    <li>This release fixes a problem with the PPDs that caused many job   options such as page orientation, color/grayscale mode, duplex printing,   etc. to fail.</li>
    <li>HPIJS is HP's universal printer driver for most of their   non-PostScript printers. It comes as a part of HPLIP, HP Linux Imaging   and Printing.</li>
    <li>The PPDs for HP printers are now sourced from the HPLIP package rather than the OpenPrinting.org database.</li>
    <li>PPDs for printers from other manufacturers are provided by OpenPrinting.org.</li>
    <li>Some printers are only partially supported.  Printers such as<br />
      HP LaserJet 1022<br />
      HP LaserJet p1505n<br />
      HP LaserJet p12014<br />
      HP LaserJet p2035<br />
      require a proprietary plug-in for full support.  This package does not contain or support such plug-ins.</li>
  </ul>
  <p><a name="Printer_Set_Up_Instructions" id="Printer_Set_Up_Instructions"></a></p>
  <h2> Printer Set Up Instructions </h2>
  <p>To add a printer queue, Leopard (Mac OS X 10.5.x) users should use   the Print &amp; Fax from System Preferences. Click on the + (plus) icon   at the lower left. A new window will open. In that window, click the   Default Browser icon at the top left. Highlight your printer in the   section below. Use the &quot;Print Using&quot; pop-up menu near the bottom of the   window to select the correct PPD for your printer and click Add.</p>
  <p>Tiger users should open the Printer Setup Utility and click on the   Add icon at the top of the Printer List window. A new window will open.   In that window, click the Default Browser icon at the top left.   Highlight your printer in the section below. Use the &quot;Print Using&quot;   pop-up menu near the bottom of the window to select the correct PPD for   your printer and click Add.</p>
  <p>Jaguar (OS X 10.2.x) and Panther (OS X 10.3.x) users should open   Print Center (Jaguar) or Printer Setup Utility (Panther), hold down the   Option key, and click the Add Printer button in the Print Center   toolbar. Within the setup sheet, choose Advanced from the top popup   menu; then in the &quot;Device:&quot; popup menu select your printer by name (it   should be the last item in the menu list). Finally, select the correct   PPD from the model browser and click Add.</p>
</div>
</div>
<script>
$(document).ready(function() {  
	$("#scroll_wrap").niceScroll("#scroll_content",{cursorborderradius:"",cursorcolor:"#E1E1E1",boxzoom:false, bouncescroll:false});    
});
</script>

		<?php $code='<style type="text/css">
#scroll_wrap {
        padding: 40px;
        height: 220px;
        width: 300px;
        border: 1px solid #E1E1E1;
        overflow: auto;
}
#scroll_content {
	width:1000px /*This creates the horisontal scroller*/
}
</style>
<div id="scroll_wrap">
  <div id="scroll_content">
  	...
  </div>
</div>
<script>
$(document).ready(function() {  
	$("#scroll_wrap").niceScroll("#scroll_content",{cursorborderradius:"",cursorcolor:"#E1E1E1",boxzoom:false, bouncescroll:false});    
});
</script>'; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>
      </div>
    </div>
    <div id="accordion" class="vtabs-content">
      <div class="tab-title"><i class="icon-tasks"></i><span>Accordion</span></div>
      <div class="tab-body">             
<?php $code='<div id="accordion_1" class="atab sortable">
  <div class="group">
      <div class="atab-item sort-item">Section 1 <input type="hidden" class="sort" value="" /><span class="icon-drag"></span>
      	<div id="accordion_htabs" class="htabs">
            <a href="#accordion_htab_1" class="htab-item">Tab 1</a>
            <a href="#accordion_htab_2" class="htab-item">Tab 2</a>
            <a href="#accordion_htab_3" class="htab-item">Tab 3</a>
        </div>
      </div>
      <div class="atab-content">
        <div class="tab-body">
          <div id="accordion_htab_1" class="htab-content">
            <div class="tab-title"><i class="icon-settings"></i><span>Tab Heading</span></div>
            <div class="tab-body">
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
          </div>
          <div id="accordion_htab_2" class="htab-content">Tab 2</div>
          <div id="accordion_htab_3" class="htab-content">Tab 3</div>
        </div>
      </div>
  </div>
  <div class="group">
      <div class="atab-item  sort-item">Section 2 <input type="hidden" class="sort" value="" /><span class="icon-drag"></span></div>
      <div class="atab-content">
        <div class="tab-title">Section 2</div>
        <div class="tab-body">
          <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
        </div>
      </div>
  </div>
  <div class="group">
      <div class="atab-item sort-item">Section 3 <input type="hidden" class="sort" value="" /><span class="icon-drag"></span></div>
      <div class="atab-content">
        <div class="tab-title">Section 3</div>
        <div class="tab-body">
          <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
        </div>
      </div>
  </div>
</div>  
<script>
  $(function() {
    $( "#accordion_1" )
      .accordion({
        header: "> div > .atab-item",
        autoHeight: false,
        collapsible: true,
        icons: false,
        
      })
      $( "#accordion_1" ).sortable({
        axis: "y",
        handle: ".sort-item",
        placeholder: "ui-state-highlight",
        distance: 5,
        stop: function( event, ui ) {
          ui.item.children( ".sort-item" ).triggerHandler( "focusout" );
			$(this).find(".group").each(function(i, el){
				$(this).find(".sort").val($(el).index())
			});
        }
      });
  });
  $(\'#accordion_htabs a\').tabs({
  		beforeActivate: function( event, ui ) {
        	alert(\'f\')
        }
   })

</script>'; ?>  
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div> 
        <h2>Sortables</h2>
        <p>Use <code>.sortable</code> to create sortable lists. </p>
        <style>#sortable_1{
			width:200px;}</style>
  <?php $code='<div id="sortable_1" class="sortable atab">
      <div class="atab-item sort-item">Section 1 <input type="hidden" class="sort-value" value="" /><span class="icon-drag"></span></div>
      <div class="atab-item sort-item">Section 2 <input type="hidden" class="sort-value" value="" /><span class="icon-drag"></span></div>
      <div class="atab-item sort-item">Section 3 <input type="hidden" class="sort-value" value="" /><span class="icon-drag"></span></div>
</div>  
<script>
  $(function() {
      $( "#sortable_1" ).sortable({
        axis: "y",
        placeholder: "ui-state-highlight",
        distance: 5,
        stop: function( event, ui ) {
          ui.item.children( ".sort-item" ).triggerHandler( "focusout" );
			$(this).find(".sort-item").each(function(i, el){
				$(this).find(".sort-value").val($(el).index())
			});
        }
      });
  });
</script>'; ?>  
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>       
        <h2>Nestable</h2>
        For this option you are required to install Nastable - add this to controlelr <code>$this->document->addScript('view/javascript/shopunity/jquery.nestable.js');</code>
        
        <?php $code='<div class="dd nastable" id="nestable">
<ol class="dd-list">
    <li class="dd-item" data-id="1">
        <div class="dd-content">Item 1 <span class="icon-drag dd-handle" ></span></div>
    </li>
    <li class="dd-item" data-id="2">
        <div class="dd-content">Item 2 <span class="icon-drag dd-handle"></span></div>
        <ol class="dd-list" style="">
            <li class="dd-item" data-id="3"><div class="dd-content">Item 3 <span class="icon-drag dd-handle"></span></div></li>
            <li class="dd-item" data-id="4"><div class="dd-content">Item 4 <span class="icon-drag dd-handle"></span></div></li>
            <li class="dd-item" data-id="5">
                <div class="dd-content">Item 5 <span class="icon-drag dd-handle"></span></div>
                <ol class="dd-list" style="">
                    <li class="dd-item" data-id="6"><div class="dd-content">Item 6 <span class="icon-drag dd-handle" ></span></div></li>
                    <li class="dd-item" data-id="7"><div class="dd-content">Item 7 <span class="icon-drag dd-handle"></span></div></li>
                    <li class="dd-item" data-id="8"><div class="dd-content">Item 8 <span class="icon-drag dd-handle"></span></div></li>
                </ol>
            </li>
            <li class="dd-item" data-id="9"><div class="dd-content">Item 9 <span class="icon-drag dd-handle"></span></div></li>
            <li class="dd-item" data-id="10"><div class="dd-content">Item 10 <span class="icon-drag dd-handle"></span></div></li>
        </ol>
    </li>
    <li class="dd-item" data-id="11">
        <div class="dd-content">Item 11 <span class="icon-drag dd-handle"></span></div>
    </li>
    <li class="dd-item" data-id="12">
        <div class="dd-content">Item 12 <span class="icon-drag dd-handle"></span></div>
    </li>
</ol>
</div>
<div class="form-vertical">
<textarea id="nestable_output" style="height:30px;"></textarea>
</div>
<script>
$(document).ready(function(){
	var updateOutput = function(e){
        var list   = e.length ? e : $(e.target),
            output = list.data(\'output\');
        if (window.JSON) {
            output.val(window.JSON.stringify(list.nestable(\'serialize\')));
        } else {
            output.val(\'JSON browser support required for this demo.\');
        }
    };
    $(\'#nestable\').nestable({
        group: 1
    })
	.on(\'change\', updateOutput);
    
    updateOutput($(\'#nestable\').data(\'output\', $(\'#nestable_output\')));
})
</script>'; ?>  
        <div class="example"><?php echo $code; ?></div>
        <div class="highlight"><?php hyperlight($code, 'php'); ?></div>  
        
      </div>
    </div>
    <div id="graphs" class="vtabs-content">
      <div class="tab-title"><i class="icon-chart-line"></i><span>Graphs</span></div>
      <div class="tab-body">
      <div id="gain-loss-chart" style=" width:300px; height:250px"></div>
     

       </div>
    </div>
  </div>
<script>
$('.vtabs a').tabs();
</script>
<!-- Vtabs-->
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
CKEDITOR.replace('description_1', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

//--></script>
</div>
<?php echo $footer; ?>