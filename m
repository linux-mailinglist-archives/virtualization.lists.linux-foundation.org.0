Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B65E21CD2B
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 04:26:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D92987244;
	Mon, 13 Jul 2020 02:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6W-HTeMws3L; Mon, 13 Jul 2020 02:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1585387249;
	Mon, 13 Jul 2020 02:26:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1D68C0733;
	Mon, 13 Jul 2020 02:26:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37534C0733;
 Mon, 13 Jul 2020 02:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1FC872049D;
 Mon, 13 Jul 2020 02:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9gJTFpA1X7G; Mon, 13 Jul 2020 02:26:49 +0000 (UTC)
X-Greylist: delayed 00:17:06 by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
 by silver.osuosl.org (Postfix) with ESMTPS id 330D520341;
 Mon, 13 Jul 2020 02:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LruRMIOJFrkQOpMYDRd1yBY/0DXM3V6+A1bEDdoxc9RmaRwS9HBRvq5Hoo8xHILQZW5LkamzP69XibMXDNBMw8uz5gAEJZCjk5XcroVB/x0vmXZxf0EdxhDZ+SnC4ga775AoPClrV2YFkPP2nX5x0yQdBA0CQ6qEGFNLiupejdNV+bD+2V/QSs0TVAGo419en+wm72yiZaZTnoWJW5dnfrABUesjhRfwqEmX7KqUr0B+AJ42xNCigcv42m3enWoyH3jYGja6s4+Uxwu+yYH47lKX8iqZVTAzGAR5C7N2Vc6Ez5uwcmuiWJgt3NdYuaqCN3Hfhy0C+p2ZmR5yRSiLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GABxCLbPG/InTruHWRpo4qulx4rYnvByLeP8nYru0E=;
 b=YjkUykQ71iQuSBu4BfIcWg+2KGefoG+bOWCDyA7KR2I5eb3EzcO4TnGTidRM51/GAwwcFHzOhVDLN0P7GSpzxCrbrG5ZUdGpwZ2ACv1y8Ckvp1pIl/sAa0MQVk3zZRT8y9Q0qn8tcjCU8cm+ZOwW/N3TgPeWiiUMUZ3EKH07PmrLdu0xF5h8D3e5oYhrwpBejTMB/TdejTxbDV+dtLxN7l1NoIsKDzgLs6N/WxGevp5Cg2slHo5qMqkjcjBhXYdJhSNAD7vdQ2qyY2k6nzTlfPrqQ/rc379jBqoSjd72nhoCFmOeiZzBlwYHG+DgSZB3lVBaQb2zXQOlwKcMBfQ6yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GABxCLbPG/InTruHWRpo4qulx4rYnvByLeP8nYru0E=;
 b=heSq42g8WHT6NiBV2e/XNCtUZpyt80CMWW/KlzGxuWhXKHsOY5GLi5GhgTP2lifKD5lRveY7y65FuZcKKfacA5WFDt+MQOBE9BmSPh58C0EN4mN65PPF51KMh9fOZtD9JyrEYy/jC2TwsFdW1roXU1na/IPUOsPO9cUNhvalgE0=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2934.eurprd04.prod.outlook.com (2603:10a6:4:9b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Mon, 13 Jul
 2020 01:53:47 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 01:53:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: RE: [PATCH] xen: introduce xen_vring_use_dma
Thread-Topic: [PATCH] xen: introduce xen_vring_use_dma
Thread-Index: AQHWSgTusARd8c8cRkWwDit233DtZajneYoAgACU6oCAAC7QAIAAEpoAgAAGSwCAAUK2gIABcSaAgAVA3oCAAnnkAIAAQwqAgAA/4wCADeHhAIADsWjQ
Date: Mon, 13 Jul 2020 01:53:46 +0000
Message-ID: <DB6PR0402MB2760A98A427AA48FA325635288600@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
 <20200701172219-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007101019340.4124@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99a7de08-78dc-4b39-c1f7-08d826cf94d4
x-ms-traffictypediagnostic: DB6PR0402MB2934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB293480B64104501E330E226088600@DB6PR0402MB2934.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNjTjTjWrIzXfE6ltpWdBR2DeplyC5i9JvzDPZQia160JH+4EpFBFzUBzaTYh+uNrM/VAFmAV3PbNhBJHmw4II1QBugVpSYd+ZkN3p/kF1yaQTw4pm/RfS3uD0WGoDkSTdS79kgwDookFi9BKKxCd10mfxdveukGFFsjh/BIVkUj48h+STYHB61GG8gkXTt6ITZV0OnndJ8ZhM6eTVmusVfqT4VGMIOba0QJ7G5tYI+xecyBwKWGL5LPqc2bRxVYTRFcQlD97nLK37PDGgCUsc7osct3GMyYTmmMbUfTR9BNamWstINU8Hh7Y9Zp4MCrITQOw3eHM8GlxxprJogzeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(2906002)(86362001)(478600001)(8936002)(8676002)(4326008)(83380400001)(71200400001)(26005)(7696005)(33656002)(44832011)(9686003)(55016002)(110136005)(7416002)(6506007)(316002)(54906003)(186003)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Iun8yMXMvh1uJny1TTawzz+RrjDW6kn8ygbIzjr3Mw6Ca8T8w5/hMDadUD5xBFjCFBsj4QPIiReVKRta2T+kh2YkRdvG58bGxrewzphSpr8HT6vhsCU/1QmupGEgZaPVUseO/ppaC+y0yTT/POW9E40JnMMr0/uKZrcYxKazMrOMAZ5quH6xrF2sj8N35RRCDqhDLSO7PVwhVKOtExLwKPDhV3juJVIk4L/5+OAIO7iJ7QreF5xC50QYFLi4bgA8BVNNt2Zqu/LbiiW+hmOWV5wVog8ablQmmxHgJkE0xIk3grgQ7hQoDvcj7g5k+s0oaD80LLjXhzmt3qHbTr4j9jD6/shsyW94xYVPdTW/caw5dVIQXvMhI5QcGOe78Yf5tKAlBryF38etGJEkPrvsO8ReuhJj6/l9q4SeAjyMwFrrWlJ5zkv4Z6OHWS60F8GC4mGuHGqOxZeHW8OwvsxL9Uw/dBc3P99uO6gTD+BH168=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a7de08-78dc-4b39-c1f7-08d826cf94d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 01:53:46.8602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhMchUJ1LWLK4MCDdWLbSri36Ld+/UF1kdGDfCfQG+NsyzpEL7vFL5ZnooxMhdUBejFSfT+ZNO67zUrafCM7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2934
Cc: "jgross@suse.com" <jgross@suse.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

> Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
> 
> Sorry for the late reply -- a couple of conferences kept me busy.
> 
> 
> On Wed, 1 Jul 2020, Michael S. Tsirkin wrote:
> > On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> > > Would you be in favor of a more flexible check along the lines of
> > > the one proposed in the patch that started this thread:
> > >
> > >     if (xen_vring_use_dma())
> > >             return true;
> > >
> > >
> > > xen_vring_use_dma would be implemented so that it returns true when
> > > xen_swiotlb is required and false otherwise.
> >
> > Just to stress - with a patch like this virtio can *still* use DMA API
> > if PLATFORM_ACCESS is set. So if DMA API is broken on some platforms
> > as you seem to be saying, you guys should fix it before doing
> > something like this..
> 
> Yes, DMA API is broken with some interfaces (specifically: rpmesg and trusty),
> but for them PLATFORM_ACCESS is never set. That is why the errors weren't
> reported before. Xen special case aside, there is no problem under normal
> circumstances.
> 
> 
> If you are OK with this patch (after a little bit of clean-up), Peng, are you OK
> with sending an update or do you want me to?

If you could help, that would be great. You have more expertise in knowing
the whole picture.

Thanks,
Peng.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
