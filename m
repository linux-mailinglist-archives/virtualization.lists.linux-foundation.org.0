Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F0765834
	for <lists.virtualization@lfdr.de>; Thu, 27 Jul 2023 18:02:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46863417F8;
	Thu, 27 Jul 2023 16:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46863417F8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s8dKFeoJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKmxzhZlDoOM; Thu, 27 Jul 2023 16:02:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C19DD40A6B;
	Thu, 27 Jul 2023 16:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19DD40A6B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9FF3C008D;
	Thu, 27 Jul 2023 16:02:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA9BC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Jul 2023 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0147B41FA9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Jul 2023 16:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0147B41FA9
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=s8dKFeoJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQis3vAPtr6s
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Jul 2023 16:02:21 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABF8D41FA8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 27 Jul 2023 16:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF8D41FA8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8J4L/rdxgAIbdHrVOM5+g27tozLxr16xDkdLEbaNZLoLAAbBsqY6x/53X5HkW4SoBjnM+iwR1p0gsXGJ//u/7hOnCfGH4FQP8aF1qcUmYjhUFX7UqlL5BwhDoBjD61lrlH7bi5hZRiG+JTB0Vplrd2HTsUC6azXBLEckcXad8D3zIwmpnkYZypxp3bfQju8GdgzjiIh9u6DQ11z0V197s1QRVcvTwZdKBVNFXk8NC1BGU69Xwf20y0FmowXQTWPqsm5ZXGGbLt/hURGwT52P9nJGsoRWPRwMKtFVkylYW6fCVq3+8rK4VmoQlEIlV9vTAxuurVZ7H6I3c5CmLP9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90Itv8iIjCbPZHqvVr1sZpCjsseYT7ij6ysYH7m3Sys=;
 b=k3LNx9cqzWG3l4RoWbbK4mdr664cw4Cqe5AfKlcw9U6hpr1mBdmmVvXJSRfVLyIyCIS6Ka7hZHhL5d+d/jWv8/aQHUJJ/0IqoO8UEGDA/zIxyHOo+Qd0rHbQLQf8rZZrvZsi0NvrgwS3Ze7eJW6RLUt8pvzkQ8MP7srQYpfzStn7chYAIF9UEvvYN9wpv32RMzPafh1BuVWPIGg9wQfd2wEO3TvbQc+NSkH87pLQOoTAFQZPc+bXLTynoe2m78ttA7ABh77srImmjOV7EmWoHC/Z6yR3ZaPdYmbUlDpnkaLYltiIv1C4B7D9QPO7+gSsr0X+coxdL6mERCKDJMCIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90Itv8iIjCbPZHqvVr1sZpCjsseYT7ij6ysYH7m3Sys=;
 b=s8dKFeoJKZTADSo3Hwt7Qt9lz5uGLWyxn5W34bSyXaZUTCmsVtOO/asFk3Dwrs8ysYPoddSDkPPClVAhThEC+SResRz+egQUGd8SM+iHxxeBsio6JJ5g5Y6IfPuHYZR/mqMYGwYNXLHVgiZMb+3j8Ne8vAmmCNHT90LaubOQsnqjRHzg6rxD+++VzQIZv66raIl0TBZ3DOuaIo7LAtA4pnIjltWMq9JeTu5XKNjmQkTggcuep6yY0RcL9jtVkM+YLw5mE8rzBMEA6nZ7G6/B+kQNyh+oK2IN+B0bfE7ytyTqDpb02VCb4/slyhHrBj7Ig22e8qR5PgFnnBwRRMO/BA==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 16:02:17 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 16:02:16 +0000
To: "mst@redhat.com" <mst@redhat.com>
Subject: Re: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Topic: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Index: AQHZv/SESZp4mdZfpESAhZmcsTYGMq/Mbh0AgAFZZYA=
Date: Thu, 27 Jul 2023 16:02:16 +0000
Message-ID: <3ae9e8919a9316d06d7bb507698c820ac6194f45.camel@nvidia.com>
References: <20230726190744.14143-1-dtatulea@nvidia.com>
 <20230726152258-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230726152258-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|PH8PR12MB7302:EE_
