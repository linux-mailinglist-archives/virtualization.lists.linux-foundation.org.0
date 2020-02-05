Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6F15317A
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 14:11:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37E2285C11;
	Wed,  5 Feb 2020 13:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jv1L5ZNCWh8I; Wed,  5 Feb 2020 13:11:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5A3E185ADC;
	Wed,  5 Feb 2020 13:11:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FC9CC0174;
	Wed,  5 Feb 2020 13:11:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 699C3C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 65C288410C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHb0ASAgF2Oi
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:11:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10078.outbound.protection.outlook.com [40.107.1.78])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2A2BF838F6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQKCu4+70/kJSBcmulkd6fE5JAWXqSUsoahihvze38tsEhLjuhOkLTtDOJCM0LrWI+DXWJwx//lnbUsRzVvt5WbgRBaf42ssZ84E0/EjgSDtjVQys3gIIZK7ZeMSJumy+YW3S4QydoHa5BeoBQnCBYFsDo/83qRCjQfu2OKqd14uP6caAsHCjTPv7Vvh7K+AMmjLiP4NtXaTMb+F/V4ZzaQGJ8L4AhGT3ib4rYOIFZppHXX5epzfUR8qJvgKB5jNxP5k3+NX8c0gyz7F2VT/LjmNXualnNpZuR2pszHP1zYtxe92Cc15q2V40gGz5rN+QNXM3tgH7ivN5qgFoFfGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbiPdN/Tw9XZTbyfw4LGMrONC3v0+6S/WuRJhvHO4Tw=;
 b=JrAdRBJaCDYfHSnnGXGaLa1TNaH/UI1SUKmizArhczqd1cfVYEynecLkR9/5k5CAXlAqO1TWLv9lHSlzqTCyjvnXX5uywgB/I6eQ+6Pal2+9B3Q8YpR10FrLAnOO7jmqfkfcwlW4EmPK5iBNkpyLoQxDr4wZRXcQv1wFI8Lun/l1P6Po05iX3cgIA45m987EKsDOHxYssUV5gw37iH4Di9Z1aUCXfg/s6ZCfS2kUOfJu6iLitodvYetyhuebInN5D1BHd8InpYghBV1I/5/KfC+p8ImSL7tZYcBEZNqUiMxFMs2rOzLXZ/e738oQbQ1SP4fRZii6X/Kas7k73P6YrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbiPdN/Tw9XZTbyfw4LGMrONC3v0+6S/WuRJhvHO4Tw=;
 b=HUqeCSJWz5pEvpa6i2a32ezw1unnN9LnmoIScZvtGJYTFugpRKxnstscHF3JzfdCzlQMBiJVjgdfzOU9nEVvDG9qp1MqyyNTrJXzhz27OLbaSVJzGwWhDYYPe5LGacHGJdZKRVNEMdD9HIuE44W0xAX0oJXISKaxOAGO24yU83s=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4509.eurprd05.prod.outlook.com (10.171.182.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Wed, 5 Feb 2020 12:56:53 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2707.020; Wed, 5 Feb 2020
 12:56:53 +0000
Date: Wed, 5 Feb 2020 08:56:48 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205125648.GV23346@mellanox.com>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
Content-Disposition: inline
In-Reply-To: <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:208:236::31) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:208:236::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.12 via Frontend
 Transport; Wed, 5 Feb 2020 12:56:53 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1izKEa-0002I9-2r; Wed, 05 Feb 2020 08:56:48 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8f8fb22b-1f4c-4d1b-e392-08d7aa3adf80
X-MS-TrafficTypeDiagnostic: VI1PR05MB4509:|VI1PR05MB4509:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB4509FA44E2ECF6674D62AB4DCF020@VI1PR05MB4509.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(189003)(199004)(2616005)(6916009)(26005)(186003)(7416002)(36756003)(33656002)(81156014)(81166006)(8936002)(9746002)(9786002)(8676002)(2906002)(1076003)(4326008)(66476007)(66946007)(66556008)(4744005)(478600001)(5660300002)(316002)(52116002)(86362001)(54906003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4509;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LgU9/3vE7rJYUS2L6IWqg10NyNGNV3Fo/zCFzdtAkzHzdiYixeujAbMyPr3Up9SgmPunaXZQ1jEpn7UN42D5oDQ+WqaFoss+ZMs62E7ORCriGuviExal0wRfiIEo7zSMvbRStwZsBP+Q+1MUjJMMmYVHsjlyXQozL9JZwIaaf2Z+UqycIEdKFUy2y4qRgEqLIRnJO6gShwg00nwO9VZELiu8kuBNYj6sSchOSZcSXBxI3kXoeho5bKrxBDx1jb7TQ70iSKejvRmgqQgLsG7DWC1h+swqeaAoKgHd7Kv+NxgZTtLulqZ9oYhGYBDA3r37qFiG6wL/buJf//G8iVZHzuAVQC96dnIf9UjMAgSzALP03EIjhlPiLpyS/l0S6RUrhB8Uh0Hghemxnma9kgWowI6SXKD5yDyYuO6HxvvOpjWAfoWyR6g0A3c8vP20OtosdSLX112OG13R/+4i1OlceLT+GtVCZfEqLM7SS4ZYMSNVwKXbIgCG3TFYOvGiu2lL
X-MS-Exchange-AntiSpam-MessageData: n1YkP5iFigNTfa5KFTJKaT4IhUwo19bRL4ngRj9iADAEXWD9JLYAO5y92o05X17qTFiV6JXJAt7MY+SCTscuiZ9/H2CvotdbMpx8YerIj9hngHhvbOf21RsGHMF3ozY3rr3eo2F8BncEuARfM1vWpw==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8fb22b-1f4c-4d1b-e392-08d7aa3adf80
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 12:56:53.3574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQ01rPmVWX2GbT50QEsE8g6wEQjpuNubHc0YWbcwnBAr7qgaxFt2UCbDidwlc0PIn3y+UjGfyWisqL0OL7AGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4509
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Feb 05, 2020 at 03:50:14PM +0800, Jason Wang wrote:
> > Would it be better for the map/umnap logic to happen inside each device ?
> > Devices that needs the IOMMU will call iommu APIs from inside the driver callback.
> 
> Technically, this can work. But if it can be done by vhost-vpda it will make
> the vDPA driver more compact and easier to be implemented.

Generally speaking, in the kernel, it is normal to not hoist code of
out drivers into subsystems until 2-3 drivers are duplicating that
code. It helps ensure the right design is used

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
