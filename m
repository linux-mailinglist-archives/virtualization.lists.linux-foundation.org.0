Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179F7B9CEF
	for <lists.virtualization@lfdr.de>; Thu,  5 Oct 2023 14:17:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECAC583689;
	Thu,  5 Oct 2023 12:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAC583689
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PSzwneSM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2my2K_JnXi7; Thu,  5 Oct 2023 12:17:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 80A3F8375B;
	Thu,  5 Oct 2023 12:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A3F8375B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEF82C008C;
	Thu,  5 Oct 2023 12:17:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3369AC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B1A41F37
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B1A41F37
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=PSzwneSM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBraRpE3zfG7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:17:00 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::626])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AC0641F25
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC0641F25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM3Vkd2F8Guz2JjvJVkyxC81KiGzoV3gR74ARYYj+qmaSndE3hnK7PuiOX83J/x+qfiLPp8vIUpVCwYk3Ekp/G3tzbquw/wO1V31zkXHcD0FMSMHgwLYhxOc28K2tJ4311b0vsMu0nM8QfSXerzvrUtk6yW6NzAcOBKa5yv0fzPt/eVi3TrzngInTSteX0kTLHKvwX1yG4koO32Fj73TCs4Sfi7Jlv8B+bp7yX8YwX5CFhimS1rTz3V3KsfHE2I+KB50K7Z96XkeofkaAeV0aZQUSqxD2q5QhdZM6Ow7/7qWvqK4tpYoSrE1jgT9lq+S33Ir2ivq64/cPm1JtRCl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW8ANML9XRW23CcYhE/Oz4u59BcmE1x/VATuS2kF1hQ=;
 b=nh8pGvF0Ld7xpxe2g+XUIHWNevIuk+5gWfruSxj/9CcR+ZMIfsc/vdP3VWQ7JdLKwkrp5fbaUxJX0H3R7pfGvw5bk/EgvA6Z+K+clSOrS0bA6wrXdIWlSCn5Ac3IcXxkoJ4R7MLiHOqFXzz6srhOqnP0SitKsUuql64zKI223OAesfpSfsxU+r6Mdjun/TkAIkzoBKWhoQcFJXsmTvETfDZuEfuOT6cl7xNiFXHJnjGAx5s+oX3Rij2t6yPIuULWc23BQhoL4+M0Ke4hx0fRkesvmpYJLlLl6xe6JQlmm373249Xmp2Hif2OK+gNZptYsrFDkzgX2VlRDApNCpw7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW8ANML9XRW23CcYhE/Oz4u59BcmE1x/VATuS2kF1hQ=;
 b=PSzwneSMqfk67Tt4dnivk+9qkMojxJEbukgLDmux+icpKLsB4Jt93pEBoR5OO5YOiJUuLoykxhZTzTunEXnqJ/8yfPVJITc0Ooyh6bJrPOqVer8zT7RCbEAza83gj62ekcdtomXqg9klKg6OHxO9c+DSs4FslO04tEcrjXvM2hm1NOZF6hi9E0Hwzo5fQfXx5koA/8JRJXL/BOVc39DYoJGjbkAiF7QVl87qd0gOxO3LWVpdD/CM6ZS3cz4z0NtmpGCZEzkpdbsHfNRYU2Ys76rJRboW1h2C8Ae+JJVEYe7aWK+EslWstnmGERYlcv13MIga3Wk/gVNOb4OQJypdIg==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 5 Oct
 2023 12:16:58 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 12:16:58 +0000
To: "eperezma@redhat.com" <eperezma@redhat.com>
Subject: Re: [PATCH vhost 15/16] vdpa/mlx5: Make iotlb helper functions more
 generic
Thread-Topic: [PATCH vhost 15/16] vdpa/mlx5: Make iotlb helper functions more
 generic
Thread-Index: AQHZ8ivjlxjS2LcKd0WMuwpYKO6cabA7BR0AgAAiNoA=
Date: Thu, 5 Oct 2023 12:16:58 +0000
Message-ID: <2f11f0c6744e40fe36b5a7429ceb7c88f0e8c91d.camel@nvidia.com>
References: <20230928164550.980832-2-dtatulea@nvidia.com>
 <20230928164550.980832-17-dtatulea@nvidia.com>
 <CAJaqyWe2btM+8Hbnq9ROyh-bhQA5vVwNk9xgSHb_gFme9dJViw@mail.gmail.com>
