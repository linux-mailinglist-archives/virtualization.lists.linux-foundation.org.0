Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D86EE16450C
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 14:11:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95D8B85EF3;
	Wed, 19 Feb 2020 13:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUbvJAsg8kEu; Wed, 19 Feb 2020 13:11:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CC0D85F2B;
	Wed, 19 Feb 2020 13:11:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E36E0C013E;
	Wed, 19 Feb 2020 13:11:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ADD3C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 13:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 12795204B6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 13:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTE39qCCMctj
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 13:11:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E12F20498
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 13:11:04 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id s6so130884qvq.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 05:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vlvlwshc67nfmD8mnuDhiaIo5+M0W9hN5kIZIDEuy2Q=;
 b=Rtapr6oXl/ZaEBtZq5MfyQnS/XVirN0sBqwZyUReZu3pzXQ2HAamZkYWPIMCtWRriL
 PlfqwVm3qUiKuPhjgf2FqEOb+9LWbcBCTU0xBqkoZ4U5iBzYnXMvl909/fXT0InfuC8B
 N70oP0+7MZYJDZZXXBUxPVRTR5UdfeLhq0Lh2CTq7o9GjhBv/uMIfVcKsNgtBKWUA9Bd
 687rV989HvQ3dUWl7k2hSZ8DC/1JiuaaFAFdwdrXBvqkfrDwFIG5yF4aQW32+XtdODc3
 C5J+OVhXMAC39OjPPCXmC+cRSbvP8SRplMyRJ8iDX10PRgz2xf6J2YBsk10bMlJIqOjF
 /bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vlvlwshc67nfmD8mnuDhiaIo5+M0W9hN5kIZIDEuy2Q=;
 b=RehkRJv0ewwHVZ6N4hM2pvC/FnYo2qhxcOfkx/3QtLInL9BbL29IFELcyGjNSYY8yA
 ciS6i7BXwjF69mEoDtji/X8vVNjIBcn9/GsCYhhGZS7CXKcicSsrbwb9RmEqeEWJM2a2
 1joYH8NKE/G/tsu8o8TJL3E7pJkttqj6T9l+zCqVLr0U+KZedYRp0DvmHZar1efgZwN6
 hEHLzstEQNFFO3TpKnSdCfD0in8TEsnErMhechoPxIbUAOI4KTEmAGdJxiMV1PCjBObP
 cHlA9NDcqkKmMkXtFl0tqsNGSBfwJF7O3KEsacFaVQUSDe1ns1mZEqhTAzUybbN+w9Cd
 CySg==
X-Gm-Message-State: APjAAAXhCCIy5Thq5cOKYn15vd0IHKn+090t/ImrKc18KzOpjWd2/hjh
 MkMc5Sn5AIH36VCkVmP6yR4Dxw==
X-Google-Smtp-Source: APXvYqyZcNxGLb7eHMU18r0zr3qpKpcwiysfX6S+jAaXMEUPECzgHhYx1h9AJGMzMfZeBkbc96JYEA==
X-Received: by 2002:a05:6214:965:: with SMTP id
 do5mr20929587qvb.202.1582117863137; 
 Wed, 19 Feb 2020 05:11:03 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m95sm939421qte.41.2020.02.19.05.11.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Feb 2020 05:11:02 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1j4P82-000137-AB; Wed, 19 Feb 2020 09:11:02 -0400
Date: Wed, 19 Feb 2020 09:11:02 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200219131102.GN31668@ziepe.ca>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <20200218135359.GA9608@ziepe.ca> <20200219025217.GA971968@___>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219025217.GA971968@___>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: kvm@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 lulu@redhat.com, maxime.coquelin@redhat.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, mhabets@solarflare.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 zhihong.wang@intel.com, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, hanand@xilinx.com, lingshan.zhu@intel.com
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

On Wed, Feb 19, 2020 at 10:52:38AM +0800, Tiwei Bie wrote:
> > > +static int __init vhost_vdpa_init(void)
> > > +{
> > > +	int r;
> > > +
> > > +	idr_init(&vhost_vdpa.idr);
> > > +	mutex_init(&vhost_vdpa.mutex);
> > > +	init_waitqueue_head(&vhost_vdpa.release_q);
> > > +
> > > +	/* /dev/vhost-vdpa/$vdpa_device_index */
> > > +	vhost_vdpa.class = class_create(THIS_MODULE, "vhost-vdpa");
> > > +	if (IS_ERR(vhost_vdpa.class)) {
> > > +		r = PTR_ERR(vhost_vdpa.class);
> > > +		goto err_class;
> > > +	}
> > > +
> > > +	vhost_vdpa.class->devnode = vhost_vdpa_devnode;
> > > +
> > > +	r = alloc_chrdev_region(&vhost_vdpa.devt, 0, MINORMASK + 1,
> > > +				"vhost-vdpa");
> > > +	if (r)
> > > +		goto err_alloc_chrdev;
> > > +
> > > +	cdev_init(&vhost_vdpa.cdev, &vhost_vdpa_fops);
> > > +	r = cdev_add(&vhost_vdpa.cdev, vhost_vdpa.devt, MINORMASK + 1);
> > > +	if (r)
> > > +		goto err_cdev_add;
> > 
> > It is very strange, is the intention to create a single global char
> > dev?
> 
> No. It's to create a per-vdpa char dev named
> vhost-vdpa/$vdpa_device_index in dev.
> 
> I followed the code in VFIO which creates char dev
> vfio/$GROUP dynamically, e.g.:
> 
> https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L2164-L2180
> https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L373-L387
> https://github.com/torvalds/linux/blob/b1da3acc781c/drivers/vfio/vfio.c#L1553
> 
> Is it something unwanted?

Yes it is unwanted. This is some special pattern for vfio's unique
needs. 

Since this has a struct device for each char dev instance please use
the normal cdev_device_add() driven pattern here, or justify why it
needs to be special like this.

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
