Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 537AB66D343
	for <lists.virtualization@lfdr.de>; Tue, 17 Jan 2023 00:37:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D299C60AE4;
	Mon, 16 Jan 2023 23:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D299C60AE4
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Jc8N54qx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WffXdSkbF4fN; Mon, 16 Jan 2023 23:37:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 74E6860B19;
	Mon, 16 Jan 2023 23:37:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E6860B19
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E71CC0078;
	Mon, 16 Jan 2023 23:37:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8E0C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Jan 2023 23:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F9040BC3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Jan 2023 23:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F9040BC3
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Jc8N54qx
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ns2ggedA3vb1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Jan 2023 23:37:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0C6C4016B
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0C6C4016B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Jan 2023 23:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjANApWfi4IdEICVIE0E9C8p9U2yFtZbVky+MEpPMoWCdSJ7PakP90U2tZhdKprhWdsgJPGaanpfBMyjP012P6XaopSKY05kox88G+ZySWeukBKpLS7CsN2yP74bqkSb03CR3USwkXrLSxp4jwmF3bJ+Cix8WLqj6XhB9WQJrjUa/vcg6z/DZuGUC7hA5OjDDy35IWLGqET+IwG2QXclNKPUoOWaoq5f/4SP8go7eZHxw6Md+HGD2kQIaRCIOFEBhYXK+FNR5pQyPmYRYUq04M1CqrHORdJs8KeIXuXaMiiGK165DBzQ1KSHhipmi3DQdxIu1rWj6lIR3IGdImD2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4pz2m10u82Wk03SC79BrZivhcfe/k71DuVG4bJD5j8=;
 b=dZ9vONG9jWSQtgHj54R0m8pVdePc60UQHOKiFdIP1Msk4UoOVgGVJUMifWcM9c85jx77uXcqxXiTud8cJ3/BNRcmEpiWe61bH7fy6TlKPDryuxikkmUhjI1cqSmc8ERk6oi5rKHrnxo1s+1aip/ZA5TSSM11Jgy37m6RuHqqqV9Rb6OvfNRjo0HXrruC3HjrTnHQmDjVMcOL6jzlHbghFKuJubnLZuoyyaT8tI8ZeMZCTHQR4E2t+hvkgSK+KNXMW5KAOlZQeoCAjtcOWLHbjySK7QYxSQhDaZSIuZRjldTRaowbdGc7SjasIuY/bXAkrLXIiHC6xIUYLoga2G/+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4pz2m10u82Wk03SC79BrZivhcfe/k71DuVG4bJD5j8=;
 b=Jc8N54qxy3m/hs+UEr7pvwMAlqGFv+7O7y0E5yh4aIGWL6TzvNsYrjF262k9bv6nImGEtFlOzIYd57EVW9A1aFRA31q0knIQ8sR8jM0QcR8YvKw8a/OKak/A2gZDZC7iSzIt2bD7l0YO68GwAn7ndPapGztRqkHBNmMNpgZcB/32JWKkw8wDm8rHaYNSTAeT0sKMqcOZIcwS9fzFM35N0JXVIo25ML3X14v950G8twKGKM3uNkuAMCCSrYdHUwDBBoEvOJdXQnvT5fozerTtTlEK7HVKcjA4BSRSc9P6eqfARpUFPu9uxzMyXJyHX6KjiHzlp4rf9jmqxKztoFM9vQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CY8PR12MB7242.namprd12.prod.outlook.com (2603:10b6:930:59::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 23:37:47 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0%5]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 23:37:47 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH net-next v2] virtio_net: Reuse buffer free function
Thread-Topic: [PATCH net-next v2] virtio_net: Reuse buffer free function
Thread-Index: AQHZKejz4CVa780Tgk2XpU5Oya2Hj66hm5KAgAAXWQA=
Date: Mon, 16 Jan 2023 23:37:47 +0000
Message-ID: <PH0PR12MB5481A0C501C79BF0B04EB537DCC19@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230116202708.276604-1-parav@nvidia.com>
 <20230116170550-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230116170550-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY8PR12MB7242:EE_
