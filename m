Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0476C7A0
	for <lists.virtualization@lfdr.de>; Wed,  2 Aug 2023 09:56:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D34BF81FF7;
	Wed,  2 Aug 2023 07:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34BF81FF7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K7pJI7pV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ChEGkgT1ghX; Wed,  2 Aug 2023 07:56:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2946780B6C;
	Wed,  2 Aug 2023 07:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2946780B6C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 543C6C008D;
	Wed,  2 Aug 2023 07:56:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FFA1C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Aug 2023 07:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF1A60DE5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Aug 2023 07:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF1A60DE5
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=K7pJI7pV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEVSE5UgVS0Y
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Aug 2023 07:56:26 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D09360EEF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Aug 2023 07:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D09360EEF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnOO5RhBsW/hLe+aBAXTwGbAZmaZrwgLZCGDDr933/67D9oBkB6dN02+NDvbISWwnJXI5rmaK8cpARSJHkfnyx1s0gRrJkK2gpgMzjP6B6Ow9+81tetcNRNlzT2Xz9Qy9BiYyPCrj+dtGM+yT1191MUGTl1KemGpS/v7jwQust0FlISK06gRFnc77ZiKUpcYU5mteS7qHeVZUCYkkLufxE7/Kv23Gq8WXFhAvq2907CNr3tGpA8ukmVaXcB6sMJia1qNQ1n7dKfwrqDVqTaerdEmnSnkYMOqRVF/gegyUfSN9aoSLk84ryfErXvXLiH+5rZ9dr1VYtW1GRNf8Ba8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ6ls4CjScB9osBN6PxvLBzx7R8zJlyLeBVWU97yxvc=;
 b=gH7475W0dt96sTcOmC20rRj99jh5s+EbvnNibsuaeQjUR+R5VwLOuLgo1Axn6WE0yKrTeKsJUIFnYkRK/mwdzU1k3nk1KrmQKCxeFbqGDq2NBcz6k0xBH6njRzw5RWOglPSzmOP37hm7qXEeCoIq55JqEdSb/y8rNc8vzgLHGwMab7MDJEhdRFezyhhr5ccZFiP6KWiP8CAnTslUba+tvz2wOFYBK091lx8ZshDXkH2W54dsAMMuygoKcnp/SKKEBa291NeB9bzBH5mOqyiyFzLBtWZXlPtcNO9AXPwMR2kokBTXyOhDrYm7srqyCadsEEvtHZp8CGj31SNboNV3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ6ls4CjScB9osBN6PxvLBzx7R8zJlyLeBVWU97yxvc=;
 b=K7pJI7pVA0YqIincbTHpt2NtmxJpLa8rIS04RFHnig721e8WITFzfjrQhvG7F0KU69IGzU7LlZSa/4fQLM7jzXp4zMoUZh+fPnNkIwSqCsfwDebC4zLObGuPVha4eBqgOwBQ+T+/Zp/et33pTGtybRmAhuC3eqz2R80YFJYSWUmCJE/iro5fKS2VGffm5wJTUJ987yGs8QsquBS+y3vH3vEhj8CODG2hlL/P542tEJXy0dpWJ/4FfnCBAYmppaZuuHmiPb4zWRz+FOmSDblJWEHa1idrGkx3tue/Vv38c4PFqmEqsqItU5jt7Golew8KcrkObwEo/5o/vUigARDVJQ==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:56:22 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 07:56:22 +0000
To: "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Topic: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Index: AQHZv/SESZp4mdZfpESAhZmcsTYGMq/Mbh0AgAFZZYCAAAdcgIAFrswAgAAfgICAATv0gIAASDEAgAE3OACAAFU2gA==
Date: Wed, 2 Aug 2023 07:56:22 +0000
Message-ID: <4375036868b636fa9c5a03e7fa9c4d7cdefefc5f.camel@nvidia.com>
References: <20230726190744.14143-1-dtatulea@nvidia.com>
 <20230726152258-mutt-send-email-mst@kernel.org>
 <3ae9e8919a9316d06d7bb507698c820ac6194f45.camel@nvidia.com>
 <20230727122633-mutt-send-email-mst@kernel.org>
 <b97484f15824c86f5cee4fe673794f17419bcb1b.camel@nvidia.com>
 <20230731050200-mutt-send-email-mst@kernel.org>
 <CACGkMEtiwNjq4pMVY-Yvgo3+DihMP5zO+q+HH-xAF+Xu_=gbHg@mail.gmail.com>
 <39c3be5dd59e67e7b5dd301100e96aa9428bc332.camel@nvidia.com>
 <CACGkMEueOXgjbr9Q0Tw5Bv-=YH9+5UR9jxttrf6hN-VRK9KtMg@mail.gmail.com>
