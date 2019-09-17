Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B623B55DB
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 21:01:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE5A1C7F;
	Tue, 17 Sep 2019 19:00:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9AE6EC74
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 19:00:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4DA1782F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 19:00:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C53AA3D38C;
	Tue, 17 Sep 2019 19:00:51 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 541C160852;
	Tue, 17 Sep 2019 19:00:45 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:00:44 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH 2/4] mdev: introduce helper to set per device dma ops
Message-ID: <20190917130044.4fb97637@x1.home>
In-Reply-To: <20190910081935.30516-3-jasowang@redhat.com>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-3-jasowang@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Tue, 17 Sep 2019 19:00:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	cohuck@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, haotian.wang@sifive.com,
	idos@mellanox.com, rob.miller@broadcom.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, 10 Sep 2019 16:19:33 +0800
Jason Wang <jasowang@redhat.com> wrote:

> This patch introduces mdev_set_dma_ops() which allows parent to set
> per device DMA ops. This help for the kernel driver to setup a correct
> DMA mappings.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vfio/mdev/mdev_core.c | 7 +++++++
>  include/linux/mdev.h          | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
> index b558d4cfd082..eb28552082d7 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c
> @@ -13,6 +13,7 @@
>  #include <linux/uuid.h>
>  #include <linux/sysfs.h>
>  #include <linux/mdev.h>
> +#include <linux/dma-mapping.h>
>  
>  #include "mdev_private.h"
>  
> @@ -27,6 +28,12 @@ static struct class_compat *mdev_bus_compat_class;
>  static LIST_HEAD(mdev_list);
>  static DEFINE_MUTEX(mdev_list_lock);
>  
> +void mdev_set_dma_ops(struct mdev_device *mdev, struct dma_map_ops *ops)
> +{
> +	set_dma_ops(&mdev->dev, ops);
> +}
> +EXPORT_SYMBOL(mdev_set_dma_ops);
> +

Why does mdev need to be involved here?  Your sample driver in 4/4 calls
this from its create callback, where it could just as easily call:

  set_dma_ops(mdev_dev(mdev), ops);

Thanks,
Alex

>  struct device *mdev_parent_dev(struct mdev_device *mdev)
>  {
>  	return mdev->parent->dev;
> diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> index 0ce30ca78db0..7195f40bf8bf 100644
> --- a/include/linux/mdev.h
> +++ b/include/linux/mdev.h
> @@ -145,4 +145,6 @@ struct device *mdev_parent_dev(struct mdev_device *mdev);
>  struct device *mdev_dev(struct mdev_device *mdev);
>  struct mdev_device *mdev_from_dev(struct device *dev);
>  
> +void mdev_set_dma_ops(struct mdev_device *mdev, struct dma_map_ops *ops);
> +
>  #endif /* MDEV_H */

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
