Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D68451660EC
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 16:28:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 927B487DAA;
	Thu, 20 Feb 2020 15:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgM+TAS8gEMG; Thu, 20 Feb 2020 15:28:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B778487DA6;
	Thu, 20 Feb 2020 15:28:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FBDFC013E;
	Thu, 20 Feb 2020 15:28:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84C89C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6FA4785F19
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOPEzy1i_WXs
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:28:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7BA0B842F8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPwhyPt0pnyd+N7bS5nZvbgBD+df4bo2FtEi4WaFayJhz2Fbk5t1R97z1OgMkRfWaYy6qxE/X4bJZr8vLsq7vZJP5jbquyfd45cDCaqeRurRjErFB8VbK5c6BT1cR0CVqzqSrUO5TcoWGsYOsknmNAE1RhjEX2lyAE6qi4+l6zSqX8q/L4pBkH4JJW6XmKmUId41D1QtOHbS5nOWLBZhDSqgZw8hR3SlL7t49tGOxWUcypbtjuC4BinqpJ5ETe16v6Shw/6mwEHpaU3H9zNmA4v/pQYfwZxtaCBAI8nQH/2LuF5yxKuuX6Lf8qX+ggydpf69Oi7vaZbu7HRBo/cCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKEaasxnyRA+P4oASqtn3mrcD23oV3l4Uil1XBkc4oo=;
 b=KEIBOJQwVMTt+t5buWFLar2vQdn6h7FCkvs0ljkIwhY6WrLPCEIJYwGNceeQRXzC6Wptt8AJtCFbfunXjt/sS0lrE4fbZYzoFRjUwl6UowHICScW2gIeo8DhLfJh7Yy9cxhzMx8UoBh/foqgsQqJrlz6pFcm6uBwvYskhVLiaKYVhWCd3xcMyooaf4aZm+Sk0pJS49GBqDi0Vo9BxOzY2HyHUUQi4WqM8B+J2mntuqK+fKZcybaNsGRYn8knP7XpzyIRZZnnzBjQMp+Y0pKTGlCuG9dt1gBbrdY5mM8+/UKK2FGUX0GKTYybQrote1JHzyuTsEi98l7f0MRyULJlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKEaasxnyRA+P4oASqtn3mrcD23oV3l4Uil1XBkc4oo=;
 b=GyaaVhHGU3/4dOefUDSDmXchEiCk2B2QBphJd6SKsLHKieueXQvgvvmmvFlE2rBjp5Po9QsNIP2xhx+2TR1iUjIe5jN8TNptTi18toa+/4a07H+YXqU7yNFDcH72EsYL6khLVyaeWwrUWiITNpeyKLozHc1HThq7WHr0PX/G0xM=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4830.eurprd05.prod.outlook.com (20.177.48.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 20 Feb 2020 15:14:16 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 15:14:16 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR22CA0005.namprd22.prod.outlook.com (2603:10b6:208:238::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Thu, 20 Feb 2020 15:14:16 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j4nWm-0002vi-1V; Thu, 20 Feb 2020 11:14:12 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 3/5] vDPA: introduce vDPA bus
Thread-Topic: [PATCH V4 3/5] vDPA: introduce vDPA bus
Thread-Index: AQHV57TR3IrhEhlGx0uJBD21uKCULKgkMWYA
Date: Thu, 20 Feb 2020 15:14:16 +0000
Message-ID: <20200220151412.GV23930@mellanox.com>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-4-jasowang@redhat.com>
In-Reply-To: <20200220061141.29390-4-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:208:238::10) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8646165e-02d1-4e27-7736-08d7b6178ce3
x-ms-traffictypediagnostic: VI1PR05MB4830:|VI1PR05MB4830:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB4830C66CBA4E37BBD709385BCF130@VI1PR05MB4830.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(199004)(189003)(186003)(33656002)(5660300002)(66446008)(316002)(66556008)(1076003)(2906002)(478600001)(66476007)(64756008)(66946007)(54906003)(7416002)(26005)(8936002)(52116002)(81156014)(71200400001)(4326008)(8676002)(6916009)(2616005)(86362001)(9786002)(81166006)(9746002)(36756003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4830;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3l1TUjvq5JcV1MdHQObPDgQ1nh1CKsV64dJXhavzUo/zyCreN4/0O0t1Y1W4EFcftYRPWnw891N7WDFOKQ8E4tP3h4VJ8OQ6c/QXuYLT5rOCPoN0KtYIFLUzaBVzknMFzYvUr7uM1bb03UprUSbfiId2YtCSM/JZspQDTXCWsF52xtVNmGgDGCqe+UqMDHcJ+OIPE4wbHv75HPOOmYptv8x83Y/jqqtiQHMyhgYA3+p8re3GN42CY5yAB9cFDEdMtS1PmfbXG2Z57UAJeCrWGsHjpLdQ4YlNxR/RPQDgnBD5JdprXIDjQjbpH0jtDwrgQlKA1ZeNOYnyAGBiw/TROR/BOfRJxEBXFkg8nJ4Np+wup6IJHP90nwp39A6ekXkLOKCq4xdZFxia7my0DX6OX6h/23wt36VBMkzSnCD//V4tbHb0yFdg9WcpILjV5V0Uu2q/qrXjYAOdN5CHySdzMhTgic9+R8c8TXQFf6ad71BdvBhb5jU1igYbLISC+o97
x-ms-exchange-antispam-messagedata: CXVXB74RSjBji8E6u0sQW8B+Qak3NefSmthR4lkNy2NEdZ7M9QZwaKBMbHIHxgJEoiHSzJr1EMAu4LgqF9H4UqRZDJNm7JtEwmF9GUYd6kwFIoME0y38J2yVNOnJaJawjBFb1Cq1b1rLzjz+KZSA2w==
Content-ID: <56560667045D7F4389E12517EA86F97B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8646165e-02d1-4e27-7736-08d7b6178ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 15:14:16.3123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S8ohyJ7RuvRc+Qdvsq/R+Oo7KzMe94EScLyA1qYTc32O4xaV+kyZ+ij0QrUalqlsmFoc9CNIHU/gQASjQgmwzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4830
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

On Thu, Feb 20, 2020 at 02:11:39PM +0800, Jason Wang wrote:
> vDPA device is a device that uses a datapath which complies with the
> virtio specifications with vendor specific control path. vDPA devices
> can be both physically located on the hardware or emulated by
> software. vDPA hardware devices are usually implemented through PCIE
> with the following types:
> 
> - PF (Physical Function) - A single Physical Function
> - VF (Virtual Function) - Device that supports single root I/O
>   virtualization (SR-IOV). Its Virtual Function (VF) represents a
>   virtualized instance of the device that can be assigned to different
>   partitions
> - ADI (Assignable Device Interface) and its equivalents - With
>   technologies such as Intel Scalable IOV, a virtual device (VDEV)
>   composed by host OS utilizing one or more ADIs. Or its equivalent
>   like SF (Sub function) from Mellanox.
> 
> From a driver's perspective, depends on how and where the DMA
> translation is done, vDPA devices are split into two types:
> 
> - Platform specific DMA translation - From the driver's perspective,
>   the device can be used on a platform where device access to data in
>   memory is limited and/or translated. An example is a PCIE vDPA whose
>   DMA request was tagged via a bus (e.g PCIE) specific way. DMA
>   translation and protection are done at PCIE bus IOMMU level.
> - Device specific DMA translation - The device implements DMA
>   isolation and protection through its own logic. An example is a vDPA
>   device which uses on-chip IOMMU.
> 
> To hide the differences and complexity of the above types for a vDPA
> device/IOMMU options and in order to present a generic virtio device
> to the upper layer, a device agnostic framework is required.
> 
> This patch introduces a software vDPA bus which abstracts the
> common attributes of vDPA device, vDPA bus driver and the
> communication method (vdpa_config_ops) between the vDPA device
> abstraction and the vDPA bus driver. This allows multiple types of
> drivers to be used for vDPA device like the virtio_vdpa and vhost_vdpa
> driver to operate on the bus and allow vDPA device could be used by
> either kernel virtio driver or userspace vhost drivers as:
> 
>    virtio drivers  vhost drivers
>           |             |
>     [virtio bus]   [vhost uAPI]
>           |             |
>    virtio device   vhost device
>    virtio_vdpa drv vhost_vdpa drv
>              \       /
>             [vDPA bus]
>                  |
>             vDPA device
>             hardware drv
>                  |
>             [hardware bus]
>                  |
>             vDPA hardware

I still don't like this strange complexity, vhost should have been
layered on top of the virtio device instead of adding an extra bus
just for vdpa.

However, I don't see any technical problems with this patch now.

Thanks,
Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
