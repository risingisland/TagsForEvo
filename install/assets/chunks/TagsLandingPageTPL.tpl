/**
 * TagsLandingPageTPL
 *
 * Tags landing page template
 *
 * @version   	2.5
 * @category	chunk
 * @internal	@modx_category Navigation
 * @internal 	@installset base, sample
 * @author 		risingisland
 */

<div class="dl_summaryPost">
	[+blog-image+]	
	<h3><a href="[~[+id+]~]" title="[+e.title+]">[+e.title+]</a></h3>
	<div class="dl_info">
		By <strong>[+user.username.createdby+]</strong> on [+date+].
		<a href="[+url+]#commentsAnchor">Comments <span class="badge">[+jotcount+]</span></a>
		<!-- Start Tags -->
		[[TagsInPage? &id=`[+id+]` &value=`[+documentTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
		<!-- End Tags -->
	</div>
	[+summary+]
	<p class="dl_link">[+link+]</p>
</div>
