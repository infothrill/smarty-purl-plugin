<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.ppurl.php
 * Type:     function
 * Name:     ppurl
 * Version:  2.0
 * Date:     February, 2014
 * Purpose:  print an URL with added/deleted key/value pairs
 *           Example:
 *           {ppurl url="index.php?l=EN" key="print" value="1"}
 *           prints the string "index.php?l=EN&print=1"
 * Params:   url:    string, any URL which should be worked on
 *           key:    string, name of a GET parameter to change
 *           value:  string, value for GET parameter 'key'
 *           path:   string, specifies a new path for URL
 *           prefix: string, prefixed before 'path'
 * Hints:    - if url is omitted, the current URL (including GET) is taken
 *           - if value for a key is omitted, the key is deleted, e.g.:
 *             {ppurl url="index.php?print=1" key="print"}
 *             prints the string "index.php"
 *           - if path is omitted, basename('url') is used
 *           - prefix is handy if you use a template variable for absolute
 *             URL's instead of relative URL's
 *           - new parameters get urlencoded automatically
 *           - this escapes ampersand automatically as opposed to 'apurl'
 * Install:  Drop into the plugin directory.
 *           (requires shared.url_parameters.php)
 * Author:   Paul Kremer (pkremer !At! spurious !DOT! biz)
 * -------------------------------------------------------------
 */

function smarty_function_ppurl($params, &$smarty)
{
	require_once $smarty->_get_plugin_filepath('shared','url_parameters');
	extract($params);
	if (!isset($url)) {
		$nurl = new Smarty_Url_Parameters();
	} else {
		$nurl = new Smarty_Url_Parameters($url);
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

	return $nurl->getUrl(true);
}
?>