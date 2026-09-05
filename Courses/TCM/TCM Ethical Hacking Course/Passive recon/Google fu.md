---
tags:
  - passive-recon
  - google-dorking
  - osint
  - reconnaissance
  - course/tcm-academy
---
# Google fu
![](Google%20fu%201mC983bOvmg7a7R9aXkp)

1- site: It tells Google to search pages in a particular web domain.
--------------------------------------------------------------------

**Example**: [site:ebay.com/gadgets](https://www.google.com/search?rlz=1C1CHBF_enIN760IN761&sxsrf=ACYBGNSqOKmR95MpVfgpsVXZcaMfGiDMbA%3A1573825364531&ei=VKvOXfqOH4zTz7sPvM2SwAs&q=site%3Aebay.com%2Fgadgets&oq=site%3Aebay.com%2Fgadgets&gs_l=psy-ab.3...3889.8859..9637...0.0..0.227.2586.0j9j4......0....1..gws-wiz.KI-Ohzhd_Vk&ved=0ahUKEwj6iKmurOzlAhWM6XMBHbymBLgQ4dUDCAs&uact=5)

Pro tip: “[+www.ebay.+com](https://www.google.com/search?q=%2Bwww.ebay.%2Bcom&rlz=1C1CHBF_enIN760IN761&oq=%2Bwww.ebay.%2Bcom&aqs=chrome..69i57j69i65&sourceid=chrome&ie=UTF-8)" — (tells you how many pages of your site are indexed by google)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2- intitle: It tells Google to search results within a given word.
------------------------------------------------------------------

**Example**: [intitle:Oneplus](https://www.google.com/search?q=intitle%3AOneplus&rlz=1C1CHBF_enIN760IN761&oq=intitle%3AOneplus&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

3- inurl: It tells Google to search results for a word in the url.
------------------------------------------------------------------

**Example**: [inurl:JBL headphones](https://www.google.com/search?q=inurl%3AJBL+headphones&rlz=1C1CHBF_enIN760IN761&oq=inurl%3AJBL+headphones&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

4- intext: It tells Google to search word in any content available though you can use other operators.
------------------------------------------------------------------------------------------------------

**Example**: [intext:chernobyl](https://www.google.com/search?q=intext%3Achernobyl&rlz=1C1CHBF_enIN760IN761&oq=intext%3Achernobyl&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

5- inanchor: It tells Google to search results with anchor text with Inbound links.
-----------------------------------------------------------------------------------

**Example**: [inanchor: Google Chromebook](https://www.google.com/search?q=inanchor%3A+Google+Chromebook&rlz=1C1CHBF_enIN760IN761&oq=inanchor%3A+Google+Chromebook&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

6- allintitle: It tells Google to search results for a product or a niche when you want to know the Competition.
----------------------------------------------------------------------------------------------------------------

**Example**: [allintitle:chromebook](https://www.google.com/search?q=allintitle%3Achromebook&rlz=1C1CHBF_enIN760IN761&oq=allintitle%3Achromebook&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

7- allinurl: It tells Google to search results for all the words containing in the url.
---------------------------------------------------------------------------------------

**Example**: [allinurl:google chromebook](https://www.google.com/search?q=allinurl%3Agoogle+chromebook&rlz=1C1CHBF_enIN760IN761&oq=allinurl%3Agoogle+chromebook&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

8- allintext: It tells Google to search results containing all the words in the web pages.
------------------------------------------------------------------------------------------

**Example**: [allintext:google chromebook](https://www.google.com/search?q=allintext%3Agoogle+chromebook&rlz=1C1CHBF_enIN760IN761&oq=allintext%3Agoogle+chromebook&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

9- filetype: It tells Google to provide results in any Format given in the query.
---------------------------------------------------------------------------------

**Example**: [filetype:pdf population state USA](https://www.google.com/search?q=filetype%3Apdf+population+state+USA&rlz=1C1CHBF_enIN760IN761&oq=filetype%3Apdf+population+state+USA&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

10- ext: Similar to Filetype
----------------------------

**Example**: [ext:pdf population state USA](https://www.google.com/search?q=ext%3Apdf+population+state+USA&rlz=1C1CHBF_enIN760IN761&oq=ext%3Apdf+population+state+USA&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

11- daterange: It tells Google to search results of Date range or years when given.
-----------------------------------------------------------------------------------

**Example**: [Michael Jackson 1995..2005](https://www.google.com/search?q=Michael+Jackson+1995..2005&rlz=1C1CHBF_enIN760IN761&oq=Michael+Jackson+1995..2005&aqs=chrome..69i57&sourceid=chrome&ie=UTF-8)

12- date: Similar to Daterange
------------------------------

**Example**: [Michael Jackson 1995–2005](https://www.google.com/search?q=Michael+Jackson+1995-2005&rlz=1C1CHBF_enIN760IN761&oq=Michael+Jackson+1995-2005&aqs=chrome..69i57&sourceid=chrome&ie=UTF-8)

Note: The results are different though.

13- weather: It tells Google to search weather Forecast for the place given or the zipcode.
-------------------------------------------------------------------------------------------

**Example**: [weather:84180](https://www.google.com/search?q=weather%3A84180&rlz=1C1CHBF_enIN760IN761&oq=weather%3A84180&aqs=chrome..69i57&sourceid=chrome&ie=UTF-8) or [weather:germany](https://www.google.com/search?q=weather%3Agermany&rlz=1C1CHBF_enIN760IN761&oq=weather%3Agermany&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

14- **Around(x): Most of the time it tells Google to limit results to pages that contain search words within X words of each other.X just defines the range or no of words.**

**Example**: [googlefu Around(5) technique](https://www.google.com/search?q=googlefu+Around%285%29+technique&rlz=1C1CHBF_enIN760IN761&oq=googlefu+Around%285%29+technique&aqs=chrome..69i57j69i59&sourceid=chrome&ie=UTF-8)

15- Stocks: It tells Google to search results about Stocks.
-----------------------------------------------------------

**Example**: [stock:facebook](https://www.google.com/search?q=stock%3Afacebook&rlz=1C1CHBF_enIN760IN761&oq=stock%3Afacebook&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

16- map: It tells Google to search results for a particular given Place.
------------------------------------------------------------------------

**Example**: [map:barcelona](https://www.google.com/search?q=map%3Abarcelona&rlz=1C1CHBF_enIN760IN761&oq=map%3Abarcelona&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

17- movie: It tells Google to search results for Movies.
--------------------------------------------------------

**Example**: [movie:Iron man](https://www.google.com/search?q=movie%3AIron+man&rlz=1C1CHBF_enIN760IN761&oq=movie%3AIron+man&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8) or [movie:\[zipcode\]](https://www.google.com/search?rlz=1C1CHBF_enIN760IN761&sxsrf=ACYBGNSooK7h__sXf-IBtdXFLMsJclhJQg%3A1573825932186&ei=jK3OXZ_5CuDFz7sP99GzwA0&q=movie%3A713304&oq=movie%3A713304&gs_l=psy-ab.3...16801.19964..20244...0.2..0.278.2237.0j7j4......0....1..gws-wiz.......0i71j0i273j0i67j0j0i131.6X-oP-tSNGs&ved=0ahUKEwif74C9ruzlAhXg4nMBHffoDNgQ4dUDCAs&uact=5)

18- convert: It tells Google to convert Currency and Uunits.
------------------------------------------------------------

**Example**: [convert: usd..inr](https://www.google.com/search?q=convert%3A+usd..inr&rlz=1C1CHBF_enIN760IN761&oq=convert%3A+usd..inr&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8) or [convert:ton..kg](https://www.google.com/search?q=convert%3Aton..kg&rlz=1C1CHBF_enIN760IN761&oq=convert%3Aton..kg&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

19- source: It tells Google to find the sources of a topic or an article.
-------------------------------------------------------------------------

**Example**: [source:how to be a google-fu](https://www.google.com/search?q=source%3Ahow+to+be+a+google-fu&rlz=1C1CHBF_enIN760IN761&oq=source%3Ahow+to+be+a+google-fu&aqs=chrome..69i57j69i58&sourceid=chrome&ie=UTF-8)

20- **Hastags: It tells Google to find articles, photos, post & blogs which has been tagged by someone.**

