Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 104EB5B0DB3
	for <lists.virtualization@lfdr.de>; Wed,  7 Sep 2022 22:04:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2207160D80;
	Wed,  7 Sep 2022 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2207160D80
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=P902Zva7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rESZkS9A1ae; Wed,  7 Sep 2022 20:04:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E9DA360D62;
	Wed,  7 Sep 2022 20:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9DA360D62
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 286C2C007C;
	Wed,  7 Sep 2022 20:04:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B206BC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 20:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C55560D80
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 20:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C55560D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zufx7_hO_i46
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 20:04:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF2EE60D62
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF2EE60D62
 for <virtualization@lists.linux-foundation.org>;
 Wed,  7 Sep 2022 20:04:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoZnlGg4Yn8r+N1SN2aYx+NVr01F91lDkjckidNtg1+67AGZq+y/t9aG3S1rTor1DKsQdAuUIO5lEZ2tdP89ilGzhHoiHUsYMXVHzDCds0V2cUYLWzhRMNjm5L0oaJWGtdFBzptsvyEn4IEdJS070FM8ozH+wn7Rn88N53GF3gs3P+3ErUk0EGEGEcurPuKXlR9w7ptRYmrSq3Y8Ywwmz+FMiX5Sh5qxrN3hUYYcuBVuDncETd1CuYOhqYMfv44PaGzwi0kt0l3rQwYcYPepamC0SMmkttkyLGNZWguIaiVBemCpNCDzt+8q9Owh3GJDk66NtCu8LNvsVm3NKQHDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmS0H/BeysKuDq5+/PvdEDVL5ZjPBTgWDsX+zwTfAn8=;
 b=feAewes9txtbhjVyxaZtcK+Pq39ERuk+7yl8WoKLbhCmQ1DyG/lyyUVYsNck2Ze0hntJvYJn9B8YzMhutYysq0kC9sHm2K+X21NwIYuRmEKFT50NlRKHal/4HaE4k5mwbXWTXsXGqZ56egezhIxPH9xPUx96Bx01QEIAvJlStA4+jJz7upuiU7FkRL6vxH9wOS5zpzxJpyP29GZwHH7KdU0k0ePM5ry5YhEiHhlyjqKZ/VRizAO00A48li87HXvr86brsa+4mRD+o6mWp9MIkSmri2vqh2ftX8jEAYE0eWhjuE+GfdfXt8qRcw5D3ZgyOO6dqK78Qr1MS80f5ryUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmS0H/BeysKuDq5+/PvdEDVL5ZjPBTgWDsX+zwTfAn8=;
 b=P902Zva79K/skQl/sx8ngILtqR6UCft4dNZnBkga7ZHN/XQRou/sqNjLy6iOzU7/yevaAw6lK1WR5bInVbJJ/H/3AryHJCvAopFW9Az8lrAqSqdE8HDfs6NqvSJ8spVli57FIqlukC6PqMav0B4KTzYMbZHJPDxJLXsllkDW00/QnzKckP6PyOwvcxaHuhZYiLeIZR0fUL1Y8eyxYckyxu0GaTYp9dRXrRiLPHxqvJ9RHaTJYD4BnwiD9vqBMe8Nq44tHzC5KnY1RMH03s2i66BE2T+vprUR0MbupgvE+FnGyR6e4rmSogg+9OU3g28G/PrkVz9YnG3tbZw+yxW6vQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA1PR12MB6680.namprd12.prod.outlook.com (2603:10b6:806:253::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 20:04:15 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::1429:e3e9:dc54:ba98]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::1429:e3e9:dc54:ba98%9]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 20:04:15 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v5 2/2] virtio-net: use mtu size as buffer length for big
 packets
Thread-Topic: [PATCH v5 2/2] virtio-net: use mtu size as buffer length for big
 packets
