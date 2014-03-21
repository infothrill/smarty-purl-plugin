<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.apurl.php
 * Type:     function
 * Name:     apurl
 * Version:  2.0.1
 * Date:     March, 2014
 * Purpose:  modify key/value pairs of a URL
 *           Example:
 *           {apurl var="test" url="index.php?l=EN" key="print" value="1"}
 *           assigns the string "index.php?l=EN&print=1"
 *           to the template variable {$test}
 * Params:   var:    string, name of the template variable to assign to
 *           url:    string, any URL which should be worked on
 *           key:    string, name of a GET parameter to change
 *           value:  string, value for GET parameter 'key'
 *           path:   string, specifies a new path for URL
 *           prefix: string, prefixed before 'path'
 * Hints:    - if url is omitted, the current URL (including GET) is taken
 *           - if value for a key is omitted, the key is deleted, e.g.:
 *             {apurl var="test" url="index.php?print=1" key="print"}
 *             assigns the string "index.php" to {$test}
 *           - if path is omitted, basename('url') is used
 *           - prefix is handy if you use a template variable for absolute
 *             URL's instead of relative URL's
 *           - new parameters get urlencoded automatically
 * Bugs:     The whole thing only works if you use '&' as seperator for GET
 *           parameters, '&amp;' will _not_ work. (In fact this is not a bug,
 *           as the URL generated is syntactically correct, but not
 *           syntactically correct html). Therefore, when outputting the
 *           asigned variable, it needs to be escaped like so:
 *           {$variable|escape:'html'}
 * Install:  Drop into the plugin directory.
 *           (requires shared.url_parameters.php)
 * Author:   Paul Kremer (pkremer !At! spurious !DOT! biz)
 * -------------------------------------------------------------
 */
function smarty_function_apurl($params, &$smarty)
{
    if (method_exists($smarty, '_get_plugin_filepath')) {
        //handle with Smarty version 2
        require_once $smarty->_get_plugin_filepath('shared','url_parameters');
    } else {
        //handle with Smarty version 3 beta 8
        foreach ($smarty->plugins_dir as $value) {
            $filepath = $value ."/shared.url_parameters.php";
            if (file_exists($filepath)) {
                require_once $filepath;
            }
        }
    } 
	extract($params);
	if (!isset($url)) {
		$nurl = new Smarty_Url_Parameters();
	} else {
		$nurl = new Smarty_Url_Parameters($url);
	}

	if (empty($var)) {
		$smarty->trigger_error("assign: missing 'var' parameter");
		return;
	}

	if (empty($url)) {
		$nurl->fromCurrent();
	}

	if (!in_array('value', array_keys($params))) {
		if (isset($key))
			$nurl->setParameter($key,false);
	} else {

		if (!in_array('key', array_keys($params))) {
			$smarty->trigger_error("assign: missing 'key' parameter");
			return;
		}

		$nurl->setParameter($key,$value);
	}

	if (!in_array('path', array_keys($params))) {
		$path = $nurl->getBasename();
	}

	if (in_array('prefix', array_keys($params))) {
		$path = $prefix . $path;
	}

	if ($path != '') {
		$nurl->setBasename($path);
	}

	$smarty->assign($var, $nurl->getUrl());
}
?>