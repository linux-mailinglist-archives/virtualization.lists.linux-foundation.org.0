Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC36F4F0B
	for <lists.virtualization@lfdr.de>; Wed,  3 May 2023 05:14:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5978142A;
	Wed,  3 May 2023 03:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5978142A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=V4EbSkM0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pu9W7_GkvVT8; Wed,  3 May 2023 03:14:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D6BDD8142D;
	Wed,  3 May 2023 03:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BDD8142D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05D41C0089;
	Wed,  3 May 2023 03:14:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF7A6C002A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 03:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAEAF404E7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 03:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAEAF404E7
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=V4EbSkM0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qd18itIMbv0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 03:14:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350FC404A9
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 350FC404A9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 May 2023 03:14:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvEf2TwIT7wQ5TYusfrBXHSEgIJ2RJs5xP2iaNH64zU3/WCPK7vjRJYaKS8WmhMth/jQXJwBj/JlaraSNPk0jmH08hu4k6aP5f38yz/hQTxC3/5yK3ApfEY7zmo8xLtPf8MEniOrWq5OVx0XIm+dlMO+a3x2pkYEwfdj+BmAm6qxMGiIMV3ezG+qQWX82GdwpwaRKeyd9lH8yBsyXzKOa3bZHZ809J/oyR6vv0e/kLqcl7rq6j4Are+KpZE3EJD0A/REWHGWqHfSjL26mP53LyqLcv68BI8i9z3wGS6uprYOy/28Z+7axWjcpAVJO8jdTAZXx90X1NXxUSY+73ezbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzZP/gsmbudKSXNL8D9BRYlR3JrAFvNok5hAXmrXH98=;
 b=k7MSScBGxY2G7ZDrK+0AIQ/K6MATe2kZl1BB3YPW+8CUMPOigK3LCQwh7Nq3aDFAaDwCK2EdYAiqJNObqikf3nVsuihSpZ8Rqt3S2DX0MUTDyje9qVgzOUrY8iuu6y54p9BdLPxqKi0n7tfJlZx3b1MSycPzUMRJo1++igIawHtGvoUMiVYk3t6Ce+elq2L5LwkZv2tCqj6IlfOP4PTiRDM5FW2AgsXCHzvAj6OJz0L/V4dSUto4xDfaf8AsWTFWf1IkO4AtDyti8S1tM5PE9eFJba8oGYvUetyWL0bELHQjLgOi/oJ1I35wFoNExwkmbBulafIjLABmQ3pgVP9oxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzZP/gsmbudKSXNL8D9BRYlR3JrAFvNok5hAXmrXH98=;
 b=V4EbSkM0uhkjpW9l48cPHEwfq5NTBw6XtGH/9Y9hH3ADKDcaFPpGKgMy0JM5UN9bTvgFM+oaSCKXkhOcCQTEpURRNSJDm2Neyp95AiWffWoWp3dNsxGPV7+i6ceYqpUv6xHKurbDX7pDVrYu8JcDw/sID5rDdjyM58Xm8w9iur6TpIixvZHRStOXAcD8Li2Pexm7NVV0zx8pNsxFpVs5lyM9cbSl3d/6EgQGjwxa8G9M46LI4FTK+COyaaLOOSC4bjIxNa12qt29il7zY7u5fPFsVqIVUyMwFM8voAa3j1k0HmTrdaJ7kGUwAhbccfs1HKS+pCOfOB+j6llWYDI9Xg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA0PR12MB7076.namprd12.prod.outlook.com (2603:10b6:806:2d5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.20; Wed, 3 May
 2023 03:14:17 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::1c51:21c0:c13c:3ed3]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::1c51:21c0:c13c:3ed3%2]) with mapi id 15.20.6363.020; Wed, 3 May 2023
 03:14:17 +0000
To: Feng Liu <feliu@nvidia.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: RE: [PATCH net v3] virtio_net: Fix error unwinding of XDP
 initialization
Thread-Topic: [PATCH net v3] virtio_net: Fix error unwinding of XDP
 initialization