Thread-Index: AQHYwpEbqLdY6RByfkyoSMo8wpA6EK3TsrMAgABG8oCAAA3LAIAAADnAgAACroCAABYGQIAAJjCAgAALaACAAAQwAIAAAFDQgAADKICAAACIkIAAAuAAgAAHNBA=
Date: Wed, 7 Sep 2022 20:04:14 +0000
Message-ID: <PH0PR12MB548190350C757262C4C814FFDC419@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20220907101335-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D19E1E5DA11B2BD067CFDC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907103420-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481066A18907753997A6F0CDC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907141447-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C6E39AB31AB445C714A1DC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907151026-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F1234CB7822F47DD1B9DC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907152156-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481291080EBEC54C82A5641DC419@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20220907153425-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220907153425-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6680:EE_
x-ms-office365-filtering-correlation-id: 022b4aa9-9577-4d3b-4b47-08da910c239b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 97mnh/K3y7g+jzCJYUeyQzt71aGPu4pDG4+a75yTS3USgX3DfekILKBAXRRZclWq5WtCxSqTj3HgjvVSIWMuOEH/7U6CNFo0eAvDgp2p0fmKVQBLhq1J2ebgSVv+ed0puRcQpatuyJVcxFuOEMwnNV5sr3TnEWLuiSUq+oeaWHNoCi3gqkcNPDCZykifB5KcNg2TFcDhqMTJDNMI99/9uBVCGzFBWCBY9VJp4c5tVl0GDt7Q66ctILABr38z56GHA8YL7gqOXTVi74Swuv33I314y0CP7lkWT6B1xWMEaIMhlC6ZBR/iPjljQqg2FCEmR1BdKjWwjEDaFf+WcQwIx7KCxi5Aka8qeZnS0BL3Z4o+9xz6tJq4hPvOXockLTVQmZk5xmwuihAAjLHKTrtmp+miScwKGoGMliS9ptzqzLT/tSNNgQ7jCsZbMLXWWs1/uKRrCGk2WLUDhXIzzsOZgEnGLANtACKT9tBtDPpgwT3XP0n5wLZHeCRZlcM3f0MhvgwxP4Hr/1Xh+gCNtkiun2n5sDkNUU82tBfOEHzsg1YLH+h6NspHvu0pPPmS0GZKjCDBcVurCpw9ULzUAO1cwOkE7rcBZddZ/Tf4sU20xP3wtIDLESUaMoprgKRxCGQ0SzLh0LzcwHQMKwbyTHs5DcEq1RgIxHcI2F7EMB9vdyQbH/Xjy57T7TEobxg0+ltrExL3vemDGwNG50Maxz6L6y5Zp1o8wz7sEi0VEJYsSoenIeCSY6yy873ucRYY2nANWohUMcqc9ZyL+dzitTP19Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(7416002)(122000001)(8936002)(52536014)(33656002)(2906002)(4744005)(55016003)(66476007)(8676002)(66446008)(64756008)(66556008)(38100700002)(66946007)(4326008)(5660300002)(6916009)(316002)(54906003)(76116006)(86362001)(6506007)(26005)(478600001)(186003)(38070700005)(71200400001)(7696005)(41300700001)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sjpji35BtDRea3UdbXfmwgHKMlCr3pXNM1M70ziw+0p3KqBRsnx1f0k+nIfX?=
 =?us-ascii?Q?In9gKPqvEd788Ftljl1/JcBmFwrpGjQS2Q4MlUecSoRk5/LNUeyesgAtHG8W?=
 =?us-ascii?Q?M3lqI4A9e3I74vNvdza6WQEXpoYHdidZurStLPxZ8m+sPRB1L0Ybx0ZuYj7l?=
 =?us-ascii?Q?SpNXxl0lLiVL5vKAtYUL3dOVKtleuPzmIN3gprbdt1ZFsiNTNa7gbMRxNFBB?=
 =?us-ascii?Q?/7gi4pDoRJFmHT0wUmcSBACyodNOKZsHcF5KD5wD3aR+ky9szdt8bC+QSb34?=
 =?us-ascii?Q?wuLKfgdRbrSv+wdDhewUl7+s0aX0vO8pkyB31msJwWdnMiwbpa509n6TM70t?=
 =?us-ascii?Q?ccWMGmZKX/IxQbf+9q5WabjxtntBrmpmTMSPwQsH7rxFDhEpAE3qUNnrhtlw?=
 =?us-ascii?Q?YZXbMuWYMhhkobeeOb/WxaeVQNY1aykT2q6hLsVY6MoljCby/Sd8/ty0vlpm?=
 =?us-ascii?Q?oCEheeSb31mnBt007tEgUFEVnnryGoHCxNeNQZ0jXgxnZswgbv8eeKBRhcGA?=
 =?us-ascii?Q?vhEB2yku861IPSn1y49OzDE9vexUPYcyguCmog+gAzmipNjhRLwnMqa/W1EE?=
 =?us-ascii?Q?t+XjeZubDyBhmu0qtZYpgReNX0dnYLDeE0sotQe7qs3C7HJ61EIOBFGMK0eF?=
 =?us-ascii?Q?MjT9AJRb/E7DVmBYCVQZGjpbJxz8USzUuO3/fRBNKZTPuMwXRLVUqLmYBX3T?=
 =?us-ascii?Q?axiWTCHriKJRq8iMo/QwUISHrghVklsCqu1JXjIOVp4Bw5fHojeQqVzV7HSY?=
 =?us-ascii?Q?BMFdusYsMU2d1iWPWC6IcgkKuGE+wNXM8wXG8RSb7b4w2OQXb8/G3QhxjCzK?=
 =?us-ascii?Q?ceM0+RV2TkLrhuUMAWusvn/2XvHuZFPGUva4SeHYyuuF7IFARzKDkMIocyyG?=
 =?us-ascii?Q?mh7Ne/chmePzTQNfkIpER72NvzcdZ0FxL5ypW08z/2AOvk0mgnKhanOEzASb?=
 =?us-ascii?Q?Jgvoie4JIjH3WdSf0kZU1rLVYbiOXfFCSuEvOXO+r90eZGSZ9/kcFsUBPLRo?=
 =?us-ascii?Q?pZTkhTGbvbIMy0SRQotk1is/OHLeg2oHsOcMabnrLwuYKgjJUwOE/Qg5FYVg?=
 =?us-ascii?Q?kbS3stz2jrPlLp4gXZRXPBfO6QddfAjKtYUSjV4H2KCs0POf48uNdkXVv+BI?=
 =?us-ascii?Q?HIL7TmuM01u6AX0zcMRN/DmUWUYdnY/O98U3mY5APGuJsPmhsl3ixdCMiSZp?=
 =?us-ascii?Q?bavJBpFA2Ei2Rfdx337uUZL2jpEXWFvtyB//eXh8PZW0DUs5odNRflDJ4qHK?=
 =?us-ascii?Q?Swn+0+Imb5eylmP0Gl2dasdrGvPRnQWw+EQ/z4AV0VKEym+rq8Nntxj03T2/?=
 =?us-ascii?Q?Ph/ygZLQDryQmCdE4PcDsIMtRyYLkdETf9ZJlf9gEWZxkP18CQ93tKCB0K/2?=
 =?us-ascii?Q?UYhmzgpze3LDnaNj9Lts70G8BFM1BRG9l4iZCZG1g+d1Sl5+/7wf9caJmLk0?=
 =?us-ascii?Q?e/+4K/T3I8Yym3RFfObYrCg1XLMl67Pn4SXjFI77ceWpC2FVIAV9RB4upgVJ?=
 =?us-ascii?Q?dl5TFAYaCDP2rbszd5nd+mcIN6b4DCtANdG/ktYZVEtM9ytb0pGPvD3iwPBv?=
 =?us-ascii?Q?nLLRpI8p2K7Ab1fKjN0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022b4aa9-9577-4d3b-4b47-08da910c239b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 20:04:14.8736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXvMp/Y/cfpX2/NAdPdpCsLqkp0teF3hxZFhTtGsIgyYBMLgfeG/qdXhgb2cdO9GXp3mmcGOKf9+//yELWauCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6680
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "sridhar.samudrala@intel.com" <sridhar.samudrala@intel.com>,
 "jesse.brandeburg@intel.com" <jesse.brandeburg@intel.com>,
 Gavi Teitz <gavi@nvidia.com>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "loseweigh@gmail.com" <loseweigh@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>, Gavin Li <gavinl@nvidia.com>
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


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, September 7, 2022 3:36 PM
> 
> (c) replace mtu = 0 with sensibly not calling the function when mtu is
> unknown.
Even when mtu is zero, virtnet_set_big_packets() must be called to act on the gso bits.
Currently handling by virtnet_set_big_packets() seems more simpler taking care of mtu and gso both.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
