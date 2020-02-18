Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0211627BF
	for <lists.virtualization@lfdr.de>; Tue, 18 Feb 2020 15:10:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0930C8613C;
	Tue, 18 Feb 2020 14:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrIXz4FDp3LJ; Tue, 18 Feb 2020 14:10:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B0AA86100;
	Tue, 18 Feb 2020 14:10:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B27FC013E;
	Tue, 18 Feb 2020 14:10:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C792AC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 14:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B392A860A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 14:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMY7orVSu1Wi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 14:10:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 87D558550D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 14:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+pyMp88oZKIN8Hzn7aeUQcNPdIcxmhxwMGc2/fU9DpFqpVGRx6TbTrso8DdJ3vrCOulWSGPTu8Z2R2m/e9ew3nV3D5s3XpcEFQWaJmF0/3tG0EfhCfqh7J6YrRZVNgA4n+rAHtm8gRUM0ldggRgfr76YpHxYfvxyBOlCDAluYsCFYcFTy+Gx4UoXDLHFQvOftzYfCQCQgGt9EqRrc8oGeHQzoI8fTyErbyWE59gvD0HmaKvIlOvsMokwNNg90/vp/OIK7V2K596hhyyjvFuXDuCrDZ6lcuA197MquD0rrzeJ88f9mZqF5oDHSNcIWxk/Nt5hSFHyW9PQi3GoT8MPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maFn4RFzaNi815Hh3PxnLpr3qN/Luvk0149mJSNSCe4=;
 b=Rt5Kwk2Za3Xi/rwixJXp71TtSz65w9/PynpYTlpkgL4+sjdkDDkc7h6ahywwBmFli9WlVsl8buCtQSYZwAUUWGs64TxTGvgT5u724RwbxrvFzlUFDBvQGm758MhKK66Bmh2FUVFX/u9ea9ZMnd0uGbZKxo5YUp58sryB/Ira24ZaJy59lWhPqTEMkWmDZEel0FgDtqxvjV0lCZiN62npgkMqMsQznrkthxI+tZBN3CxX/g/WjDogUi+uvIeJ6J3zUkHSh+vbqizsF/3Q0RitvsGznqJCqWI55U2d5BARbVeikuKCHD66NxaqfNBd2sR3i+vJaaO57mxuoYosQE1kBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maFn4RFzaNi815Hh3PxnLpr3qN/Luvk0149mJSNSCe4=;
 b=GwuqgV7dtf2brUaOHZVWuPXvIt0Nlo+iNVraVMkVf0fXUKV5pM8vkIysE+r9psxIAgayq343AQYW0ta1IxhSEU+92Mzs8H4yEcgrXHP0hoHjEq2PQiapt+qBy89XgAOxj133uDW7WmmUGWnvpploFiiAkBGlKzUkZ5upGTyuaWs=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5918.eurprd05.prod.outlook.com (20.178.126.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 18 Feb 2020 13:56:12 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 13:56:12 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR14CA0006.namprd14.prod.outlook.com (2603:10b6:208:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Tue, 18 Feb 2020 13:56:11 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j43M8-0002h5-9S; Tue, 18 Feb 2020 09:56:08 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Thread-Topic: [PATCH V2 3/5] vDPA: introduce vDPA bus
Thread-Index: AQHV38asJrupyM4st0u+LnLMVE2dj6gWBCEAgAEv6YCAAFKZAIAA9rcAgACprgCAABWWAIAAAfIAgADOIICAAK/EAIAENTiAgAIVHQA=
Date: Tue, 18 Feb 2020 13:56:12 +0000
Message-ID: <20200218135608.GS4271@mellanox.com>
References: <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <8b3e6a9c-8bfd-fb3c-12a8-2d6a3879f1ae@redhat.com>
 <20200214135232.GB4271@mellanox.com>
 <01c86ebb-cf4b-691f-e682-2d6f93ddbcf7@redhat.com>
In-Reply-To: <01c86ebb-cf4b-691f-e682-2d6f93ddbcf7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR14CA0006.namprd14.prod.outlook.com
 (2603:10b6:208:23e::11) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7604cef4-cb39-495b-9819-08d7b47a500c
x-ms-traffictypediagnostic: VI1PR05MB5918:|VI1PR05MB5918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB5918CD3ACFCA91AD10215909CF110@VI1PR05MB5918.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(199004)(189003)(8676002)(33656002)(54906003)(8936002)(6666004)(316002)(4326008)(7416002)(9786002)(81156014)(26005)(1076003)(5660300002)(66446008)(64756008)(2616005)(66946007)(9746002)(66476007)(81166006)(186003)(66556008)(71200400001)(4744005)(36756003)(966005)(52116002)(2906002)(478600001)(86362001)(6916009)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5918;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tsx07X9JHj26sipFLqHPJ5MkFK7bAlhozKrErwU4s+Oc3auwrQh1HhzYqDwW/JdtLsMwRdrx06pcnwVrkGq66Tl05voxaqt8Jd5u1ebxQyS9LFFRnidXXBm62TGKlJgcRyajoMP5eb6euONSGcR2QskdkILdxIglw7X283QDqg6ACdU3JBmeR0YCblnKuFnQeZS0kKU352bc2aC8cJZR2/IAzWGbTnu6k/SwvDHZuWSDbCAGLobyidUGpUpOFkJM72btiaujr6ZdLmXWZtkuOgkEIkYef5eyyDEGOQSQaVQKcPOOnL32ODOh5xrcwAu8WEs2XlkQ+dW+3+wjxWo8Q8rCppWUsK8Qs5yjZaKcBLHJtfTyajladW8dj3aqz5MNHx+ijm4KwcrkReAi6Q3vTahQv1d6dNJf5e+q+WQbQliWrmPv6H6HdT2tevmAZCKQJveiH/o/YzruEoyNEzAIb5GSmc5vYOP535tLj2rJCpFoOZfA7jYVt3n6bJtqI5JtyvOySwcZdk2DL3tA8ODZlyY+0C/vEV9xGcSYQWWX8FCYgDLE4kvhHDmXQLkXQpIKk/H3F3+aNnylk48HwdrgfA==
x-ms-exchange-antispam-messagedata: eQp/Q00Tmt9N+AcvTTj7wNGg/V1ahBinAUAZJxNFFawgROsTwUUrJLUl4NjWAZljJDaJDTv1sOJcsfFv++il9h6x4hqk1oex0Gd2J4aUOH0oNJ97Rm+y5JYhJOkDVqK/Vsz9iuITuWV8evuykL8NJw==
Content-ID: <CFAA87160CBAF244B86C490A3BEFC428@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7604cef4-cb39-495b-9819-08d7b47a500c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 13:56:12.1974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbcQEUBlLgXjLVGAyDtF5h5en7Ncnd/3fCgi0YDztLjJ/o7pVwMrewTsXeL7VgQZRJMBvkFCL8ajrwiGYQKUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5918
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
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

On Mon, Feb 17, 2020 at 02:08:03PM +0800, Jason Wang wrote:

> I thought you were copied in the patch [1], maybe we can move vhost related
> discussion there to avoid confusion.
>
> [1] https://lwn.net/Articles/811210/

Wow, that is .. confusing.

So this is supposed to duplicate the uAPI of vhost-user? But it is
open coded and duplicated because .. vdpa?

> So it's cheaper and simpler to introduce a new bus instead of refactoring a
> well known bus and API where brunches of drivers and devices had been
> implemented for years.

If you reason for this approach is to ease the implementation then you
should talk about it in the cover letters/etc

Maybe it is reasonable to do this because the rework is too great, I
don't know, but to me this whole thing looks rather messy. 

Remember this stuff is all uAPI as it shows up in sysfs, so you can
easilly get stuck with it forever.

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
