Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAE9157C15
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 14:34:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA49181EE6;
	Mon, 10 Feb 2020 13:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDssvXsuTfeC; Mon, 10 Feb 2020 13:34:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EA07848F5;
	Mon, 10 Feb 2020 13:34:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E75C6C0171;
	Mon, 10 Feb 2020 13:34:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9065CC0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 13:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7B11685022
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 13:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65amxFiO7-jv
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 13:34:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5F9082713
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 13:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVzveOVfN8Xz03ksgNbMr4idgkvXDa4UJuOEVyHJs7yjUdF/NhLEL8xy46vF1DXiGMqx3hJfaffI3/utfy3gBQPC/1P+zsIKZoi5RCCCVUUO30mn2N3Smn1G9YOXe1/6dIoCnm6TO6qKQYP4hOOQDZ02oJAorYRejw7Ee653FcUVwdMR/cvUiCATBCuGtKcUHDZ454xwn2Jg9mFB0Siw7Xm2eKxB2KLEU68huumecTvaPTreCsZD/sYQ5gsKizNZX2VLxHJZqT0eE7vGPu8JUJ8P0xKomxzhhgr0CSBI2yro2ptxf1W62ScLvE++cJzG52NEWFvDmwWNfXK3oAvnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaZwTrZDk3+PW79yrrqW4udBycnyk2AgyvXtnszqCh0=;
 b=CcnW1wcBwhJw+og1Ut8119zGiTAePKe7B7XKjLWDL0DrgiaXw+8kGFY63Smmw2LZsSau7pQM/8hvPR0rpjsteuPx6XRDqp7Ff40elaaGeOUatm8Ix8mPkPJRxgQHdc6U5RrMsjejD+M0gZ6h8AK6umIomFNFph+aFa0VdY1woexieiBWoOzoXhYaGMLdPubEmL4kHZIhQnahUxzuYIVqExsiwsim5cDgOqbQ3Odwei24m1y8HAs0zq4fCoYWnJKwMXxwD/oTcQ3/sBllAFPACyNl+FFKXQ1zBsVFlndNP8eMrW1J8S35xa1VV0DlVhldLkC8085ARzCaXOsCwLg17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaZwTrZDk3+PW79yrrqW4udBycnyk2AgyvXtnszqCh0=;
 b=kC2Bb9TIdknNEFb3gDBe1E9ApYXXtpQEV/3soJEKHJxcExIbVm0KP6CY/Rk4zZla1lcK5yROaudbo1DZ79Lp9EP4kYT0YE+yXmq8kA6fvK8pvkJNuFd5qJpkORwQB03MjoMEF2fx/ovo4jD/rxJLZlA7z0T5yEfR6boL3nqwnvQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5693.eurprd05.prod.outlook.com (20.178.124.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Mon, 10 Feb 2020 13:34:46 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 13:34:46 +0000
Date: Mon, 10 Feb 2020 09:34:42 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 4/5] virtio: introduce a vDPA based transport
Message-ID: <20200210133442.GS23346@mellanox.com>
References: <20200210035608.10002-1-jasowang@redhat.com>
 <20200210035608.10002-5-jasowang@redhat.com>
Content-Disposition: inline
In-Reply-To: <20200210035608.10002-5-jasowang@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:208:120::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:208:120::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Mon, 10 Feb 2020 13:34:46 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j19D0-0007da-Dx; Mon, 10 Feb 2020 09:34:42 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25ec9ef4-7192-407d-6259-08d7ae2dfe74
X-MS-TrafficTypeDiagnostic: VI1PR05MB5693:|VI1PR05MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB56939BD3265A5DA05A710F4FCF190@VI1PR05MB5693.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 03094A4065
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(33656002)(4744005)(36756003)(86362001)(5660300002)(1076003)(7416002)(316002)(66946007)(66476007)(66556008)(9746002)(9786002)(8936002)(2906002)(81156014)(52116002)(81166006)(4326008)(8676002)(6916009)(478600001)(2616005)(26005)(186003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5693;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YtvaUXxzyYCj0pgU9Eg9keN35LKCSqyajPZxI905JRj11wLMxtYAEPa+nLINWL3o0WGqS9oBKxsKm5zmaiBzl2LDzTMDWaudCZBBq145H8ZpPY33e2CoAeHQ2PrO79/9uXAmhuULv8GCn/Ah1OqYIrVimheg2es5qKwOHHbQxIdQUi1iuiRdzgrCn9FNAazngDZuwo+o39s/CYy/4iel+FKT5fLW1weTjKhWZBXTKIyOlIOD95c0jYTn4q1pdciS1vZo14+AIXaG0mC/ZG88Ka3S5cTvmTAGCPxIpnVZ/NQvoR+EWwSDPzP/My3C0qBV5dwi3M9pUXn1XffqFlUW1cTzfzhtRlPeHw9zncG833vHgFqqF4HJaLu5WBKjxVP/G90PH5nDcRPKQ4g9cq6k6s/mlvEwe9OP1+EhPBTCfE1ElzhKnA1+t8ys8MjlxkfzZNFwqh86kN8p9P0Og4wc2KwGzHRqAwi1+eCpwDaupUciDcm8HNQ8hFc4Khi+ZHdq
X-MS-Exchange-AntiSpam-MessageData: CIfrORGkJvDfy+1AFpTaIVIepe25xJRzSvJHNesSmByTLAqMjmHrCN+QEKzTXE6KqbDIQWiuPiA0NMdEwHgGGOsekA2xCRDrU5emtcnb8XC29S1a8/VbIiaBUn3cAMLbFBpEW05Iak+cXoINndaL4g==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ec9ef4-7192-407d-6259-08d7ae2dfe74
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2020 13:34:46.5204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSYCotorbWwV1JeU4KqH7/avPuFIxu20RpiHphMzFN55hK9WttMyFe2tQNyj3ibEswqN73mEb3fSJqlrvuO0ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5693
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, hanand@xilinx.com, hch@infradead.org, eperezma@redhat.com,
 haotian.wang@sifive.com, shahafs@mellanox.com, parav@mellanox.com,
 jiri@mellanox.com, xiao.w.wang@intel.com, stefanha@redhat.com,
 zhihong.wang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

On Mon, Feb 10, 2020 at 11:56:07AM +0800, Jason Wang wrote:
> This patch introduces a vDPA transport for virtio. This is used to
> use kernel virtio driver to drive the mediated device that is capable
> of populating virtqueue directly.

Is this comment still right? Is there a mediated device still?

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
