# TagsForEvo
Add tags to documents, display tags in DocLister, display tags in pages, and include a tag-cloud.

Fashened to replace the old Ditto Blog tags with Doclister for Evo v1.4.12 and above.


## Included in Package:
**Snippets:** 
* **TagsLandingPage:** Call to display in Landing Page
* **TagsCloud:** Call to add a Tag-Cloud
* **TagsInSummary:** 
* **TagsInPage:** 

**TVs:** 
* **docTags:** TV to add comma seperated tags to documents

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
	&tagTV=`docTags`
	&tvList=`image,docTags`
	&summary=`notags,len:350`
	&tpl=`TagsLandingPageTPL`
	&paginate=`1`
]]
```



* Include the needed "TagsInPage" call to  to the summary template to display the tags:

```
[[TagsInPage? &id=`[+id+]` &value=`[+docTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
```

Where "docTags" is the name of the TV that includes you tags and "50" is the ID of your tags landing page.


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
		[[TagsInPage? &id=`[+id+]` &value=`[+docTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
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
[!TagsCloud? &parent=`2` &landing=`50` &tvTags=`docTags` &showCount=`0`!]
<hr>
```

## 3. Display Tags in Page

* Include the following call into the desired page template:

```
[[TagsInPage? &tv=`docTags` &separator=`, ` &path=`50` &label=`Tags: `]]
```

## 4. Adding Tags to your DocLsiter call

#### Method 1:

* If your &tpl is using @CODE

If @CODE is being used, include the "TagsInSummary" Snippet:

```
[[TagsInSummary? &id=`tags` &tags=`[+docTags+]` &tagsLanding=`50`]]
```

Example:
```
[[DocLister? 
	&jotcount=`1`
	&parents=`2` 
	&display=`2`
	&tvPrefix=``
	&tvList=`image,docTags`
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
				Tags: [[TagsInSummary? &id=`tags` &tags=`[+docTags+]` &tagsLanding=`50`]]
				<!-- End Tags -->
			</div>
			[+summary+]
			<p class="dl_link">[+link+]</p>
		</div>` 
	&paginate=`1` 
]]
```

#### Method 2:

* If your &tpl is referencing a Chunk template

If &tpl is refferencing a Chunk, include the "TagsInPage" Snippet:

```
[[TagsInPage? &id=`[+id+]` &value=`[+docTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
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
		[[TagsInPage? &id=`[+id+]` &value=`[+docTags+]` &separator=`, ` &path=`50` &label=`Tags: `]]
		<!-- End Tags -->
	</div>
	[+summary+]
	<p class="dl_link">[+link+]</p>
</div>
```


#### Credits and Side Notes:

Most of the credit for this package goes to [@Nicola1971](https://github.com/Nicola1971) and his [Doclister-Tags-in-Ditto-Style](https://github.com/Nicola1971/Doclister-Tags-in-Ditto-Style)

Files were cleaned up and renamed for a more logical deployment. As well as a few minor fixes and adjustments.