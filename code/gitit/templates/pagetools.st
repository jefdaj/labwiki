<div class="pageTools">
  <fieldset>
    <!-- <legend>tools</legend> -->

    <!-- <form action="$base$/_go" method="post" id="goform">
      <input type="text" name="gotopage" id="gotopage"/>
      <input type="submit" name="go" id="go" value="go"/>
    </form> -->

    <form action="$base$/_search" method="post" id="searchform">
      <input type="text" name="patterns" id="patterns"/>
      <input type="submit" name="search" id="search" value="search"/>
    </form>

    $exportbox$

    <ul>
      <li><a href="$base$/_index">all pages</a></li>
      <li><a href="$base$/_activity">recent activity</a></li>
      $if(wikiupload)$
      <li><a href="$base$/_upload">upload a file</a></li>
      $endif$
      <li><a href="$base$$pageUrl$?printable$if(revision)$&amp;revision=$revision$$endif$">printable version</a></li>
      <li><a href="$base$/_showraw$pageUrl$$if(revision)$?revision=$revision$$endif$">raw page source</a></li>
      <!-- <li><a href="$base$/_delete$pageUrl$">delete this page</a></li> -->

    <!-- <li><a href="$base$/_categories">categories</a></li> -->

    </ul>
  </fieldset>
</div>
