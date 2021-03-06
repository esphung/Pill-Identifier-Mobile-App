# Pill Identifier

***Images provided by National Library of Medicine***

An ios mobile app for identifying and researching
prescription medications

*Developed by Eric Phung*

#### Possible Data APIs and Contributors
[BioLabeler API](https://www.programmableweb.com/api/biolabeler) <br>
[DailyMed](https://www.programmableweb.com/api/dailymed) <br>
(allows specific drug information by NDC code. Can provide class, ingredients, and ...)
https://dailymed.nlm.nih.gov/dailymed/services/v2/

#### Run Instructions
>Open up ***Pill Identifier App.xcworkspace*** file <br>
Run the simulator on an iphone device in Xcode


#### Resource Links
- [NLM RxIMAGE API](https://lhncbc.nlm.nih.gov/rximage-api) <br>
http://rximage.nlm.nih.gov/api/{apiName}/{apiVersion}/{resourcePath}?{parameters}

- [RzImage API Paramaters](https://rxnav.nlm.nih.gov/RxImageAPIParameters.html)

<!--
#### View Layouts
<img src="./notes/screenies/displaypill.png" alt="display-page" width="100px"/>
<img src="./notes/screenies/originalsearch.png" alt="search-page" width="100px"/>
-->
<!--
![Alt text](./Notes/screenies/displaypill.png)
![Alt text](./Notes/screenies/originalsearch.png)
-->

##### Background Images
<img src="./notes/screenies/cherylbackground.png" alt="page-background" width="100px"/>

#### CocoaPod Libraries

```language
pod 'SwiftyJSON', '~> 4.0'
pod 'ActionSheetPicker-3.0'
pod 'Alamofire', '~> 4.7'
pod 'Kingfisher', '~> 4.0'
```

***Copyright Eric Phung 2018***