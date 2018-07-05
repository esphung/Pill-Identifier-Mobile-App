Pill Identifier
=

* An ios mobile app for identifying and researching presription medications
* Developed by Eric Phung.

<!-- [Hello Google](https://www.google.com/ "google https url")
	***https://www.google.com/***
-->

![Screens/displaypill.png](./Screens/displaypill.png)
<img src="./Screens/displaypill.png" alt="drawing" width="200px"/>

CocoaPod Libraries:
---
- pod 'SwiftyJSON', '~> 4.0'
- pod 'ActionSheetPicker-3.0'
- pod 'Alamofire', '~> 4.7'
- pod 'Kingfisher', '~> 4.0'



Sample Json
---
```json
{
  "nlmRxImages": [
    {
      "acqDate": "06-02-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185638985,
      "imageSize": 511169,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00069-4210-30_RXNAVIMAGE10_641DB26D.jpg",
      "labeler": "Pfizer Laboratories, Division of Pfizer Inc",
      "name": "sildenafil 50 MG Oral Tablet [Viagra]",
      "ndc11": "00069-4210-30",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00069-4210",
          "ndc9": [
            "21695-0157",
            "54868-4084",
            "55289-0577",
            "63629-2640",
            "67544-0355"
          ]
        }
      ],
      "rxcui": 213270,
      "splRootId": "ac8087a0-ea3e-464b-b322-6a89c8ce9c01",
      "splSetId": "0b0be196-0c62-461c-94f4-9a35339b4501",
      "splVersion": 18
    },
    {
      "acqDate": "06-02-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185638972,
      "imageSize": 501270,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00069-4200-30_RXNAVIMAGE10_601DB05D.jpg",
      "labeler": "Pfizer Laboratories, Division of Pfizer Inc",
      "name": "sildenafil 25 MG Oral Tablet [Viagra]",
      "ndc11": "00069-4200-30",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00069-4200",
          "ndc9": [
            "43063-0256",
            "43353-0764",
            "54868-4784",
            "55154-2727"
          ]
        }
      ],
      "rxcui": 213269,
      "splRootId": "ac8087a0-ea3e-464b-b322-6a89c8ce9c01",
      "splSetId": "0b0be196-0c62-461c-94f4-9a35339b4501",
      "splVersion": 18
    },
    {
      "acqDate": "06-02-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185638888,
      "imageSize": 531407,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00069-4220-30_RXNAVIMAGE10_411DA09D.jpg",
      "labeler": "Pfizer Laboratories, Division of Pfizer Inc",
      "name": "sildenafil 100 MG Oral Tablet [Viagra]",
      "ndc11": "00069-4220-30",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00069-4220",
          "ndc9": [
            "21695-0158",
            "49999-0316",
            "52125-0494",
            "54868-4706",
            "55154-2736",
            "55289-0524",
            "63629-1792",
            "67544-0356",
            "54569-4570",
            "50090-0619"
          ]
        }
      ],
      "rxcui": 213271,
      "splRootId": "ac8087a0-ea3e-464b-b322-6a89c8ce9c01",
      "splSetId": "0b0be196-0c62-461c-94f4-9a35339b4501",
      "splVersion": 18
    },
    {
      "acqDate": "12-07-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185655619,
      "imageSize": 481209,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00093-7248-06_RXNAVIMAGE10_7829BC3D.jpg",
      "labeler": "Teva Pharmaceuticals USA Inc",
      "name": "lamotrigine 200 MG Oral Tablet",
      "ndc11": "00093-7248-06",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00093-7248",
          "ndc9": [
            "00615-7547",
            "16590-0777",
            "24236-0945",
            "54868-5955"
          ]
        }
      ],
      "rxcui": 198429,
      "splRootId": "26fd988c-cd4d-4de4-8555-9f9a2c787fd6",
      "splSetId": "14799df4-c425-4946-9168-9028c1f2e571",
      "splVersion": 20
    }
  ],
  "replyStatus": {
    "date": "2018-06-27 10:04:54 GMT",
    "imageCount": 4,
    "matchedTerms": {
      "color": "BLUE",
      "shape": "DIAMOND"
    },
    "success": true,
    "totalImageCount": 4
  }
}
```
[]: {
  "nlmRxImages": [
    {
      "acqDate": "06-02-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185638985,
      "imageSize": 511169,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00069-4210-30_RXNAVIMAGE10_641DB26D.jpg",
      "labeler": "Pfizer Laboratories, Division of Pfizer Inc",
      "name": "sildenafil 50 MG Oral Tablet [Viagra]",
      "ndc11": "00069-4210-30",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00069-4210",
          "ndc9": [
            "21695-0157",
            "54868-4084",
            "55289-0577",
            "63629-2640",
            "67544-0355"
          ]
        }
      ],
      "rxcui": 213270,
      "splRootId": "ac8087a0-ea3e-464b-b322-6a89c8ce9c01",
      "splSetId": "0b0be196-0c62-461c-94f4-9a35339b4501",
      "splVersion": 18
    },
    {
      "acqDate": "06-02-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185638972,
      "imageSize": 501270,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00069-4200-30_RXNAVIMAGE10_601DB05D.jpg",
      "labeler": "Pfizer Laboratories, Division of Pfizer Inc",
      "name": "sildenafil 25 MG Oral Tablet [Viagra]",
      "ndc11": "00069-4200-30",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00069-4200",
          "ndc9": [
            "43063-0256",
            "43353-0764",
            "54868-4784",
            "55154-2727"
          ]
        }
      ],
      "rxcui": 213269,
      "splRootId": "ac8087a0-ea3e-464b-b322-6a89c8ce9c01",
      "splSetId": "0b0be196-0c62-461c-94f4-9a35339b4501",
      "splVersion": 18
    },
    {
      "acqDate": "06-02-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185638888,
      "imageSize": 531407,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00069-4220-30_RXNAVIMAGE10_411DA09D.jpg",
      "labeler": "Pfizer Laboratories, Division of Pfizer Inc",
      "name": "sildenafil 100 MG Oral Tablet [Viagra]",
      "ndc11": "00069-4220-30",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00069-4220",
          "ndc9": [
            "21695-0158",
            "49999-0316",
            "52125-0494",
            "54868-4706",
            "55154-2736",
            "55289-0524",
            "63629-1792",
            "67544-0356",
            "54569-4570",
            "50090-0619"
          ]
        }
      ],
      "rxcui": 213271,
      "splRootId": "ac8087a0-ea3e-464b-b322-6a89c8ce9c01",
      "splSetId": "0b0be196-0c62-461c-94f4-9a35339b4501",
      "splVersion": 18
    },
    {
      "acqDate": "12-07-2012",
      "attribution": "National Library of Medicine | Lister Hill National Center for Biomedical Communications | Office of High Performance Computing and Communications | Medicos Consultants LLC",
      "id": 185655619,
      "imageSize": 481209,
      "imageUrl": "https://rximage.nlm.nih.gov/image/images/gallery/original/00093-7248-06_RXNAVIMAGE10_7829BC3D.jpg",
      "labeler": "Teva Pharmaceuticals USA Inc",
      "name": "lamotrigine 200 MG Oral Tablet",
      "ndc11": "00093-7248-06",
      "part": 1,
      "relabelersNdc9": [
        {
          "@sourceNdc9": "00093-7248",
          "ndc9": [
            "00615-7547",
            "16590-0777",
            "24236-0945",
            "54868-5955"
          ]
        }
      ],
      "rxcui": 198429,
      "splRootId": "26fd988c-cd4d-4de4-8555-9f9a2c787fd6",
      "splSetId": "14799df4-c425-4946-9168-9028c1f2e571",
      "splVersion": 20
    }
  ],
  "replyStatus": {
    "date": "2018-06-27 10:04:54 GMT",
    "imageCount": 4,
    "matchedTerms": {
      "color": "BLUE",
      "shape": "DIAMOND"
    },
    "success": true,
    "totalImageCount": 4
  }
}
