Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB37143167
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 19:24:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70FD0845D9;
	Mon, 20 Jan 2020 18:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9y5Gc_ymw0ND; Mon, 20 Jan 2020 18:24:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D819847BD;
	Mon, 20 Jan 2020 18:24:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 510E3C0174;
	Mon, 20 Jan 2020 18:24:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9419BC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 18:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D7B18435A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 18:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwFAmXeCvwmH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 18:24:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50070.outbound.protection.outlook.com [40.107.5.70])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2D16683FA2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 18:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y88J61tvUvsYHT+zp0d8awILIoGOslFNjl2LRGrbk1JrQtElU81N3rc/z4v2VHiyz6hmC/cNye4AsxzTP2dKNi3D0ZQru/dxtGlTEP1r6rK78RCGwCH7mCI2dKBjZrgT5HZRAhN6RveI/mlGq5KEsL0jQVEqLsDI2HuH4UqS7pBs5wYh64lChes+YibIYlPkDtClLIzdHntGBoZ/uhqCaX4ItyLKuIGMKqPTcJa1Mk8GUwQv2ZAtor53ln5aqotQHw2dQfukpwhDIAXcuYihWSep7Ke7eEGDeFTZwBjVodK4HFRb+MxdZasDjZ2nVuugHXm7txD2/v2z5y6yDbC8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECTrdlo1fv2Az2UVjPfINeLkgTGxScjZODiR+1ocQhs=;
 b=Zl3SxnyMhzoKCf3zN/QChiVSx7d791ML3geGracbIRM/EbbTkSi7t3TaOCebtQotb3lN9gX04x/pkLlPzXVhJp2mOrmqPOwhQfS+iLz31/S0LDz0ut4SUeIt8CM3OzJOLQ8I9x0t6NZEGHdikey+RIituG3XQrJivPr7xKkpW7JUphWmoWh9/cICUohoY40nkJi+Af6/BEcu0Qoskt+04923wF7eOUhasCqWTLwOtjnr2C1andGVNR1/IHb18qzBb8hiqAyt5PNwQdhb0yf/4cJb6BoWv0n8k/9g88fo9rDwbF/+JXXJpqC4MNBFWcelgpfC8MkmUOArO6QADDxuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECTrdlo1fv2Az2UVjPfINeLkgTGxScjZODiR+1ocQhs=;
 b=lam6MJCSd+leIXdfH/K0k8h2LbVUztlkgDEdk7vPTjd8T3gE9+lxgsOkK5nMoVJhk9v8elPkAuyBMNJ6m07tu3V/A6FTJUuM6Ke2VaEw5vF71G3Qbyj4jRVyGKqY4TmVoEBntJpDJnNF3iLbKtKeiGj3B6Jue0Smibrpomye4VY=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5741.eurprd05.prod.outlook.com (20.178.122.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 17:50:55 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 17:50:55 +0000
Received: from mlx.ziepe.ca (208.176.44.194) by
 SN4PR0501CA0116.namprd05.prod.outlook.com (2603:10b6:803:42::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.16 via Frontend
 Transport; Mon, 20 Jan 2020 17:50:55 +0000
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1itbCM-0001JG-5d; Mon, 20 Jan 2020 13:50:50 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Thread-Topic: [PATCH 3/5] vDPA: introduce vDPA bus
Thread-Index: AQHVzGqUgTlkW8H4N0+zRVK4Lh0XAKftaJqAgADD3wCAALX/gIAEm9kAgABdJwA=
Date: Mon, 20 Jan 2020 17:50:55 +0000
Message-ID: <20200120175050.GC3891@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
 <20200117135435.GU20978@mellanox.com>
 <20200120071406-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200120071406-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0116.namprd05.prod.outlook.com
 (2603:10b6:803:42::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [208.176.44.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc36fa4c-0687-44f2-a263-08d79dd14c59
x-ms-traffictypediagnostic: VI1PR05MB5741:|VI1PR05MB5741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB57413F64EA4F6545AACC3AD5CF320@VI1PR05MB5741.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(199004)(189003)(66946007)(2906002)(6916009)(66446008)(64756008)(33656002)(478600001)(66476007)(66556008)(316002)(2616005)(7416002)(4326008)(81156014)(8676002)(81166006)(26005)(5660300002)(1076003)(71200400001)(8936002)(52116002)(9786002)(9746002)(36756003)(86362001)(186003)(54906003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5741;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0sY72fP6ctyCUyiXZchkrdpHohJf2eebdSMO14QUlKS528P/QUD467ZPIX0eISDyBG9kxWvr4Qk7QUrv9CwtO6rizI5IyEVNrQf8jMW8jHFZNb/P4f3ZXRQRmStytN5hkx3HS0J0LXHP2uWD5r5q4pOrKSRPqJF0R/YEWZKjb90mglH8I2g60vrzYOL3Wpc7LZplOUdNriox+FQ3Pi9DLSEJ6KE6+sAfSsbQgQ7U5iQbCeV55JvWerJudM48hNxiDj1dMGUIr83NkpcbM3L16HMtpOlnLDnjHapbPJ84/7z1LiLUUs1QXjjF+z6njT4izGmPnhOoTCGAR4jqMkAZEaCnsnAZI/7M+gL/RHmrnOUSE1bRVgM6hm66QpwwpSPJCGsUDFiBek27oAi93vpMEVcHZps8WytGIR0ohTYF3PSqsXhfcFivx7rIWUp7A2ifKrTDlHmFO/4fOwxe03+774SBX0r3jhjFeGLCFc/qMaETXDwpFSXi45UkGvunJ6Cj
Content-ID: <94C3646DE8533A4083A9EE4FD962ED2C@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc36fa4c-0687-44f2-a263-08d79dd14c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 17:50:55.3991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruGe0LtPNv5tp2ujgoY7rn6JGws9N72/MxY08xUWBcAD32eJ6btjMSEZDDYuIoktszlK10aisF12vBWUQP2lfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5741
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
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

On Mon, Jan 20, 2020 at 07:17:26AM -0500, Michael S. Tsirkin wrote:
> On Fri, Jan 17, 2020 at 01:54:42PM +0000, Jason Gunthorpe wrote:
> > > 1) "virtio" vs "vhost", I implemented matching method for this in mdev
> > > series, but it looks unnecessary for vDPA device driver to know about this.
> > > Anyway we can use sysfs driver bind/unbind to switch drivers
> > > 2) virtio device id and vendor id. I'm not sure we need this consider the
> > > two drivers so far (virtio/vhost) are all bus drivers.
> > 
> > As we seem to be contemplating some dynamic creation of vdpa devices I
> > think upon creation time it should be specified what mode they should
> > run it and then all driver binding and autoloading should happen
> > automatically. Telling the user to bind/unbind is a very poor
> > experience.
> 
> Maybe but OTOH it's an existing interface. I think we can reasonably
> start with bind/unbind and then add ability to specify
> the mode later. bind/unbind come from core so they will be
> maintained anyway.

Existing where? For vfio? vfio is the only thing I am aware doing
that, and this is not vfio..

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
