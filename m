Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E203E76ED7E
	for <lists.virtualization@lfdr.de>; Thu,  3 Aug 2023 17:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0C684181C;
	Thu,  3 Aug 2023 15:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C684181C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YnuVS0n+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNHe1rcXIvn0; Thu,  3 Aug 2023 15:03:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 61005417F2;
	Thu,  3 Aug 2023 15:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61005417F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56290C0DD4;
	Thu,  3 Aug 2023 15:03:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56DBCC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 15:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18D1860F3E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 15:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D1860F3E
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=YnuVS0n+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gihJrJsdAnCA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 15:03:03 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::606])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AB24612A1
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Aug 2023 15:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB24612A1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcMQgv7VaaqytMC4eJhHlaLhoqZ2AGEUaYuPbY2r4LB5j2d1xZQ8oCAD8LOlRE5A5PYHYeys4/ZcErBqC+fRiS8wVZs1CBCmF4u2inq51RTRgfzXPgRAKPaF7rpeMvXDW7fRoQJCa9k70QePQ5L7qzkQstDwH3lcTpfSKmDVU3JUTuP1eVf3uYFj3EzAb5wjtSkjMb2rlrSsTvcruho0cwqWetcKetzor7QCmXzQEdOB7HPNXeCb1Osru3UtOtd4HSXasRJFa3X/ESLDACOd5qfOTysAYhBNxy9Hob7poD5fgJthr2gQMvDY2twqEvaarVymT/2M62w7gCUazu8uVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPBt24NgYnIbm17kky74onDXQY0ba/BuPP0VgnuxbV8=;
 b=dM4A584Ml3wbC//DW3sqUEEkNYQM6Si1bDlCUY9ozKZv4KIVkp2uuVecyBJFLLM4euGLrU4O5qNg+PZQ1X9To2Z01Xt1SfSJ3Q/NgaXMEtzXxPkMuE3X0urIo/OAOe11wlndHXRA1M/yVVLQY+/NnwDe7uOPsXIZ567WTpGX766FeAfeyfpnI6HyA6Cl7CVXSB0GIZ3nBZek8FJukq3+9TkkU9VD3PFElHyWnotUtP1w3SbTaxh/BPPs/IbSQZudv3IoSb7M20F746ncTiDjx57IGxISOoeWGFeo/KZid279TQsE90xQKdIx4hsJMvXy0nYeOGQJnDUKrGs51xyl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPBt24NgYnIbm17kky74onDXQY0ba/BuPP0VgnuxbV8=;
 b=YnuVS0n+AEh9DH3vj42QHruiAgd8T0g0q7KZKaZlor6wGh5LHKmHkkcmTF26wFW3+5n8SwkZ12xYkkIaZx5XgReR6WLZdfpFBgLVUsZsDnU1/cKLmxmqUdhjjAMdyrexUV6LlmA/zmFZ/58zqavTYk25x+7WyLghanKeBYLXvveInvouVqk3tOQS7W/wGEteXS26JLeyicjNuoQFyb0TNOwgiNKqyX4ZagC0jLcDOxl3V0F09HK7qPIfULpfz4OFpjR96g2SCR5Qe/AIjfOv37QWs+vs14IYhesBy6pmY6ClgMlYdS1v90ZHLfjgZO3CxbMjYrAv0yiw44R9mYvS0w==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by LV3PR12MB9259.namprd12.prod.outlook.com (2603:10b6:408:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 15:03:00 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 15:02:59 +0000
To: "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Topic: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Index: AQHZv/SESZp4mdZfpESAhZmcsTYGMq/Mbh0AgAFZZYCAAAdcgIAFrswAgAAfgICAATv0gIAASDEAgAE3OACAAFU2gIACCYcA
Date: Thu, 3 Aug 2023 15:02:59 +0000
Message-ID: <5eba7bc2d3f253be4b0b998dc8a7a3efc7fe08d9.camel@nvidia.com>
References: <20230726190744.14143-1-dtatulea@nvidia.com>
 <20230726152258-mutt-send-email-mst@kernel.org>
 <3ae9e8919a9316d06d7bb507698c820ac6194f45.camel@nvidia.com>
 <20230727122633-mutt-send-email-mst@kernel.org>
 <b97484f15824c86f5cee4fe673794f17419bcb1b.camel@nvidia.com>
 <20230731050200-mutt-send-email-mst@kernel.org>
 <CACGkMEtiwNjq4pMVY-Yvgo3+DihMP5zO+q+HH-xAF+Xu_=gbHg@mail.gmail.com>
 <39c3be5dd59e67e7b5dd301100e96aa9428bc332.camel@nvidia.com>
 <CACGkMEueOXgjbr9Q0Tw5Bv-=YH9+5UR9jxttrf6hN-VRK9KtMg@mail.gmail.com>
 <4375036868b636fa9c5a03e7fa9c4d7cdefefc5f.camel@nvidia.com>
In-Reply-To: <4375036868b636fa9c5a03e7fa9c4d7cdefefc5f.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|LV3PR12MB9259:EE_
x-ms-office365-filtering-correlation-id: 52c54f23-56bb-434f-5955-08db9432ba3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QWfjUlJ3Dik8FVHs9UwkhZZbe+mcN/3dw6HBNbmgw18foAJ5lRnDhfhi8l5ORiSOpcLTi4EyxqVJO0jN1OCcFRtby8G19UxR/vOMWmnSKBurxhH1Pwgz7UW8/UUJXg3y27VygXYxD50WrpqzQX/f1UpPZkR0wF10xe8efG07g2eFuSWJeuulIyqjKpEjwfstmrNslVyy3a8Eto6KpGmLoohjvBYbvI1eYRbOo9mDWcjxGJjjs6oI0id1pSnUfoq97kIPKw6P99UfuPhwckOqJ+hAeMc5Zyt0wKjCce+Nv8zsSaU/Eem+9GtU47O6cZKi0syB4xmTY9mp9NE5+SBaRr63OCQ6120aCdj4KvdFxxgGLrI7tPrgcKKuvel759P0dEGbRrSJyquuz/IhQtSoRR02I/egAETog9Nx3ttZ/y36fsFQxpnQrX07m+AMHEh23MBEDb2CatWYTF7Ep5MJNGdwnxbHFnViyMhbfH/h8QfkP5dYYl1AvF5OYnzv8td5N7QaxYeMQw2IKtigOHrkxHiUqCKxLOwwCDOsMdEp+No6A+x4F/VMK5hJhZoNTry5ZmSWgPg9ilfzZmhkehMbJ+BX4VYCyZ7kiktQbljGY+Zuz/8tJFU+BONMYZ7E7vHvF447iOdvOwmuB8atYxwiKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(41300700001)(38100700002)(6486002)(966005)(6512007)(71200400001)(54906003)(91956017)(66446008)(66556008)(64756008)(6916009)(76116006)(4326008)(66476007)(66946007)(316002)(5660300002)(478600001)(38070700005)(83380400001)(186003)(53546011)(6506007)(2616005)(122000001)(36756003)(8676002)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qy9sVm53KzNSNnlzVms0cCtHUGRXRnJyN1VEV0N5UFp6V216NU9PS1ZscWsy?=
 =?utf-8?B?TUhlSE9jMG1BNnUrVDQ0Q0xCMGFlU0tmZWMxOGxWcktONlhtQ1EzTWVyVnR6?=
 =?utf-8?B?QjFhQ2NSTm50VFZGQXVQajd0NFNNRXNRV09FYTlob1Q0M2FZb3NWTmZlT3dM?=
 =?utf-8?B?b1B4SFloTFQzcDNIVUY1K21OWE03NzRmSXRZQlJUajJNcXM0bEUyWHdIVi85?=
 =?utf-8?B?bzAydFZQdG85aSs3TG5sK2pkK3NEOTVhNWxBc1NsOXJ4N05jZkFrejVoVHRJ?=
 =?utf-8?B?bDN0d2M4dEVVajZxUTFJNTlSZWljZGNwWmJPOU4zdWJ3dWVBaGtPSDZxQUlN?=
 =?utf-8?B?cFowYmFWZDdyYk45c21pY25oUG96dVY1UStsTGtaMjZxQnF4dm02UUVDWkJm?=
 =?utf-8?B?TEZNWlR0VzRzeEVHcTBkNGtXUW43WlJJWDRJdHQxSVhzK1V5WkVQZEJ1c0Vp?=
 =?utf-8?B?RHFZcG1ZeHVscVNsTlNnaDhERkNQYWQ4QVlRZXZLQ0JqcWNRS2tMS0gvcWs2?=
 =?utf-8?B?UG82N2kxOEpRTUU5VVZSczV0Q2FLSTlSNGNZNkpGZ3hadmhxcWZFWE96M1BD?=
 =?utf-8?B?RnB0NitZY3VQWmhPMTlRNmcvY2dPbjdJVTNSNC91YmlNR2dKNVV6WDZaRFls?=
 =?utf-8?B?Mk5hVHd6aW1EamNydTNMU25DMXhEMFd4NEhaT2dMRU44R0M2bDIwMkxCZHBZ?=
 =?utf-8?B?SUoxSUxEVWt2TmRjRkxTbkF2Mk5JRTV6NDNPcDQwTis2NFdnWlJMS0pTcFlH?=
 =?utf-8?B?MzJVNHg1Y2orVW1ENEtJbDduT2lZaVNxeW45SDdNbVdlNHpyRkN1WnVITGla?=
 =?utf-8?B?N2p1TTBEOEdZNytGZjZvVUoxZkM2ZWNNVmNlMXFUUXFQN2xEaytvQ2hDSU1q?=
 =?utf-8?B?eVowZWRNVGtuTFhEZzBTbkRGZDVqOG5JMnRQVVNVbjVPMENjNkRMUVFlaXE2?=
 =?utf-8?B?TS9lY0dibUlNdXB3WDlQa20wOGovS09pMUhzR3BsVW1rbFVWbnFRQlo5eDJX?=
 =?utf-8?B?eWtTNTNoVnN3UEFTSmRkdmNlUTd6QlZvbGQ5Y1M3MEpwa3BQek4ybk1OSm9B?=
 =?utf-8?B?MHJMTWRjTUE2UUtQUDV3SXhSbisxMEJiL3YvVlVTNUYyNXkyZ3p4UmdzNVF0?=
 =?utf-8?B?S2lMV2lub1dCVzFBaVdQbThFQzAxc1FEdUFQSTAvbmRpMWlzK1BmWXBFamta?=
 =?utf-8?B?RXhsV1JuUzRWN3Aya0dQeDUzNXM3N3d2VFlXVW5CYmtvUnR2em03OGcwQ0Vr?=
 =?utf-8?B?NlBET0drNmEzSGFhMDNNMExnQ3FLOXEyM0VYMFE3WWw5UWtHcTZoMjJHTXAv?=
 =?utf-8?B?RWI2MDJUdmozNUllWlRneUFhN0JNZUFXa0NUMU1OemxaeVgwdGVVUUxqbnkw?=
 =?utf-8?B?eFkyV0pDVnI5ZmdaTS9wNTE3Zk9jVkpDT24rZGZrcmhZcGk1VkhPQ0lVMWJK?=
 =?utf-8?B?M0l0WmwzVFBXU2JYWTFUVW1YK1BXcnhBOGU0ajFndXljeUlzdllUTVh1VDhm?=
 =?utf-8?B?N3lzamNKdmFuWXFDeTRRL3JoQ0x3aFpxNC9xeFQ4T2NjQllhSXU2OHR6NUNZ?=
 =?utf-8?B?TVdOc3NyUXdJQVUwQzVmNGpONU9mM3poVi9zQis2Y0dqR2VmaUVwS0xJTVJ1?=
 =?utf-8?B?a2o3NHNmWlp3dUw5SHE3ODlHeGJGaGZtQzVZY1RYSmpRdUFheHlnSUZZQ3BY?=
 =?utf-8?B?cUdyblNsbXE1bVNiRjZXMmdTSm82SUljRTJSc25JQzZuNGsvOTRYRVNBdXNT?=
 =?utf-8?B?T0VzeVorUkRBYmNTaGxvcFNiMHUzZzUwVmlTc1VhcXVST2dIR0dqeDNLdU5C?=
 =?utf-8?B?WERxSDAwNWUyTjcxbytFZzQ4NEcrbnBFSEVpWGw0ZEF2MFZ3OGdEengrT21N?=
 =?utf-8?B?QThsNWFXLzkyRXJnWnVySkQrVFRkeUJNMWF6aGl6UHF2ckpSeFdNZmVRUXdL?=
 =?utf-8?B?dkpoYnNsOVdUTWJnTmxGQlRzRnVwVXRLYU4zTW5YUGVLalZTLzlKU0d0TDdV?=
 =?utf-8?B?S21Rb0oybjRycFkwTlk0dVhPcEFPbFFlOWZKbGYya3V1QTJ5aTh2S0o4bWpj?=
 =?utf-8?B?TStLdHdCQWVneEh6QTFXU3F2Y20yQ21uaFNFSkQveXRnc2pabFFFc2xGMG5V?=
 =?utf-8?B?d3BiWW5oSDk4WmdtZWNaZUV6b293TmlmM1ZBZzVxZkxyVEgrUkhvZFJ0WGEx?=
 =?utf-8?Q?1YRjzrw8X0PSoXcr0+abQollfNDY5IrNvjcRwhUVdc+j?=
Content-ID: <FA58F30621C6B24290C4088E994ADC34@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c54f23-56bb-434f-5955-08db9432ba3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 15:02:59.6451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nk9ZLJUtBP2Q8O83uziI6VKTOgoCThqYfD9WDPmtnf3fTwMesFTb928yGlSkIG1SFQZQQo+L9vF0HdRlvVk6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9259
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

T24gV2VkLCAyMDIzLTA4LTAyIGF0IDA5OjU2ICswMjAwLCBEcmFnb3MgVGF0dWxlYSB3cm90ZToN
Cj4gT24gV2VkLCAyMDIzLTA4LTAyIGF0IDEwOjUxICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0K
PiA+IE9uIFR1ZSwgQXVnIDEsIDIwMjMgYXQgNDoxN+KAr1BNIERyYWdvcyBUYXR1bGVhIDxkdGF0
dWxlYUBudmlkaWEuY29tPiB3cm90ZToNCj4gPiA+IA0KPiA+ID4gT24gVHVlLCAyMDIzLTA4LTAx
IGF0IDExOjU5ICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIEp1bCAz
MSwgMjAyMyBhdCA1OjA44oCvUE0gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4N
Cj4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT24gTW9uLCBKdWwgMzEsIDIw
MjMgYXQgMDc6MTU6MzFBTSArMDAwMCwgRHJhZ29zIFRhdHVsZWEgd3JvdGU6DQo+ID4gPiA+ID4g
PiBPbiBUaHUsIDIwMjMtMDctMjcgYXQgMTI6MjggLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3
cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDQ6MDI6MTZQTSAr
MDAwMCwgRHJhZ29zIFRhdHVsZWEgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIz
LTA3LTI2IGF0IDE1OjI2IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPiA+
ID4gPiA+ID4gPiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBhdCAxMDowNzozOFBNICswMzAwLCBEcmFn
b3MgVGF0dWxlYQ0KPiA+ID4gPiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+
IFRoZSBuZGV2IHdhcyBhY2Nlc3NlZCBvbiBzaHV0ZG93biB3aXRob3V0IGEgY2hlY2sgaWYgaXQN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gYWN0dWFsbHkNCj4gPiA+ID4gPiA+ID4gPiA+ID4gZXhpc3Rz
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHRyaWdnZXJlZCB0aGUgY3Jhc2ggcGFzdGVkIGJl
bG93LiBUaGlzIHBhdGNoIHNpbXBseQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiBhZGRzDQo+ID4gPiA+
ID4gPiA+ID4gPiA+IGENCj4gPiA+ID4gPiA+ID4gPiA+ID4gY2hlY2sNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gYmVmb3JlIHVzaW5nIG5kZXYuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gPiA+ID4gPiDCoEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVz
czoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAwMDMwMA0KPiA+ID4gPiA+ID4gPiA+
ID4gPiDCoCNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiDCoCNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90LXByZXNlbnQgcGFn
ZQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoFBHRCAwIFA0RCAwDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IMKgT29wczogMDAwMCBbIzFdIFNNUA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoENQVTogMCBQSUQ6
IDEgQ29tbTogc3lzdGVtZC1zaHV0ZG93IE5vdCB0YWludGVkIDYuNS4wLQ0KPiA+ID4gPiA+ID4g
PiA+ID4gPiByYzJfZm9yX3Vwc3RyZWFtX21pbl9kZWJ1Z18yMDIzXzA3XzE3XzE1XzA1ICMxDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IMKgSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoUTM1
ICsgSUNIOSwgMjAwOSksIEJJT1MNCj4gPiA+ID4gPiA+ID4gPiA+ID4gcmVsLQ0KPiA+ID4gPiA+
ID4gPiA+ID4gPiAxLjEzLjAtMC0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gZ2YyMWI1YTRhZWIwMi1w
cmVidWlsdC5xZW11Lm9yZyAwNC8wMS8yMDE0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IMKgUklQOiAw
MDEwOm1seDV2X3NodXRkb3duKzB4ZS8weDUwIFttbHg1X3ZkcGFdDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IMKgUlNQOiAwMDE4OmZmZmY4ODgxMDAzYmZkYzAgRUZMQUdTOiAwMDAxMDI4Ng0KPiA+ID4g
PiA+ID4gPiA+ID4gPiDCoFJBWDogZmZmZjg4ODEwM2JlZmJhMCBSQlg6IGZmZmY4ODgxMDlkMjgw
MDggUkNYOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAwMDAwMDAwMDAwMDAwMDE3DQo+ID4gPiA+ID4g
PiA+ID4gPiA+IMKgUkRYOiAwMDAwMDAwMDAwMDAwMDAxIFJTSTogMDAwMDAwMDAwMDAwMDIxMiBS
REk6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IGZmZmY4ODgxMDlkMjgwMDANCj4gPiA+ID4gPiA+ID4g
PiA+ID4gwqBSQlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwZDNhM2EzODgyIFIwOToN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAwMDAwMQ0KPiA+ID4gPiA+ID4gPiA+ID4g
PiDCoFIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiBmZmZmODg4MTA5ZDI4MDAwDQo+ID4gPiA+ID4gPiA+ID4gPiA+IMKg
UjEzOiBmZmZmODg4MTA5ZDI4MDgwIFIxNDogMDAwMDAwMDBmZWUxZGVhZCBSMTU6DQo+ID4gPiA+
ID4gPiA+ID4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPiA+ID4gPiA+ID4gwqBGUzrC
oCAwMDAwN2Y0OTY5ZTBiZTQwKDAwMDApIEdTOmZmZmY4ODg1MmM4MDAwMDAoMDAwMCkNCj4gPiA+
ID4gPiA+ID4gPiA+ID4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4gPiA+ID4gPiA+ID4g
PiDCoENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+
ID4gPiA+ID4gPiA+ID4gPiA+IMKgQ1IyOiAwMDAwMDAwMDAwMDAwMzAwIENSMzogMDAwMDAwMDEw
NTFjZDAwNiBDUjQ6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IDAwMDAwMDAwMDAzNzBlYjANCj4gPiA+
ID4gPiA+ID4gPiA+ID4gwqBEUjA6IDAwMDAwMDAwMDAwMDAwMDAgRFIxOiAwMDAwMDAwMDAwMDAw
MDAwIERSMjoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4gPiA+
ID4gPiA+ID4gPiDCoERSMzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZTBmZjAg
RFI3Og0KPiA+ID4gPiA+ID4gPiA+ID4gPiAwMDAwMDAwMDAwMDAwNDAwDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IMKgQ2FsbCBUcmFjZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gwqAgPFRBU0s+DQo+ID4g
PiA+ID4gPiA+ID4gPiA+IMKgID8gX19kaWUrMHgyMC8weDYwDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IMKgID8gcGFnZV9mYXVsdF9vb3BzKzB4MTRjLzB4M2MwDQo+ID4gPiA+ID4gPiA+ID4gPiA+IMKg
ID8gZXhjX3BhZ2VfZmF1bHQrMHg3NS8weDE0MA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoCA/IGFz
bV9leGNfcGFnZV9mYXVsdCsweDIyLzB4MzANCj4gPiA+ID4gPiA+ID4gPiA+ID4gwqAgPyBtbHg1
dl9zaHV0ZG93bisweGUvMHg1MCBbbWx4NV92ZHBhXQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoCBk
ZXZpY2Vfc2h1dGRvd24rMHgxM2UvMHgxZTANCj4gPiA+ID4gPiA+ID4gPiA+ID4gwqAga2VybmVs
X3Jlc3RhcnQrMHgzNi8weDkwDQo+ID4gPiA+ID4gPiA+ID4gPiA+IMKgIF9fZG9fc3lzX3JlYm9v
dCsweDE0MS8weDIxMA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoCA/IHZmc193cml0ZXYrMHhjZC8w
eDE0MA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoCA/IGhhbmRsZV9tbV9mYXVsdCsweDE2MS8weDI2
MA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoCA/IGRvX3dyaXRldisweDZiLzB4MTEwDQo+ID4gPiA+
ID4gPiA+ID4gPiA+IMKgIGRvX3N5c2NhbGxfNjQrMHgzZC8weDkwDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IMKgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ2LzB4YjANCj4gPiA+ID4g
PiA+ID4gPiA+ID4gwqBSSVA6IDAwMzM6MHg3ZjQ5Njk5MGZiNTYNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gwqBSU1A6IDAwMmI6MDAwMDdmZmZjN2JkZGU4OCBFRkxBR1M6IDAwMDAwMjA2IE9SSUdfUkFY
Og0KPiA+ID4gPiA+ID4gPiA+ID4gPiAwMDAwMDAwMDAwMDAwMGE5DQo+ID4gPiA+ID4gPiA+ID4g
PiA+IMKgUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6DQo+
ID4gPiA+ID4gPiA+ID4gPiA+IDAwMDA3ZjQ5Njk5MGZiNTYNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
wqBSRFg6IDAwMDAwMDAwMDEyMzQ1NjcgUlNJOiAwMDAwMDAwMDI4MTIxOTY5IFJESToNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gZmZmZmZmZmZmZWUxZGVhZA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoFJC
UDogMDAwMDdmZmZjN2JkZTFkMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5Og0KPiA+ID4gPiA+
ID4gPiA+ID4gPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+ID4gPiA+ID4gPiA+IMKgUjEwOiAw
MDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDIwNiBSMTI6DQo+ID4gPiA+ID4gPiA+
ID4gPiA+IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPiA+ID4gPiA+ID4gwqBSMTM6IDAwMDA3
ZmZmYzdiZGRmMTAgUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNToNCj4gPiA+ID4gPiA+ID4gPiA+
ID4gMDAwMDdmZmZjN2JkZTJiOA0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoCA8L1RBU0s+DQo+ID4g
PiA+ID4gPiA+ID4gPiA+IMKgQ1IyOiAwMDAwMDAwMDAwMDAwMzAwDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IMKgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBGaXhlczogYmM5YTJiM2U2ODZlICgidmRwYS9t
bHg1OiBTdXBwb3J0IGludGVycnVwdA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBieXBhc3NpbmciKQ0K
PiA+ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmFnb3MgVGF0dWxlYSA8ZHRhdHVs
ZWFAbnZpZGlhLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IMKgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jIHwgMyArKy0NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IGluZGV4IDkxMzhlZjJmYjJjOC4uZTJlN2ViZDcxNzk4IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gKysrIGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jDQo+ID4gPiA+
ID4gPiA+ID4gPiA+IEBAIC0zNTU2LDcgKzM1NTYsOCBAQCBzdGF0aWMgdm9pZCBtbHg1dl9zaHV0
ZG93bihzdHJ1Y3QNCj4gPiA+ID4gPiA+ID4gPiA+ID4gYXV4aWxpYXJ5X2RldmljZQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiAqYXV4ZGV2KQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oCBtZ3RkZXYgPSBhdXhpbGlhcnlfZ2V0X2RydmRhdGEoYXV4ZGV2KTsNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqAgbmRldiA9IG1ndGRldi0+bmRldjsNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqAgZnJlZV9pcnFzKG5kZXYp
Ow0KPiA+ID4gPiA+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgIGlmIChuZGV2KQ0KPiA+ID4gPiA+
ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlX2lycXMobmRldik7
DQo+ID4gPiA+ID4gPiA+ID4gPiA+IMKgfQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gc29tZXRoaW5nIEkgZG9uJ3QgZ2V0Og0KPiA+
ID4gPiA+ID4gPiA+ID4gaXJxcyBhcmUgYWxsb2NhdGVkIGluIG1seDVfdmRwYV9kZXZfYWRkDQo+
ID4gPiA+ID4gPiA+ID4gPiB3aHkgYXJlIHRoZXkgbm90IGZyZWVkIGluIG1seDVfdmRwYV9kZXZf
ZGVsPw0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gVGhhdCBpcyBhIGdvb2Qg
cG9pbnQuIEkgd2lsbCB0cnkgdG8gZmluZCBvdXQuIEkgYWxzbyBkb24ndCBnZXQNCj4gPiA+ID4g
PiA+ID4gPiB3aHkNCj4gPiA+ID4gPiA+ID4gPiBmcmVlX2lycQ0KPiA+ID4gPiA+ID4gPiA+IGlz
DQo+ID4gPiA+ID4gPiA+ID4gY2FsbGVkIGluIHRoZSB2ZHBhIGRldiAuZnJlZSBvcCBpbnN0ZWFk
IG9mIG1seDVfdmRwYV9kZXZfZGVsLg0KPiA+ID4gPiA+ID4gPiA+IE1heWJlIEkNCj4gPiA+ID4g
PiA+ID4gPiBjYW4NCj4gPiA+ID4gPiA+ID4gPiBjaGFuZ2UNCj4gPiA+ID4gPiA+ID4gPiB0aGF0
IGluIGEgZGlmZmVyZW50IHJlZmFjdG9yaW5nLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gYXMgaXQgaXMgSSBoYXZlIG5vIGlkZWEgd2hldGhlciBlLmcuIG5kZXYgY2FuIGNoYW5nZQ0K
PiA+ID4gPiA+ID4gPiBiZXR3ZWVuIHRoZXNlIHR3byBjYWxsIHNpdGVzLiB0aGF0IHdvdWxkIG1h
a2UgdGhlIGNoZWNrDQo+ID4gPiA+ID4gPiA+IHBvaW50bGVzcy4NCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gPiB0aGlzIGlzIHdoYXQncyBjcmVhdGluZyBhbGwgdGhpcyBtZXNzLg0K
PiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBO
b3QgcXVpdGU6IG1seDVfdmRwYV9kZXZfZGVsICh3aGljaCBpcyBhIC5kZXZfZGVsIG9mIGZvciBz
dHJ1Y3QNCj4gPiA+ID4gPiA+ID4gPiB2ZHBhX21nbXRkZXZfb3BzKSBkb2Vzbid0IGdldCBjYWxs
ZWQgb24gc2h1dGRvd24uIEF0IGxlYXN0DQo+ID4gPiA+ID4gPiA+ID4gdGhhdCdzDQo+ID4gPiA+
ID4gPiA+ID4gd2hhdA0KPiA+ID4gPiA+ID4gPiA+IEkNCj4gPiA+ID4gPiA+ID4gPiBzZWUuIE9y
DQo+ID4gPiA+ID4gPiA+ID4gYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+IGFuZCB3aHkgZG8gd2UgY2FyZSB3aGV0aGVyIGlycXMgYXJlIGZyZWVk
IG9uIHNodXRkb3duPw0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEhhZCB0byBhc2sgYXJv
dW5kIGEgYml0IHRvIGZpbmQgb3V0IHRoZSBhbnN3ZXI6IHRoZXJlIGNhbiBiZSBpc3N1ZXMNCj4g
PiA+ID4gPiA+IHdpdGgNCj4gPiA+ID4gPiA+IGtleGVjDQo+ID4gPiA+ID4gPiBJUlEgYWxsb2Nh
dGlvbiBvbiBzb21lIHBsYXRmb3Jtcy4gSXQgaXMgZG9jdW1lbnRlZCBoZXJlIFswXSBmb3INCj4g
PiA+ID4gPiA+IG1seDVfY29yZS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVsbGFub3gvbWx4NS9jb3JlL21haW4uYyNuMjEy
OQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGFua3MsDQo+ID4gPiA+ID4gPiBEcmFnb3MN
Cj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJdCdzIHF1aXRlIHdlaXJkLg0KPiA+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqAgKiBTb21lIHBsYXRmb3JtcyByZXF1aXJpbmcgZnJlZWluZyB0aGUgSVJRJ3Mg
aW4gdGhlIHNodXRkb3duDQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCAqIGZsb3cuIElmIHRo
ZXkgYXJlbid0IGZyZWVkIHRoZXkgY2FuJ3QgYmUgYWxsb2NhdGVkIGFmdGVyDQo+ID4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoCAqIGtleGVjLiBUaGVyZSBpcyBubyBuZWVkIHRvIGNsZWFudXAgdGhl
IG1seDVfY29yZSBzb2Z0d2FyZQ0KPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBjb250ZXh0
cy4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBidXQgbW9zdCBkcml2ZXJzIGRvbid0IGhhdmUgYSBz
aHV0ZG93biBjYWxsYmFjayBob3cgZG8gdGhleSB3b3JrIHRoZW4/DQo+ID4gPiA+ID4gZG8geW91
IGtub3cgd2hpY2ggcGxhdGZvcm1zIHRoZXNlIGFyZT8NCj4gPiA+ID4gDQo+ID4gPiBJIGRvbid0
LiB4ODZfNjQgaXMgbm90IG9uZSBvZiB0aGVtIHRob3VnaC4gSSB3aWxsIGRvIHNvbWUgbW9yZSBk
aWdnaW5nIC4uLg0KPiA+ID4gDQo+IFR1cm5zIG91dCB0aGF0IHRoaXMgZml4IChyZWxlYXNpbmcg
dGhlIGlycXMgb24gLnNodXRkb3duIG9uIG1seDVfY29yZSkgd2FzDQo+IHJlcXVpcmVkIGZvciBQ
UEMgYXJjaCBidXQgb25seSBmb3IgY2VydGFpbiBtYWluZnJhbWUgc3lzdGVtcy4gVGhhdCdzIGFs
bCB0aGUNCj4gaW5mbyBJIGNvdWxkIGZpbmQuDQo+IA0KSSB3aWxsIHNlbmQgYSB2MiBmb3IgdGhp
cyBwYXRjaCB0aGF0IHJlbW92ZXMgdGhlIHNodXRkb3duIG9wLiBUaGUgaXJxcyB3aWxsIGJlDQpy
ZWxlYXNlZCBieSB0aGUgbWx4NV9jb3JlIHNodXRkb3duIGhhbmRsZXIgd2hpY2ggaXMgcmVzcG9u
c2libGUgZm9yIHRoZSBWRi4NCg0KVGhhbmtzLA0KRHJhZ29zDQoNCj4gPiA+ID4gVGhlcmUgdXNl
ZCB0byBiZSBienMgdGhhdCByZXF1aXJlcyB2aXJ0aW8gZHJpdmVycyB0byBhZGQgYSBzaHV0ZG93
biB0bw0KPiA+ID4gPiBmaXgga2V4ZWM6DQo+ID4gPiA+IA0KPiA+ID4gPiBodHRwczovL2J1Z3pp
bGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTIxMDg0MDYNCj4gPiA+ID4gDQo+ID4gPiBJ
IGRvbid0IGhhdmUgYWNjZXNzIHRvIHRoaXMuIFdoYXQgaXMgaXQgYWJvdXQ/DQo+ID4gDQo+ID4g
VGhpcyBidWcgbWlnaHQgYmUgbW9yZSBhY2N1cmF0ZToNCj4gPiANCj4gPiBodHRwczovL2J1Z3pp
bGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE4MjA1MjENCj4gPiANCj4gPiBJdCdzIGFi
b3V0IHRoZSBrZXhlYyBndXlzIChjY2VkIHJlbGV2YW50IHBlb3BsZSkgd2FudGluZyB0byBhZGQg
YQ0KPiA+IHNodXRkb3duIG1ldGhvZCBmb3IgdmlyaXRvIHRvIGZpeCBwb3RlbnRpYWwga2V4ZWMg
aXNzdWVzLg0KPiA+IA0KPiA+IFRoYW5rcw0KPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFua3MsDQo+
ID4gPiBEcmFnb3MNCj4gPiA+ID4gVGhhbmtzDQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IEkgZG9uJ3QgcmVhbGx5IGtub3cgbXVjaCBhYm91dCB3aHkgc2h1dGRvd24gY2FsbGJhY2sg
aXMgZXZlbg0KPiA+ID4gPiA+IG5lY2Vzc2FyeS4NCj4gPiA+ID4gPiBJIGd1ZXNzIHRoaXMgaXMg
dG8gZGV0ZWN0IHNodXRkb3duIGFuZCBkbyBhIGZhc3RlciBjbGVhbnVwIHRoYW4NCj4gPiA+ID4g
PiB0aGUgc2xvdywgZ3JhY2VmdWwgcmVtb3ZhbCwganVzdCBjbGVhbmluZyBoYXJkd2FyZSByZXNv
dXJjZXM/DQo+ID4gPiA+ID4gDQo+IC5zaHV0ZG93biBjb3VsZCBiZSByZW1vdmVkIGluIG1seDVf
dmRwYS4gQnV0IEkgbm90aWNlIHRoYXQgbWx4NV9jb3JlJ3MNCj4gLnNodXRkb3duDQo+IGtpY2tz
IGluIGZyb20gcGNpX2RldmljZV9zaHV0ZG93biB0byBjbGVhbiB0aGUgaXJxcy4gU28gdGhlIGly
cXMgd2lsbCBzdGlsbCBiZQ0KPiBmcmVlZCBidXQgYXMgYSBzaWRlIGVmZmVjdC4gV2hpY2ggaXMg
bm90IGdvb2QuDQo+IA0KPiBUaGFua3MsDQo+IERyYWdvcw0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
