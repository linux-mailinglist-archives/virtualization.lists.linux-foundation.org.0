Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3C688150
	for <lists.virtualization@lfdr.de>; Thu,  2 Feb 2023 16:11:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DA6841CAC;
	Thu,  2 Feb 2023 15:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DA6841CAC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A8Sqyvs0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAqy0rQbPxWk; Thu,  2 Feb 2023 15:11:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DC1C641CB3;
	Thu,  2 Feb 2023 15:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1C641CB3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17DE5C0078;
	Thu,  2 Feb 2023 15:11:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9440AC002B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 15:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DD376111A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 15:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DD376111A
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=A8Sqyvs0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yH4_BXdImdpv
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 15:11:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D3A6110E
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17D3A6110E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Feb 2023 15:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT2WQtIFE3I7RxLpg/Si0HjzpVuBmHsF9CP5UdNOJYpdE7/YT1/ZVXRZjqgAgUAiOWzu4p1JlYR9/3BCKMXonbcS9FrCLZvn1XGeaEUpwXBdAITl745YnFaXmrehQRI8xpZCSqH3sFDex5S0y0HXGfIzaEov2Ki0EVb73tZ7P1SXpu37dgPqvD4cNSZ8lMJEiJtlEH1oYU5lYjj9uLCEtqkPu+cTl2Hk/313bAz0ad0yAxqev2/flyhqUG/iUDGtbYBMVemtvHdd9fD7XgUZncjwXpRrcFA7UPDPkzc5U4mIqqzAZZ5kAbFYBM6/mhDcydAO0YJG+VdlUBlSs+Iznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb20mHB6ia2rbuRQNGDbM4H658n10/dDrVH8JUns/ls=;
 b=apQjAB0HfD0teUOj7WuS2jMt/G1YuadCku9kkeCyUQIG3uuljKY7nEQccd2o2bqdunqfWkoRkABsRinvVGAeVlp4+WM7MbAZq+z7OSpbfAeGhdcs2zDKKRe3u01e3wQU9LAPq0bs98O2zUS4rSvLsSkVed2l9KnMfi0s5TWvwH6hv7oqEPZaAyoasI7Qu0K4IUFU8toAnNxU7BOj2XKx8pI1ReDDCRtcW6dVoidyX1n6G38pSQFVdiTJM3If1aMGUCK/rWLdDT9I5oEOuh41TOJmpJE9LjprNEIR0eLPcBdbEp3bdeCeHI32T8c8ZPdhgtJwf/2DRV/r0PAkxjvU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb20mHB6ia2rbuRQNGDbM4H658n10/dDrVH8JUns/ls=;
 b=A8Sqyvs0cmM39xOu42/YDGtGLS2hJJwZROZnFA1Dlq0Ta8coUiu12zRcYZ9gbRSYKp+EXDuJ3gFRCSNnvwCMqIEXC+a3WdLQZsb06xjBYXkCFVVQpAnBUzwkDVTaOam41yyI9e45jUc2Jq/BvZDRLu/w32zjXZv3lUXIF0YTt2GLuGHjusvsXHLwNtjpfigAc6BPaETMnjRHco5wuNSlmNKuL2nw89IVLxojggE+m3tQuN98+pHgacGERNp48ii1+SWTgAJmy+0SOYqHHZev6Ea/w+WAyt6SjtH5KV2hXLyQh1ITyxEVeSxtbp0j9rlkm7eM7ls5Y2FGP+GjY4tn1g==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH2PR12MB4874.namprd12.prod.outlook.com (2603:10b6:610:64::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 15:10:56 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0%4]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 15:10:56 +0000
To: Jiri Pirko <jiri@resnulli.us>
Subject: RE: [PATCH 2/2] virtio-net: Maintain reverse cleanup order
Thread-Topic: [PATCH 2/2] virtio-net: Maintain reverse cleanup order
Thread-Index: AQHZNsNmqB1HoihArUa+/kiDXzADNK67lZ4AgAAtS/A=
Date: Thu, 2 Feb 2023 15:10:56 +0000
Message-ID: <PH0PR12MB5481C0C7E46B5DFF85178792DCD69@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230202050038.3187-1-parav@nvidia.com>
 <20230202050038.3187-3-parav@nvidia.com> <Y9ur9B6CDIwThMN6@nanopsycho>
