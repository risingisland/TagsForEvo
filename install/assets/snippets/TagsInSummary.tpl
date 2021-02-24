//<?php
/**
 * TagsInSummary
 *
 * Snippet to display linked TV Tags in DocLister tpl @code (method 1 call)
 *
 * @category 	snippet
 * @version 	2.5
 * @internal	@properties
 * @internal	@modx_category Navigation
 * @internal    @installset base, sample
 * @author 		risingisland
 */

/****************************************************

Example:
	[[TagsInSummary? &id=`tags` &tags=`[+documentTags+]` &tagsLanding=`50`]]

	(be sure to add "documentTags" to &tvList)
	
****************************************************/

$output = '';
if ($tags != '') {
  $tagsArray = explode(',', $tags);
  $i = 0;
  $len = count($tagsArray);
  while(list($key,$val)=each($tagsArray)){
	$trimval = trim($val);
	$urlencoded_tag = preg_replace('/\s+/', '+', $trimval);
    $tpl = '<a href="[~'.$tagsLanding.'~]?tags='.$urlencoded_tag.'">'.$val.'</a>';
    
    // remove comma from last item
    if ($i == $len - 1) {
      $output .= $tpl;
    }
    
    // every other item
    else {
      $output .= $tpl.', ';
    }
    
    $i++;
  }
}
return $output;