In-Reply-To: <CACGkMEueOXgjbr9Q0Tw5Bv-=YH9+5UR9jxttrf6hN-VRK9KtMg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|CY5PR12MB6299:EE_
x-ms-office365-filtering-correlation-id: 7af47b4d-1ba3-45a7-9d2a-08db932df6c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aW7nspBSrOwiUtKsM6XX5WibasgZG2urJu5O6Lt8d6ZSdyx//+YrZP/YncyVneNCkw2oMrBjTbN+4ToPtccOLvVkmSO6nOrfLZIWkZvEZCqt5yrLovRy2ER/RjSBUtsbk5WLIFWIzsqR17S5AuS9XerQd1etcqiks4vi07HWGhCcj5FD7f/t4EEFG49cyWaBA2La5RToc2n0A+wsggLokjsnEPeuC+gGcgA1lt1KIDA87GuZnrmuqq1E1exxsUZgSDzW5fXAqVsm0/qMcDMAWWJ4OB8/5+y0e9ORtHyhUOAYhYJVkYqF4HGctigsHiliPcdYC/G7sUX9TTns4jYpDMwrYvda7IttWFppBYl+12dSEwz84LNeqpz5vKyGxl6f12ryn/7QYxgnYb2HXSAL22KNzljZO2OBiBq3LUVC4g0yqa+nXpI2M5yfnh7FekZ1c24DpDQbn1rjW0UYcSpWe87QEcUzaw/C3/JVAL0iofN9sz+KMRRDyenMG7zuziVzAkmvAyL7BNBhJwo/K5p70A/bEajfDbQnAngKBycWDA5u0fiR7srCJUoxgGHIR3Xr6LMzUzwxZmUoP3ZS8GQCnQy8ZGNemhuK6UC2ZWBI6nEc4IL9puVF72QsMevuJsrHBJkV/jG2iJ5u1pXEuteMEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(86362001)(76116006)(91956017)(66556008)(64756008)(66476007)(2616005)(66446008)(66946007)(53546011)(6506007)(54906003)(122000001)(71200400001)(36756003)(966005)(6486002)(6512007)(186003)(38100700002)(478600001)(41300700001)(2906002)(8676002)(8936002)(5660300002)(83380400001)(38070700005)(316002)(4326008)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkE5VWxvMG93QWR6QkwrWDVWbElQM3U3c2l6czI1R3FrMUUvOVI0UFNLaXlj?=
 =?utf-8?B?ekYyUjZpYlA5UG0rcVV1RkhDUHZPUC82bktFeTlOd3I4dmtrQmNLQWRhRklv?=
 =?utf-8?B?Q1RoQ0wzN2habTAyREZWNnZSbHFtQ01rbkRqU1QrU0FmL1BOalIrSGxpaGtx?=
 =?utf-8?B?dTEvRUNJbnFycUxhNFdEaFhPd2hUOXRDMkhNVW9Hem1UQkVCWGxZK2NjSjlZ?=
 =?utf-8?B?UWRiejgzWVVCSTVlRjhLaEFkMmxyZllVZGxFc2djdGltRmFISURBV2dpZVpR?=
 =?utf-8?B?VlJCUVFkc3NsYTZiaFBleXRVY0NxWEZyaXVvWksvUkNlMjdrR2lyT1JDaDMx?=
 =?utf-8?B?dWtzVUFwY2lsZjgyMVUzbjNhSTNwWGcwRXdYNk5yT1NBWCt2eTZ5SXN6ODF1?=
 =?utf-8?B?L2VSdURRSUtEUGdVQjNla09oQ0V2cG94cm0yM3pCaVJGci9DNlZEN0NveDY4?=
 =?utf-8?B?QjBOVXR6TFBValowVy9BQVRqZFdtUXhZSzJvREpiR3BVK2g0N2NLVEREcXV6?=
 =?utf-8?B?V29PZnpXUTRxckJsRVZGZk9XYy9QSmlMWkN2M0pxeTBpcENnd0hSbFpzT054?=
 =?utf-8?B?Rzd1WE5SdHI2NEpXVnZwR2VwN0tlS253WmlhMEgrNER4QXRNQU0xVmFucEpn?=
 =?utf-8?B?WVJFS2gzNnM2TGt2Mk5Fa1IxMWs0NlRhTUh3ZkQ2WTdxVFhIODQ5bW9lZGFY?=
 =?utf-8?B?dXRDQzFqL2lPckljVHVORUNJbkx0aWdFZ3EzQ1hHanpKa25qRmdqRnllL1hL?=
 =?utf-8?B?K2ZVdmlsUDRIWUVGOExCZmQ2NW5iSDVtaXZxSWtaa1c3TDlNTHdDblJ2ZXh5?=
 =?utf-8?B?UTBvOHlZTlJEeDh5V3JEcmhQNkRiL08xcWYySmYwbmkrQkxrekh0ejd5TmF0?=
 =?utf-8?B?SWd3Z2ZpeE82V0Z5M0JzQzFWVlZKZVhTQWZOYVBpTjhpdUhrOU5GejBnT3Q5?=
 =?utf-8?B?RHJzZm1WOXRMbmZnRE1IaWR1TElnaWJkVkFIOWhFYVVwWVBTTGpjNUdzc2Jr?=
 =?utf-8?B?NmoybG1pa2x5VzdlOWFKejFHSktEMGdEZTlpVXBlSzEzYU53QUFMQnF4cFdG?=
 =?utf-8?B?Tlp5eDNPbjE2cTFnYUIyT003UWMzN2FTZlkyVTVpNkxPdXJQenBQc1RBSUd2?=
 =?utf-8?B?WlllUXlWbm9hUitXLzFsVUltNS85STJxZVM3WUFhM2lUYzlGRUpBWjhYUEVm?=
 =?utf-8?B?dnZ3WllGVEZlSXQvbnpXYURNM05oaTUvb2FqejNWUC9GSVRIamRvSGpETlhN?=
 =?utf-8?B?M0IxamM1OEoyUEJyeTA4bEI1Nm1rbXhiUFpJQUdwTk9VdXZhQit4K1dHUnJG?=
 =?utf-8?B?Z0pWQzJaeVVCNnBZMFBjeWoxVGtmTGVIWndLYmttb3lTQXlRWmVoN2RXUnBp?=
 =?utf-8?B?UzJySGsvQ2cwL2VUWW9JTWVrVnllWG9mVjNvZlBuR29reGNiSS9TV2Ria2RT?=
 =?utf-8?B?WlRaNVR6dVJ3UVVIdmxRT2pjdTV6NXA2S3d6OUNoZVZjcUNCUUkvVncxNFhB?=
 =?utf-8?B?Y2pFRmZJQnB3UjR4VVhCZTNkdkkvOTFnVEZ5aHhsMFAvSFpWQnJoK0lNU0N4?=
 =?utf-8?B?QllCMGhWT1kxTkdCUjR5TFRaTlp1Ri9MNmxMV2tIaDUxL01zN25IbGhZby9q?=
 =?utf-8?B?b1pyUnltN1ZPOFR6U2ZXYnJvM2E2S3VwNHFSNFNPQmhRRmxFWmFOSXpTQ3JU?=
 =?utf-8?B?UFFmRWt0bmhKQm53ajJjK3phajNZOWZOTDB3eDkyQ1FRYWlHbjhUQ05uZFBp?=
 =?utf-8?B?enNiek00N3JtVU1iRnNYUzljamFyZ241OXNaWkdtY0hXeFVQRGh5S2pIL08y?=
 =?utf-8?B?amY0QnIvckVIanRJbjJ0aW90N3A0aVVHR3htZEVRamw4OHN1SkJRUEZrei8y?=
 =?utf-8?B?WmtydzNGeE9ZMlZkVGJZcDhpTnEvdzJCc25lQ3RJQkhHT2krLzAyNVg2WitT?=
 =?utf-8?B?VmNkbEw4RVNzMnhROHdlSUF0L3lrQ3BXQWpSQmRMTTVhT1Vud1o4U0c5RE1M?=
 =?utf-8?B?d2lxU0o2OU5WMkVvYmpRY1R5NFd5SHNrc3BMZTNsOU5OZHB5bHpUYXJQVXRJ?=
 =?utf-8?B?RnhlS3JyTnB1dDV2WGxaQXZvSDRWcUU2OEg2VzdZRFNEQzdVdnFnMUprUkJP?=
 =?utf-8?B?bDFqK3NzL08vQTJWRGhpRzl1Ny9rd1NQYzhOMUJzV1QvUjZvSTZlaTRTdnM0?=
 =?utf-8?Q?KZPiK5+vnPCyLDs1LdQUl+GPnMVrJF7Die8qdHCj8dse?=