In-Reply-To: <Y9ur9B6CDIwThMN6@nanopsycho>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4874:EE_
x-ms-office365-filtering-correlation-id: 5c4a892c-ce36-4eaa-d37a-08db052faf3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bsUPysJU6ghdglXr39xL1o7XRHvqdfC+TLhOmIQzf90zwF+Q3TKZCioBV0+jCFafQi0Ev3bOUxDpDyq+F06lRUaiitbHB3Opqului3ow3GGWLUCcvcNI86zSolyhbiwGQqxxVgk1Apq8sxC+tRsKwy48Uz2aMFOpEqgMwT8LXZYaxa+Axcx+uDws+tAFX4JSqRo5VwLceDckoHNxkMwi03n4zEOF3AKLXurLM1Msv6pefoEnaf9oKpmYWQheJDheyxP0tAQue5aszkPEeIBKnFdQbw9kjkc0NMlJ0u7MDWukCLIgD3lILYr2wsB0X3+xYDij2h5580bAsVw0EYMevajOebI87iVfPKVuWOFR9gdflgXqhLvn56geAoLnFouwB0Ct+p3OOC7xos9b5Nkqg2iYCU2oStZXNMKifutSXTrOXt7izN57orx+xBidQHRP5KXAiykizsxhnx93sAlyqO4auA0WM3aVNNOLpDmmiPYwP5nc1kd6a9srT3s/tMcsnSSWFRwVbdZQWErMLzDwwrhQ73Xj+gCl9qr70xc/C/O4qGZFk3NEZJdQwf66FH1mGOh8aOmRxD3mrgrvMd1bOZodC0nthbAXwxgnOQ9gZgk8U8kYkBv1eRvxFOnvaEvY+kyBXQozu5+jQ8kCV5ty8OrWimxE+d/52zDZh2EeAC9KeOYfywdA/cXuCtuVqADeq7jFYOki23c/WvTcD/Blcw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199018)(76116006)(66556008)(66446008)(66476007)(66946007)(38100700002)(4326008)(83380400001)(64756008)(8676002)(6916009)(54906003)(122000001)(316002)(478600001)(26005)(186003)(6506007)(9686003)(33656002)(7416002)(5660300002)(86362001)(41300700001)(55016003)(71200400001)(38070700005)(52536014)(8936002)(7696005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZuNzPXQwireEO2Y5QixRcRF61hIddV1yZciqdXLYX1frE91A0chDwWaT+wth?=
 =?us-ascii?Q?AFJ3Ea1bIlplxJb3rrmsbphiknLhXBFb8B126HdwvwEX10GJLDzKgX9UyYYd?=
 =?us-ascii?Q?RkzHilYvsQePzkgLhRPus9XdAAYgBNSOgYkMKEUV18YDWTnvFMOKGz+4ompE?=
 =?us-ascii?Q?CTa19oteDPdsI2dGgqfjJx4y8/8ZUWVrrF/MuWUW2/ij2S6QtdOWN7A5QO98?=
 =?us-ascii?Q?LLTEBq6UXgV6kwH0aH83hPHvevSCaR6+ej9HMhYjCWKPGbapTih4cMHpki3O?=
 =?us-ascii?Q?tdKYrb/uvVa+ydkLt3wMzE28t5cWJp+xcO4d7Vx7r6uF2nq5dwkbIa9IWuVr?=
 =?us-ascii?Q?G+VD1n/pNXzENvSkUInQi/ZeiI2GWH9DEkN1TNSwwab2+ZgSAJpv2pJAtufz?=
 =?us-ascii?Q?DPrISlA7SoFvx0IDpie/Vwr2K+VaT0layAkfjpIu1fLdVRtlO7LgVMWmgmSi?=
 =?us-ascii?Q?wBk3YP9LdThyMMqPI9PSNHe3F79j3sxzYolcWAwM5ktdHhLBhUQOdlHm1XEa?=
 =?us-ascii?Q?hMf/0tIz1kUYI6sftALt9JPOGpmYK2EyMs6JAsNubThp/xLQrEnII5WTJn9y?=
 =?us-ascii?Q?WLrd0urUUwrhW9uFb7R+ws4xAIjwDGeRoGWaRnvNyIQBSh7MFHC+Zc7kZNiM?=
 =?us-ascii?Q?ghoUcQ80YJM4/+zwYCMauuXL/owtmoXH+mClDQB9hUnyBunC60ytYZf6ZdRs?=
 =?us-ascii?Q?tJWgudcSTFRAn0Bf+qze+iADVz9BUA5z2zM/tJ/PQmgbjwc/fcy5aGN5yn+p?=
 =?us-ascii?Q?BDKIXkNxHD4B1SjF7JmLiyYanXZnnSKkQRYkQUBIVPt4B5JG1wDELfCEm98y?=
 =?us-ascii?Q?0dWhtG0xxpEO4F44PP5KRnWTaSO+tJ7KXGLVsFzFp9dVNynLTFfVxDgEYQ9b?=
 =?us-ascii?Q?8jTIQSsS8rVbK8SXJyWQby6WUzCgNkHwkjxCaZ+4wplfEjsxq6g8+MqPVa8K?=
 =?us-ascii?Q?+oBnkYBkFMFJPnCESYZSZbjw8br+G7npKuCzfJ7Sn/+o7GGIto4Oxizt/bDJ?=
 =?us-ascii?Q?+B+QnWzjgPCtaeXYHIAXJ/hCXgfdXIPVsguBv0HwIj93L+RSMlTEKHJT4Ndg?=
 =?us-ascii?Q?rqQz+1SKioBhuO67I558Ts5cJmZUkn0KckcCYa34YZR0hmwSKwZA5k6KdEE9?=
 =?us-ascii?Q?OTf/5HxfOLFH4TWanB1FE9ALnXJJraoSF3zKP9xSr7Fav150RlqoM/3DnIJv?=
 =?us-ascii?Q?JXrASrAGA3vDlg2QC59FKfRJgVVF0p2O3cTqJofHesjSf1t8vQ8z8S/T81Bc?=
 =?us-ascii?Q?T+e+EHY1hr4/6BZQ4S1+lK/Wt2CWg2F7MXKRZO6+evMxwvjF/W+feDHZqDWA?=
 =?us-ascii?Q?xJsBzfI6x9JsNHToXzWfgR0wr3z0p0Pi+EVsbWzXfLSOGhP8guQ3IFdt6DXD?=
 =?us-ascii?Q?bLBdeG6TzRxQ24nPplf5Nvu74bazoY6cQP5hwVC48CTL6V9On4TxwlLEhlvl?=
 =?us-ascii?Q?jDHpvaWLVw3Gq5mxt8jUqCbDnnCo1kBRdGkovlxnLu5pw7gNshUmZawFiVQG?=
 =?us-ascii?Q?W2x9JI/4HhCQhGaA9/vMG3bxgNPXbGCppUi3WK38KmTygeWt5dMaTKFgxwxZ?=
 =?us-ascii?Q?IEdl+NJl8gOfINaUowk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4a892c-ce36-4eaa-d37a-08db052faf3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 15:10:56.4385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bMQAd4fYxGISAvjAYv607NLiLRulOAVp9bC64J3VynuX8DJyRJu0a9YJIiDsHn+raKUjW8mVkJKa1jsId61nxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4874
Cc: "hawk@kernel.org" <hawk@kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "mst@redhat.com" <mst@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ast@kernel.org" <ast@kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
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
From: Parav Pandit via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


> From: Jiri Pirko <jiri@resnulli.us>
> Sent: Thursday, February 2, 2023 7:26 AM
> 
> Thu, Feb 02, 2023 at 06:00:38AM CET, parav@nvidia.com wrote:
> >To easily audit the code, better to keep the device stop() sequence to
> >be mirror of the device open() sequence.
> >
> >Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> 
> If this is not fixing bug (which I believe is the case), you should target it to net-
> next ([patch net-next] ..).
> 
Yes. Right. First one was fix for net-rc, second was for net-next. And 2nd depends on the first to avoid merge conflicts.
So, I was unsure how to handle it.
Can you please suggest?


> 
> >---
> > drivers/net/virtio_net.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c index
> >b7d0b54c3bb0..1f8168e0f64d 100644
> >--- a/drivers/net/virtio_net.c
> >+++ b/drivers/net/virtio_net.c
> >@@ -2279,9 +2279,9 @@ static int virtnet_close(struct net_device *dev)
> > 	cancel_delayed_work_sync(&vi->refill);
> >
> > 	for (i = 0; i < vi->max_queue_pairs; i++) {
> >+		virtnet_napi_tx_disable(&vi->sq[i].napi);
> > 		napi_disable(&vi->rq[i].napi);
> > 		xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
> >-		virtnet_napi_tx_disable(&vi->sq[i].napi);
> > 	}
> >
> > 	return 0;
> >--
> >2.26.2
> >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
