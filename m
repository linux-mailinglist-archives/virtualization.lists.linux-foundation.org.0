Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9253CD679
	for <lists.virtualization@lfdr.de>; Mon, 19 Jul 2021 16:20:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF2E460744;
	Mon, 19 Jul 2021 14:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6CSzAGfls-dD; Mon, 19 Jul 2021 14:20:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A08D460752;
	Mon, 19 Jul 2021 14:20:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BD2DC000E;
	Mon, 19 Jul 2021 14:20:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C9E0C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 14:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D47D40135
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 14:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZELjxo5Txcg
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 14:20:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 983C84012D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 14:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0zZ0+66fbWEArNX4em2YWJrcgLw0QKypRse9Jw3dAy8Y7KIqF5V+O+UUhpa/0QPQNsdkb7fv3BbPPV0jOv7n7I6piZ3ZOnTc3bYBuDkXJsSGZvmrdM1ulRbpM8ZOR8IJkqC3UMtD+ruNHUXCqwCUDdV9b6HYUaNCfCFOHSz1uLAd64YiTfJ0HsBEwQMZ0vXM91nHM6ZdzhOGyR3qa2qXivbFoYMPWpv4cm/SSScqd4Mj1SYT0uFrSa1PkIKQrMhYvFnXTMzWz6ezRBGx+H2OYLJ9FoLOp1NWxc3FlOl6KqVMyxOF89D4QbLLmxLfGPJqAdRbywcXL67b8POzdvdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU5WEDed8/gDkskz/Nm6UZsG2S/YASH42xI0jphhUXY=;
 b=n0QyB/LL1mFDlD+rMStQceWfU8LPa/C+Zc9gr7qDUf5X3ZRDv/lam1LmlHDZQM7kFGI8Cu4DRoWHmw0y7qu6can+g+JerZJ0eQ9URfa4Yzpjfqoe5YFXVnPwZSCKEaO+FuOJfiDlJC8jmTGobEZN8afw2RsKFaHdjqzT65xcIgoRBw5ni3uD054baDLRGo6Xr187RVT1qvPGMUdJKeE8q2W2r5u3Rof+ah+ThTDS5dteRce2JfwIw1Nj+kjp8IkEscMv0tumAkkkDlJMlFORyY/R2e0PQ/IFaHRYhPic7F692n4rs0wQgFnBxHtf1weHJ51lNC0LBjdizP8Fg/eZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU5WEDed8/gDkskz/Nm6UZsG2S/YASH42xI0jphhUXY=;
 b=Y/0wAMo/uV6BJg1cOLM9Mln6kuazVh55/lZC4kAkDXUO7mYnvbwfyooDMscoxY2TRKgRRL7m7v6z/ARc/sTLRd2AmhQ1Xz5AS3DxN8EJAu3Z4S50ZR+B6OjsTGW/JTYM536G1iisYsrxCS6iu0t41T3f9NKMXdfN3R5B3JrPjmHYsCDP+cUpDmgHIsU8KOPxr8mANgTe4dKIuyM2zaLcqQZYCXRwYpoPDw34gwPcuraSLoYOFjnbPimLoMmi44NBOF+2ZLS8K5BfFDn++tpScfPgZ3Typx+Le4YmK7z3IFjjy1Ho6uaRCdEviCtf8jVWA8/1GfHMYKrdKGDlAizFqQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH0PR12MB5465.namprd12.prod.outlook.com (2603:10b6:510:ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Mon, 19 Jul
 2021 14:20:29 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::ace1:9322:ab32:7293]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::ace1:9322:ab32:7293%3]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 14:20:29 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH 1/4] virtio: Improve vq->broken access to avoid any
 compiler optimization
Thread-Topic: [PATCH 1/4] virtio: Improve vq->broken access to avoid any
 compiler optimization
Thread-Index: AQHXet9oIEipiPbuTECOdqhlwyb4batHobWAgAIi27CAAHJAAIAAJJyw
Date: Mon, 19 Jul 2021 14:20:29 +0000
Message-ID: <PH0PR12MB5481E200CD85DDAA621FC476DCE19@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20210717074258.1463313-1-parav@nvidia.com>
 <20210717074258.1463313-2-parav@nvidia.com>
 <20210717163319-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EBA531451478010F926DDCE19@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20210719080316-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210719080316-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13a936b6-1c0e-4926-5b9f-08d94ac05c80