In-Reply-To: <CAJaqyWe2btM+8Hbnq9ROyh-bhQA5vVwNk9xgSHb_gFme9dJViw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|CY8PR12MB7313:EE_
x-ms-office365-filtering-correlation-id: 862cfe61-dad6-4ed6-6558-08dbc59cf8fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rGTDkzTli2v4OoK3Zh44F2Z1hXldmrXhQwCqkoFJYpFhsjYGXSznSQ7ZIeM2bZza5faoXmp+aOFjW9QMW+YavrhvzTzuxIoaoVnT7AjisYihIkso52ot8RmQBQD/0/4ADjOGJNCCTDOahRpmZdCAuIYgXzWf9BfRJ1f8o4j3/FNQA0G/XtwqRsW0/ms8Ods9+5aDWxdsC9LZRkcDn/dHsAwkoZNorEC4PkH1TGX8P+kr4x79u4jjx8NnNECkqqqsyz0OxOtU15wTV/WX6SQTPuRcVo+IYv2qfq9T2/oJqY1BelaUtlUMQemNLhwhORYdpnhyj56OPAZbstXp4xaigwxMcpyecSQSMl8DxvEJqZ75mEF0NTrYlntx1SyZoyszvgxxww9KdphOxrpC75/SQnLsvkdI3aDbh8kwz5Y75BFffKkLM7Xax9lZhZmkFBKCjC1D4ax+RuvIyyruY688t91u03lI6nuSS+6+BCAe9/UUZDQjLai4hKoPoWhptIzEDAE0g/TSeDR0oNR2pa0lPi0CByUn7ShfvZ+jb0LzLS9rUy96JpcFZDjKsOw7pQjsSX58vMHv3AZXsLGE2oSJ/fOAXSM6QJ57q+Zn8ItiDZijh0j5tfUbhzKSvl70yhAeLGiKhGsahEI3PN8NijN8+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(86362001)(5660300002)(2906002)(4326008)(8936002)(41300700001)(83380400001)(122000001)(6506007)(38070700005)(38100700002)(66574015)(8676002)(2616005)(53546011)(478600001)(66556008)(91956017)(316002)(6916009)(76116006)(66476007)(66946007)(66446008)(54906003)(64756008)(6486002)(6512007)(71200400001)(36756003)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWZyVnhkbU9ESmIwZzhoQWlFUjZUZ0JsVlIrSEpHSHcvRUhIOUZnMEpvUHV4?=
 =?utf-8?B?S2wvb3pSSGFPOWpZVWlsSkxaVHRRd0dXejJINDZJd2ZVenJIS0ZOejIxSXBX?=
 =?utf-8?B?MjZEZ3dDVm5TSjEwWWJhT2pPSnlhaVFEWWtNeDdxQWNTbnlhNjcxd1hEUzF3?=
 =?utf-8?B?emt5aHM2OXFwaDF5VEhFbkNNQkUvek8rUWpIOERpbnNTTFIrYTJIQ0ZUWHE4?=
 =?utf-8?B?RmhCWFRQWXcwbmtlallMZFpxWEdZZU5PS2xiMlc3MkNMKzZGbFptcmxQRTNn?=
 =?utf-8?B?N3dqNjhNNDhFM3VWT1IrN2VYYmpWK1VmYjdqUG9JOERLVWRhaVFoWmUvOWZv?=
 =?utf-8?B?ekRrdXZOK0RVRk5zNHBHSU9iZTF0UHFMb1B5M0FOakxLcFdsaFNlL0t2c0hu?=
 =?utf-8?B?R0V0NTEzeUFPQ1lTMEl3VDhTVjVqTU1XOXZNaXhYQzRkRjZhdjNXdGR2QXdL?=
 =?utf-8?B?REIwT0g4NkRhbGRXSUQvSW1BNHNYeFVwVTFidEM5WmhndzZTb0hra0MwZWVn?=
 =?utf-8?B?dDVhTmRrU1NjYjN5ODYzQ3RzeExpT1lwZ1Q5ZThxUG5nY3VSU2U1VWFQSnVx?=
 =?utf-8?B?MHVVNDF6eTBaUDBuVmg0WWVabU0zZGhjQUFSWWx3N2FmdkxlVklPTnBRaTBF?=
 =?utf-8?B?M0NCM3ppcDJrOVFmc2FENnZHbEw1WGdHVUtnckYvdG9Ud0VFL2dFTzh0bVda?=
 =?utf-8?B?UHpGRTlJdGplbG1icDRpd21MU3FCckJ3YXdkRDNPbHZCTDNuYlk0Q2JKMEIw?=
 =?utf-8?B?QXA1L2FBRjJIcFFUSUNxbXVaRTJhamhPTTZCenoyOEdyQ3ExTWQ0cmszTHEx?=
 =?utf-8?B?S3Z1ZDhreVB2dHBjUEVZYU9WbXdVM0pOWStWV0Nqd2tjYklYWTNkQ0VGZFV4?=
 =?utf-8?B?ekVnYm9aM2xKNlZTcWZaZlRzYVRwc040UDJjVVVGYWdTSGVnYWNiQmRNaFJl?=
 =?utf-8?B?ZVdMOWFXeGMvUHZvQ05aV25LZVVCRFVRRHJOTHYwdEp5b2g2Q2xtaWtsVVNy?=
 =?utf-8?B?MlJVZUdISEpna0dkdDJxYTlYRjg3NUNnUzl3YUdmTFRDRHU3VzhmbnZiZUll?=
 =?utf-8?B?bERkR3lSVG9pTG1rb3VscHlsRjYwWCtUMUZMd0luQk8wb3RnNGNWQmpMRXFr?=
 =?utf-8?B?NStOMTJqOTRCQXoyUXFUUzZlbGdCUEkwMlBYcXE3Nm9qdXU0TnI0cHJtQWRt?=
 =?utf-8?B?WW01UWpDUThBcXNYMVdkbDZKYXRHY0Vjem9DaVMvSmZPTUs1anlRaWVlWW5D?=
 =?utf-8?B?bnNLb01lcnp6SGdTZXcyVFM0TGIxanRIYkhpK2psZ2Rma0RxM3VJY1A1V3ND?=
 =?utf-8?B?YTdRbkVnUkVEZDBWYXBkdUY2UDJPbU1ldDA0T0tCMWdPdUR1QXUwelltak1M?=
 =?utf-8?B?R0U1bzUrd0hyVEZrUG0razFrWEdNSzI0R0RhRVJRZnZlVUZUZ3lzWi9SOWRQ?=
 =?utf-8?B?K25EZk5JUXVPUVpYWnU2ejBNUXFBVUR5bFlQVjdiWlYvcHRGUHpubUV0b3Mx?=
 =?utf-8?B?NGtHZy9ONnZjamhrb1BmWEczWlZEQm5qTzV2K0x3N2hzRFJPdGpERUFzdWhR?=
 =?utf-8?B?eUNCZ3VaRzRCc3oyQjhDUDAzVmJqSGU0Unl4UGYzUEUxNzNiSXNTbXJWUVlw?=
 =?utf-8?B?S1pNTWppQzQrSm1MOWx6ZjhVQ0tMcCt1SXZEWFdXZjVsQjFrV0Mxc3d3c0dE?=
 =?utf-8?B?cEVMdkRCcjF6WmZjQ1BHZDBxd2VPekhMV3ZNVGxpT3dJZUFtVlJ2NEcreUNv?=
 =?utf-8?B?RUk5Z1JTcXBIajBTdHZmdC94Z1ZacFFWcDIrUXQ2TnRZYnQzMlJJU0RnMk4y?=
 =?utf-8?B?UGFTTEcvbVM5NFgzTVRjRU1rQWxCVmVWVXRrcW9OL2JmSEZVT01DZ1JRUDZB?=
 =?utf-8?B?Zk1nNDVaZGFLZUZaM3BQWHNkNm5LSmlLQXlCc1c2WERZcGdyejRueDdVWFoz?=
 =?utf-8?B?MmFSTmdOTHkxUnE2MXdVY2pEalZ1S0xmTUlsK08yYzUvd0VOTVQ2bUY4cWky?=
 =?utf-8?B?RWdJcGdBR0NsQ2Q5MGE3bGNvaWZUd0hzaTZFOWREaGlTaXpIM3ZuUzAyUnYz?=
 =?utf-8?B?U1VHYkJsRGplSVkvVTFXc0FLQWI0MGN5eVJIRGV5OURCUzFobThuUWphV2RY?=
 =?utf-8?B?c3ZWMU1TdElXSmhseW4xMDR5eDZON0xlY0dEMjZpODZHNkE0aVMzY2ZPM1lS?=
 =?utf-8?Q?bBQcC6sVbpFdKdqS3oLXwxCDcmXhniBLJmjloid+panq?=
