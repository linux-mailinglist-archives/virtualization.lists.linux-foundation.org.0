Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 800365AF2C7
	for <lists.virtualization@lfdr.de>; Tue,  6 Sep 2022 19:38:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C993F81289;
	Tue,  6 Sep 2022 17:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C993F81289
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=GtHAekKZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgBmn0wRleeP; Tue,  6 Sep 2022 17:37:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 585F681288;
	Tue,  6 Sep 2022 17:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 585F681288
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B0E8C007C;
	Tue,  6 Sep 2022 17:37:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC3A4C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E1A281288
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E1A281288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CIPiP9gPFwe
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:37:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F37181257
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazlp170130009.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c111::9])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F37181257
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Sep 2022 17:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoJDmoiIBtrN2tvGO0lJZNPxE5oOzL4bK3B30ljZWwXbsVyIuFym5B7gdS1o2vWuInd8Bp21+tR7jRGz0a1sblHfKk1muw1XHB1Fznri66bgCUA3kQFVfIBXPnAunwp96Wgd2TsIwF8QeXYbr6yxcwbdPeBrOaw97k+q7PToFPy3AVxC4oBOqPyAp6PFtlao+EwK5tFI36L3QcresUaZoGC5AOOvkSgakP0T0JL5dlblMetfK7EpTeoYtIjKvHLB8K1SnQsRJynMjvxHampAqdoQ0Xq5/OzEiOwdOj2z5mCoPHsA1EESJtvY3+6W2wVXgUdbzLajr0Ji6xMBMwe9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLYGAP5T7jZsDTmSdZNplX/2RRsSlrdQmwBf7rPj3g8=;
 b=CCDR12SdWM2sPs4zCQ3EtXQ1pikX0jdb5bPxbU4qrJIlGiLEYAhhGPFrH7QHCVRWsUOnytrb4CK3Dg3WAnkT4ERzx9ExduuuPBsxnF0GDYYjwJSbS19CvM5G3T0Tpah96UocC0LH7VmJVGtr+RRb1g86athXRfm3TmypU271bAmA1Utp7PeY+7nFFfYUYl9vUygRQ4ibFiOEL7awHJw5m/p4/r4pnh6sVGY3QCQXye+JilyMD9g6MBK5H5I2YPi3nTaUcKpfKZ95Gf3QDl1GlzvSo8xA0rf5vAoeGh1/GvpAz622iYNnXFtMClQCO9sEF9ZJ1kXX/8CGhPMllTd1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLYGAP5T7jZsDTmSdZNplX/2RRsSlrdQmwBf7rPj3g8=;
 b=GtHAekKZFjSgX69cuvQgc5G5keZH1hmSh1GSRJxvyyLDvX3T1p8QIkebfk8DYoQ7SniMBe6xH/yHXe3j3jmu/sw8UItnIxT4g7em0t2FbdPocSSCqc0UlwuAe5Ad1+byAjlKrfNOLI/aZCUcGWCCP1uW9IbDfqWyORVsenSXvYU=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by BL0PR05MB4739.namprd05.prod.outlook.com (2603:10b6:208:29::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.9; Tue, 6 Sep
 2022 17:37:44 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::e46:a7cf:acd:c835]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::e46:a7cf:acd:c835%2]) with mapi id 15.20.5612.012; Tue, 6 Sep 2022
 17:37:43 +0000
To: Vishnu Dasa <vdasa@vmware.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Change status of some VMware drivers
Thread-Topic: [PATCH 2/3] MAINTAINERS: Change status of some VMware drivers
Thread-Index: AQHYwhYZd5LRJliYYkuk8GCfNhJZQa3Sqo8A
Date: Tue, 6 Sep 2022 17:37:43 +0000
Message-ID: <4269C33A-AC6E-4247-8471-5AC0A7D3DB1C@vmware.com>
References: <20220906172722.19862-1-vdasa@vmware.com>
 <20220906172722.19862-3-vdasa@vmware.com>
