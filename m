Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77976E721
	for <lists.virtualization@lfdr.de>; Thu,  3 Aug 2023 13:40:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC58961313;
	Thu,  3 Aug 2023 11:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC58961313
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mTySvc1t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fTjHbd0BaWs; Thu,  3 Aug 2023 11:40:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3C41C6136F;
	Thu,  3 Aug 2023 11:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C41C6136F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AD93C0DD4;
	Thu,  3 Aug 2023 11:40:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8D82C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 11:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C5B080F03
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 11:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5B080F03
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=mTySvc1t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjQZ3WT8WLP3
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 11:40:41 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78F7580DB4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 11:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78F7580DB4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXn/BznMXrpVdIc+CAEG9cQUamorFI3kA0gUNQhMtC6bAxX7EN6VMgBvDuJ/rxkAm9Wfp3boN2H90ljahxdGQt3XwID/2GjU3zFGklSVMXgNbwsZrxGy+LQepvxSvjrR9HEeDGeRgyqXtOIq1guLDLlEDvt3noZfNAOgjbpTIDph5SM6gxqafUcu5+CiFNSMp1qjvdq66bD3d+WyY4bW1iR9P5mIAQvmScJ1K5sWyf5oHVdq2BdKSg7FXuRB7CT2eSiDKByD3sHDgZU85nX+p6I+rAyJEo6JssvX/uWZFxU7cznbGFPGDg82+QqNZjWVhjsGOtnvNUC3c+f56NkfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30L9ZyfmrQ1ggxXsQc2YEZUqjDm6gWUm+1rQWmWKPzE=;
 b=HrPsf4yRv5t3Q7crbXRlJMhYFVMWNWzcRene44N5RJnlYAR3Q85zD2nTCPxPXEf++MuY4cCesw76LXUwqvwA6AhQeuGU6mm/Sxlw7XJ/WPAqPBAgoi7b2J+F3ra4b2FPJlZcMN/zU/sfV6FJibdFhQC9zyV2uJbYa4/abMjBfWQlcqMABenjDmGPQHqgC7+YSir304f9KQ+Hf3hEB1pCECKgUY7uzGvay/ZlS9d+KZQBASEIHgz4/1dJ2SJvlbrnvyN70Ok/nrwHRhV0AWGhEpV8jvevP8AyWnYRP8MK7xGVZ6APtD8B2+YNJCBOCoUIH9igxQ8YEO/He4Yzzd8FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30L9ZyfmrQ1ggxXsQc2YEZUqjDm6gWUm+1rQWmWKPzE=;
 b=mTySvc1tpuE9if8nurNhwk3Wd3aU445KRV0RYY7STMCW8WmS0UVyyAi+qMAlJ1E7DAttF/fZg73QhcQtBV6564dBPEse1/v0hIchR/U3gQfKHhYRNLOhrFjPAwXr/9wTH41owQTNVb0+arX4rM/pG+xiaX04Jkp5irWBxpZwgf3BoKQwinlCJotm7mYAO5MgB5plr2wGEuZip//TFYNhXLq9o2yQq6CwoF9L6nixhxE3islNSOajFpNLF8Af9GbM8ogvEtzOB9ZUJ86JXlAbLX8dliKbNIc7YjQMzXpyKTFEcwA8IQHZQYZvJ7Hn27gU19q8mBv2jAKrLszzD2SUJw==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by MW4PR12MB7287.namprd12.prod.outlook.com (2603:10b6:303:22c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 11:40:37 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 11:40:37 +0000
To: "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] vdpa/mlx5: Fix mr->initialized semantics
Thread-Topic: [PATCH 1/2] vdpa/mlx5: Fix mr->initialized semantics
Thread-Index: AQHZxWScYzQYP2l8TkunB6gTY1iBgK/YN0cAgAA8kgA=
Date: Thu, 3 Aug 2023 11:40:36 +0000
Message-ID: <b31737724cdcf0cc63fbec56209b7288dc8fcfce.camel@nvidia.com>
References: <20230802171231.11001-1-dtatulea@nvidia.com>
 <20230802171231.11001-3-dtatulea@nvidia.com>
 <CACGkMEsE45k+fqv-biYfOX5VbqZLo_drQV5rPYByuLJZK03hWQ@mail.gmail.com>