x-ms-office365-filtering-correlation-id: e1a5ec56-64f3-437d-27aa-08db8ebad990
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WyiUidia4VzXvC6eO98qVEiLTXMUoJY+80p1vyIfqQbwPqSw4O62ufWjatJS4VdP2YTRML99+NOrx5++1224xLft6kweRkycAKqhhAzfySFS0RrE+o9w1VpzV7iKxGY6kMDIxY09wkQlerhpMkvcW+4yZ+WJB08jddgbmT8bCLfd+cL2VcDB6ph8eLXXNvU0ebzZULSFBH5peL/oBadqGJFk9Ik+rW2UQeBzsSxtt0GaIwXTxZYyjGB+0I6Y4s9AwDgnNa1/wzw8+GnkvEKbP0bhaWcobO4NzHTo7HFNeYEin0xUe5RsLcDZDTXsjtxlG0FdMGxktMmW3PDKBHhyDX+5RO12KOFq5iz6jtaIAbqOlKfVEXpuDYLd7wsBPhpWLPuyHeflAF5gAqjtGXByEXhpKOKpudiq/7rVMVdPCrJiMoEjB3dSwkHujjcBaMEizorKSWh9xj2AvC4YwaDdKn3S222uO8vwHAqufqmKzDcoO60qP3JHynCwwiSH8jzaQlqlQZdcthYwc/2az1GxQhOC4CKZpnUCFZdECSg16pYgKJJH7/2oF17Q2Du60ZISU4CJDnOR9jrm8OFbv2d0rCtywcTlsTyTMhwcgrIVvvc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(2906002)(41300700001)(316002)(38070700005)(5660300002)(8676002)(8936002)(36756003)(86362001)(478600001)(186003)(54906003)(2616005)(122000001)(6486002)(71200400001)(6512007)(6506007)(91956017)(38100700002)(66946007)(66476007)(76116006)(64756008)(66446008)(66556008)(6916009)(4326008)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qld4YTBBYUJEcHdVS0lhRXJTQVduNmVBRFAwb253WmRJQ2lGRU1oM2h0YWNE?=
 =?utf-8?B?MldRTEFzWnhkbHg3ZHhoREh0QkxBQ2JzUHY1MlZEc250aEVwNmJXYk9rcERD?=
 =?utf-8?B?UWRhU25ESUlJNDRrSGk1MHlDajRXWW11emtQMXFXYVZkL3QremNCWWpYRjVM?=
 =?utf-8?B?WFV0KzNVRmJ2K0VvYk5tNExRWDAvSk5XZzRqTEFxeVZrQzNDVGlNbndvT3o0?=
 =?utf-8?B?MkpKOUJQOXVVRTRmQ0MrcVR0QlJtaGpBRHp0UHBpL3M2dXJtUzl6KzM3YzRi?=
 =?utf-8?B?K0FEVi9SYmVhSFp6VkZCU0gxZDBvYW5BSXBKRllKczc1TmJ5NlVLbisyRkt1?=
 =?utf-8?B?b2M3eTh6WHNVV25JSkpTaFdwYXhwbHlsMlBaM25qK3p6TnNRZ0tPVEU4TDAv?=
 =?utf-8?B?bkV1dzUxTTEzcVRCUmoxR1RXRVNoWk5qY0tRT3Q2WS9JV0RXYmxWQWRmNlVr?=
 =?utf-8?B?dENjdDdCdUNkbXhxT0txL1B4N1dyVEVMcWNuUTZ5MHkyckpicjBxdVhzT21z?=
 =?utf-8?B?ZjkvQjFIREJNQ3daQUJYZ0d5NlY3TVVCWjJxbFJkbkNJbjNJb3kxSmNlbGFm?=
 =?utf-8?B?OUl6SW1rczBlVStFeitlVEtxYWlqVUt3VWFDbXh2L3lwd0doWnhtK2NrL2xP?=
 =?utf-8?B?OGhheDByOFJBdmtDT3RNcG1XWEEvZFJ1RlJaYU9SamtOZmJxVkFQaytCSGRU?=
 =?utf-8?B?UFl5RGlRY3dLZkZTT01HSVdZb2lvMHB5SlZuNkcyb1JUQmIzNERqTVp3bmV4?=
 =?utf-8?B?dFQ0cHlGZGFEeE5lMVZGaDg5Z2VZS2NGV0NCNDlMcnl4MlJwdUpiWjJYdmd2?=
 =?utf-8?B?N1VvUm5uTStzWlBxZVc2N01PK25Gc1R3U3l6U0NYVEUzVWx6RDN6bW05c05M?=
 =?utf-8?B?S0IrTGxoakpSME04VHRNbUZrdE02RnlLYjJpVGpVSWpydVhtZm50b0dvTWp3?=
 =?utf-8?B?Tmp4WWJXQ3IvSytPcE0zUThyWEg2dUI3QnlHTVZ0bFM1SVN2dXRXeG5CeUJt?=
 =?utf-8?B?MVVXYlFkUk1QZ0hVaElncnJjWkxIN1JJbnZjaHl3OCthN0V2c3hJZ3lwckFm?=
 =?utf-8?B?RXBXOE81QXYyUUlKaDdhaktwdC8zOHVZTTFjTXlmYkpkSDJqeFhOdDVwcWxh?=
 =?utf-8?B?c2NUNU5qMDVIRkRPaDk5N0JRNUhsVTFDSHpoR3l6MGR4MHhWZkJFUWorMHh2?=
 =?utf-8?B?UFpWWjdLOXBKQ0svem53bGVPc2Y5R05lck9JbEJxOGNHZ3l4YTNUc2o1bjRI?=
 =?utf-8?B?ZHpHVHp2TnFZUngvRUdxaVFBZy9qSWhpYzZrdFR6dkdLdFU0SElRYnV1L1dK?=
 =?utf-8?B?YnplS2dhZzdqVjFNWnpOdXovVHMwY1kvSmdibk1icHFUeXpUSEN5UkNpUFNH?=
 =?utf-8?B?bHJsOEpLTEhKeFF6SzA1L3d0cy8yQWZLWmtlbVNpMmxTV0dzUmRwY053Mkhu?=
 =?utf-8?B?Y3M1d0hzOUE0c3VkdzBudnFrdFBaWWU2NWdwQndQY0FidmMzUXJGdlRkakxv?=
 =?utf-8?B?QVgrQmU4NGZqNmdXb2plTXliV3ZISStmRnFsQXMvYkhoZFNER21ZRDhsUHd5?=
 =?utf-8?B?QzY0VXJ6OGFnQ3ZyZDU4QzRsU1QyTk95TzlBVks1dW0vZ0dJcVhKNTJYY3pP?=
 =?utf-8?B?Y29uZEFoUXdZU2hhRit2THRpS0U0dnY5Nno2NnFwZDBJNFZSL3JOOW5vYVp4?=
 =?utf-8?B?YWpzdnJrYjBrejNVR1NPcjkyR1g1ajhCb082TDZuU0JXU3ZIWGRjK212eVR5?=
 =?utf-8?B?akN4ajRrZ0dJVUhhV2piZ05CTWNOR1llMENLL05seXVySVFBTDV6NEt3SGFW?=
 =?utf-8?B?YnBkVUdtZGgzN1lHZ0Q2OVQyU2N1cm1CSjlMa1Nmd0hxTGpCKzNBd0FQdVlx?=
 =?utf-8?B?RVVOczc2VytpN2l6MlFBdFFDTGRyVmkzWjlrZW85c0NEUE5FSnlRemtWclJY?=
 =?utf-8?B?eTErak1PaTJpcU5lVkNLYnUyRGc3Um8xRFVNRjhsUkFJYXMvaFlBZit4dmhT?=
 =?utf-8?B?VDhYZWhmTWF6Y1Z0cUd4eWExaEpsTDQ0eDY4OVZFZDU0N2dWbGJNbDVkTVd1?=
 =?utf-8?B?c2ZQMjFLcHNGVHFTWWZqZ0JRUjkzeHFDV1lPY0Mwb1V5RVhOUk5jLzYxMWJQ?=
 =?utf-8?B?MlR5bXRuT3pRSUNyaEpuZThhZU8ySm1mZG9Ha1RVN3NQRG55T2cyTnZGeDhs?=
 =?utf-8?Q?b2QhJK5XCO18N6Fvoxz5YWNpMETZi40ltVvJHl0X4kex?=