x-ms-office365-filtering-correlation-id: 28228837-673f-4cd3-5e80-08daf81aac56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /9CVYxjU5vWuw42Z1bpepNAo2uQJJFHpU7Z70LpIoVMd4riSk5fgsPNmsJaTnLcncC5BtqjeyQLxSXNHEN7JSqtjg+pIvRbhGl2yezL9SldSjE0aV0cxgQ9qqHWP8FWrGnvCD8a4NqQrd0q5slD5fyMj7P293Y/pKv1MkKoiiR5Fk1wmk7FXeLRNBHs4mnilQPSqQNyPI9VyZziYgmcujmcK768ynD2ZSXPwtKRxpy1wABi1gTbm4MGYQRzE9Me89f/o/75rtBQDQyomvIeVEZ65VfUR3/o1YA3QVvDDARseQk1koNTUSrFujZGsMR5WtyjkOYjza2ziwlmI3SbsDEKc+ZQhkEjQEmezWqHrywq1SUHJA2hLlP9hxy/FHP/LhShVzFwfQ7V8OlD+G4zSWL2BxHDMT/z+iMO1ygD/OSHEzyqzn/oBkpSMLa+MKwCPJOgiQRT/Ktv5+DZj3IT9REyIJbnAlSQn/fNrt7eaHKlNyxcGFLaCoSONzSHQh4IvA8Pcz2hZaQFY5tc3A1VvflkjApICi+shbONEswCmqxOe6OmVcLdrBuW1gxpkS77DnTy4SoFyPnmGR6eBk6xLsyWYsdwLcIvtkZ4YWehUTqIyq/tQTNCPKQlzG2dFwbTkYELSLrHp9adXj9QrBXmV2+DABTYXoXK7AgXYwlsRpYkyZvTp0oYg3XPVZ4gwle88hsnZ/eKpg8vy9H5FwlBH1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199015)(38100700002)(83380400001)(122000001)(33656002)(38070700005)(86362001)(4326008)(2906002)(55016003)(7416002)(5660300002)(8936002)(6916009)(8676002)(66556008)(64756008)(76116006)(66946007)(66446008)(52536014)(66476007)(41300700001)(9686003)(186003)(6506007)(26005)(54906003)(478600001)(316002)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yDjkAF0eW01awB2ZslMYmQ8Knk4fON59zORlJF3rUIP541YQaqKLsaqnxkFA?=
 =?us-ascii?Q?clX2tYfsYmLd1UoJc7O4e7McuUNPNByB+roblqkv7JjQ6M4MM0p4/WOu4DjB?=
 =?us-ascii?Q?PHuZ6B+tmvgS35jdtAh3+KVaQaZr3kjCqqgMYWuYs+IHgtDKl2UP7XF6o2M+?=
 =?us-ascii?Q?A7awbvc73yAlVJp/vxiqgwfoBpgLqiIyvFim3ANyossajuBFZR86apUtq0EL?=
 =?us-ascii?Q?pLOsttHGHZ2ojK64TbKZcpxmniA9pV7hBzKk3hWvcPbsk80eDYyE1+O//T2m?=
 =?us-ascii?Q?reQfF6L67CNyXJeRpitnKM2Bd7opiqi+jU0FdP1KnP+0d4FAGPvHPmhOIl7v?=
 =?us-ascii?Q?VK4ib4Iy8TuhvA/8u7/edSBN97uXAO4pcMLq9ZLFhDoJDgAPubxVwXO4z9dR?=
 =?us-ascii?Q?P1KcCZA9myvIpJdNUeXFEWZFdczMkFZ0+INU7UFosAylXvIfZ8Iu9JSi3RBx?=
 =?us-ascii?Q?oRMD0CWwH9FGtfecipWuABrMGvsJoqiy5EnQsn1DvgMd4cPfaos6hckGEY3Z?=
 =?us-ascii?Q?t45LYCfGpiKHJyR8Izy5TdherGYtRlPnhDu1G8x9wEo0hgK8uSTt+WZn667t?=
 =?us-ascii?Q?8YcIT8Dg3G6NM3KumpaIh5CrGcPf/OqmocQzpDhw/57in9qSgiCNskVgKBwH?=
 =?us-ascii?Q?mCcrqOGrFf5bR6c59Ccl1WmP44yTPYNvjM3/APZzkS3Vn3CufBU5jM6Oxqhd?=
 =?us-ascii?Q?SZsgsuCx20YTZHICXG3KbZN8J/f6gQCbpUAbaaggsAcMW/m89fddWErmP/lL?=
 =?us-ascii?Q?cWVomspOpNffZYA9aNHwvUejYLjtrP6zsWj28eGVnnvrCl5zlL8Aii7ha2X6?=
 =?us-ascii?Q?Vc3JTK+HvEqWNYEdWvyyLOT8Wzz9Olrxe35qjWRuuiHwMNGSW5D4kSTlX7xF?=
 =?us-ascii?Q?ITAu6HMVRJlWMyd2LGfUawoZgEBylkDJ8iOn9QimshsKLEKHfOrgWhS/abwE?=
 =?us-ascii?Q?8jeTgaWPtZwjWKHLSvwvcrTSlZ01WWRWvpY8YRZb5P5mtg3KCmNB/dwfVnRt?=
 =?us-ascii?Q?GkHetj9A0or5lgPPYIa0s0hOnH7dMl22kb+v5IO0MelLNOzWz4ng43HHzSRo?=
 =?us-ascii?Q?O9PepVqeUNPHxU3OIuJ7ZAHgabwJBwvQQKn7QD1DslIYQknDqCyyq//4C37s?=
 =?us-ascii?Q?mi6WSkszEtcgH/SblY/qPhciFQsnQCeFBlcSkmI6BJjStFcYITXk24L8N8Xn?=
 =?us-ascii?Q?ZA92Wo4j3mwyTyGAStNJ4pzmBz+8thYTwUfw13I/WlNW78HWtI9TO5evmJP1?=
 =?us-ascii?Q?OYLx6mtNnaXK6kSUyZvrSBDThiMydm1STe9Ddw5o+L2w28fsdAGwLfqHIpLd?=
 =?us-ascii?Q?KC7TVG9DPqdyxHQQnog7K+5CPV2+2uA6UhGx55YBMSRulRBT256yueYY50/t?=
 =?us-ascii?Q?sCD2otdX147mr4Q8jcmaSpp4sxjnYJri4NBOQ5q4IQSfQdMREF1o28mWNJ+Z?=
 =?us-ascii?Q?KRvtEbPxZpKUdOFN/kpSnbA1xLfq6N9CeAAaJFemDxl/WLJ8I5tJ3M+Mow47?=
 =?us-ascii?Q?iNGqv+pWYjp8Y88+ZS799MDVyWgxo3uBqHmfT/EONc8GbE/SSL/Hpy7gzwtT?=
 =?us-ascii?Q?URkLESbkBUfwgDnDeK4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28228837-673f-4cd3-5e80-08daf81aac56
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 23:37:47.0369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQfL9AcuFnfCnNu6ULsJK8oIoMzn80kwTjJVR1iojra88Se71n/kQcXcAlqRC5KmZv7iRINP7TJv0Y6WLvStEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7242
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>,
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



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, January 16, 2023 5:13 PM
> 
> On Mon, Jan 16, 2023 at 10:27:08PM +0200, Parav Pandit wrote:
> > virtnet_rq_free_unused_buf() helper function to free the buffer
> > already exists. Avoid code duplication by reusing existing function.
> >
> > Reviewed-by: Alexander Duyck <alexanderduyck@fb.com>
> > Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  drivers/net/virtio_net.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c index
> > 7723b2a49d8e..31d037df514f 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -1251,13 +1251,7 @@ static void receive_buf(struct virtnet_info *vi,
> struct receive_queue *rq,
> >  	if (unlikely(len < vi->hdr_len + ETH_HLEN)) {
> >  		pr_debug("%s: short packet %i\n", dev->name, len);
> >  		dev->stats.rx_length_errors++;
> > -		if (vi->mergeable_rx_bufs) {
> > -			put_page(virt_to_head_page(buf));
> > -		} else if (vi->big_packets) {
> > -			give_pages(rq, buf);
> > -		} else {
> > -			put_page(virt_to_head_page(buf));
> > -		}
> > +		virtnet_rq_free_unused_buf(rq->vq, buf);
> >  		return;
> >  	}
> 
> Sure.
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> while we are at it how about a patch moving virtnet_rq_free_unused_buf and
> virtnet_sq_free_unused_buf so we don't need forward declarations?
> 
Yes. its in my list. Will do after this patch.
I am also going to add the comment for the history about not doing ZLEN around this area.

> E.g. a good place for virtnet_sq_free_unused_buf is likely after ptr_to_xdp
> group of functions.
> 
> For virtnet_rq_free_unused_buf - after give_pages/get_a_page.
> 
> >
> > --
> > 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
