Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B37739EC
	for <lists.virtualization@lfdr.de>; Tue,  8 Aug 2023 13:35:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9D4408D8;
	Tue,  8 Aug 2023 11:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF9D4408D8
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z9m0i0F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mz2mEyDG7FdK; Tue,  8 Aug 2023 11:35:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1FFBB401F3;
	Tue,  8 Aug 2023 11:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FFBB401F3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7345BC008D;
	Tue,  8 Aug 2023 11:35:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB78AC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Aug 2023 11:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6825D610E8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Aug 2023 11:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6825D610E8
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Z9m0i0F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zb2om5ypbHXY
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Aug 2023 11:35:06 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9282D60F45
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Aug 2023 11:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9282D60F45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/oJJXnKAR/g0UJStVzaFx8nwnGT+J/AkFuS6AjOTsz/Kg9T83le6k4qKDeLFqi7ZVHzzPwT1tp9c6Vl+C5R8AD0DwhifBvIFuY10SbgX18qeu18n4bByFIpQnw0D3GfQclEUgGUQzPd14xiLj7CFgCi+05zt0/B1VvGledH0Ju1Mg8LI/6qYXQq/u5EmVsfI5J3+SnBn7mmJ7KtEabE+qNVoU6fXoZRvdF57auVWD+pE0xtaHfUMCEp1P4Kyv71Vv81gS5XtR0kvMgSEraMfEEo4z9nvg4+2Bjset9mx7gZUFFKBjgZIKlFzka7q0qYXGXw73TZFX0lQ7J86VhfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD7W50Gu9lsf4Uqu97WrNZM3QO9r5mlNzj4Y6ZJ1Z1k=;
 b=VwcZL9NafQXDnOn69SuwVWJWb44sDg2ICL3wWu6ZdUj6h8R+9vmfyyD/g0mZUcy78aAU1wEfzjECBMQ6/tpeOTzaFe+B8yWNPlKiDXlV0cG9VvpFkvxU6bDOePq5o5uJWL67/Hu76NxNKmlwmXUgxmdmac/hG0Ri/LeiSjQt95qarBO+9fxJxwu2bPHYt+5z/K76rBe3UPkhYcMn7xEVTAASMui9NRyuoYAYkWM9BIzfGp6Oddh8waCu11phtT3WXFJ9NFXI9GGzbovSIAJTH45QU//WOn8UfUNYRiS5ZNX1WPTMtDgSiU1+zyl62GDhSwmC6PbyVUAXZyusjG8pqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD7W50Gu9lsf4Uqu97WrNZM3QO9r5mlNzj4Y6ZJ1Z1k=;
 b=Z9m0i0F2gb01zBk+mdhDc1pv9htLKhWjABC0DuEsN0nXLxN+dMVLmUZZS+ZQ1u4Q/Pzx82ILWmHL/CEulXooG42+BmUua/O1PZOaXdO9j6A0sCcOupBjkkO2+gTZg8o4A2e29FAIsWwJtJGZAP7983s8qCTCNKNF743HyRT+6cs0UDukVb4wcvW/reFb8+Kzrnrx+DsDC6eaoUlyetGCeShUYOAhQGSUYxtJjVO2j6Vuxm1zWL97FUjtqG2a5kzujddpKQKjz20Fptgm2Cb5xyqOYuVkrWGS8KYVLvt2HsBOfKs4Yu3gDSyipVexe/AWKm3bIq9oxfIl65iIXCMgLQ==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 11:35:03 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 11:35:03 +0000