In-Reply-To: <CACGkMEsE45k+fqv-biYfOX5VbqZLo_drQV5rPYByuLJZK03hWQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|MW4PR12MB7287:EE_
x-ms-office365-filtering-correlation-id: f496fcc9-3aac-411d-fddf-08db941674a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f+SVzJsyIe7HrjRuzJ/Mh04Y23FNtNqEiX1jXhjzLQK8omj22p4kUa+jX7NRjISUlUP+vpiIau0J1EUQiBtrd6H1dC0YYRFkijix68Olq8eAo9s5E5cJV/hThQ1VrWKscij9hL6Ms/HGH0pIbGoZOt8SZ+6h5QHCjYtqOYj+5TxZUmxvOY98v1tBmv0G8OhDLrP/afJoopsOO3GZ3kv6KBOhsN4EbBAemKptpUvNZ1Y4ILHSGv1nJNs9F9HS2XxW/MsDjIbZvv4EbR/S/V7U6aaGfoPVPP6mWQmKoUEdHzyatuRP+BxzNDnFu4TyGwJ7vW13iEgp5a7Q5Z5gN4+J39QgwWPZvvnfufHcT8Q0Bdi2bGCHo18ivFVY+yplSn0WRZPPoUtKrmosJjoqct35ufFtoqH8DIao3NWGMOKbZ1A+/9jfRHJWhbERgNsl3B5TwL8LsYq7/SinsQDCDbFCNA2d3hw3zzExwjkFr3YDak9icXd/4VYK3B832xMub3RwpHjqTR1zn3aT0vjz+Y0+46VjWvGlWOzec40ZBh83eDsGp5zXzmkF0RbFY+ebmRMJMhvjpp17r3usw+J34Gp2ILp8ipXgts/nzS/cSo4PIVAGT2xFmaKRjBGf6/RAQVEkJzEaZ6gVkFQNjabpWwhpH76XVs1+jnYFBr00kCyDDDw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(41300700001)(66556008)(66446008)(316002)(2906002)(91956017)(4326008)(76116006)(6916009)(64756008)(66946007)(66476007)(8936002)(8676002)(5660300002)(122000001)(38100700002)(36756003)(53546011)(186003)(38070700005)(6506007)(86362001)(83380400001)(2616005)(66574015)(6512007)(478600001)(54906003)(71200400001)(6486002)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0hWMlJpdVVMMVp6R2dIbmNGVjlkUGlCRUFqOVlmWk5nbWJkY29rMGlvWFVI?=
 =?utf-8?B?YTBWelQ2UEkrcEFkMUhocW5JOWFUZjZlMzJjbEZodUFCUHZ1bmpMWnN0amZQ?=
 =?utf-8?B?NVZoL2hhMTErWEtiRXNhNElrZjcvUkx2Z2YvQ0ZyN1BpajdnMEhjbzFGWG9U?=
 =?utf-8?B?b25JQWJUc21HaXF4c3Q5TktrTVpmNTF5YkNUY1djc3RZL2FOUjJRMXIrK2F2?=
 =?utf-8?B?RUtQbUdPTVNmZXlXSm9HTjltcE1NendtZSs0OFRGRXl5Vkl1Wm52U09odmdh?=
 =?utf-8?B?c1dON0hZU29YTDNndDhWdUoweXEvNmd6V2xvZ21WSndZMHgvZVQzT2JSUm1G?=
 =?utf-8?B?ZTdSWDQ3dGZsYkcrU3JMY3d3T3BoTmxnSmw2OWtFSjZzaDZDam5ULzVNcy93?=
 =?utf-8?B?TWh3cmNSY3IwVVVHVVl2ZlJwN3hCOWNzVmpqZ21NZUVUa2I3Y05Vc1ZrN3pP?=
 =?utf-8?B?ZjZsa0s1WDVab2NkbVVXMGY0UVh0Si94UGpGRmxuU1k1ZkpnYkxPSEdydERB?=
 =?utf-8?B?WGNoZGtETHRVbzI5cmJTcUMybGJPeUQyUGZUeFUvaTVoVnlJZGhlZFhLM3Br?=
 =?utf-8?B?Nm9lUG55bjRUSUlqdDlXWmt5OWJqaDdOcks1T3JLVUZnbTNDeW1qdGdmZjR2?=
 =?utf-8?B?VDZKanJnYlBGemxBTnhDMFhVY0JvRFBSZG1iUThRUUtjd2J2SDVpdFlOaWU2?=
 =?utf-8?B?TlZCZnkzdVRQU0lDRDlmK2k2WS9MTTZPT2xjNGtBN29VMUV1VGlYQUNzTHVH?=
 =?utf-8?B?Rm5PL1pCUUtCdk96N1ZsZStaOW0vNlBKbDVpaUd2Y3hLNE1pVkxVazVmVHAw?=
 =?utf-8?B?c1duSDJwSlJrQk1lYjBLQ2hMRE5ENWlwbjlMbFhXN21ET2tIYzBtRHRnczBu?=
 =?utf-8?B?QXp4QTRtR2FCblNwNmlqeGZLMzUyVlJhVHBvdWpyTTZabkhRdnNkZHhzNmdj?=
 =?utf-8?B?WktKQUdIdDFiQ2RDTndFeEhTSy8yQlBRWWVKWW5FY1RpY3FOM1kzdCt3d3FE?=
 =?utf-8?B?NGF5dmEvM3NuRnFyOFhKNEFVUTBrRTE5NXRWQUJJNkVLdXdUOVlWcXJUVnh0?=
 =?utf-8?B?Q2R5c2F3U3JrMlh0NlVmdXJvSkprOVZZV0VmaSsxWU81RzZPdytkQUVtcG9t?=
 =?utf-8?B?cjJVVy84ZkJSUXVPRnA0L3ZVTVlVZzRHYUh1ZTliZzZaRldWcXlET0k3WnYz?=
 =?utf-8?B?OUtGanAzU2pNbFV3K0NHOG1aUTFnS0t0bnBRdXE0UnpJL3FVREs4eVAzMTZQ?=
 =?utf-8?B?ckxMNWxQL2ljYlZIUGpQTGtUUmZPMlcrNVNEbmVBWk5odHJlanIyZDBId2Fh?=
 =?utf-8?B?cmRhZXVGTVJTUmFnMU9Vb2ZHcG4waUdNZmQ3dy9nbk5DdjZPRjFrVjVzSWJz?=
 =?utf-8?B?SzBiNnU5UDVoVDMyV3hjblplQlZpN2d4alh0UmhzL2RsS3NVeTd6WU90ejJL?=
 =?utf-8?B?YWNLaEwzRFFORm9ZaFFZQ1c3OG9IUkM5dDJLUzc5Z2RnMkxVM1lUTjE3elR5?=
 =?utf-8?B?SktnNjd4bE9JazJjR0NYZXBhTGNTME10akhicHFIbzM4UkdReGgwWVd3eTFR?=
 =?utf-8?B?MTFDcjE5RDN0MTFhUVN3WFl3YUZaUTNXVjFUci93dUQ0WWJTcGdtejJzUGxR?=
 =?utf-8?B?eGZrSzNsZzF6Z1F4NzVUT1RZRXdWNGNWd2FvTUUvcDJhem00TFNkdGFpRG1F?=
 =?utf-8?B?VWlndTJiN2xSbXJwcnU5TGxrTHljUm5TSjJoNGpKdTFhSWpQSzgvWnRWOUt6?=
 =?utf-8?B?S2pGb3dxRzFqNTZ6ZmlqL1poNGg5ditxVmczM3VQL3hNWHRGc01uRGdBays3?=
 =?utf-8?B?V3hJdFdMcWg1STRKTFBzMmFLdGYvay9mUHA0c0NDMUlCajZ2VFFqeURMbVdL?=
 =?utf-8?B?TmI5VUpoQ0dmK0RpM2V0RXB4dVJtY0w1YzNlZ0YzMjgxRjIwYU9oY2d0Y2xo?=
 =?utf-8?B?L2FKb2xSWWhFU0pweWpwM2JHWi9PTHZ5a2NMc3h2ekN4V29ibVNRdDJDUDIv?=
 =?utf-8?B?cmhNMkk0YnhnK0RRZHJ4QlhOZ3RuQnFvTjhoOFhBR3VHcnlDeDhOcWgzUlVa?=
 =?utf-8?B?dld3S1VmaDFFQlJlNm9SZEVPUzdsWFIvaW9hRW96STJ1VTBYTEhuUTRYWnBi?=
 =?utf-8?B?WkJ4N29yay9WaXRvRnB0bjc2MEJlVWNaWDN1QnRLTTNDanp1dU9zZS9OUlB0?=
 =?utf-8?Q?b0a3lpMDWRB+Vt1EGRHAcn7HXkgskotLvPt1HtOXmlMh?=
