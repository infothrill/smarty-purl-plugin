<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html;CHARSET=utf-8">
<title>*purl test case</title>
<meta name="robots" content="noindex, nofollow">
<style type="text/css">
{literal}
<!--
p,a,h1,td,th { font-family: Helvetica,Arial,sans-serif;}
td {
   padding: 5px;
}
th {
    padding: 7px;
    background-color:lightgrey;
};
//-->
{/literal}
</style>
</head>
<body>
<h1>Smarty plugins apurl ppurl demo</h1>
<p>
    This page is a small demo for the <tt>ppurl</tt> and <tt>apurl</tt>
    Smarty plugins
</p>

<p>
    <a href="{$smarty.server.PHP_SELF}">reset all GET parameters</a>
</p>

<table border="1" cellpadding="2" cellspacing="0">
<tr>
   <th>case</th>
   <th>tpl</th>
   <th>output</th>
   <th>link</th>
</tr>
<tr>
    <td>ppurl 1</td>
    <td>{literal}{ppurl}{/literal}</td>
    <td><a href="{ppurl}">{ppurl}</a></td>
</tr>
<tr>
    <td>ppurl 2</td>
    <td>{literal}{ppurl prefix="pre"}{/literal}</td>
    <td>{ppurl prefix="pre"}</td>
</tr><tr>
    <td>ppurl 3</td>
    <td>{literal}{ppurl path="index.php"}{/literal}</td>
    <td>{ppurl path="index.php"}</td>
</tr><tr>
    <td>ppurl 4</td>
    <td>{literal}{ppurl path="index.php" prefix="/somepath/"}{/literal}</td>
    <td>{ppurl path="index.php" prefix="/somepath/"}</td>
</tr><tr>
    <td>ppurl 5</td>
    <td>{literal}{ppurl key="username"}{/literal}</td>
    <td><a href="{ppurl key="username"}">{ppurl key="username"}</a></td>
</tr><tr>
    <td>ppurl 6</td>
    <td>{literal}{ppurl key="username" value="john"}{/literal}</td>
    <td><a href="{ppurl key="username" value="john"}">{ppurl key="username" value="john"}</a></td>
</tr><tr>
    <td>ppurl 7</td>
    <td>{literal}{ppurl key="list[]" value="1"}{/literal}</td>
    <td><a href="{ppurl key="list[]" value="1"}">{ppurl key="list[]" value="1"}</a></td>
</tr><tr>
    <td>ppurl 8</td>
    <td>{literal}{ppurl url="/index.php?removeme=fubar" key="removeme"}{/literal}</td>
    <td>{ppurl url="/index.php?removeme=fubar" key="removeme"}</td>
</tr><tr>
<td style="text-align:center;" colspan="4"><tt><strong>apurl</strong></tt> assigns a template variable, so the output changes with every row. Also, <tt><strong>apurl</strong></tt> does not escape the output, so it needs to be fed through the modifier <tt>|escape:'html'</tt></td>
</tr><tr>
    <td>apurl 1</td>
    <td>{literal}{apurl var="zeeurl"} {$zeeurl|escape:'html'}{/literal}</td>
    <td>{apurl var="zeeurl"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr><tr>
    <td>apurl 2</td>
    <td>{literal}{apurl var="zeeurl" key="A"} {$zeeurl|escape:'html'}{/literal}</td>
    <td>{apurl var="zeeurl" key="A"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr><tr>
    <td>apurl 3</td>
    <td>{literal}{apurl var="zeeurl" key="sid" value="123456789"} {$zeeurl|escape:'html'}{/literal}</td>
    <td>{apurl var="zeeurl" key="sid" value="123456789"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr><tr>
    <td>apurl 4</td>
    <td>{literal}{apurl var="zeeurl" url=$zeeurl key="BLA" value="---"} {$zeeurl|escape:'html'}{/literal}</td>
    <td>{apurl var="zeeurl" url=$zeeurl key="BLA" value="---"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr><tr>
    <td>apurl 5</td>
    <td>{literal}{apurl var="zeeurl" url=$zeeurl key="BLA"} {$zeeurl|escape:'html'}}{/literal}</td>
    <td>{apurl var="zeeurl" url=$zeeurl key="BLA"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr><tr>
    <td>apurl 6</td>
    <td>{literal}{apurl var="zeeurl" url=$zeeurl path="bla.php"} {$zeeurl|escape:'html'}{/literal}</td>
    <td>{apurl var="zeeurl" url=$zeeurl path="bla.php"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr><tr>
    <td>apurl 7</td>
    <td>{literal}{apurl var="zeeurl" url=$zeeurl prefix="/somepath/"} {$zeeurl|escape:'html'}{/literal}</td>
    <td>{apurl var="zeeurl" url=$zeeurl prefix="/somepath/"}<a href="{$zeeurl|escape:'html'}">{$zeeurl|escape:'html'}</a></td>
</tr>
</table>
</body>
</html>