Content-ID: <1AE7E6594B9D1E4E94B73FAEC95EE596@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a5ec56-64f3-437d-27aa-08db8ebad990
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 16:02:16.8069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2hAX+naSFIzBeHEaafy857ASJPheNBZOHCrZ+uBPlC4lX+pppklWr68U+0C12+Ko5OBdAHs93hurnzWvzsy7ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
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

T24gV2VkLCAyMDIzLTA3LTI2IGF0IDE1OjI2IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIFdlZCwgSnVsIDI2LCAyMDIzIGF0IDEwOjA3OjM4UE0gKzAzMDAsIERyYWdvcyBU
YXR1bGVhIHdyb3RlOg0KPiA+IFRoZSBuZGV2IHdhcyBhY2Nlc3NlZCBvbiBzaHV0ZG93biB3aXRo
b3V0IGEgY2hlY2sgaWYgaXQgYWN0dWFsbHkgZXhpc3RzLg0KPiA+IFRoaXMgdHJpZ2dlcmVkIHRo
ZSBjcmFzaCBwYXN0ZWQgYmVsb3cuIFRoaXMgcGF0Y2ggc2ltcGx5IGFkZHMgYSBjaGVjaw0KPiA+
IGJlZm9yZSB1c2luZyBuZGV2Lg0KPiA+IA0KPiA+IMKgQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMzAwDQo+ID4gwqAjUEY6IHN1cGVy
dmlzb3IgcmVhZCBhY2Nlc3MgaW4ga2VybmVsIG1vZGUNCj4gPiDCoCNQRjogZXJyb3JfY29kZSgw
eDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQ0KPiA+IMKgUEdEIDAgUDREIDANCj4gPiDCoE9vcHM6
IDAwMDAgWyMxXSBTTVANCj4gPiDCoENQVTogMCBQSUQ6IDEgQ29tbTogc3lzdGVtZC1zaHV0ZG93
IE5vdCB0YWludGVkIDYuNS4wLQ0KPiA+IHJjMl9mb3JfdXBzdHJlYW1fbWluX2RlYnVnXzIwMjNf
MDdfMTdfMTVfMDUgIzENCj4gPiDCoEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKFEz
NSArIElDSDksIDIwMDkpLCBCSU9TIHJlbC0xLjEzLjAtMC0NCj4gPiBnZjIxYjVhNGFlYjAyLXBy
ZWJ1aWx0LnFlbXUub3JnIDA0LzAxLzIwMTQNCj4gPiDCoFJJUDogMDAxMDptbHg1dl9zaHV0ZG93
bisweGUvMHg1MCBbbWx4NV92ZHBhXQ0KPiA+IMKgUlNQOiAwMDE4OmZmZmY4ODgxMDAzYmZkYzAg
RUZMQUdTOiAwMDAxMDI4Ng0KPiA+IMKgUkFYOiBmZmZmODg4MTAzYmVmYmEwIFJCWDogZmZmZjg4
ODEwOWQyODAwOCBSQ1g6IDAwMDAwMDAwMDAwMDAwMTcNCj4gPiDCoFJEWDogMDAwMDAwMDAwMDAw
MDAwMSBSU0k6IDAwMDAwMDAwMDAwMDAyMTIgUkRJOiBmZmZmODg4MTA5ZDI4MDAwDQo+ID4gwqBS
QlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwZDNhM2EzODgyIFIwOTogMDAwMDAwMDAw
MDAwMDAwMQ0KPiA+IMKgUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAw
MCBSMTI6IGZmZmY4ODgxMDlkMjgwMDANCj4gPiDCoFIxMzogZmZmZjg4ODEwOWQyODA4MCBSMTQ6
IDAwMDAwMDAwZmVlMWRlYWQgUjE1OiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gwqBGUzrCoCAwMDAw
N2Y0OTY5ZTBiZTQwKDAwMDApIEdTOmZmZmY4ODg1MmM4MDAwMDAoMDAwMCkNCj4gPiBrbmxHUzow
MDAwMDAwMDAwMDAwMDAwDQo+ID4gwqBDUzrCoCAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDog
MDAwMDAwMDA4MDA1MDAzMw0KPiA+IMKgQ1IyOiAwMDAwMDAwMDAwMDAwMzAwIENSMzogMDAwMDAw
MDEwNTFjZDAwNiBDUjQ6IDAwMDAwMDAwMDAzNzBlYjANCj4gPiDCoERSMDogMDAwMDAwMDAwMDAw
MDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gwqBE
UjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERSNzogMDAwMDAwMDAw
MDAwMDQwMA0KPiA+IMKgQ2FsbCBUcmFjZToNCj4gPiDCoCA8VEFTSz4NCj4gPiDCoCA/IF9fZGll
KzB4MjAvMHg2MA0KPiA+IMKgID8gcGFnZV9mYXVsdF9vb3BzKzB4MTRjLzB4M2MwDQo+ID4gwqAg
PyBleGNfcGFnZV9mYXVsdCsweDc1LzB4MTQwDQo+ID4gwqAgPyBhc21fZXhjX3BhZ2VfZmF1bHQr
MHgyMi8weDMwDQo+ID4gwqAgPyBtbHg1dl9zaHV0ZG93bisweGUvMHg1MCBbbWx4NV92ZHBhXQ0K
PiA+IMKgIGRldmljZV9zaHV0ZG93bisweDEzZS8weDFlMA0KPiA+IMKgIGtlcm5lbF9yZXN0YXJ0
KzB4MzYvMHg5MA0KPiA+IMKgIF9fZG9fc3lzX3JlYm9vdCsweDE0MS8weDIxMA0KPiA+IMKgID8g
dmZzX3dyaXRldisweGNkLzB4MTQwDQo+ID4gwqAgPyBoYW5kbGVfbW1fZmF1bHQrMHgxNjEvMHgy
NjANCj4gPiDCoCA/IGRvX3dyaXRldisweDZiLzB4MTEwDQo+ID4gwqAgZG9fc3lzY2FsbF82NCsw
eDNkLzB4OTANCj4gPiDCoCBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0Ni8weGIw
DQo+ID4gwqBSSVA6IDAwMzM6MHg3ZjQ5Njk5MGZiNTYNCj4gPiDCoFJTUDogMDAyYjowMDAwN2Zm
ZmM3YmRkZTg4IEVGTEFHUzogMDAwMDAyMDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwYTkNCj4g
PiDCoFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiAwMDAw
N2Y0OTY5OTBmYjU2DQo+ID4gwqBSRFg6IDAwMDAwMDAwMDEyMzQ1NjcgUlNJOiAwMDAwMDAwMDI4
MTIxOTY5IFJESTogZmZmZmZmZmZmZWUxZGVhZA0KPiA+IMKgUkJQOiAwMDAwN2ZmZmM3YmRlMWQw
IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiDCoFIxMDog
MDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAyMDYgUjEyOiAwMDAwMDAwMDAwMDAw
MDAwDQo+ID4gwqBSMTM6IDAwMDA3ZmZmYzdiZGRmMTAgUjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIx
NTogMDAwMDdmZmZjN2JkZTJiOA0KPiA+IMKgIDwvVEFTSz4NCj4gPiDCoENSMjogMDAwMDAwMDAw
MDAwMDMwMA0KPiA+IMKgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+ID4g
DQo+ID4gRml4ZXM6IGJjOWEyYjNlNjg2ZSAoInZkcGEvbWx4NTogU3VwcG9ydCBpbnRlcnJ1cHQg
YnlwYXNzaW5nIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmFnb3MgVGF0dWxlYSA8ZHRhdHVsZWFA
bnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3Zu
ZXQuYyB8IDMgKystDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9t
bHg1X3ZuZXQuYw0KPiA+IGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jDQo+ID4g
aW5kZXggOTEzOGVmMmZiMmM4Li5lMmU3ZWJkNzE3OTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jDQo+ID4gKysrIGIvZHJpdmVycy92ZHBhL21seDUv
bmV0L21seDVfdm5ldC5jDQo+ID4gQEAgLTM1NTYsNyArMzU1Niw4IEBAIHN0YXRpYyB2b2lkIG1s
eDV2X3NodXRkb3duKHN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlDQo+ID4gKmF1eGRldikNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgbWd0ZGV2ID0gYXV4aWxpYXJ5X2dldF9kcnZkYXRhKGF1eGRldik7DQo+
ID4gwqDCoMKgwqDCoMKgwqDCoG5kZXYgPSBtZ3RkZXYtPm5kZXY7DQo+ID4gwqANCj4gPiAtwqDC
oMKgwqDCoMKgwqBmcmVlX2lycXMobmRldik7DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKG5kZXYp
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZyZWVfaXJxcyhuZGV2KTsNCj4g
PiDCoH0NCj4gPiDCoA0KPiANCj4gc29tZXRoaW5nIEkgZG9uJ3QgZ2V0Og0KPiBpcnFzIGFyZSBh
bGxvY2F0ZWQgaW4gbWx4NV92ZHBhX2Rldl9hZGQNCj4gd2h5IGFyZSB0aGV5IG5vdCBmcmVlZCBp
biBtbHg1X3ZkcGFfZGV2X2RlbD8NCj4gDQpUaGF0IGlzIGEgZ29vZCBwb2ludC4gSSB3aWxsIHRy
eSB0byBmaW5kIG91dC4gSSBhbHNvIGRvbid0IGdldCB3aHkgZnJlZV9pcnEgaXMNCmNhbGxlZCBp
biB0aGUgdmRwYSBkZXYgLmZyZWUgb3AgaW5zdGVhZCBvZiBtbHg1X3ZkcGFfZGV2X2RlbC4gTWF5
YmUgSSBjYW4gY2hhbmdlDQp0aGF0IGluIGEgZGlmZmVyZW50IHJlZmFjdG9yaW5nLg0KDQo+IHRo
aXMgaXMgd2hhdCdzIGNyZWF0aW5nIGFsbCB0aGlzIG1lc3MuDQo+IA0KPiANCk5vdCBxdWl0ZTog
bWx4NV92ZHBhX2Rldl9kZWwgKHdoaWNoIGlzIGEgLmRldl9kZWwgb2YgZm9yIHN0cnVjdA0KdmRw
YV9tZ210ZGV2X29wcykgZG9lc24ndCBnZXQgY2FsbGVkIG9uIHNodXRkb3duLiBBdCBsZWFzdCB0
aGF0J3Mgd2hhdCBJIHNlZS4gT3INCmFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCj4gPiDCoHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZCBtbHg1dl9pZF90YWJsZVtdID0g
ew0KPiA+IC0tIA0KPiA+IDIuNDEuMA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