Content-ID: <24492CE6F9A0924DB1D191380C2BA8BF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f496fcc9-3aac-411d-fddf-08db941674a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 11:40:37.0027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXbDk+rk179TalLs2clGQpz4KMQU/SHW3aIZfSynSx73VAit/GQ8oird8VQ1k17X6FLL7ZvDxlO5YpFd9g0jvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7287
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "mst@redhat.com" <mst@redhat.com>, Gal Pressman <gal@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Dragos Tatulea via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCAyMDIzLTA4LTAzIGF0IDE2OjAzICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+IE9u
IFRodSwgQXVnIDMsIDIwMjMgYXQgMToxM+KAr0FNIERyYWdvcyBUYXR1bGVhIDxkdGF0dWxlYUBu
dmlkaWEuY29tPiB3cm90ZToKPiA+IAo+ID4gVGhlIG1yLT5pbml0aWFsaXplZCBmbGFnIGlzIHNo
YXJlZCBiZXR3ZWVuIHRoZSBjb250cm9sIHZxIGFuZCBkYXRhIHZxCj4gPiBwYXJ0IG9mIHRoZSBt
ciBpbml0L3VuaW5pdC4gQnV0IGlmIHRoZSBjb250cm9sIHZxIGFuZCBkYXRhIHZxIGdldCBwbGFj
ZWQKPiA+IGluIGRpZmZlcmVudCBBU0lEcywgaXQgY2FuIGhhcHBlbiB0aGF0IGluaXRpYWxpemlu
ZyB0aGUgY29udHJvbCB2cSB3aWxsCj4gPiBwcmV2ZW50IHRoZSBkYXRhIHZxIG1yIGZyb20gYmVp
bmcgaW5pdGlhbGl6ZWQuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggY29uc29saWRhdGVzIHRoZSBjb250
cm9sIGFuZCBkYXRhIHZxIGluaXQgcGFydHMgaW50byB0aGVpcgo+ID4gb3duIGluaXQgZnVuY3Rp
b25zLiBUaGUgbXItPmluaXRpYWxpemVkIHdpbGwgbm93IGJlIHVzZWQgZm9yIHRoZSBkYXRhIHZx
Cj4gPiBvbmx5LiBUaGUgY29udHJvbCB2cSBjdXJyZW50bHkgZG9lc24ndCBuZWVkIGEgZmxhZy4K
PiA+IAo+ID4gVGhlIHVuaW5pdGlhbGl6aW5nIHBhcnQgaXMgYWxzbyB0YWtlbiBjYXJlIG9mOiBt
bHg1X3ZkcGFfZGVzdHJveV9tciBnb3QKPiA+IHNwbGl0IGludG8gZGF0YSBhbmQgY29udHJvbCB2
cSBmdW5jdGlvbnMgd2hpY2ggYXJlIG5vdyBhbHNvIEFTSUQgYXdhcmUuCj4gPiAKPiA+IEZpeGVz
OiA4ZmNkMjBjMzA3MDQgKCJ2ZHBhL21seDU6IFN1cHBvcnQgZGlmZmVyZW50IGFkZHJlc3Mgc3Bh
Y2VzIGZvcgo+ID4gY29udHJvbCBhbmQgZGF0YSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmFnb3Mg
VGF0dWxlYSA8ZHRhdHVsZWFAbnZpZGlhLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBFdWdlbmlvIFDD
qXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KPiA+IFJldmlld2VkLWJ5OiBHYWwgUHJlc3NtYW4g
PGdhbEBudmlkaWEuY29tPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4
NV92ZHBhLmggfMKgIDEgKwo+ID4gwqBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmPCoMKgwqDC
oMKgwqDCoCB8IDk3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ID4gwqAyIGZpbGVz
IGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92ZHBhL21seDUvY29yZS9tbHg1X3ZkcGEuaAo+ID4gYi9kcml2ZXJz
L3ZkcGEvbWx4NS9jb3JlL21seDVfdmRwYS5oCj4gPiBpbmRleCAyNWZjNDEyMGI2MTguLmEwNDIw
YmU1MDU5ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBh
LmgKPiA+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgKPiA+IEBAIC0z
MSw2ICszMSw3IEBAIHN0cnVjdCBtbHg1X3ZkcGFfbXIgewo+ID4gwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGxpc3RfaGVhZCBoZWFkOwo+ID4gwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBudW1f
ZGlyZWN0czsKPiA+IMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbnVtX2tsbXM7Cj4gPiAr
wqDCoMKgwqDCoMKgIC8qIHN0YXRlIG9mIGR2cSBtciAqLwo+ID4gwqDCoMKgwqDCoMKgwqAgYm9v
bCBpbml0aWFsaXplZDsKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgLyogc2VyaWFsaXplIG1rZXkg
Y3JlYXRpb24gYW5kIGRlc3RydWN0aW9uICovCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBh
L21seDUvY29yZS9tci5jIGIvZHJpdmVycy92ZHBhL21seDUvY29yZS9tci5jCj4gPiBpbmRleCAw
M2U1NDMyMjk3OTEuLjRhZTE0YTI0OGE0YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmRwYS9t
bHg1L2NvcmUvbXIuYwo+ID4gKysrIGIvZHJpdmVycy92ZHBhL21seDUvY29yZS9tci5jCj4gPiBA
QCAtNDg5LDYwICs0ODksMTAzIEBAIHN0YXRpYyB2b2lkIGRlc3Ryb3lfdXNlcl9tcihzdHJ1Y3Qg
bWx4NV92ZHBhX2Rldgo+ID4gKm12ZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX21yICptcgo+ID4gwqDC
oMKgwqDCoMKgwqAgfQo+ID4gwqB9Cj4gPiAKPiA+IC12b2lkIG1seDVfdmRwYV9kZXN0cm95X21y
KHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldikKPiA+ICtzdGF0aWMgdm9pZCBfbWx4NV92ZHBh
X2Rlc3Ryb3lfY3ZxX21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdW5zaWduZWQKPiA+
IGludCBhc2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKG12ZGV2LT5ncm91cDJhc2lk
W01MWDVfVkRQQV9DVlFfR1JPVVBdICE9IGFzaWQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHBydW5lX2lvdGxiKG12ZGV2
KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQgX21seDVfdmRwYV9kZXN0cm95X2R2cV9t
cihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHVuc2lnbmVkCj4gPiBpbnQgYXNpZCkKPiA+
IMKgewo+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9tciAqbXIgPSAmbXZkZXYt
Pm1yOwo+ID4gCj4gPiAtwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJm1yLT5ta2V5X210eCk7Cj4g
PiArwqDCoMKgwqDCoMKgIGlmIChtdmRldi0+Z3JvdXAyYXNpZFtNTFg1X1ZEUEFfREFUQVZRX0dS
T1VQXSAhPSBhc2lkKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+
ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKCFtci0+aW5pdGlhbGl6ZWQpCj4gPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybjsKPiA+IAo+ID4gLcKgwqDCoMKgwqDCoCBwcnVuZV9pb3RsYihtdmRl
dik7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAobXItPnVzZXJfbXIpCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZGVzdHJveV91c2VyX21yKG12ZGV2LCBtcik7Cj4gPiDCoMKgwqDC
oMKgwqDCoCBlbHNlCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzdHJveV9k
bWFfbXIobXZkZXYsIG1yKTsKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgbXItPmluaXRpYWxpemVk
ID0gZmFsc2U7Cj4gPiAtb3V0Ogo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBtbHg1X3Zk
cGFfZGVzdHJveV9tcl9hc2lkKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgdW5zaWduZWQK
PiA+IGludCBhc2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9t
ciAqbXIgPSAmbXZkZXYtPm1yOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZt
ci0+bWtleV9tdHgpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBfbWx4NV92ZHBhX2Rlc3Ryb3lf
ZHZxX21yKG12ZGV2LCBhc2lkKTsKPiA+ICvCoMKgwqDCoMKgwqAgX21seDVfdmRwYV9kZXN0cm95
X2N2cV9tcihtdmRldiwgYXNpZCk7Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoCBtdXRleF91bmxv
Y2soJm1yLT5ta2V5X210eCk7Cj4gPiDCoH0KPiA+IAo+ID4gLXN0YXRpYyBpbnQgX21seDVfdmRw
YV9jcmVhdGVfbXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LAo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
dmhvc3RfaW90bGIgKmlvdGxiLCB1bnNpZ25lZCBpbnQKPiA+IGFzaWQpCj4gPiArdm9pZCBtbHg1
X3ZkcGFfZGVzdHJveV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYpCj4gPiArewo+ID4g
K8KgwqDCoMKgwqDCoCBtbHg1X3ZkcGFfZGVzdHJveV9tcl9hc2lkKG12ZGV2LCBtdmRldi0KPiA+
ID5ncm91cDJhc2lkW01MWDVfVkRQQV9DVlFfR1JPVVBdKTsKPiA+ICvCoMKgwqDCoMKgwqAgbWx4
NV92ZHBhX2Rlc3Ryb3lfbXJfYXNpZChtdmRldiwgbXZkZXYtCj4gPiA+Z3JvdXAyYXNpZFtNTFg1
X1ZEUEFfREFUQVZRX0dST1VQXSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgX21seDVf
dmRwYV9jcmVhdGVfY3ZxX21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGludCBhc2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKG12ZGV2LT5ncm91cDJh
c2lkW01MWDVfVkRQQV9DVlFfR1JPVVBdICE9IGFzaWQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gMDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIGR1cF9p
b3RsYihtdmRldiwgaW90bGIpOwo+IAo+IFRoaXMgd29ycmllcyBtZSBhcyBjb25jZXB0dWFsbHks
IHRoZXJlIHNob3VsZCBiZSBubyBkaWZmZXJlbmNlIGJldHdlZW4KPiBkdnEgbXIgYW5kIGN2cSBt
ci4gVGhlIHZpcnRxdWV1ZSBzaG91bGQgYmUgbG9vc2VseSBjb3VwbGVkIHdpdGggbXIuCj4gCkFy
ZSB5b3Ugd29ycmllZCBieSB0aGUgY2hhbmdlcyBpbiB0aGlzIHBhdGNoIG9yIGFib3V0IHRoZSBw
b3NzaWJpbGl0eSBvZiBoYXZpbmcgCgpUaGUgcmVhc29uIGZvciB0aGlzIGNoYW5nZSBpcyB0aGF0
IEkgbm90aWNlZCBpZiB5b3UgY3JlYXRlIG9uZSBtciBpbiBvbmUgYXNpZAp5b3UgY291bGQgYmUg
YmxvY2tlZCBvdXQgZnJvbSBjcmVhdGluZyBhbm90aGVyIG9uZSBpbiBhIGRpZmZlcmVudCBhc2lk
IGR1ZSB0bwptci0+aW5pdGlhbGl6ZWQgYmVpbmcgdHJ1ZS4gVG8gbWUgdGhhdCBzZWVtZWQgcHJv
YmxlbWF0aWMuIElzIGl0IG5vdD8KCj4gT25lIGV4YW1wbGUgaXMgdGhhdCwgaWYgd2Ugb25seSBk
byBkdXBfaW90bGIoKSBidXQgbm90IHRyeSB0byBjcmVhdGUKPiBkbWEgbXIgaGVyZSwgd2Ugd2ls
bCBicmVhayB2aXJ0aW8tdmRwYToKPiAKSG93IHdpbGwgdGhhdCBiZSBwb3NzaWJsZT8gX21seDVf
dmRwYV9jcmVhdGVfbXIgY2FsbHMgX21seDVfdmRwYV9jcmVhdGVfZHZxX21yCmFuZCBfbWx4NV92
ZHBhX2NyZWF0ZV9jdnFfbXIuIFRoZSBvbmx5IHRoaW5nIHRoYXQgaXMgZGlmZmVyZW50IGluIHRo
aXMgcGF0Y2ggaXMKdGhhdCB0aGUgY3ZxIGlzIG5vdCBwcm90ZWN0ZWQgYnkgYW4gaW5pdCBmbGFn
LiBNeSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0IGl0CndvdWxkIGJlIG9rIHRvIGR1cF9pb3RsYiBh
Z2Fpbi4gSXMgaXQgbm90PyBJZiBub3QgSSBjb3VsZCBhZGQgYW4gYWRkaXRpb25hbAppbml0aWFs
aXplZCBmbGFnIGZvciB0aGUgY3ZxIG1yLgoKVGhhbmtzLApEcmFnb3MKCj4gY29tbWl0IDZmNTMx
MmY4MDE4MzZlNmFmOWJjYmIwYmRiNDRkYzQyM2UxMjkyMDYKPiBBdXRob3I6IEVsaSBDb2hlbiA8
ZWxpY0BudmlkaWEuY29tPgo+IERhdGU6wqDCoCBXZWQgSnVuIDIgMTE6NTg6NTQgMjAyMSArMDMw
MAo+IAo+IMKgwqDCoCB2ZHBhL21seDU6IEFkZCBzdXBwb3J0IGZvciBydW5uaW5nIHdpdGggdmly
dGlvX3ZkcGEKPiAKPiDCoMKgwqAgSW4gb3JkZXIgdG8gc3VwcG9ydCBydW5uaW5nIHZkcGEgdXNp
bmcgdnJpdGlvX3ZkcGEgZHJpdmVyLCB3ZSBuZWVkwqAgdG8KPiDCoMKgwqAgY3JlYXRlIGEgZGlm
ZmVyZW50IGtpbmQgb2YgTVIsIG9uZSB0aGF0IGhhcyAxOjEgbWFwcGluZywgc2luY2UgdGhlCj4g
wqDCoMKgIGFkZHJlc3NlcyByZWZlcnJpbmcgdG8gdmlydHF1ZXVlcyBhcmUgZG1hIGFkZHJlc3Nl
cy4KPiAKPiDCoMKgwqAgV2UgY3JlYXRlIHRoZSAxOjEgTVIgaW4gbWx4NV92ZHBhX2Rldl9hZGQo
KSBvbmx5IGluIGNhc2UgZmlybXdhcmUKPiDCoMKgwqAgc3VwcG9ydHMgdGhlIGdlbmVyYWwgY2Fw
YWJpbGl0eSB1bWVtX3VpZF8wLiBUaGUgcmVhc29uIGZvciB0aGF0IGlzIHRoYXQKPiDCoMKgwqAg
MToxIE1ScyBtdXN0IGJlIGNyZWF0ZWQgd2l0aCB1aWQgPT0gMCB3aGlsZSB2aXJ0cXVldWUgb2Jq
ZWN0cyBjYW4gYmUKPiDCoMKgwqAgY3JlYXRlZCB3aXRoIHVpZCA9PSAwIG9ubHkgd2hlbiB0aGUg
ZmlybXdhcmUgY2FwYWJpbGl0eSBpcyBvbi4KPiAKPiDCoMKgwqAgSWYgdGhlIHNldF9tYXAoKSBj
YWxsYmFjayBpcyBjYWxsZWQgd2l0aCBuZXcgdHJhbnNsYXRpb25zIHByb3ZpZGVkCj4gwqDCoMKg
IHRocm91Z2ggaW90bGIsIHRoZSBkcml2ZXIgd2lsbCBkZXN0cm95IHRoZSAxOjEgTVIgYW5kIGNy
ZWF0ZSBhIHJlZ3VsYXIKPiDCoMKgwqAgb25lLgo+IAo+IMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBF
bGkgQ29oZW4gPGVsaWNAbnZpZGlhLmNvbT4KPiDCoMKgwqAgTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDIxMDYwMjA4NTg1NC42MjY5MC0xLWVsaWNAbnZpZGlhLmNvbQo+IMKgwqDC
oCBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+IMKg
wqDCoCBBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiAKPiAKCj4g
VGhhbmtzCj4gCj4gCgo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IF9tbHg1X3ZkcGFfY3Jl
YXRlX2R2cV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHZob3N0X2lvdGxiICppb3RsYiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
YXNpZCkKPiA+IMKgewo+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9tciAqbXIg
PSAmbXZkZXYtPm1yOwo+ID4gwqDCoMKgwqDCoMKgwqAgaW50IGVycjsKPiA+IAo+ID4gLcKgwqDC
oMKgwqDCoCBpZiAobXItPmluaXRpYWxpemVkKQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAobXZkZXYt
Pmdyb3VwMmFzaWRbTUxYNV9WRFBBX0RBVEFWUV9HUk9VUF0gIT0gYXNpZCkKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiA+IAo+ID4gLcKgwqDCoMKgwqDCoCBp
ZiAobXZkZXYtPmdyb3VwMmFzaWRbTUxYNV9WRFBBX0RBVEFWUV9HUk9VUF0gPT0gYXNpZCkgewo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlvdGxiKQo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IGNyZWF0ZV91c2VyX21y
KG12ZGV2LCBpb3RsYik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gY3Jl
YXRlX2RtYV9tcihtdmRldiwgbXIpOwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAobXItPmluaXRpYWxp
emVkKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gPiAKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpCj4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPiA+IC3CoMKgwqDC
oMKgwqAgfQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoaW90bGIpCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlcnIgPSBjcmVhdGVfdXNlcl9tcihtdmRldiwgaW90bGIpOwo+ID4gK8Kg
wqDCoMKgwqDCoCBlbHNlCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBj
cmVhdGVfZG1hX21yKG12ZGV2LCBtcik7Cj4gPiAKPiA+IC3CoMKgwqDCoMKgwqAgaWYgKG12ZGV2
LT5ncm91cDJhc2lkW01MWDVfVkRQQV9DVlFfR1JPVVBdID09IGFzaWQpIHsKPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IGR1cF9pb3RsYihtdmRldiwgaW90bGIpOwo+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVycikKPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9lcnI7Cj4gPiAtwqDCoMKg
wqDCoMKgIH0KPiA+ICvCoMKgwqDCoMKgwqAgaWYgKGVycikKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgIG1yLT5pbml0
aWFsaXplZCA9IHRydWU7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ID4gK30K
PiA+ICsKPiA+ICtzdGF0aWMgaW50IF9tbHg1X3ZkcGFfY3JlYXRlX21yKHN0cnVjdCBtbHg1X3Zk
cGFfZGV2ICptdmRldiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHZob3N0X2lvdGxiICppb3RsYiwgdW5zaWdu
ZWQgaW50Cj4gPiBhc2lkKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgaW50IGVycjsKPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqAgZXJyID0gX21seDVfdmRwYV9jcmVhdGVfZHZxX21yKG12ZGV2LCBp
b3RsYiwgYXNpZCk7Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChlcnIpCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBlcnIg
PSBfbWx4NV92ZHBhX2NyZWF0ZV9jdnFfbXIobXZkZXYsIGlvdGxiLCBhc2lkKTsKPiA+ICvCoMKg
wqDCoMKgwqAgaWYgKGVycikKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0X2VycjsKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ID4gCj4gPiDCoG91
dF9lcnI6Cj4gPiAtwqDCoMKgwqDCoMKgIGlmIChtdmRldi0+Z3JvdXAyYXNpZFtNTFg1X1ZEUEFf
REFUQVZRX0dST1VQXSA9PSBhc2lkKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoaW90bGIpCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGVzdHJveV91c2VyX21yKG12ZGV2LCBtcik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGVzdHJveV9kbWFfbXIobXZkZXYsIG1yKTsKPiA+IC3CoMKgwqDCoMKgwqAgfQo+
ID4gK8KgwqDCoMKgwqDCoCBfbWx4NV92ZHBhX2Rlc3Ryb3lfZHZxX21yKG12ZGV2LCBhc2lkKTsK
PiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPiA+IMKgfQo+ID4gLS0KPiA+IDIu
NDEuMAo+ID4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