Thread-Index: AQHZfVcwzjoxZpx/L0qvM1APBG0OYq9H318A
Date: Wed, 3 May 2023 03:14:17 +0000
Message-ID: <PH0PR12MB54816403B23CE6D0AF2FD035DC6C9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230503003525.48590-1-feliu@nvidia.com>
In-Reply-To: <20230503003525.48590-1-feliu@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB7076:EE_
x-ms-office365-filtering-correlation-id: 24c07e2e-897f-4c7a-e7ac-08db4b847ad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +ZFrW+wqXYrppcu1cIPb+IkvARJ7EA1ykY0K0OJaYrGqVwOHssRb9paCZNYga1AV5GDZtaTJGvOBgcwsnm/xL7IkJ4M+Xb6ByNzhQUHrKSqNduLmh0P471KdV/w3Jo9bm5drE2HYf3hyi8XDcKcT/WuG+/3gk/EfIs8SzmYR/n5BEvb5+HXV+Ovk35pXaC6gguXYz8HWeWiH/2YrhOng88AHgemZSEGy8ICSx4ICYuVQDcY2pVO7XNyQzsvZ9i31ls+zjKD9qpaa/IuRWi/X4oEyRaSrU6AfDwphKuBHpE5FQavvdUZE+KAN/Na7+uujRWwEqeuy041yqjKopFKNGAKqhstghYJEin3CgFgg/B3yPuvnwkmKEGAr8STInY7boQpXe+06/CqPTAKQlJ/4y+dcLda6NIvl9wIqVtAJFEv9bWktE8i6gsvei0bvOjBp/i9Y+CUPJpMlcrkil5wtIPaqNmx1R0QjwSDJNDU2PLJDyO+1vgD3YEe0zuaM5TvFnu+Qlhz0DNfdOO3pjoT5UozlaFNADOvUommyZb4irHOBptYC3a90GJ+Ss6Tg5bu/tTD6f2VOpxSSidL0kC9igWzha+w2gbKDQfgaOW+1P0qmrAIllgajJfwCed0o6X3r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(4744005)(122000001)(41300700001)(8936002)(8676002)(5660300002)(52536014)(2906002)(86362001)(38070700005)(38100700002)(33656002)(71200400001)(7696005)(54906003)(55016003)(478600001)(186003)(9686003)(6506007)(107886003)(26005)(66946007)(4326008)(66446008)(66476007)(76116006)(66556008)(64756008)(316002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SgN/JCwvh1kYx6SP4G1g7cJsBnlU+NLUSBcn9blPdX/0qeNO2iJll8TDUw/4?=
 =?us-ascii?Q?Bsm5NMGv8P05szh100Bg89ic+uiYTR7XpmbzV9giwwomFeOAGf5UbxEUNAMU?=
 =?us-ascii?Q?B2kf7oiYgqvKBDxByhPzgfYENFOPWx+RlBCw862nphsqtUWBdL5oKmB2GkcM?=
 =?us-ascii?Q?5DJ1DqXzMrPB1CT84B8HO8MF7XKdiB1NSVFCDl+GNM+cG4V7ydeUteilXKiY?=
 =?us-ascii?Q?vW70rLdYhwit+zBRTE11xRKxlhJtiq+wcuA0fnlj0evJ5J1Uuvzy4Wdz3OhQ?=
 =?us-ascii?Q?2vap/ajs0TUEgsRtzuqLXBUrgCZ1EvmUChSrus91Mppjvk6AO/pwB4nFER2z?=
 =?us-ascii?Q?FmUGsiEmqElpxcSFWN4Ls8SLX84i1FbSzPl/h/Z75U1p27BUTevHzx0i/7RS?=
 =?us-ascii?Q?Xj34EDYWDMWxELzvttLGYOv7Ju1Q+zBwGo/7ckby9GfrLiVHQFf9pEQZuZBk?=
 =?us-ascii?Q?pAuAgOns2KkXMwoQNpaJNRCSo5QhXd0YMV5gHikAXknhrJ/fjSgocYJBR3WY?=
 =?us-ascii?Q?XqA4SUs/GRF/KUQ5yr4DSu5i63DIMn04X+BlPvJG5vcHj/hMUTXWMxdD83Ll?=
 =?us-ascii?Q?GASC5UkECnXvEM48PIwWvkMfuW685CYn1Tt8ikOiHDPHvkrse+xZnevKWo2e?=
 =?us-ascii?Q?1JgxLChAaFcKxbTZraIhpCfb5tiXo3HKi+rV7T+glr9yyKEBVNzjg2srDlSp?=
 =?us-ascii?Q?5gS527l244j0lMDQVcpfzZ+3kruv62F2fH72UTm5QAq9D4BzgoUdJTG7pscm?=
 =?us-ascii?Q?jEzNiAsvvYI12btE2HvSE9sumVbe7VpWdMXXgOu8nQQKLsWvETfkGzpzDycr?=
 =?us-ascii?Q?S6dr7S0mxMmdl3SYUUGu0MS0hDN36mQiHi0qYeISqkqaYRgO1tJ0Q3c4D/Ec?=
 =?us-ascii?Q?8M0CWxu5dvzBd/2rgFr2guYk+aA5CNaE65I37zQ7Jy/HAIfV0SDsOwhqABme?=
 =?us-ascii?Q?wx8r60RtsUKS2C2b6kr8peZnpvkI7yEFEpXSmbe2yk+vCJ8pTxZ2nM7OxH1/?=
 =?us-ascii?Q?ZDpHsO0hMGQtaPap77KIW1T9VFl0ydB5t6R2cLoYBxZFZyXOhWO8ontuN2+O?=
 =?us-ascii?Q?5VyOV5TL5biBYBGaGCUTIhALSj5gCERgCwTDcOVB79GVh0jMDWvNwHeiUtv6?=
 =?us-ascii?Q?J1u/2fdXdB3Wq2GYanhPNO72n5euBqa47K3KDwgTgdKYk2lK65akxj4rn/Tq?=
 =?us-ascii?Q?5Kn7vgk94+07OIjVdy4D4n/TSHonx7NwctkSbWpa6tMyEhcaGGuq0xi7YnZP?=
 =?us-ascii?Q?NhtGf8dFJOJpKXdlmj+xKihmYb4kQTgthPaVxN6BevSF88w9j2AgWumskYR3?=
 =?us-ascii?Q?9kfzEbBsK/m5163HiETOm3k57WwBA7Mo9Q51nNoI8ovr99TSDqR0wBhly6gb?=
 =?us-ascii?Q?wXpSX+2eKKVd4oZXqHyiaJ3PBVfJziill78DdaBQnc/n76JvkzQkarQZyUMS?=
 =?us-ascii?Q?VVUTFZQtT9i76qd6tOBe7v4hdkHVhp4qb1SOJTocwbGl8os5YoojXZD4Brk+?=
 =?us-ascii?Q?bTjCDqSSuY4U3zFiOp7KZW4TWiHjujjN/e9yNq/s1hNviKPJagVDbYSpX+LZ?=
 =?us-ascii?Q?T445rLDtoaegTRbs21o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c07e2e-897f-4c7a-e7ac-08db4b847ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 03:14:17.1204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7jSOxjuzy8Ae8xVP8PRvALp00RKvTaY4zwJMq+Rc0KgHJgxl87NX0SdTVhkWKF+8jKEffErpC6QHa8qp2EITQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7076
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Simon Horman <simon.horman@corigine.com>, Bodong Wang <bodong@nvidia.com>,
 William Tu <witu@nvidia.com>
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


> From: Feng Liu <feliu@nvidia.com>
> Sent: Tuesday, May 2, 2023 8:35 PM

> Issue: 3383038
Remove this internal garbage.

> Fixes: 754b8a21a96d ("virtio_net: setup xdp_rxq_info")
> Signed-off-by: Feng Liu <feliu@nvidia.com>
> Reviewed-by: William Tu <witu@nvidia.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Change-Id: Ib4c6a97cb7b837cfa484c593dd43a435c47ea68f
Remove this internal garbage.
Please run a local script not to forward the above garbage in upstream patches.

You are missing the changelog from v0->v1->v2->v3.
Please add and resend with above things removed and with changelog.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
