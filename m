Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DB1660E7
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 16:27:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 55AA120355;
	Thu, 20 Feb 2020 15:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-kttXhXxCkP; Thu, 20 Feb 2020 15:27:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4C1A52036E;
	Thu, 20 Feb 2020 15:27:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E4F1C013E;
	Thu, 20 Feb 2020 15:27:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69454C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 51652872F8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FXNtrm9bz3HW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:27:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80058.outbound.protection.outlook.com [40.107.8.58])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4CC88872E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 15:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1AS9DIBnc6Z+86E8NjJlkCHPVZmJegGmRTwaKZNnXjtrng9lDNmdGntGoM8Jf3ploNXYtA7YqUkJKY1e4q2P+zHQEwsVQ71TGF8XfjTqA10m+mug+arUV7ftCYjjg+6PLBLBrTPzE/Czyaimr1Qj90k/H30NJBRJRsgC/Hg34A+MmfwK47IV7zRtKynyIk2hoQcv/+NPUrYp2ib2YPbuSrXdU6xh9pM9OSeSbcEmHPvJiOrmkDRHo0BeJbJ1YZ92m+tPXSbhIPGLH/p0WEbrrcT1mxO8iVWiGt4DyxClPWlXK9Pqsugy5LaAPfmc8R8tA2D8PxTkcXaNhR3IksJ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZH9ftVJglR/snWZrUTd41dkvh56vFT33EBMV4zawWk=;
 b=jI5qjqxVqCBf9meDTrd2YWqMqDZGmuIdlYCraPzFDPzTx2IdyIQ+1b23Md65Ph/VudH0Qor0sIoTBSLnfKAsbeCxVB1+XZ2Z8djRffdqk0nmfoqUwcqt/aTRoJ7pYyi/WqVPyPza4D90ooe50shNAL1GVafMcsiUo9/W8Z8ZiqKpr5Ri5ivI2V75tQxjadHCR6I4vZZMZrw/HNJB2ABcAmUrpXElMWpvOcK01RCBR17cO1N9+6qbEWkcMiKkb1nJ27BfIbfs7mBm1yMcKbCUzYTi6Zk+YvnWykpwiyffGKcX8wleVYnjKXzNQZC/S3IFIQFNtXjNy/6iNyMH6TloZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZH9ftVJglR/snWZrUTd41dkvh56vFT33EBMV4zawWk=;
 b=JycOTVBiTn4tQ+HfTPw3R6RxJSH5XM2F/pIlyTrijXfvHzPzUIfnix1QXcflIp1m+PfPmxPSJtkaDkPGfYLFJvJOuLoSC/6gzS6CwSqzZdk7eA56lE+HfITdI79ueb8Rp6ss+jKZuVb6WPmeCg3rxNh0uOIdufJlKQRhhSIGPb8=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4830.eurprd05.prod.outlook.com (20.177.48.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 20 Feb 2020 15:12:18 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 15:12:18 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR17CA0003.namprd17.prod.outlook.com (2603:10b6:208:15e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Thu, 20 Feb 2020 15:12:17 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j4nUt-0002sj-4e; Thu, 20 Feb 2020 11:12:15 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 5/5] vdpasim: vDPA device simulator
Thread-Topic: [PATCH V4 5/5] vdpasim: vDPA device simulator
Thread-Index: AQHV57Tl/t7aCF25gE6qK0wpcX6V56gkMNqA
Date: Thu, 20 Feb 2020 15:12:18 +0000
Message-ID: <20200220151215.GU23930@mellanox.com>
References: <20200220061141.29390-1-jasowang@redhat.com>
 <20200220061141.29390-6-jasowang@redhat.com>
In-Reply-To: <20200220061141.29390-6-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:208:15e::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19be9418-cf9a-4595-655d-08d7b617467c
x-ms-traffictypediagnostic: VI1PR05MB4830:|VI1PR05MB4830:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB48301A8E29CA9CA55333B25ECF130@VI1PR05MB4830.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(189003)(199004)(2616005)(6916009)(86362001)(52116002)(81156014)(71200400001)(8936002)(8676002)(4326008)(9746002)(81166006)(36756003)(9786002)(1076003)(478600001)(2906002)(5660300002)(186003)(33656002)(66446008)(66556008)(316002)(26005)(7416002)(66946007)(66476007)(64756008)(54906003)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4830;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bCH8r5H6eoHo4wgDLqb5d0Sjeyqs03os+uRy2mobj91Co1bE2AcipEUy8NR/pAYyxfIoOSialteMtxvTgLlbyJZDXA0yC02SCag1vpezeX9WrSpO1aX2JQ+dJB3Ngla4JmRihqs+880JOF0Jm4G0m5X1O0JUyWpXS6KCEUmsyKs87QrGrUNWhkATDzvXoS1t510IFYoCFdVBhe8/RD7gDYpYoXMRgwvRbCMJFOf40aVZuSqmdiVhvg3hUJnMcC8T5KeArIWKSr7q5FG2EviDIkTY7IQgXktH15ZqfR6Flkie/mMLE0vbbVIyzStI05aNkWRElWroFZwlHWR+f9FytMNwGfEB1964Vl+rJ7yfrUJmnEGwnLmfeSf7M8g9+UrZOOrbJR8CpWYqgc9BRd+2Ij/u6P3NeaeWwGoB9pOrsx+a8mCq18tEp4SP2Bo1LCJfMxkvrdRA1S+JRUvr2ffgpVA7GKbZsIYDTPUqPO4XhULbmT7F7w+lQ2z7BovguSGv
x-ms-exchange-antispam-messagedata: brKauSbNI0jj74DfPsEh3D2SMrswkbsa33ZOkMXPRkENK2rqKndQim/p32fEw7OUsh9k+flh3hQJWtn3SIO2bqC54AaW21+kB4cua0bMGr9N0UHZS+GOcwUj29tf74bpQMbv8PQ9msQVVLQwvU5omA==
Content-ID: <27D03B0CCFB76D4196FC8C2FF59A0D07@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19be9418-cf9a-4595-655d-08d7b617467c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 15:12:18.2433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/uYslA456LI7zqcojZRMolOqxSlEfek5Xtspy/Wef0GJEw5J+Y5Ocib4REsTxKqegdxgqjOalOMUZhcP4LMaQ==
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

On Thu, Feb 20, 2020 at 02:11:41PM +0800, Jason Wang wrote:
> +static void vdpasim_device_release(struct device *dev)
> +{
> +	struct vdpasim *vdpasim = dev_to_sim(dev);
> +
> +	cancel_work_sync(&vdpasim->work);
> +	kfree(vdpasim->buffer);
> +	vhost_iotlb_free(vdpasim->iommu);
> +	kfree(vdpasim);
> +}
> +
> +static struct vdpasim *vdpasim_create(void)
> +{
> +	struct virtio_net_config *config;
> +	struct vhost_iotlb *iommu;
> +	struct vdpasim *vdpasim;
> +	struct device *dev;
> +	void *buffer;
> +	int ret = -ENOMEM;
> +
> +	iommu = vhost_iotlb_alloc(2048, 0);
> +	if (!iommu)
> +		goto err;
> +
> +	buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +	if (!buffer)
> +		goto err_buffer;
> +
> +	vdpasim = kzalloc(sizeof(*vdpasim), GFP_KERNEL);
> +	if (!vdpasim)
> +		goto err_alloc;
> +
> +	vdpasim->buffer = buffer;
> +	vdpasim->iommu = iommu;
> +
> +	config = &vdpasim->config;
> +	config->mtu = 1500;
> +	config->status = VIRTIO_NET_S_LINK_UP;
> +	eth_random_addr(config->mac);
> +
> +	INIT_WORK(&vdpasim->work, vdpasim_work);
> +	spin_lock_init(&vdpasim->lock);
> +
> +	vringh_set_iotlb(&vdpasim->vqs[0].vring, vdpasim->iommu);
> +	vringh_set_iotlb(&vdpasim->vqs[1].vring, vdpasim->iommu);
> +
> +	dev = &vdpasim->dev;
> +	dev->release = vdpasim_device_release;
> +	dev->coherent_dma_mask = DMA_BIT_MASK(64);
> +	set_dma_ops(dev, &vdpasim_dma_ops);
> +	dev_set_name(dev, "%s", VDPASIM_NAME);
> +
> +	ret = device_register(&vdpasim->dev);
> +	if (ret)
> +		goto err_init;

It is a bit weird to be creating this dummy parent, couldn't this be
done by just passing a NULL parent to vdpa_alloc_device, doing
set_dma_ops() on the vdpasim->vdpa->dev and setting dma_device to
vdpasim->vdpa->dev ?

> +	vdpasim->vdpa = vdpa_alloc_device(dev, dev, &vdpasim_net_config_ops);
> +	if (ret)
> +		goto err_vdpa;

> +	ret = vdpa_register_device(vdpasim->vdpa);
> +	if (ret)
> +		goto err_register;
> +
> +	return vdpasim;
> +
> +err_register:
> +	put_device(&vdpasim->vdpa->dev);
> +err_vdpa:
> +	device_del(&vdpasim->dev);
> +	goto err;
> +err_init:
> +	put_device(&vdpasim->dev);
> +	goto err;

If you do the vdmasim alloc first, and immediately do
device_initialize() then all the failure paths can do put_device
instead of having this ugly goto unwind split. Just check for
vdpasim->iommu == NULL during release.

> +static int __init vdpasim_dev_init(void)
> +{
> +	vdpasim_dev = vdpasim_create();
> +
> +	if (!IS_ERR(vdpasim_dev))
> +		return 0;
> +
> +	return PTR_ERR(vdpasim_dev);
> +}
> +
> +static int vdpasim_device_remove_cb(struct device *dev, void *data)
> +{
> +	struct vdpa_device *vdpa = dev_to_vdpa(dev);
> +
> +	vdpa_unregister_device(vdpa);
> +
> +	return 0;
> +}
> +
> +static void __exit vdpasim_dev_exit(void)
> +{
> +	device_for_each_child(&vdpasim_dev->dev, NULL,
> +			      vdpasim_device_remove_cb);

Why the loop? There is only one device, and it is in the global
varaible vdmasim_dev ?

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