x-ms-traffictypediagnostic: PH0PR12MB5465:
x-microsoft-antispam-prvs: <PH0PR12MB5465EE42ED530F7D91920959DCE19@PH0PR12MB5465.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8MHC0vQMv+9uDRudOGYvez8Uoenbv8p76rYL91pJRFrcNxhDB9abM3dAdJ37S+boTZ9xmYeIODwqDbjQHNN16zwRgRwz//q0Tz+5FbeXyhv+gM/odz01zxUEB+WPjm6FcBFz0aY/3HybtPR46VIvyMH//E8kWUgalgMYiNSaP0BIkoP4dvkplGs2EeJX/y0H4c4b1rDv2qJ17DlaJ+JpZVEuQTjTmtzzUwTN0pp/FXKwlkzZzq8qezBK858evJLjs3TpCSoiPa8nA8aHx2+hSQWpxk1lqpVpz1wr8BRYe6ep8QtddXcUrR94aEQLyfrfYirX0qtMqVoxn9k49+2Zn1cFHGMi9E4DZircisKBIDMnbExU6FE81N3hG5CHV6cINF7IsTc3iq+Q34DNIYS9TlXb4mcAi5WyplZ6n28RwDZFCQl3pyP97q00Sg3nJSPZkKPBQhr8T7zilWRUyJRo1b5KOC+29eLNyRKnLJNYRtNO2M7H1NdWHExxCCTjcz+udrn0fp+/0aTu45dbh1x4sCFaUIr4fAie6PLLT0BZwWUdm2No4Q74ho4iluSw1QoIvXcSaa2sh6/MtJkPCvUkxWHVSDkQn6YsJKkHS07ujcPlAt7KCW6tINYIK5mQrZOEORKhTJFeYyUf7PIKWjoVYDMBLCBzqHluK/+3jTHZ5wUSAF4bQ710muj3Cvv4t1Wr10N08WOKOxv+fqrqGRyQfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(4326008)(76116006)(5660300002)(52536014)(8676002)(66946007)(66556008)(8936002)(66476007)(66446008)(64756008)(26005)(55236004)(2906002)(86362001)(9686003)(122000001)(71200400001)(55016002)(7696005)(478600001)(316002)(6916009)(38100700002)(33656002)(6506007)(83380400001)(186003)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0uObFFL2iagfEQsrlEhqT+/LaSC1XYS+W0FvdAWhmXBKLELOsIXjj8RhsLQU?=
 =?us-ascii?Q?Av3xOvxfqtSZtpUdx7NWATqmRynQ6ITpcdPSNG+Ru+WrUwRGg5Ulw3Gxo4bF?=
 =?us-ascii?Q?Vylr+iwpupCwzutqZTpOoVTzukN9aLBngudTuSFOsxVUqP2oBbU83I4MheAa?=
 =?us-ascii?Q?aseHN3RWFUPACt2sruQVa7BnSJt92Tpxumd9i84rhcME9aKfj7CyPAUkX/J3?=
 =?us-ascii?Q?8kvr4geeo3ZBcgLk450yupx+SPOnEpcZvcNLAS1T9c7NUtx649NJXRALuPui?=
 =?us-ascii?Q?AqyKFsqMYGScfQwYspcWZINTGo/LcoWGDXHRDP9O2oowor7wAxf+eGRSDnzq?=
 =?us-ascii?Q?5Ti+M/9CpS/3bBi21VILUVFZTxfBHMlAJaHiMtu249tE6OCfUQj5naLdeQFo?=
 =?us-ascii?Q?EgnOvVKaRsFcIC1kYzAohUfgqXlR3A9ro6kxWFs58SAt/ndXSQAbu0v6Ga0e?=
 =?us-ascii?Q?fcBBYMNsCik1CjRG+Ol8Yyn2Lzyd6Pz6hCjX25GD613EwMwzfq2BBtrMoDvG?=
 =?us-ascii?Q?2kSNMaF4Re6aTvvSy5hPbmZGnvrXAyPlOF8vXUjfm1xPME7kHCiMh7EgTnyw?=
 =?us-ascii?Q?bE7BD9vdQ7FeV6uX6gm9IsObLMza0wZNjsa9j/nKeLjwYk0+bUZyyv+ZyDcs?=
 =?us-ascii?Q?9UF13qSXaX0PzSsdENTzUeXaD0Jic/w7QnUu0B+EqhUpFve2nVa6uFuexjxB?=
 =?us-ascii?Q?KzyoyY5e0PmyPdx31K0/+VIatWvArmxLCgLcoFSe4uDNmN1oRUOzN8Lflqgx?=
 =?us-ascii?Q?eHT6h0OyuSfTK1E7ae0Hf1cCFtNo8JRjneQsgotDtlKvgICgT4kf0SHfYtCD?=
 =?us-ascii?Q?uKFmPgbGLUIZ5ZcMLRPezfE8cRcHlcwHLp0F4CKVEC4zykiNLKraDBtOkZIN?=
 =?us-ascii?Q?/sChw3Molc2Ly/Uovk0Knb192tfLWRQF/XsmCXzA8xKCUQY50bj2jzK8hHQA?=
 =?us-ascii?Q?92yvjykgxtQE2Eb17AMDq7raFYLZ9PI4niriWwxuHGCjT5Uce/xlPeUszOo4?=
 =?us-ascii?Q?4e/WdIgtctNvnw1euLYjNHfS4QIx5cYwwf4aj5ZemIdy24GP/3K32Ls8vrJn?=
 =?us-ascii?Q?FhVSvP9UjmYkVv9Bj7MZITM9fyrXLWQ0gtzU74iZJSge2BeORqlqwfS8nnDI?=
 =?us-ascii?Q?rFUsHSshYtRijNoN3GjRQu/csTOmPlEWJoJAFTxocKXNHEkMR9s+EjdndK34?=
 =?us-ascii?Q?jGnLDkfb3uNGmbercDR17azNUDue9Qy858v8rteSGE3sNT3L8NCCog68ZDvZ?=
 =?us-ascii?Q?WnQUVUK6MHRxS/FhuXN4CYC8i6I9o0DTv3y7JKQHqTwjl4aU0gJUkj6OIhZH?=
 =?us-ascii?Q?lmbT+DQkva5UfOHZhBHorlly?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a936b6-1c0e-4926-5b9f-08d94ac05c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 14:20:29.4851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/QZptzj9LlmI2oB8cVY6KA9obgSdme3yAgBkxEyly7O2mE+n8vCUaEzMnShVPB00z2H4kou9RBsHsRAS9G/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5465
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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
> Sent: Monday, July 19, 2021 5:35 PM
> 
> On Mon, Jul 19, 2021 at 05:26:22AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Sunday, July 18, 2021 2:09 AM
> > >
> > > On Sat, Jul 17, 2021 at 10:42:55AM +0300, Parav Pandit wrote:
> > > > Currently vq->broken field is read by virtqueue_is_broken() in
> > > > busy loop in one context by virtnet_send_command().
> > > >
> > > > vq->broken is set to true in other process context by
> > > > virtio_break_device(). Reader and writer are accessing it without
> > > > any synchronization. This may lead to a compiler optimization
> > > > which may result to optimize reading vq->broken only once.
> > > >
> > > > Hence, force reading vq->broken on each invocation of
> > > > virtqueue_is_broken() and ensure that its update is visible.
> > > >
> > > > Fixes: e2dcdfe95c0b ("virtio: virtio_break_device() to mark all
> > > > virtqueues broken.")
> > >
> > > This is all theoretical right?
> > > virtqueue_get_buf is not inlined so compiler generally assumes any
> > > vq field can change.
> > Broken bit checking cannot rely on some other kernel API for correctness.
> > So it possibly not hitting this case now, but we shouldn't depend other APIs
> usage to ensure correctness.
> >
> > >
> > > I'm inclined to not include a Fixes
> > > tag then. And please do change subject to say "theoretical"
> > > to make that clear to people.
> > >
> > I do not have any strong opinion on fixes tag. But virtio_broken_queue()
> API should be self-contained; for that I am not sure if this just theoretical.
> > Do you mean theoretical, because we haven't hit this bug?
> 
> Because with existing code I don't believe existing compilers are clever
> enough to optimize this away.
Ok. got it. I will mention in the commit log.

> 
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  drivers/virtio/virtio_ring.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/virtio/virtio_ring.c
> > > > b/drivers/virtio/virtio_ring.c index 89bfe46a8a7f..7f379fe7d78d
> > > > 100644
> > > > --- a/drivers/virtio/virtio_ring.c
> > > > +++ b/drivers/virtio/virtio_ring.c
> > > > @@ -2373,7 +2373,7 @@ bool virtqueue_is_broken(struct virtqueue
> > > > *_vq) {
> > > >  	struct vring_virtqueue *vq = to_vvq(_vq);
> > > >
> > > > -	return vq->broken;
> > > > +	return READ_ONCE(vq->broken);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(virtqueue_is_broken);
> > > >
> > > > @@ -2387,7 +2387,9 @@ void virtio_break_device(struct
> > > > virtio_device
> > > > *dev)
> > > >
> > > >  	list_for_each_entry(_vq, &dev->vqs, list) {
> > > >  		struct vring_virtqueue *vq = to_vvq(_vq);
> > > > -		vq->broken = true;
> > > > +
> > > > +		/* Pairs with READ_ONCE() in virtqueue_is_broken(). */
> > > > +		smp_store_release(&vq->broken, true);
> > >
> > > A bit puzzled here. Why do we need release semantics here?
> > > IUC store_release does not generally pair with READ_ONCE - does it?
> > >
> > It does; paired at few places, such as,
> >
> > (a) in uverbs_main.c, default_async_file
> > (b) in netlink.c, cb_table
> > (c) fs/dcache.c i_dir_seq,
> >
> > However, in this scenario, WRITE_ONCE() is enough. So I will simplify and
> use that in v1.
> >
> >
> > > The commit log does not describe this either.
> > In commit log I mentioned that "ensure that update is visible".
> > I think a better commit log is, to say: "ensure that broken bit is written".
> 
> "is read repeatedly" maybe.

I updated it to below in v2.

" Hence, force reading vq->broken on each invocation of
virtqueue_is_broken() and also force writing it so that such update is visible to the readers."


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