To: "jasowang@redhat.com" <jasowang@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>
Subject: Re: [PATCH net] virtio-net: fix race between set queues and probe
Thread-Topic: [PATCH net] virtio-net: fix race between set queues and probe
Thread-Index: AQHZvsiXB6b6nVGd5EW6f1D4kzXs7a/gWyqA
Date: Tue, 8 Aug 2023 11:35:02 +0000
Message-ID: <e1fcd1a2ca22bc09387e162e22c61e54fe8c57ca.camel@nvidia.com>
References: <20230725072049.617289-1-jasowang@redhat.com>
In-Reply-To: <20230725072049.617289-1-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|DS0PR12MB8019:EE_
x-ms-office365-filtering-correlation-id: ae8cd8b1-f3b5-4b36-1947-08db98038198
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ImxLpy8iMjLMKNswgRXguYjXB1B7pKCLccduqfy+6iMLTzEBmaulITD1oX6NwnX46f3DxDrSUyDxl1ArxyXlXZseQq92YdebDVV1wy9tyO2AmE1fCHzrbVpLL0J/BoSLLccZQMGEoUcKfUqFpk/LlrtYev/vdXUCG9iYntvAKXcf2K9VBbRN8j1RdTdaWJflBP/IPLcmTMpCpQIfpWrpi6QIluEWAWxHDgjZlvhysCrtMHpM/nzoo/Sdfe/RTpddvqze+IhyffqDC8pJWqWU7hdq5Te6AUxiQWNS2kOgRYGJlzT/sE2mOIF4Gpvu/7MeDt9GCEYAeOWL1UBzS+l+/PaBnBrnyML2EsgKvdndaoEEUoIKXoldQBjuauw3Rw8Jyr4CWIpbIE4D2I+WMEnJ4ZToU1Pj9o4HsGgK3aoyirP8rx6CCoOv0+XfCnwiWmu/44CgWHFcLTHXfWEfpTZb8kC9TGxTht4xTu3eTTX9k9jfLeDTHLn6eu55/cNceHM3l4/QHTnHhf+aYDfly2a1bsojAQw0HKam2MObQJLzKfc2+1sTHn91UvoNaQuKwoPNnqdEieRNTDstiyA/43mqMASiknV7AySPp+PNIhPGPESSspYx4AqKQPxxLW42b4bF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(186006)(1800799003)(2906002)(83380400001)(41300700001)(5660300002)(8936002)(8676002)(38070700005)(36756003)(86362001)(54906003)(110136005)(122000001)(478600001)(38100700002)(6512007)(6486002)(71200400001)(6506007)(66476007)(66556008)(66946007)(64756008)(66446008)(91956017)(76116006)(4326008)(2616005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTIvdHdZT01NdmI4UC9XdmlicjhSNEZLQ3ArWURQVk5zSEJrWEd1REQ2RTlM?=
 =?utf-8?B?OHJmSWNPc1NRQ2hib1JBOEVGd2FXSElibGZwcUR1UEVSRkdVcWJKa3diSkRa?=
 =?utf-8?B?bDdqbkRqR0JHZHFXZ2N0aG1MbWZac1JCMFBDNHJiRlBXODNIVVNQRzVaRFZI?=
 =?utf-8?B?bytna0p2RXN5a3NmQk10dlFhYllVenBEaDRQazRPSEFDdFJBODlvbmpsbHVT?=
 =?utf-8?B?QTEreERuTDFJOXk0SWl3bjB6MVFQVURNbFhtQ1crKytiLy9NSlRobHhPaXkr?=
 =?utf-8?B?WG1DckwrTjNiZ0ZMa1A4SUVNTU5SOEdYakNkLzE0K2toOXJJZUVJMmMwaHNK?=
 =?utf-8?B?cXBmYmwyVnJ3ckJ0VWxjSG0xc1BncldLQUxyU1R3NjFhKzlhNy8wMnZPajhz?=
 =?utf-8?B?WmZxOVBoUStPakxFdmlCc1JIb2dMeHBPenVuMWY0SVdaODVFRUdsZmdjMklv?=
 =?utf-8?B?aW9UbDZ5V0Npdy9JMnRuWTdTd1FGV1h6MTAwak0rWllENzZnVEl0ejdlUVdE?=
 =?utf-8?B?VUQ3R1laNHZxWG1DTHdYYlN4QjdBRXp1Ky95eVZ4cXdhcUpZTCs5RkxEZFdZ?=
 =?utf-8?B?bFo3ZXY5RjhSZlZGbFBuVWl1ZnNOc0pLdTdEVmNxcW9kN255emdhY1NwTXoy?=
 =?utf-8?B?dzVWeUZRbkZuZnRrdy9VVWxjSzcwYUlIemVUVTBPcy9aYm1BVkdqS0R5Z2tw?=
 =?utf-8?B?SGdFWGZFY293RXQyb3FnWnFUUHhHQndQM2laZDZDY20vMzRRM2FqcU12Y3ha?=
 =?utf-8?B?clk1SDczRnVqeGZBVkY1MFBudllqNndjMHlwcDBCRXI5eW8rVVhOZkVVNG1q?=
 =?utf-8?B?ZkVVK0FMQW4wVHl0R3NnOWRxZEw0aUxqMHJ4cnAzRXd2Mmk1SFVwbExHakl0?=
 =?utf-8?B?TkltMEdzVlRXWE1WUFR2cUZDaVVTS1cyZlJETlowVncyOWhBSzZ5bHVDQ3BY?=
 =?utf-8?B?TEtKSWVEb0pURXBUaDZyTjBudW1jcXRoUWUxay9VNXd2ZVdoWXVRTlJvUFNW?=
 =?utf-8?B?M3luT0ttMzVkZ2FkUm1yM2NuOG51Q2cvUHRhSlVCZElUVFVqTWtkNFVtQTh2?=
 =?utf-8?B?U0hGeXMrT0Y3clNUcjFnU1JmS2FKdTREbjhzS0N3MnMvUDNUdENpRnRCdFFC?=
 =?utf-8?B?Zit6Mm5iWWljekdGNmtNa25qbVFOdGxJYzg0eCtxaHJzaVBPdGt1QkpQbUlu?=
 =?utf-8?B?T1hkZHZBOHd4YzRXeVloVThYaTR6a0pYNFJQc240bzErVkdYaExCb3o0ZUlq?=
 =?utf-8?B?OU16a1RodDl1Um1kSjVNUkNjZWJBQWJmRmJmZVRudHlIa0ZMbU4ydTgyQ1lQ?=
 =?utf-8?B?a1hiblRyeFpPK2tRZEdNdk1Iam1kQjArYzFhNGRwTytvZXQrK3FheUl6QVlH?=
 =?utf-8?B?VHV2NFpBMVk3VXZ6d1Y3cXYvN1VFRWg2WjEwZkVBTUl1dGhYaE9pa291RTY0?=
 =?utf-8?B?NlM5YVhXYTFFcGxoa3BsWXdkUi9MbTlsNTgzako2SUNQblJhV1hCWFJ0d3Bw?=
 =?utf-8?B?MVljRytDUlI1a283VXZuNkhpSXArckVya0xiN0Z3MjR6dDhkM05BbkNPRWp6?=
 =?utf-8?B?MUd0MU9VQ2dFZ2pvTm1pMUxEWFZGQndmOFdZZVpLOE42cTEzY1FncWRVMkFC?=
 =?utf-8?B?V1RWM25DdGY0QUs1a2V4TXUzOFlFWEVMcDlmQm9EZ3N1RmNBMERnZlAxODY1?=
 =?utf-8?B?dlY2WFhpZjU1RkxTc3NWWFBvVzZacUdTN1RybVZLRWV3TFU5T2QydkJWN0VS?=
 =?utf-8?B?dXBTUEdkNGd2NlVSRk9oY3dJMDhsWlk2U0YwcitCQ2loVTdmRHR1K0F5Nk1U?=
 =?utf-8?B?NGxDejl0WlVxYk1SWEFkNmdvb1U2UWZEWUtnbU5NWmFFcmpYUGE1c1lsSTh6?=
 =?utf-8?B?OWZ5WERTcnQxMzhpaGVTZVVhQXFzUDNjcHZ5YUY4U0poUDA3Nmc0U25ocmtL?=
 =?utf-8?B?MjBlUi9aMFZUYTRjQnYvWUNOeUNXaVpJNG0vYy9qR1BhbWVxWUtOa2UvOTk2?=
 =?utf-8?B?bXp1M3RwUVBOMDhjNzkzZDUyYjJUSkZvOVdzWEV5VFpjYnh1WnprNldrWm9D?=
 =?utf-8?B?MGNndkU1ZHJDL0dGVUJ6SjZHTVRSVnVsTEI5M3Qweit2RHhUY3hjTlYwaGF0?=
 =?utf-8?B?dFdrdFk3eERhRDAzdWR3aDB2WW5JQ1ZWeVBaZlZnNGorUEF6U2ExWXVyK3Fs?=
 =?utf-8?Q?B00X9hu+Xu9cBI+ZbijZPqYJhqXTWMGhrQgb7zytA4Pc?=
Content-ID: <9B83DE0054513E4FA9606B03AEF7F229@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8cd8b1-f3b5-4b36-1947-08db98038198
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 11:35:02.9326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHeKQIpP/zcnz7+a67cCilD7Xpxro+r3na8tU2+I/9TCA5hecIb007ZFo27LjL0xoj2ebqFwhvekQXKbooei4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>
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

T24gVHVlLCAyMDIzLTA3LTI1IGF0IDAzOjIwIC0wNDAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiBB
IHJhY2Ugd2VyZSBmb3VuZCB3aGVyZSBzZXRfY2hhbm5lbHMgY291bGQgYmUgY2FsbGVkIGFmdGVy
IHJlZ2lzdGVyaW5nDQo+IGJ1dCBiZWZvcmUgdmlydG5ldF9zZXRfcXVldWVzKCkgaW4gdmlydG5l
dF9wcm9iZSgpLiBGaXhpbmcgdGhpcyBieQ0KPiBtb3ZpbmcgdGhlIHZpcnRuZXRfc2V0X3F1ZXVl
cygpIGJlZm9yZSBuZXRkZXZpY2UgcmVnaXN0ZXJpbmcuIFdoaWxlIGF0DQo+IGl0LCB1c2UgX3Zp
cnRuZXRfc2V0X3F1ZXVlcygpIHRvIGF2b2lkIGhvbGRpbmcgcnRubCBhcyB0aGUgZGV2aWNlIGlz
DQo+IG5vdCBldmVuIHJlZ2lzdGVyZWQgYXQgdGhhdCB0aW1lLg0KPiANCj4gRml4ZXM6IGEyMjA4
NzFiZTY2ZiAoInZpcnRpby1uZXQ6IGNvcnJlY3RseSBlbmFibGUgbXVsdGlxdWV1ZSIpDQo+IFNp
Z25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiDC
oGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8IDQgKystLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jDQo+IGluZGV4IDBk
YjE0ZjZiODdkMy4uMTI3MGM4ZDIzNDYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC92aXJ0
aW9fbmV0LmMNCj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jDQo+IEBAIC00MjE5LDYg
KzQyMTksOCBAQCBzdGF0aWMgaW50IHZpcnRuZXRfcHJvYmUoc3RydWN0IHZpcnRpb19kZXZpY2Ug
KnZkZXYpDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAodmktPmhhc19yc3MgfHwgdmktPmhhc19yc3Nf
aGFzaF9yZXBvcnQpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdmlydG5ldF9p
bml0X2RlZmF1bHRfcnNzKHZpKTsNCj4gwqANCj4gK8KgwqDCoMKgwqDCoMKgX3ZpcnRuZXRfc2V0
X3F1ZXVlcyh2aSwgdmktPmN1cnJfcXVldWVfcGFpcnMpOw0KPiArDQo+IMKgwqDCoMKgwqDCoMKg
wqAvKiBzZXJpYWxpemUgbmV0ZGV2IHJlZ2lzdGVyICsgdmlydGlvX2RldmljZV9yZWFkeSgpIHdp
dGggbmRvX29wZW4oKQ0KPiAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgcnRubF9sb2NrKCk7DQo+IMKg
DQo+IEBAIC00MjU3LDggKzQyNTksNiBAQCBzdGF0aWMgaW50IHZpcnRuZXRfcHJvYmUoc3RydWN0
IHZpcnRpb19kZXZpY2UgKnZkZXYpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBmcmVlX3VucmVnaXN0ZXJfbmV0ZGV2Ow0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0K
PiAtwqDCoMKgwqDCoMKgwqB2aXJ0bmV0X3NldF9xdWV1ZXModmksIHZpLT5jdXJyX3F1ZXVlX3Bh
aXJzKTsNCj4gLQ0KPiDCoMKgwqDCoMKgwqDCoMKgLyogQXNzdW1lIGxpbmsgdXAgaWYgZGV2aWNl
IGNhbid0IHJlcG9ydCBsaW5rIHN0YXR1cywNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3RoZXJ3
aXNlIGdldCBsaW5rIHN0YXR1cyBmcm9tIGNvbmZpZy4gKi8NCj4gwqDCoMKgwqDCoMKgwqDCoG5l
dGlmX2NhcnJpZXJfb2ZmKGRldik7DQoNClRoaXMgY2hhbmdlIHNlZW1zIHRvIGJyZWFrIG1seDVf
dmRwYSB3aGVuIHVzaW5nIHZpcnRpb192ZHBhLg0KX3ZpcnRuZXRfc2V0X3F1ZXVlcygpIGhhbmdz
LiBCZWNhdXNlIERSSVZFUl9PSyBoYXMgbm90IHlldCBiZWVuIHNldCwgbWx4NV92ZHBhDQpjdnEg
a2ljayBoYW5kbGVyIHdpbGwgaWdub3JlIGFueSBjb21tYW5kcy4NCg0KT3V0cHV0Og0KWyAgMTk5
LjY4MTQ0NV0gbWx4NV9jb3JlIDAwMDA6MDg6MDAuMDogRS1Td2l0Y2g6IEVuYWJsZTogbW9kZShP
RkZMT0FEUyksDQpudmZzKDEpLCBuZWN2ZnMoMCksIGFjdGl2ZSB2cG9ydHMoMikNClsgIDE5OS42
OTAxNTRdIG1seDVfY29yZSAwMDAwOjA4OjAwLjI6IGZpcm13YXJlIHZlcnNpb246IDIyLjM4LjQ1
OA0KWyAgMTk5Ljg2MjgxNl0gbWx4NV9jb3JlIDAwMDA6MDg6MDAuMjogUmF0ZSBsaW1pdDogMTI3
IHJhdGVzIGFyZSBzdXBwb3J0ZWQsDQpyYW5nZTogME1icHMgdG8gOTc2NTZNYnBzDQpbICAxOTku
ODk1NjUzXSBtbHg1X2NvcmUgMDAwMDowODowMC4yOiBBc3NpZ25lZCByYW5kb20gTUFDIGFkZHJl
c3MNCmIyOmExOjcxOmMwOjI4OmEyDQpbICAyMDAuMDM2OTAwXSBtbHg1X2NvcmUgMDAwMDowODow
MC4yOiBNTFg1RTogU3RyZFJxKDEpIFJxU3ooOCkgU3RyZFN6KDIwNDgpDQpSeENxZUNtcHJzcygw
IGVuaGFuY2VkKQ0KWyAgMjAyLjIxNTAyMl0gbWx4NV9jb3JlIDAwMDA6MDg6MDAuMjogbWx4NV92
ZHBhX3Jlc2V0OjI4MTM6KHBpZCAxMjk0KToNCnBlcmZvcm1pbmcgZGV2aWNlIHJlc2V0DQpbICAy
MjMuMjI4MzA5XSByY3U6IElORk86IHJjdV9zY2hlZCBzZWxmLWRldGVjdGVkIHN0YWxsIG9uIENQ
VQ0KWyAgMjIzLjIyODg3MF0gcmN1OiAgICAzLS4uLi46ICg1MjUwIHRpY2tzIHRoaXMgR1ApDQpp
ZGxlPTFjZGMvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT0xOTgxLzE5ODEgZnFzPTIwNjQN
ClsgIDIyMy4yMjk2ODZdIHJjdTogICAgKHQ9NTI1MSBqaWZmaWVzIGc9NzA2MSBxPTQzNjUgbmNw
dXM9MTApDQpbICAyMjMuMjMwMTY1XSBDUFU6IDMgUElEOiAxMjk0IENvbW06IG1vZHByb2JlIE5v
dCB0YWludGVkIDYuNS4wLXJjNCsgIzMyDQpbICAyMjMuMjMwNzI1XSBIYXJkd2FyZSBuYW1lOiBR
RU1VIFN0YW5kYXJkIFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUyByZWwtDQoxLjEzLjAtMC1n
ZjIxYjVhNGFlYjAyLXByZWJ1aWx0LnFlbXUub3JnIDA0LzAxLzIwMTQNClsgIDIyMy4yMzE2NTdd
IFJJUDogMDAxMDp2aXJ0cXVldWVfZ2V0X2J1Zl9jdHgrMHg3LzB4MjkwDQpbICAyMjMuMjMyMTQx
XSBDb2RlOiAuLi4NClsgIDIyMy4yMzM2MzldIFJTUDogMDAxODpmZmZmODg4MTQ0ZmU3ODk4IEVG
TEFHUzogMDAwMDAyNDYNClsgIDIyMy4yMzQxMDhdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6
IGZmZmY4ODgxMDMzMjc5NDAgUkNYOiBmZmZmODg4MTAwZWNhMDAwDQpbICAyMjMuMjM0NzExXSBS
RFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmODg4MTQ0ZmU3OGFjIFJESTogZmZmZjg4ODEw
OGMzYjMwMA0KWyAgMjIzLjIzNTMxNV0gUkJQOiBmZmZmODg4MTQ0ZmU3OGQwIFIwODogMDAwMDAw
MDAwMDAwMDAwMSBSMDk6IGZmZmY4ODgxMDMzMjc5NDANClsgIDIyMy4yMzU5MjFdIFIxMDogMDAw
MDAwMDAwMDAwMDAwMyBSMTE6IDAwMDAwMDAwMDAwMDAwMDggUjEyOiAwMDAwMDAwMDAwMDAwMDAy
DQpbICAyMjMuMjM2NTM2XSBSMTM6IDAwMDAwMDAwMDAwMDAwMDQgUjE0OiBmZmZmODg4MTAzN2Mx
NDAwIFIxNTogZmZmZjg4ODEwMzM3Zjc0MA0KWyAgMjIzLjIzNzE0NF0gRlM6ICAwMDAwN2Y1NTU3
MmY4NzQwKDAwMDApIEdTOmZmZmY4ODg0NmY5ODAwMDAoMDAwMCkNCmtubEdTOjAwMDAwMDAwMDAw
MDAwMDANClsgIDIyMy4yMzc4NzddIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzMNClsgIDIyMy4yMzg0MDFdIENSMjogMDAwMDdmNTU1NmQwNWMwMCBDUjM6
IDAwMDAwMDAxMmRmM2EwMDIgQ1I0OiAwMDAwMDAwMDAwMzcwZWEwDQpbICAyMjMuMjM5MDE2XSBE
UjA6IDAwMDAwMDAwMDAwMDAwMDAgRFIxOiAwMDAwMDAwMDAwMDAwMDAwIERSMjogMDAwMDAwMDAw
MDAwMDAwMA0KWyAgMjIzLjIzOTYzMF0gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAw
MDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDANClsgIDIyMy4yNDAyNjVdIENhbGwgVHJh
Y2U6DQpbICAyMjMuMjQwNTcwXSAgPElSUT4NClsgIDIyMy4yNDA4MjNdICA/IHJjdV9kdW1wX2Nw
dV9zdGFja3MrMHhjNC8weDEwMA0KWyAgMjIzLjI0MTI1MF0gID8gcmN1X3NjaGVkX2Nsb2NrX2ly
cSsweDQwNy8weGFmMA0KWyAgMjIzLjI0MTY3N10gID8gdHJpZ2dlcl9sb2FkX2JhbGFuY2UrMHg2
Mi8weDM4MA0KWyAgMjIzLjI0MjEwNV0gID8gdXBkYXRlX3Byb2Nlc3NfdGltZXMrMHg1Yi8weDkw
DQpbICAyMjMuMjQyNTI3XSAgPyB0aWNrX3NjaGVkX3RpbWVyKzB4OGIvMHhhMA0KWyAgMjIzLjI0
MjkyNl0gID8gdGlja19zY2hlZF9kb190aW1lcisweDgwLzB4ODANClsgIDIyMy4yNDMzNDZdICA/
IF9faHJ0aW1lcl9ydW5fcXVldWVzKzB4MTIxLzB4MjcwDQpbICAyMjMuMjQzNzc3XSAgPyBocnRp
bWVyX2ludGVycnVwdCsweGY0LzB4MjMwDQpbICAyMjMuMjQ0MTkzXSAgPyBfX3N5c3ZlY19hcGlj
X3RpbWVyX2ludGVycnVwdCsweDUyLzB4ZjANClsgIDIyMy4yNDQ2ODRdICA/IHN5c3ZlY19hcGlj
X3RpbWVyX2ludGVycnVwdCsweDY5LzB4OTANClsgIDIyMy4yNDUxNTBdICA8L0lSUT4NClsgIDIy
My4yNDU0MTJdICA8VEFTSz4NClsgIDIyMy4yNDU2NjhdICA/IGFzbV9zeXN2ZWNfYXBpY190aW1l
cl9pbnRlcnJ1cHQrMHgxNi8weDIwDQpbICAyMjMuMjQ2MTYwXSAgPyB2aXJ0cXVldWVfZ2V0X2J1
Zl9jdHgrMHg3LzB4MjkwDQpbICAyMjMuMjQ2NTg4XSAgdmlydG5ldF9zZW5kX2NvbW1hbmQrMHgx
MTMvMHgxNzANClsgIDIyMy4yNDcwMDhdICA/IHZpcnRuZXRfc2V0X2FmZmluaXR5KzB4MTY2LzB4
MWIwDQpbICAyMjMuMjQ3NDQxXSAgX3ZpcnRuZXRfc2V0X3F1ZXVlcysweDlmLzB4MTAwDQpbICAy
MjMuMjQ3ODUwXSAgdmlydG5ldF9wcm9iZSsweGEyNy8weDEyNzANClsgIDIyMy4yNDgyNDJdICA/
IHZkcGFfZ2V0X2NvbmZpZysweDViLzB4NzAgW3ZkcGFdDQpbICAyMjMuMjQ4Njk5XSAgPyB2aXJ0
aW9fdmRwYV9ub3RpZnlfd2l0aF9kYXRhKzB4MzAvMHgzMCBbdmlydGlvX3ZkcGFdDQpbICAyMjMu
MjQ5MjUxXSAgdmlydGlvX2Rldl9wcm9iZSsweDE5Ni8weDMwMA0KWyAgMjIzLjI0OTY0Nl0gIHJl
YWxseV9wcm9iZSsweGMzLzB4M2QwDQpbICAyMjMuMjUwMDEyXSAgPyBkcml2ZXJfcHJvYmVfZGV2
aWNlKzB4OTAvMHg5MA0KWyAgMjIzLjI1MDQyNV0gIF9fZHJpdmVyX3Byb2JlX2RldmljZSsweDgw
LzB4MTYwDQpbICAyMjMuMjUwODQ2XSAgZHJpdmVyX3Byb2JlX2RldmljZSsweDFmLzB4OTANClsg
IDIyMy4yNTEyNDddICBfX2RldmljZV9hdHRhY2hfZHJpdmVyKzB4N2QvMHgxMDANClsgIDIyMy4y
NTE2NzRdICBidXNfZm9yX2VhY2hfZHJ2KzB4N2QvMHhkMA0KWyAgMjIzLjI1MjA1NV0gIF9fZGV2
aWNlX2F0dGFjaCsweGIyLzB4MWMwDQpbICAyMjMuMjUyNDU1XSAgYnVzX3Byb2JlX2RldmljZSsw
eDg2LzB4YTANClsgIDIyMy4yNTI4MzldICBkZXZpY2VfYWRkKzB4NjViLzB4ODcwDQpbICAyMjMu
MjUzMjAwXSAgPyBtbHg1X3ZkcGFfc2V0X3N0YXR1cysweDJhLzB4MjAwIFttbHg1X3ZkcGFdDQpb
ICAyMjMuMjUzNjk5XSAgPyB2aXJ0aW9fdmRwYV9ub3RpZnlfd2l0aF9kYXRhKzB4MzAvMHgzMCBb
dmlydGlvX3ZkcGFdDQpbICAyMjMuMjU0MjU1XSAgcmVnaXN0ZXJfdmlydGlvX2RldmljZSsweGI1
LzB4ZjANClsgIDIyMy4yNTQ2NzhdICB2aXJ0aW9fdmRwYV9wcm9iZSsweGFlLzB4ZjAgW3ZpcnRp
b192ZHBhXQ0KWyAgMjIzLjI1NTE1Nl0gIHJlYWxseV9wcm9iZSsweGMzLzB4M2QwDQpbICAyMjMu
MjU1NTE4XSAgPyBfX2RldmljZV9hdHRhY2hfZHJpdmVyKzB4MTAwLzB4MTAwDQpbICAyMjMuMjU1
OTYyXSAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4ODAvMHgxNjANClsgIDIyMy4yNTY0MDldICBk
cml2ZXJfcHJvYmVfZGV2aWNlKzB4MWYvMHg5MA0KWyAgMjIzLjI1NjgxMl0gIF9fZHJpdmVyX2F0
dGFjaCsweGU5LzB4MWIwDQpbICAyMjMuMjU3MTkwXSAgYnVzX2Zvcl9lYWNoX2RldisweDcwLzB4
YzANClsgIDIyMy4yNTc1NzRdICBidXNfYWRkX2RyaXZlcisweGYxLzB4MjIwDQpbICAyMjMuMjU3
OTU0XSAgZHJpdmVyX3JlZ2lzdGVyKzB4NTUvMHhmMA0KWyAgMjIzLjI1ODMzMF0gID8gMHhmZmZm
ZmZmZmEwNjQ3MDAwDQpbICAyMjMuMjU4Njc1XSAgZG9fb25lX2luaXRjYWxsKzB4NGMvMHgxZTAN
ClsgIDIyMy4yNTkwNjBdICA/IGttYWxsb2NfdHJhY2UrMHgyNi8weDgwDQpbICAyMjMuMjU5NDM4
XSAgZG9faW5pdF9tb2R1bGUrMHg4OC8weDI2MA0KWyAgMjIzLjI1OTgxM10gIGluaXRfbW9kdWxl
X2Zyb21fZmlsZSsweDg2LzB4YzANClsgIDIyMy4yNjAyNDVdICBfX3g2NF9zeXNfZmluaXRfbW9k
dWxlKzB4MTZkLzB4MmUwDQpbICAyMjMuMjYwNjk1XSAgZG9fc3lzY2FsbF82NCsweDNkLzB4OTAN
ClsgIDIyMy4yNjEwNjNdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0Ni8weGIw
DQpbICAyMjMuMjYxNTMyXSBSSVA6IDAwMzM6MHg3ZjU1NTZkMmJkMmQNClsgIDIyMy4yNjE4OTRd
IENvZGU6IC4uLg0KWyAgMjIzLjI2MzQxNV0gUlNQOiAwMDJiOjAwMDA3ZmZjMWZmY2Q5MDggRUZM
QUdTOiAwMDAwMDI0NiBPUklHX1JBWDoNCjAwMDAwMDAwMDAwMDAxMzkNClsgIDIyMy4yNjQxMTNd
IFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA1NjQyZmE4MmNhZjAgUkNYOiAwMDAwN2Y1
NTU2ZDJiZDJkDQpbICAyMjMuMjY0NzM2XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAw
NTY0MmY4Y2EzZmM5IFJESTogMDAwMDAwMDAwMDAwMDAwMw0KWyAgMjIzLjI2NTM0OF0gUkJQOiAw
MDAwN2ZmYzFmZmNkOWMwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDA3ZmZjMWZmY2Q5
NTANClsgIDIyMy4yNjU5NjZdIFIxMDogMDAwMDAwMDAwMDAwMDAwMyBSMTE6IDAwMDAwMDAwMDAw
MDAyNDYgUjEyOiAwMDAwNTY0MmY4Y2EzZmM5DQpbICAyMjMuMjY2NTgxXSBSMTM6IDAwMDAwMDAw
MDAwNDAwMDAgUjE0OiAwMDAwNTY0MmZhODJjYzIwIFIxNTogMDAwMDAwMDAwMDAwMDAwMA0KWyAg
MjIzLjI2NzE5Ml0gIDwvVEFTSz4NCg0KVGhhbmtzLA0KRHJhZ29zDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
