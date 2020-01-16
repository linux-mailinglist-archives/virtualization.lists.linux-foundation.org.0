Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B8F13DF1F
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 16:47:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A68FF86A7C;
	Thu, 16 Jan 2020 15:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLq3xgnmQJ-J; Thu, 16 Jan 2020 15:47:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F32686AC7;
	Thu, 16 Jan 2020 15:47:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54949C077D;
	Thu, 16 Jan 2020 15:47:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14CC2C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 01EA5203AF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 15:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UVWucgiNNrw
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 15:47:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80042.outbound.protection.outlook.com [40.107.8.42])
 by silver.osuosl.org (Postfix) with ESMTPS id A5337203BD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 15:47:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJ7H+M6jMHgN7HMw8x3aDHKaKeetyzEwYeyvHrdeFHDQTQBpHz4PmUkd3tN0zPkaP6GYDmSP/RYuyC8+goggZtge6L9Anzwp6L3KeOJzvHNQz0N/7TWLkHKDFC4AjvmIXVOhL1Drys+zVP7lLlIQpzJoz+/q41RXlwhjcBAbxPunFJCGhj22tdxFjLNRg6Va/v4s1ET0QsicQYprzkeFEgUp2QPVUSJhFMXUzcjynz6GQLmjkWjnOiODvZdY9ZyZf0ur/teCqw8q0a/9BBkGV+f0r2y/ngGS1Ew6mQKwtXuu1/4m+We+7JDmxchm0W16vJQpMY1KNaMFDvYQ2Md89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFLN02G/8QOA4bKdrk5WP0X5vmdssJzpZTT2IG0k9dM=;
 b=nxXDJFOhBHTQMW3YTY7SlEpt8ktHCE/ESw9unXrztQlb0I3+luP0b/2BrCf2HKQEw79HAqDxiZK1QS6fM1pocbhICHJv7a1Y+O2jhlPN/64FJu/ben5fqPb9rhFcb/lFxsJNiqodAwRQdgPuA4AMUBF947If0PGZs7im8E4MQPACfbRZ2F4v35yzIo9sgMl8fcUCf6YBb1pfnSZ3Nv8p+96wfFLBjcM3KLN0KGV2D2XLoxLW70MDraTYHBRLdpBsVExoMw8Xau8aWZ4EVC2PaGLjt/O54YcGRaVGOoNE/+xqEjS/aA+bfTP7FQ3Sc0tJuCfqXAkFpTod2FhAPFu2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFLN02G/8QOA4bKdrk5WP0X5vmdssJzpZTT2IG0k9dM=;
 b=PqiPiT6qwDrCtI9l3BKfq0+PGKeuryPB+J0cfMkl7yrljZRrLbk5/akf+yfPzX2iODGh7H6MRZxYUaryhElj+9PFCh1zX91QOPnqT3KV4ACmZ/ecNG5y9K1dWb29BFgEwA2bNv1NXHTZr1OdUHReXkJTb5crH3en4Mmd69mIjmY=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB3408.eurprd05.prod.outlook.com (10.170.239.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 16 Jan 2020 15:47:02 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 15:47:02 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR05CA0044.namprd05.prod.outlook.com (2603:10b6:208:236::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.14 via Frontend
 Transport; Thu, 16 Jan 2020 15:47:01 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1is7MI-00064B-7W; Thu, 16 Jan 2020 11:46:58 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
Thread-Topic: [PATCH 5/5] vdpasim: vDPA device simulator
Thread-Index: AQHVzGqlRPHVvNcseEuo1k66+tVAdqftb4kA
Date: Thu, 16 Jan 2020 15:47:01 +0000
Message-ID: <20200116154658.GJ20978@mellanox.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-6-jasowang@redhat.com>
In-Reply-To: <20200116124231.20253-6-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:236::13) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: be6c7c42-ba66-4cfb-61a6-08d79a9b5401
x-ms-traffictypediagnostic: VI1PR05MB3408:|VI1PR05MB3408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB3408E455B567BAB2EC064A9ACF360@VI1PR05MB3408.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(189003)(199004)(9746002)(9786002)(26005)(478600001)(186003)(8936002)(6666004)(316002)(54906003)(1076003)(2906002)(33656002)(7416002)(4326008)(6916009)(8676002)(86362001)(71200400001)(36756003)(52116002)(2616005)(66556008)(64756008)(66446008)(81166006)(66476007)(5660300002)(66946007)(81156014)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3408;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0zLaRR1spDm8LThUgz4JbVSkwCx9yW68+R6nRGPImfp6jV02OAKkGfrCvfaHdADgSd/5x12/pQM2i7XzMDZ+aaLLlj4ehqiXfgZGNrltpCsOq8gOVv+uANe64IQLYeAdq9+5qjlzDhMheE814QmD3NtfgMCYTSlCJeSEyD15DU15QPcwGTmRx5Jy0F+OtEOC2s16pRMSb/TfCpZbrv+gCFP+HLcmsmi6kGOLmXG81iVZttdNtcQ/VwTji0rpeP8yDayVZBFV58gBHoA8FclT12ufnCUB4GgQbZy06psv2JAH2qrLXE62WcZ1q241hmEH2Ty2DeyPn8feXQozYcC42iRu6yb/htv63eEOAECNEy4UB5qHXDtFho+mJ6lbW8v2W32pPhjj784lbCV5i2ry8YhcKAc3MD2z+spLPDT+O7BnTn3XCTgIHICaF5H5NicWKspV2K2kE9MWKnfq0X//kWoZBGVMHnJMzBQx6Wne9oURZbGrqwHGci8XRnqgbX0
Content-ID: <2168E1773A68F84989C86DC2620C0247@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6c7c42-ba66-4cfb-61a6-08d79a9b5401
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 15:47:01.8678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8eWo2s7xcND71TcjalQWoar6IsTWNWG+8x6Wv+LFQA+Be65x5E8ah+BZ46ksCkEAoX+a5l4Y242/myE3SIn+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3408
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>,
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

On Thu, Jan 16, 2020 at 08:42:31PM +0800, Jason Wang wrote:
> This patch implements a software vDPA networking device. The datapath
> is implemented through vringh and workqueue. The device has an on-chip
> IOMMU which translates IOVA to PA. For kernel virtio drivers, vDPA
> simulator driver provides dma_ops. For vhost driers, set_map() methods
> of vdpa_config_ops is implemented to accept mappings from vhost.
> 
> A sysfs based management interface is implemented, devices are
> created and removed through:
> 
> /sys/devices/virtual/vdpa_simulator/netdev/{create|remove}

This is very gross, creating a class just to get a create/remove and
then not using the class for anything else? Yuk.

> Netlink based lifecycle management could be implemented for vDPA
> simulator as well.

This is just begging for a netlink based approach.

Certainly netlink driven removal should be an agreeable standard for
all devices, I think.

> +struct vdpasim_virtqueue {
> +	struct vringh vring;
> +	struct vringh_kiov iov;
> +	unsigned short head;
> +	bool ready;
> +	u64 desc_addr;
> +	u64 device_addr;
> +	u64 driver_addr;
> +	u32 num;
> +	void *private;
> +	irqreturn_t (*cb)(void *data);
> +};
> +
> +#define VDPASIM_QUEUE_ALIGN PAGE_SIZE
> +#define VDPASIM_QUEUE_MAX 256
> +#define VDPASIM_DEVICE_ID 0x1
> +#define VDPASIM_VENDOR_ID 0
> +#define VDPASIM_VQ_NUM 0x2
> +#define VDPASIM_CLASS_NAME "vdpa_simulator"
> +#define VDPASIM_NAME "netdev"
> +
> +u64 vdpasim_features = (1ULL << VIRTIO_F_ANY_LAYOUT) |
> +		       (1ULL << VIRTIO_F_VERSION_1)  |
> +		       (1ULL << VIRTIO_F_IOMMU_PLATFORM);

Is not using static here intentional?

> +static void vdpasim_release_dev(struct device *_d)
> +{
> +	struct vdpa_device *vdpa = dev_to_vdpa(_d);
> +	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
> +
> +	sysfs_remove_link(vdpasim_dev->devices_kobj, vdpasim->name);
> +
> +	mutex_lock(&vsim_list_lock);
> +	list_del(&vdpasim->next);
> +	mutex_unlock(&vsim_list_lock);
> +
> +	kfree(vdpasim->buffer);
> +	kfree(vdpasim);
> +}

It is again a bit weird to see a realease function in a driver. This
stuff is usually in the remove remove function.

> +static int vdpasim_create(const guid_t *uuid)
> +{
> +	struct vdpasim *vdpasim, *tmp;
> +	struct virtio_net_config *config;
> +	struct vdpa_device *vdpa;
> +	struct device *dev;
> +	int ret = -ENOMEM;
> +
> +	mutex_lock(&vsim_list_lock);
> +	list_for_each_entry(tmp, &vsim_devices_list, next) {
> +		if (guid_equal(&tmp->uuid, uuid)) {
> +			mutex_unlock(&vsim_list_lock);
> +			return -EEXIST;
> +		}
> +	}
> +
> +	vdpasim = kzalloc(sizeof(*vdpasim), GFP_KERNEL);
> +	if (!vdpasim)
> +		goto err_vdpa_alloc;
> +
> +	vdpasim->buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +	if (!vdpasim->buffer)
> +		goto err_buffer_alloc;
> +
> +	vdpasim->iommu = vhost_iotlb_alloc(2048, 0);
> +	if (!vdpasim->iommu)
> +		goto err_iotlb;
> +
> +	config = &vdpasim->config;
> +	config->mtu = 1500;
> +	config->status = VIRTIO_NET_S_LINK_UP;
> +	eth_random_addr(config->mac);
> +
> +	INIT_WORK(&vdpasim->work, vdpasim_work);
> +	spin_lock_init(&vdpasim->lock);
> +
> +	guid_copy(&vdpasim->uuid, uuid);
> +
> +	list_add(&vdpasim->next, &vsim_devices_list);
> +	vdpa = &vdpasim->vdpa;
> +
> +	mutex_unlock(&vsim_list_lock);
> +
> +	vdpa = &vdpasim->vdpa;
> +	vdpa->config = &vdpasim_net_config_ops;
> +	vdpa_set_parent(vdpa, &vdpasim_dev->dev);
> +	vdpa->dev.release = vdpasim_release_dev;
> +
> +	vringh_set_iotlb(&vdpasim->vqs[0].vring, vdpasim->iommu);
> +	vringh_set_iotlb(&vdpasim->vqs[1].vring, vdpasim->iommu);
> +
> +	dev = &vdpa->dev;
> +	dev->coherent_dma_mask = DMA_BIT_MASK(64);
> +	set_dma_ops(dev, &vdpasim_dma_ops);
> +
> +	ret = register_vdpa_device(vdpa);
> +	if (ret)
> +		goto err_register;
> +
> +	sprintf(vdpasim->name, "%pU", uuid);
>+
> +	ret = sysfs_create_link(vdpasim_dev->devices_kobj, &vdpa->dev.kobj,
> +				vdpasim->name);
> +	if (ret)
> +		goto err_link;

The goto err_link does the wrong unwind, once register is completed
the error unwind is unregister & put_device, not kfree. This is why I
recommend to always initalize the device early, and always using
put_device during error unwinds.

This whole guid thing seems unncessary when the device is immediately
assigned a vdpa index from the ida. If you were not using syfs you'd
just return that index from the creation netlink.

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