Content-ID: <3F94B3650A181B41A67A8309360E1F40@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af47b4d-1ba3-45a7-9d2a-08db932df6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 07:56:22.5348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8MXXVHklelo6JiB1dlZALMQNVAqtzlHLHcr3OmZC3NSGOHZWKpXGQA6JkIjG5EffbfeDiRXT4v9KtnuO93t2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "bhe@redhat.com" <bhe@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ruyang@redhat.com" <ruyang@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Saeed Mahameed <saeedm@nvidia.com>
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

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDEwOjUxICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiBP
biBUdWUsIEF1ZyAxLCAyMDIzIGF0IDQ6MTfigK9QTSBEcmFnb3MgVGF0dWxlYSA8ZHRhdHVsZWFA
bnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gT24gVHVlLCAyMDIzLTA4LTAxIGF0IDExOjU5
ICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQg
NTowOOKAr1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+IHdyb3RlOg0KPiA+
ID4gPiANCj4gPiA+ID4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMDc6MTU6MzFBTSArMDAwMCwg
RHJhZ29zIFRhdHVsZWEgd3JvdGU6DQo+ID4gPiA+ID4gT24gVGh1LCAyMDIzLTA3LTI3IGF0IDEy
OjI4IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBUaHUs
IEp1bCAyNywgMjAyMyBhdCAwNDowMjoxNlBNICswMDAwLCBEcmFnb3MgVGF0dWxlYSB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIzLTA3LTI2IGF0IDE1OjI2IC0wNDAwLCBNaWNoYWVs
IFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCBKdWwgMjYsIDIwMjMg
YXQgMTA6MDc6MzhQTSArMDMwMCwgRHJhZ29zIFRhdHVsZWEgd3JvdGU6DQo+ID4gPiA+ID4gPiA+
ID4gPiBUaGUgbmRldiB3YXMgYWNjZXNzZWQgb24gc2h1dGRvd24gd2l0aG91dCBhIGNoZWNrIGlm
IGl0DQo+ID4gPiA+ID4gPiA+ID4gPiBhY3R1YWxseQ0KPiA+ID4gPiA+ID4gPiA+ID4gZXhpc3Rz
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gVGhpcyB0cmlnZ2VyZWQgdGhlIGNyYXNoIHBhc3RlZCBiZWxv
dy4gVGhpcyBwYXRjaCBzaW1wbHkgYWRkcw0KPiA+ID4gPiA+ID4gPiA+ID4gYQ0KPiA+ID4gPiA+
ID4gPiA+ID4gY2hlY2sNCj4gPiA+ID4gPiA+ID4gPiA+IGJlZm9yZSB1c2luZyBuZGV2Lg0KPiA+
ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiDCoEJVRzoga2VybmVsIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczoNCj4gPiA+ID4gPiA+ID4gPiA+IDAwMDAwMDAwMDAw
MDAzMDANCj4gPiA+ID4gPiA+ID4gPiA+IMKgI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGlu
IGtlcm5lbCBtb2RlDQo+ID4gPiA+ID4gPiA+ID4gPiDCoCNQRjogZXJyb3JfY29kZSgweDAwMDAp
IC0gbm90LXByZXNlbnQgcGFnZQ0KPiA+ID4gPiA+ID4gPiA+ID4gwqBQR0QgMCBQNEQgMA0KPiA+
ID4gPiA+ID4gPiA+ID4gwqBPb3BzOiAwMDAwIFsjMV0gU01QDQo+ID4gPiA+ID4gPiA+ID4gPiDC
oENQVTogMCBQSUQ6IDEgQ29tbTogc3lzdGVtZC1zaHV0ZG93IE5vdCB0YWludGVkIDYuNS4wLQ0K
PiA+ID4gPiA+ID4gPiA+ID4gcmMyX2Zvcl91cHN0cmVhbV9taW5fZGVidWdfMjAyM18wN18xN18x
NV8wNSAjMQ0KPiA+ID4gPiA+ID4gPiA+ID4gwqBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJk
IFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUyByZWwtDQo+ID4gPiA+ID4gPiA+ID4gPiAxLjEz
LjAtMC0NCj4gPiA+ID4gPiA+ID4gPiA+IGdmMjFiNWE0YWViMDItcHJlYnVpbHQucWVtdS5vcmcg
MDQvMDEvMjAxNA0KPiA+ID4gPiA+ID4gPiA+ID4gwqBSSVA6IDAwMTA6bWx4NXZfc2h1dGRvd24r
MHhlLzB4NTAgW21seDVfdmRwYV0NCj4gPiA+ID4gPiA+ID4gPiA+IMKgUlNQOiAwMDE4OmZmZmY4
ODgxMDAzYmZkYzAgRUZMQUdTOiAwMDAxMDI4Ng0KPiA+ID4gPiA+ID4gPiA+ID4gwqBSQVg6IGZm
ZmY4ODgxMDNiZWZiYTAgUkJYOiBmZmZmODg4MTA5ZDI4MDA4IFJDWDoNCj4gPiA+ID4gPiA+ID4g
PiA+IDAwMDAwMDAwMDAwMDAwMTcNCj4gPiA+ID4gPiA+ID4gPiA+IMKgUkRYOiAwMDAwMDAwMDAw
MDAwMDAxIFJTSTogMDAwMDAwMDAwMDAwMDIxMiBSREk6DQo+ID4gPiA+ID4gPiA+ID4gPiBmZmZm
ODg4MTA5ZDI4MDAwDQo+ID4gPiA+ID4gPiA+ID4gPiDCoFJCUDogMDAwMDAwMDAwMDAwMDAwMCBS
MDg6IDAwMDAwMDBkM2EzYTM4ODIgUjA5Og0KPiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAw
MDAwMQ0KPiA+ID4gPiA+ID4gPiA+ID4gwqBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAw
MDAwMDAwMDAwMDAwIFIxMjoNCj4gPiA+ID4gPiA+ID4gPiA+IGZmZmY4ODgxMDlkMjgwMDANCj4g
PiA+ID4gPiA+ID4gPiA+IMKgUjEzOiBmZmZmODg4MTA5ZDI4MDgwIFIxNDogMDAwMDAwMDBmZWUx
ZGVhZCBSMTU6DQo+ID4gPiA+ID4gPiA+ID4gPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+ID4g
PiA+ID4gPiDCoEZTOsKgIDAwMDA3ZjQ5NjllMGJlNDAoMDAwMCkgR1M6ZmZmZjg4ODUyYzgwMDAw
MCgwMDAwKQ0KPiA+ID4gPiA+ID4gPiA+ID4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4g
PiA+ID4gPiA+ID4gwqBDUzrCoCAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4
MDA1MDAzMw0KPiA+ID4gPiA+ID4gPiA+ID4gwqBDUjI6IDAwMDAwMDAwMDAwMDAzMDAgQ1IzOiAw
MDAwMDAwMTA1MWNkMDA2IENSNDoNCj4gPiA+ID4gPiA+ID4gPiA+IDAwMDAwMDAwMDAzNzBlYjAN
Cj4gPiA+ID4gPiA+ID4gPiA+IMKgRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAw
MDAwMDAwMCBEUjI6DQo+ID4gPiA+ID4gPiA+ID4gPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+
ID4gPiA+ID4gPiDCoERSMzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZTBmZjAg
RFI3Og0KPiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAwMDQwMA0KPiA+ID4gPiA+ID4gPiA+
ID4gwqBDYWxsIFRyYWNlOg0KPiA+ID4gPiA+ID4gPiA+ID4gwqAgPFRBU0s+DQo+ID4gPiA+ID4g
PiA+ID4gPiDCoCA/IF9fZGllKzB4MjAvMHg2MA0KPiA+ID4gPiA+ID4gPiA+ID4gwqAgPyBwYWdl
X2ZhdWx0X29vcHMrMHgxNGMvMHgzYzANCj4gPiA+ID4gPiA+ID4gPiA+IMKgID8gZXhjX3BhZ2Vf
ZmF1bHQrMHg3NS8weDE0MA0KPiA+ID4gPiA+ID4gPiA+ID4gwqAgPyBhc21fZXhjX3BhZ2VfZmF1
bHQrMHgyMi8weDMwDQo+ID4gPiA+ID4gPiA+ID4gPiDCoCA/IG1seDV2X3NodXRkb3duKzB4ZS8w
eDUwIFttbHg1X3ZkcGFdDQo+ID4gPiA+ID4gPiA+ID4gPiDCoCBkZXZpY2Vfc2h1dGRvd24rMHgx
M2UvMHgxZTANCj4gPiA+ID4gPiA+ID4gPiA+IMKgIGtlcm5lbF9yZXN0YXJ0KzB4MzYvMHg5MA0K
PiA+ID4gPiA+ID4gPiA+ID4gwqAgX19kb19zeXNfcmVib290KzB4MTQxLzB4MjEwDQo+ID4gPiA+
ID4gPiA+ID4gPiDCoCA/IHZmc193cml0ZXYrMHhjZC8weDE0MA0KPiA+ID4gPiA+ID4gPiA+ID4g
wqAgPyBoYW5kbGVfbW1fZmF1bHQrMHgxNjEvMHgyNjANCj4gPiA+ID4gPiA+ID4gPiA+IMKgID8g
ZG9fd3JpdGV2KzB4NmIvMHgxMTANCj4gPiA+ID4gPiA+ID4gPiA+IMKgIGRvX3N5c2NhbGxfNjQr
MHgzZC8weDkwDQo+ID4gPiA+ID4gPiA+ID4gPiDCoCBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3
ZnJhbWUrMHg0Ni8weGIwDQo+ID4gPiA+ID4gPiA+ID4gPiDCoFJJUDogMDAzMzoweDdmNDk2OTkw
ZmI1Ng0KPiA+ID4gPiA+ID4gPiA+ID4gwqBSU1A6IDAwMmI6MDAwMDdmZmZjN2JkZGU4OCBFRkxB
R1M6IDAwMDAwMjA2IE9SSUdfUkFYOg0KPiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAwMDBh
OQ0KPiA+ID4gPiA+ID4gPiA+ID4gwqBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAw
MDAwMDAwMDAwIFJDWDoNCj4gPiA+ID4gPiA+ID4gPiA+IDAwMDA3ZjQ5Njk5MGZiNTYNCj4gPiA+
ID4gPiA+ID4gPiA+IMKgUkRYOiAwMDAwMDAwMDAxMjM0NTY3IFJTSTogMDAwMDAwMDAyODEyMTk2
OSBSREk6DQo+ID4gPiA+ID4gPiA+ID4gPiBmZmZmZmZmZmZlZTFkZWFkDQo+ID4gPiA+ID4gPiA+
ID4gPiDCoFJCUDogMDAwMDdmZmZjN2JkZTFkMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5Og0K
PiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4gPiA+ID4gPiA+ID4gwqBS
MTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjA2IFIxMjoNCj4gPiA+ID4g
PiA+ID4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPiA+ID4gPiA+IMKgUjEzOiAwMDAw
N2ZmZmM3YmRkZjEwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6DQo+ID4gPiA+ID4gPiA+ID4g
PiAwMDAwN2ZmZmM3YmRlMmI4DQo+ID4gPiA+ID4gPiA+ID4gPiDCoCA8L1RBU0s+DQo+ID4gPiA+
ID4gPiA+ID4gPiDCoENSMjogMDAwMDAwMDAwMDAwMDMwMA0KPiA+ID4gPiA+ID4gPiA+ID4gwqAt
LS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gPiA+ID4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gPiA+ID4gRml4ZXM6IGJjOWEyYjNlNjg2ZSAoInZkcGEvbWx4NTogU3VwcG9y
dCBpbnRlcnJ1cHQgYnlwYXNzaW5nIikNCj4gPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IERyYWdvcyBUYXR1bGVhIDxkdGF0dWxlYUBudmlkaWEuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4g
LS0tDQo+ID4gPiA+ID4gPiA+ID4gPiDCoGRyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQu
YyB8IDMgKystDQo+ID4gPiA+ID4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYw0KPiA+ID4g
PiA+ID4gPiA+ID4gYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMNCj4gPiA+ID4g
PiA+ID4gPiA+IGluZGV4IDkxMzhlZjJmYjJjOC4uZTJlN2ViZDcxNzk4IDEwMDY0NA0KPiA+ID4g
PiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jDQo+ID4g
PiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMNCj4g
PiA+ID4gPiA+ID4gPiA+IEBAIC0zNTU2LDcgKzM1NTYsOCBAQCBzdGF0aWMgdm9pZCBtbHg1dl9z
aHV0ZG93bihzdHJ1Y3QNCj4gPiA+ID4gPiA+ID4gPiA+IGF1eGlsaWFyeV9kZXZpY2UNCj4gPiA+
ID4gPiA+ID4gPiA+ICphdXhkZXYpDQo+ID4gPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBt
Z3RkZXYgPSBhdXhpbGlhcnlfZ2V0X2RydmRhdGEoYXV4ZGV2KTsNCj4gPiA+ID4gPiA+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgIG5kZXYgPSBtZ3RkZXYtPm5kZXY7DQo+ID4gPiA+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqAgZnJlZV9pcnFzKG5kZXYpOw0KPiA+ID4g
PiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoCBpZiAobmRldikNCj4gPiA+ID4gPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyZWVfaXJxcyhuZGV2KTsNCj4gPiA+ID4gPiA+
ID4gPiA+IMKgfQ0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiA+ID4gc29tZXRoaW5nIEkgZG9uJ3QgZ2V0Og0KPiA+ID4gPiA+ID4gPiA+IGlycXMgYXJl
IGFsbG9jYXRlZCBpbiBtbHg1X3ZkcGFfZGV2X2FkZA0KPiA+ID4gPiA+ID4gPiA+IHdoeSBhcmUg
dGhleSBub3QgZnJlZWQgaW4gbWx4NV92ZHBhX2Rldl9kZWw/DQo+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+IFRoYXQgaXMgYSBnb29kIHBvaW50LiBJIHdpbGwgdHJ5IHRvIGZpbmQgb3V0
LiBJIGFsc28gZG9uJ3QgZ2V0IHdoeQ0KPiA+ID4gPiA+ID4gPiBmcmVlX2lycQ0KPiA+ID4gPiA+
ID4gPiBpcw0KPiA+ID4gPiA+ID4gPiBjYWxsZWQgaW4gdGhlIHZkcGEgZGV2IC5mcmVlIG9wIGlu
c3RlYWQgb2YgbWx4NV92ZHBhX2Rldl9kZWwuDQo+ID4gPiA+ID4gPiA+IE1heWJlIEkNCj4gPiA+
ID4gPiA+ID4gY2FuDQo+ID4gPiA+ID4gPiA+IGNoYW5nZQ0KPiA+ID4gPiA+ID4gPiB0aGF0IGlu
IGEgZGlmZmVyZW50IHJlZmFjdG9yaW5nLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBhcyBp
dCBpcyBJIGhhdmUgbm8gaWRlYSB3aGV0aGVyIGUuZy4gbmRldiBjYW4gY2hhbmdlDQo+ID4gPiA+
ID4gPiBiZXR3ZWVuIHRoZXNlIHR3byBjYWxsIHNpdGVzLiB0aGF0IHdvdWxkIG1ha2UgdGhlIGNo
ZWNrDQo+ID4gPiA+ID4gPiBwb2ludGxlc3MuDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
PiB0aGlzIGlzIHdoYXQncyBjcmVhdGluZyBhbGwgdGhpcyBtZXNzLg0KPiA+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBOb3QgcXVpdGU6IG1seDVfdmRwYV9k
ZXZfZGVsICh3aGljaCBpcyBhIC5kZXZfZGVsIG9mIGZvciBzdHJ1Y3QNCj4gPiA+ID4gPiA+ID4g
dmRwYV9tZ210ZGV2X29wcykgZG9lc24ndCBnZXQgY2FsbGVkIG9uIHNodXRkb3duLiBBdCBsZWFz
dCB0aGF0J3MNCj4gPiA+ID4gPiA+ID4gd2hhdA0KPiA+ID4gPiA+ID4gPiBJDQo+ID4gPiA+ID4g
PiA+IHNlZS4gT3INCj4gPiA+ID4gPiA+ID4gYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gYW5kIHdoeSBkbyB3ZSBjYXJlIHdoZXRoZXIgaXJxcyBhcmUg
ZnJlZWQgb24gc2h1dGRvd24/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiBIYWQgdG8gYXNrIGFy
b3VuZCBhIGJpdCB0byBmaW5kIG91dCB0aGUgYW5zd2VyOiB0aGVyZSBjYW4gYmUgaXNzdWVzDQo+
ID4gPiA+ID4gd2l0aA0KPiA+ID4gPiA+IGtleGVjDQo+ID4gPiA+ID4gSVJRIGFsbG9jYXRpb24g
b24gc29tZSBwbGF0Zm9ybXMuIEl0IGlzIGRvY3VtZW50ZWQgaGVyZSBbMF0gZm9yDQo+ID4gPiA+
ID4gbWx4NV9jb3JlLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZl
cnMvbmV0L2V0aGVybmV0L21lbGxhbm94L21seDUvY29yZS9tYWluLmMjbjIxMjkNCj4gPiA+ID4g
PiANCj4gPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+ID4gRHJhZ29zDQo+ID4gPiA+IA0KPiA+ID4g
PiBJdCdzIHF1aXRlIHdlaXJkLg0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgICogU29tZSBwbGF0
Zm9ybXMgcmVxdWlyaW5nIGZyZWVpbmcgdGhlIElSUSdzIGluIHRoZSBzaHV0ZG93bg0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgICogZmxvdy4gSWYgdGhleSBhcmVuJ3QgZnJlZWQgdGhleSBjYW4n
dCBiZSBhbGxvY2F0ZWQgYWZ0ZXINCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIGtleGVjLiBU
aGVyZSBpcyBubyBuZWVkIHRvIGNsZWFudXAgdGhlIG1seDVfY29yZSBzb2Z0d2FyZQ0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgICogY29udGV4dHMuDQo+ID4gPiA+IA0KPiA+ID4gPiBidXQgbW9z
dCBkcml2ZXJzIGRvbid0IGhhdmUgYSBzaHV0ZG93biBjYWxsYmFjayBob3cgZG8gdGhleSB3b3Jr
IHRoZW4/DQo+ID4gPiA+IGRvIHlvdSBrbm93IHdoaWNoIHBsYXRmb3JtcyB0aGVzZSBhcmU/DQo+
ID4gPiANCj4gPiBJIGRvbid0LiB4ODZfNjQgaXMgbm90IG9uZSBvZiB0aGVtIHRob3VnaC4gSSB3
aWxsIGRvIHNvbWUgbW9yZSBkaWdnaW5nIC4uLg0KPiA+IA0KVHVybnMgb3V0IHRoYXQgdGhpcyBm
aXggKHJlbGVhc2luZyB0aGUgaXJxcyBvbiAuc2h1dGRvd24gb24gbWx4NV9jb3JlKSB3YXMNCnJl
cXVpcmVkIGZvciBQUEMgYXJjaCBidXQgb25seSBmb3IgY2VydGFpbiBtYWluZnJhbWUgc3lzdGVt
cy4gVGhhdCdzIGFsbCB0aGUNCmluZm8gSSBjb3VsZCBmaW5kLg0KDQo+ID4gPiBUaGVyZSB1c2Vk
IHRvIGJlIGJ6cyB0aGF0IHJlcXVpcmVzIHZpcnRpbyBkcml2ZXJzIHRvIGFkZCBhIHNodXRkb3du
IHRvDQo+ID4gPiBmaXgga2V4ZWM6DQo+ID4gPiANCj4gPiA+IGh0dHBzOi8vYnVnemlsbGEucmVk
aGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjEwODQwNg0KPiA+ID4gDQo+ID4gSSBkb24ndCBoYXZl
IGFjY2VzcyB0byB0aGlzLiBXaGF0IGlzIGl0IGFib3V0Pw0KPiANCj4gVGhpcyBidWcgbWlnaHQg
YmUgbW9yZSBhY2N1cmF0ZToNCj4gDQo+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93
X2J1Zy5jZ2k/aWQ9MTgyMDUyMQ0KPiANCj4gSXQncyBhYm91dCB0aGUga2V4ZWMgZ3V5cyAoY2Nl
ZCByZWxldmFudCBwZW9wbGUpIHdhbnRpbmcgdG8gYWRkIGENCj4gc2h1dGRvd24gbWV0aG9kIGZv
ciB2aXJpdG8gdG8gZml4IHBvdGVudGlhbCBrZXhlYyBpc3N1ZXMuDQo+IA0KPiBUaGFua3MNCj4g
DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IERyYWdvcw0KPiA+ID4gVGhhbmtzDQo+ID4gPiANCj4g
PiA+ID4gDQo+ID4gPiA+IEkgZG9uJ3QgcmVhbGx5IGtub3cgbXVjaCBhYm91dCB3aHkgc2h1dGRv
d24gY2FsbGJhY2sgaXMgZXZlbiBuZWNlc3NhcnkuDQo+ID4gPiA+IEkgZ3Vlc3MgdGhpcyBpcyB0
byBkZXRlY3Qgc2h1dGRvd24gYW5kIGRvIGEgZmFzdGVyIGNsZWFudXAgdGhhbg0KPiA+ID4gPiB0
aGUgc2xvdywgZ3JhY2VmdWwgcmVtb3ZhbCwganVzdCBjbGVhbmluZyBoYXJkd2FyZSByZXNvdXJj
ZXM/DQo+ID4gPiA+IA0KLnNodXRkb3duIGNvdWxkIGJlIHJlbW92ZWQgaW4gbWx4NV92ZHBhLiBC
dXQgSSBub3RpY2UgdGhhdCBtbHg1X2NvcmUncyAuc2h1dGRvd24NCmtpY2tzIGluIGZyb20gcGNp
X2RldmljZV9zaHV0ZG93biB0byBjbGVhbiB0aGUgaXJxcy4gU28gdGhlIGlycXMgd2lsbCBzdGls
bCBiZQ0KZnJlZWQgYnV0IGFzIGEgc2lkZSBlZmZlY3QuIFdoaWNoIGlzIG5vdCBnb29kLg0KDQpU
aGFua3MsDQpEcmFnb3MNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