In-Reply-To: <20220906172722.19862-3-vdasa@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|BL0PR05MB4739:EE_
x-ms-office365-filtering-correlation-id: 0f7de458-1c6e-473f-dbdb-08da902e811e
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xST/KcV54v6zjbQK8ejLFQe2/2tPGKfXQVAjiHWqilw/2RO6ha/OwInIKpIHz/RhcDTpxZVYUZugpgV3sPdqt/7KdSduBWZ2h0hWJIiJYeFgY1wBfwoG32guunfZJZjU8l2pBjjX/F1g76LthcWh6lQMNyjYvmxW1GKu6A2YcwsHy3PkXPySon+R5RcewXKmzn3BeavR41uP2hWh1eydimywCseYYXWPo16dhvEyhjW4wx4cymJWCCtt7S7o1Ka2m9dgvvYpKYl1zcVWxiUggaBgHb2Y+ViGHSOWB/3cQQ4ETLFUKc50pBkDcIWPJtvgTa1Gii1BE6jtq0B+UcfEOWJPseOXzIFy1Pavxbadhwf+F3kcVW87sDRtuyH+2HpvV2AgYUR1VTYrB/hyj0KF7sSck546vbreVMnoS8x8tiad4GXUDCZ/x3hi6RavpMIwO7lKFt9PBee6GDL5SGb+T2mYPC43LlJOfqeVYABju7a5ka7mCM5hVmOZbytVjLQ1zf6GNeYrMXEhkkyXc+jwVbv0yg0Q/ZHeJvK1K8dG7RlHuEdK/+/DsRmN15B1vExbTUKVTIl/W+MRSW6UhGI85rqOyaydWqsPSSiAzymxxZ1ZvhZdLyyV0Xyom8mMkq4WTswMVaUnXVlFHUg24zh0SQfyz1LCQi3iIs9qP+sS/7ukMgnmU/G4DQWwYQdtvXvJxST6TwQrLhRqhOCj2CAE9al45FfyjuiRzkJttGlQ9KPFY7DK3eqgksJ1Fye2tuStuShROO1M2TAvfulMGfgOvU7lRrpG3aoii4yk/y8v41drpwNB8uWQd1Z/Pkd+DfVcx1g9mq+EKd6hz6zC1B4pIeYnxxW/ML0H84+pmZiX5IpOI7zKT9IfLCYGaW5fOXuhV2/SbMc0gjj3wbH6227+jRVEAvaKZlduJwXfhzmBoTcyoQlzRIsXS/4w7kpCU1Qf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR05MB8531.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(66556008)(8676002)(4326008)(66946007)(7416002)(2906002)(4744005)(76116006)(8936002)(6862004)(5660300002)(38070700005)(64756008)(66476007)(122000001)(38100700002)(53546011)(6506007)(66446008)(41300700001)(6512007)(26005)(478600001)(36756003)(71200400001)(966005)(6486002)(316002)(54906003)(2616005)(186003)(83380400001)(86362001)(37006003)(33656002)(6636002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ffowl9du0aBsi20dxDrApkzw5edNv2yYrjy7F0CuHV+rQv4n+pKxR3Ijax/1?=
 =?us-ascii?Q?iGy2WVnGkd86Tm17+2+HELt4LbIdgcV1KwYeSCa6D2GCLJSIZK/iGVr9uVAa?=
 =?us-ascii?Q?Tf8aP9ocvTRNR4TvrukTYcFBF03qyQ6sh8SjwMmokJ7hZCf7lnwNXB77tcrB?=
 =?us-ascii?Q?lJpNMMTOA4R8n6nuo9HxmCtLNbZrI6n+FAWzkChVxxPTnXEf3QISUsx7uiJD?=
 =?us-ascii?Q?pt2fM/suPHiv3oFsmdQxY8r0Orv6LMCdz6eQARnD6wD8K+7iDkfd+slge0K0?=
 =?us-ascii?Q?D3MyZrQDvgIDGwIM3hGenPJYI5lzuSex2G/9azPl34SJkconRxhxo5NVB7Gs?=
 =?us-ascii?Q?HlZIQwpJEGnRgDxqJr0J74b5HBXhK5JLUDbRKURlCV8g/L1DvcYovEH0jt3n?=
 =?us-ascii?Q?/dMGFFGA4aWZUUFIkpXq8M6tNoCKlbKnnXC1oLnDnyDMUshq85Y/FwgznjWN?=
 =?us-ascii?Q?6OQsdLZ6mR87ebF7kNd2G/DNH3QN6I0n3XChnUl+0r3mCS0CzBA38wgcQD63?=
 =?us-ascii?Q?QDXYeJHMyrMukGnd/6XtTQB3F/hLlFNXzcThVEmeXa9wAYH8D7tY3cGaBIAj?=
 =?us-ascii?Q?xF9yj/dbDCPvNsGdZmCAxQxYYWLn8b37BsJSiUo3XJL0xYDQB1z1CZt8H39B?=
 =?us-ascii?Q?sw2CDajxwXj9yDVGvL49ap7Hv4NeHu0KcpG1GjfQQKYRpiyOHmFbZ/XtaoaX?=
 =?us-ascii?Q?9gerc0ydQlIvZ/xlhr+dUDzbVNKIQbZ2jQ9hOYHfhSPxyh/GHv0sEbEgbnn/?=
 =?us-ascii?Q?5hiVgKRaQyB1Y289vHvZt4cIP+VZzIsWOHar001oq6NI+7+soSdQbvoMSv3h?=
 =?us-ascii?Q?I2Ce70/GdQbE3vkhjR8mLQgb+e9n8o7iQ2dNEWQotK9Yl3bXP58dsBNKlUmG?=
 =?us-ascii?Q?heCa1ijSzOc9NpYZFzw3VTWvqEk044GeBuSeVdIsslgBf/NJfCLgFmxczlST?=
 =?us-ascii?Q?ihaEvYaPISdcYJgv2/fl7V1b9QbfU9t9VI4ceSKu0QHgq1UqrnNzvu48WQHn?=
 =?us-ascii?Q?rxJjCyf66JArDm3uPTauvObpxKeuRFrOsuUGCeGmdYuf/YTUd8Tl5Bd7nLBp?=
 =?us-ascii?Q?ZVNckC7fiLT9wbX0QdDT4Wej1U8lCLETyA+K4YurmvL0v59ICMJSLE7H9kKS?=
 =?us-ascii?Q?n1Q/yyMJzzfPKicToFq8Km04O1c/hwXuZQ3L8f+GeCm7oTCOsICTE9yuyTkU?=
 =?us-ascii?Q?9YufdSQ/vo0Q5JjNOWryN9p8Tevx1hGyxn6YqdRC8lwnKPCWfqlc4BxN9Pwf?=
 =?us-ascii?Q?DpQjv0XVl14pLzwRoufDO4Uj/HobIQoAUNhSQq8TIttTOFUzH7KbbXB2TTyr?=
 =?us-ascii?Q?XiTnRrkAkuSTaCTRx3YSttRYTBvJLN6+LG4RASUwz12N47Ha5jTBmxWpht8h?=
 =?us-ascii?Q?OoNarSvSgbpFUDcLthQXeU8/cG5MRDA/coZnxBuDwTj6b0bY3KONAsVKbpns?=
 =?us-ascii?Q?GPE9az0uo7r+K6XFbTKDlY/D8/fXGCjmbcSPIYrjGijHvd6K0tf4myeVZK64?=
 =?us-ascii?Q?r3MvUykl2lmpTB8vNPPKIAeyw/5LVm5uoO0s2ltlC2V1Tmjz/yvnjRIvDZZO?=
 =?us-ascii?Q?G+pWQ9uCBh/0AghWXnU2mfyMyJL0ywxIaIqv5JPz?=
Content-ID: <1781454FFC6038499E8F43715531848E@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB4739
Cc: Pv-drivers <Pv-drivers@vmware.com>, Ronak Doshi <doshir@vmware.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Vishal Bhakta <vbhakta@vmware.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Bryan Tan <bryantan@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Joe Perches <joe@perches.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>
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
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sep 6, 2022, at 10:27 AM, Vishnu Dasa <vdasa@vmware.com> wrote:

> From: Vishnu Dasa <vdasa@vmware.com>
> 
> Change the status from 'Maintained' to 'Supported' for VMWARE
> BALLOON DRIVER, VMWARE PVRDMA DRIVER, VMWARE PVSCSI driver,
> VMWARE VMCI DRIVER, VMWARE VMMOUSE SUBDRIVER and VMWARE VMXNET3
> ETHERNET DRIVER.
> 
> This needs to be done to conform to the guidelines in [1].
> Maintainers for these drivers are VMware employees.
> 
> [1] https://docs.kernel.org/process/maintainers.html
> 
> Signed-off-by: Vishnu Dasa <vdasa@vmware.com>
> ---
> MAINTAINERS | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b75eb23a099b..5a634b5d6f6c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21812,7 +21812,7 @@ VMWARE BALLOON DRIVER
> M:	Nadav Amit <namit@vmware.com>
> R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
> L:	linux-kernel@vger.kernel.org
> -S:	Maintained
> +S:	Supported
> F:	drivers/misc/vmw_balloon.c

Acked-by: Nadav Amit <namit@vmware.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