Content-ID: <CCCBBCC5FE34ED49A4342DECB3484D4E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 862cfe61-dad6-4ed6-6558-08dbc59cf8fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 12:16:58.5658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKUyb+BnIciG0wEa4gJBsJ3q+EZeDPO9ce3VaS3Gi0eqfw+geG+wZDFRcijzW0W73neqBdMf3VYoDN3rBGrT2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Gal Pressman <gal@nvidia.com>
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

T24gVGh1LCAyMDIzLTEwLTA1IGF0IDEyOjE0ICswMjAwLCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3
cm90ZToKPiBPbiBUaHUsIFNlcCAyOCwgMjAyMyBhdCA2OjUw4oCvUE0gRHJhZ29zIFRhdHVsZWEg
PGR0YXR1bGVhQG52aWRpYS5jb20+IHdyb3RlOgo+ID4gCj4gPiBUaGV5IHdpbGwgYmUgdXNlZCBp
biBhIGZvbGxvd3VwIHBhdGNoLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmFnb3MgVGF0dWxl
YSA8ZHRhdHVsZWFAbnZpZGlhLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL3ZkcGEvbWx4NS9j
b3JlL21yLmMgfCAxNiArKysrKysrKy0tLS0tLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZkcGEvbWx4NS9jb3JlL21yLmMgYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmMKPiA+IGlu
ZGV4IDNkZWU2ZDliZWQ2Yi4uYTQxMzVjMTZiNWJmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92
ZHBhL21seDUvY29yZS9tci5jCj4gPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21yLmMK
PiA+IEBAIC00NTQsMjAgKzQ1NCwyMCBAQCBzdGF0aWMgdm9pZCBkZXN0cm95X2RtYV9tcihzdHJ1
Y3QgbWx4NV92ZHBhX2Rldgo+ID4gKm12ZGV2LCBzdHJ1Y3QgbWx4NV92ZHBhX21yICptcikKPiA+
IMKgwqDCoMKgwqDCoMKgIG1seDVfdmRwYV9kZXN0cm95X21rZXkobXZkZXYsIG1yLT5ta2V5KTsK
PiA+IMKgfQo+ID4gCj4gPiAtc3RhdGljIGludCBkdXBfaW90bGIoc3RydWN0IG1seDVfdmRwYV9k
ZXYgKm12ZGV2LCBzdHJ1Y3Qgdmhvc3RfaW90bGIgKnNyYykKPiA+ICtzdGF0aWMgaW50IGR1cF9p
b3RsYihzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiLCBzdHJ1Y3Qgdmhvc3RfaW90bGIgKnNyYykK
PiAKPiBJdCB3b3VsZCBiZSBncmVhdCB0byBtb3ZlIHRoaXMgcGF0Y2ggdG8gdmhvc3QvaW90bGIs
IGVzcGVjaWFsbHkKPiBiZWNhdXNlIGl0IGNhbiBiZSByZXVzZWQgYnkgdmRwYV9zaW0uIEJ1dCBp
dCBjYW4gYmUgZG9uZSBvbiB0b3AgZm9yCj4gc3VyZSwKPiAKQWNrLiBXaWxsIGNyZWF0ZSBhIHNl
cGFyYXRlIHBhdGNoIGZvciB0aGlzIGFmdGVyIHRoZSBzZXJpZXMuCgpUaGFua3MsCkRyYWdvcwoK
PiBBY2tlZC1ieTogRXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+Cj4gCj4gPiDC
oHsKPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB2aG9zdF9pb3RsYl9tYXAgKm1hcDsKPiA+IMKg
wqDCoMKgwqDCoMKgIHU2NCBzdGFydCA9IDAsIGxhc3QgPSBVTExPTkdfTUFYOwo+ID4gwqDCoMKg
wqDCoMKgwqAgaW50IGVycjsKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKCFzcmMpIHsKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHZob3N0X2lvdGxiX2FkZF9yYW5n
ZShtdmRldi0+Y3ZxLmlvdGxiLCBzdGFydCwgbGFzdCwKPiA+IHN0YXJ0LCBWSE9TVF9BQ0NFU1Nf
UlcpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gdmhvc3RfaW90bGJf
YWRkX3JhbmdlKGlvdGxiLCBzdGFydCwgbGFzdCwgc3RhcnQsCj4gPiBWSE9TVF9BQ0NFU1NfUlcp
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4gPiDCoMKg
wqDCoMKgwqDCoCB9Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgIGZvciAobWFwID0gdmhvc3RfaW90
bGJfaXRyZWVfZmlyc3Qoc3JjLCBzdGFydCwgbGFzdCk7IG1hcDsKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtYXAgPSB2aG9zdF9pb3RsYl9pdHJlZV9uZXh0KG1hcCwgc3RhcnQs
IGxhc3QpKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSB2aG9zdF9p
b3RsYl9hZGRfcmFuZ2UobXZkZXYtPmN2cS5pb3RsYiwgbWFwLT5zdGFydCwKPiA+IG1hcC0+bGFz
dCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHZob3N0X2lvdGxiX2Fk
ZF9yYW5nZShpb3RsYiwgbWFwLT5zdGFydCwgbWFwLT5sYXN0LAo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWFwLT5hZGRyLCBtYXAtPnBlcm0pOwo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4gPiBAQCAtNDc1LDkgKzQ3NSw5IEBAIHN0
YXRpYyBpbnQgZHVwX2lvdGxiKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwgc3RydWN0Cj4g
PiB2aG9zdF9pb3RsYiAqc3JjKQo+ID4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gPiDCoH0K
PiA+IAo+ID4gLXN0YXRpYyB2b2lkIHBydW5lX2lvdGxiKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICpt
dmRldikKPiA+ICtzdGF0aWMgdm9pZCBwcnVuZV9pb3RsYihzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlv
dGxiKQo+ID4gwqB7Cj4gPiAtwqDCoMKgwqDCoMKgIHZob3N0X2lvdGxiX2RlbF9yYW5nZShtdmRl
di0+Y3ZxLmlvdGxiLCAwLCBVTExPTkdfTUFYKTsKPiA+ICvCoMKgwqDCoMKgwqAgdmhvc3RfaW90
bGJfZGVsX3JhbmdlKGlvdGxiLCAwLCBVTExPTkdfTUFYKTsKPiA+IMKgfQo+ID4gCj4gPiDCoHN0
YXRpYyB2b2lkIGRlc3Ryb3lfdXNlcl9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsIHN0
cnVjdAo+ID4gbWx4NV92ZHBhX21yICptcikKPiA+IEBAIC01NDQsNyArNTQ0LDcgQEAgdm9pZCBt
bHg1X3ZkcGFfZGVzdHJveV9tcl9yZXNvdXJjZXMoc3RydWN0IG1seDVfdmRwYV9kZXYKPiA+ICpt
dmRldikKPiA+IMKgwqDCoMKgwqDCoMKgIGZvciAoaW50IGkgPSAwOyBpIDwgTUxYNV9WRFBBX05V
TV9BUzsgaSsrKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1seDVfdmRwYV9k
ZXN0cm95X21yKG12ZGV2LCBtdmRldi0+bXJbaV0pOwo+ID4gCj4gPiAtwqDCoMKgwqDCoMKgIHBy
dW5lX2lvdGxiKG12ZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqAgcHJ1bmVfaW90bGIobXZkZXYtPmN2
cS5pb3RsYik7Cj4gPiDCoH0KPiA+IAo+ID4gwqBzdGF0aWMgaW50IF9tbHg1X3ZkcGFfY3JlYXRl
X21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwKPiA+IEBAIC01OTYsOCArNTk2LDggQEAg
aW50IG1seDVfdmRwYV91cGRhdGVfY3ZxX2lvdGxiKHN0cnVjdCBtbHg1X3ZkcGFfZGV2Cj4gPiAq
bXZkZXYsCj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmbXZkZXYtPmN2cS5pb21t
dV9sb2NrKTsKPiA+IAo+ID4gLcKgwqDCoMKgwqDCoCBwcnVuZV9pb3RsYihtdmRldik7Cj4gPiAt
wqDCoMKgwqDCoMKgIGVyciA9IGR1cF9pb3RsYihtdmRldiwgaW90bGIpOwo+ID4gK8KgwqDCoMKg
wqDCoCBwcnVuZV9pb3RsYihtdmRldi0+Y3ZxLmlvdGxiKTsKPiA+ICvCoMKgwqDCoMKgwqAgZXJy
ID0gZHVwX2lvdGxiKG12ZGV2LT5jdnEuaW90bGIsIGlvdGxiKTsKPiA+IAo+ID4gwqDCoMKgwqDC
oMKgwqAgc3Bpbl91bmxvY2soJm12ZGV2LT5jdnEuaW9tbXVfbG9jayk7Cj4gPiAKPiA+IC0tCj4g
PiAyLjQxLjAKPiA+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
