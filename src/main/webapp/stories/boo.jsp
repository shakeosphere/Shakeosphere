<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="estc" uri="http://icts.uiowa.edu/ESTCTagLib"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakeosphere</title>
<style type="text/css" media="all">
@import "../resources/style.css";
</style>
</head>
<body>
	<div id="body">
		<jsp:include page="../header.jsp" flush="true" />
		<jsp:include page="../menu.jsp" flush="true">
			<jsp:param name="caller" value="person" />
		</jsp:include>
		<div id="center">
			<h2>
				"Boo!": Using <i>Shakeosphere</i> to Scare Up the Origins of a
				Halloween Refrain
			</h2>
			<h4><i>Blaine Greteman</i></h4>

			<p>
				This Friday, October 31, National Public Radio's "<a href="http://www.npr.org/programs/all-things-considered/">All
				Things Considered</a>" is running a story on the history of the word
				"boo," and their producers reached out to <i>Shakeosphere</i> for
				help. The process highlighted several important aspects of our
				project and the ESTC dataset that I thought were worth addressing.
				Let's take a look at the tricks <i>Shakeosphere</i> can do and the
				treats it can offer a researcher &ndash; and also some of the spooky
				surprises that can still waylay the unwary.
			</p>

			<p>
				First, it is fascinating that <i>Shakeosphere</i> has so quickly
				become a place where people go to find basic information about
				historical texts, as opposed to established resources like the
				English Short Title Catalogue. In this case, NPR producers wanted to
				learn more about <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=4394">Gilbert Crokatt's</a> <i>Scottish Presbyterian
				Eloquence Display'd,</i> which the Oxford English Dictionary lists as
				the first documented source to use the word "Boo" in the way we now
				do on Halloween. Crokatt ridicules a Scottish minister for using
				unintentionally hilarious colloquialisms in his sermons, such as
				"God without Christ is a boo." "Boo is a word," Crokatt adds, "used
				in the North of Scotland to frighten crying Children."
			</p>

			<p>
				The OED lists the publication of this tract in 1718, but we were
				quickly able to see that an earlier version was published in 1692,
				under the pseudonym <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=13296">Jacob Curate</a>.
				In fact, as I dug around further
				in our data and in the EEBO-TCP corpus, I found several other
				versions of "boo" that might be contenders for an earlier use, and
				curiously they are all, like <i>The Scottish Presbyterian
				Eloquence,</i> in the genre of satirical religious polemic. A 1672 poem
				by the nonconformist <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=6101">Robert Wild</a> ridicules timid Protestants who
				fear that "The Pope's Raw-head-and-bloody-bones cry Boh Behind the
				door!" Even earlier, in 1588 the infamous <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=14069">Martin Marprelate</a> &ndash; who
				helped transform English religious polemic from a dry and scholarly
				affair into a satirical blood sport &ndash; ridiculed a Bishop who was
				too timid to say "bo to a goose." In both the earlier examples, "bo"
				rhymes with "go," but they are all curiously like our own use of
				"boo" in their sense of knowing irony &ndash; no one is really afraid
				of the ghost who says "boo," and that is part of the fun. If Crokatt
				is working in an established tradition, though, the OED rightly
				identifies his particular use, pronunciation, and association with
				children as the most direct pipeline to our own trick or treaters,
				and <i>Shakeosphere</i> helps to clarify why this is the case.
			</p>

			<p>
				I used <i>Shakeosphere</i> to generate a network map for the 1692.
				This detail shows the cluster containing the <i>Scottish Presbyterian
				Eloquence:</i>
			</p><img alt="Force graph of 1692 authors, printers, publishers and booksellers" src="boo.png">

			<p>What can we learn from this, that we couldn't learn, for
				example, by searching in the ESTC? I asked Dave Eichmann's student Charisse Madlock-Brown,
				who is finishing up her PhD in Health Informatics at Iowa, to run
				some network analytics on this text and see what she found. She
				started by measuring the degree of "betweenness" of everyone in
				Crokatt's network. Betweenness is the number of shortest paths from
				between other nodes that pass through a given node, and in Crokett's
				network, one name that jumped to the top is <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=57810">Randall Taylor</a>. In the
				graph above, Taylor is the big red dot, with lots of little dots
				clustering around him. The big green dot is <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=734">Richard Bentley</a>,
				slightly more distantly connected to Crokatt, but also with a very
				high degree of betweenness, as is clearly indicated by the size of
				the node. (<a href="http://shakeosphere.lib.uiowa.edu/publicationYear.jsp?year=1692&count=1681">Click
				here</a> for the live version of the 1692 network map.)</p>

			<p>I would propose that "betweenness" could be connected to
				"Halloweenness." That is, if we want to know why our children say
				"boo" today, and not "bo," these nodes are both important &ndash;
				because they helped make the <i>Scotch Presbyterian Eloquence</i> what we
				might call a "viral" work, republished dozens of times, and read by
				everyone from <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=14161">Samuel Pepys</a>
				to <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=293">Jonathan Swift</a>, who both owned copies.
				While Crokatt himself was a curate of a church in London and is
				basically unknown today, Taylor was one of the first "trade
				publishers," specializing mostly in publishing works in support of
				the government, an unofficial part of <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=10541">Roger L'Estrange's</a> propaganda
				machine. When we run network analysis, we find that Crokatt is also connected
				to <a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=28057">Richard Baldwin</a> &ndash; another of the new breed of "publishers"
				remaking the industry, while Richard Bentley was among the most
				successful booksellers of his era. Known as "Novel Bentley" because
				of his specialization in early novels, Bentley held an interest in
				many important literary works, from Shakespeare to Milton.</p>

			<p>
				And now for that note of caution. In running this analysis, we also
				generated some distinctly weird results, which could perhaps
				appropriately be summed up by the phrase "double, double, toil and
				trouble." First the doubles: alongside Taylor, Bentley, and the
				others, Charisse's data analysis for example produced very high
				betweenness results for "<a href="http://shakeosphere.lib.uiowa.edu/persons/person.jsp?pid=3377">J. Johnson</a>." In fact this was our top
				result. But that is because so many printers and publishers, for
				such a long stretch of time, were identified by this common name
				&ndash; and our data extraction technique has not yet differentiated
				them. We have J. Johnsons who were active in the early 1600s, the
				late 1600s, and all the way up to the 1780s. Clearly these are not
				all the same person, and one of our next tasks will be able to
				differentiate them using date and location limitations. The other
				problem is that <i>Shakeosphere</i> did not originally pick up
				Crokatt's own double, the pseudonymous "Jacob Curate." And in that
				trouble lies the toil: we will need to find a way to associate
				pseudonyms more firmly with authoritative author IDs, but for the
				time being it still takes a human reader to sort out this ambiguity.
			</p>



			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</div>
</body>