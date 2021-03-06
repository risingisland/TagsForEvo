# TagsForEvo
Add tags to documents, display tags in DocLister, display tags in pages, and include a tag-cloud.

Fashened to replace the old Ditto Blog tags with Doclister for Evo v1.4.12 and above.


## Included in Package:
**Snippets:** 
* **TagsLandingPage:** Call to display in Landing Page
* **TagsCloud:** Call to add a Tag-Cloud
* **TagsInPage:** Call to add the tags to pages & summaries
* **TagsInSummary:** Secondary method to include in summaries

**TVs:** 
* **documentTags:** TV to add comma seperated tags to documents

**Chunks:** 
* **TagsLandingPageTPL:** Template used for "TagsLandingPage" call



# How to setup...

#### NOTE: the tutorial is based and tested on Evolution v1.4.12 & v2.04 demo content

## 1. Create Tags Landing Page

* Create new Resource named, for example, "Tags".

(A few recomendations, but not required: un-mark "Show in menu" & "Rich-text".)

* Include the following call from "TagsLandingPage" Snippet:

```
<h2>You are viewing tags for: <span style="color:green;">[+tags+]<span></h2><hr>
[[TagsLandingPage?
	&parents=`2`
	&display=`2`
	&depth=`4`
	&tagTV=`documentTags`
	&tvList=`image,documentTags`
	&summary=`notags,len:350`
	&tpl=`TagsLandingPageTPL`
	&paginate=`1`
]]
```



* Include the needed "TagsInPage" call to  to the summary template to display the tags:

```
[[TagsInPage? &id=`[+id+]` &value=`[+documentTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
```

Where "documentTags" is the name of the TV that includes you tags and "50" is the ID of your tags landing page.


* Adjust the landing pages summary template chunk "TagsLandingPageTPL" to your needs:

Example:
```
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
```



## 2. Add Tag-Cloud

* Include the following "TagsCloud" Snippet call into the desired page template:

(For example, page sidebar.)

```
<h2>Tag-Cloud:<h2>
[!TagsCloud? &parent=`2` &landing=`50` &tvTags=`documentTags` &showCount=`0`!]
<hr>
```

## 3. Display Tags in Page

* Include the following call into the desired page template:

```
[[TagsInPage? &tv=`documentTags` &separator=`, ` &path=`50` &label=`Tags: `]]
```

## 4. Adding Tags to your DocLsiter call


#### Method 1:

* If your &tpl is referencing a Chunk template
* Recommended method because of how Evo's parsing order.

If &tpl is refferencing a Chunk, include the "TagsInPage" Snippet:

```
[[TagsInPage? &id=`[+id+]` &value=`[+documentTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
```

Example:
```
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
```


#### Method 2:

* If your &tpl is using @CODE

If @CODE is being used, include the "TagsInSummary" Snippet:

```
[[TagsInSummary? &id=`tags` &tags=`[+documentTags+]` &tagsLanding=`50`]]
```

Example:
```
[[DocLister? 
	&jotcount=`1`
	&parents=`2` 
	&display=`2`
	&tvPrefix=``
	&tvList=`image,documentTags`
	&prepare=`prepareBlog`
	&summary=`notags,len:350` 
	//&tpl=`TagsLandingPageTPL`
	&tpl=`@CODE:
		<div class="dl_summaryPost">
			[+blog-image+]	
			<h3><a href="[~[+id+]~]" title="[+e.title+]">[+e.title+]</a></h3>
			<div class="dl_info">
				By <strong>[+author+]</strong> on [+date+].
				<a href="[+url+]#commentsAnchor">Comments <span class="badge">[+jotcount+]</span></a><br>
				<!-- Start Tags -->
				Tags: [[TagsInSummary? &id=`tags` &tags=`[+documentTags+]` &tagsLanding=`50`]]
				<!-- End Tags -->
			</div>
			[+summary+]
			<p class="dl_link">[+link+]</p>
		</div>` 
	&paginate=`1` 
]]
```


#### Credits and Side Notes:

Most of the credit for this package goes to [@Nicola1971](https://github.com/Nicola1971) and his [Doclister-Tags-in-Ditto-Style](https://github.com/Nicola1971/Doclister-Tags-in-Ditto-Style)

Files were cleaned up and renamed for a more logical deployment. As well as a few minor fixes and adjustments.