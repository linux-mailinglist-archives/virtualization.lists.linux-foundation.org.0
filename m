Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E627B5C5
	for <lists.virtualization@lfdr.de>; Mon, 28 Sep 2020 21:55:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D850286174;
	Mon, 28 Sep 2020 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6A6uq0OcAjkn; Mon, 28 Sep 2020 19:55:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 206E886123;
	Mon, 28 Sep 2020 19:55:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E19CCC0051;
	Mon, 28 Sep 2020 19:55:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69418C0051
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5101B86FA2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxE8g2ad+xdT
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:55:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6E9E686F9E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:55:18 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601322917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1qD/bYiwXaDqvMUHTGUqMaHkNigUfku0s1G1pgifknA=;
 b=PNS96dILccnm1r9MTUtp7gB7t0xo02nWRnHUwZlTmgEdl78OiJVjxn3EuzTCPpOyb/AXiM
 edvSRiwdJbiGPakBj0KBRQbBw1gv8ZD5NaWb2FZoJ1AY8VDuG8iIv/4XxVLII8fINkSVII
 mEo9Qp3hvYZ2NcmK6GY7bgzWAH036ZU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-QjF0tfo0MgCWX2OV-0RAwQ-1; Mon, 28 Sep 2020 15:55:15 -0400
X-MC-Unique: QjF0tfo0MgCWX2OV-0RAwQ-1
Received: by mail-wm1-f69.google.com with SMTP id a11so48204wmh.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 12:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1qD/bYiwXaDqvMUHTGUqMaHkNigUfku0s1G1pgifknA=;
 b=Xsn6CV1j0vHvrbHIQACxkergmj2FdZSQMKzy2UdRAo4VZXJfzYUeGhesCNWcgGzpYr
 GQ/NhQqXWdXZWjatHAtBhDE/8z/Kx5bdsAOiZunqc5VXLFKO1fnirKSowJp4FAgrhj3j
 450o/p39hi/LE9RXr64xMc4ZZOvi6/7JpJGVbwuYaRn0X6cZXEd/Z3lb0AogBRoh5Lgj
 A4jnR1cuuQegSWMJm8WA00aUAlWHPekdTkpWqAVyThgku+uSGKRWnPmrJHScWbpnu50I
 2HQlNoB+NTgMDaTevitRAElqtnqzUJo+zGDyMWP2CID8a4XEG5kRHXYP7Gq69ZWJRavA
 Wq2A==
X-Gm-Message-State: AOAM532tSkF+G+6YYun9FLyFUgy6he60QlhX9xQ/Vkd5U4hGSJseNh8b
 /mhsXmOc+RQx9PXZmTcz3XObvhIQNApQwKaFS8kRgfDJntLqTU0J94NX3XOCHFo5p4zJVKOQD9E
 YosRHhuJMBVh8UG41Cz2tmsHUgBCAY6t1IBKzbn8WUQ==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr806549wmi.53.1601322913403;
 Mon, 28 Sep 2020 12:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHJc0NzkL6UIF4Usztiftaij8e1WIEJYDq5hNYrhp+v+0ltPTCNUWn4xJ0d+jBa6m27TyepA==
X-Received: by 2002:a7b:c151:: with SMTP id z17mr806531wmi.53.1601322913098;
 Mon, 28 Sep 2020 12:55:13 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id v9sm3010804wrv.35.2020.09.28.12.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 12:55:12 -0700 (PDT)
Date: Mon, 28 Sep 2020 15:55:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH V1 vhost-next] vdpa/mlx5: Make vdpa core driver a
 distinct module
Message-ID: <20200928155448-mutt-send-email-mst@kernel.org>
References: <20200924143231.GA186492@mtl-vdi-166.wap.labs.mlnx>
MIME-Version: 1.0
In-Reply-To: <20200924143231.GA186492@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, eli@nvidia.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Thu, Sep 24, 2020 at 05:32:31PM +0300, Eli Cohen wrote:
> Change core vdpa functionality into a loadbale module such that upcoming
> block implementation will be able to use it.
> 
> Signed-off-by: Eli Cohen <elic@nvidia.com>

Why don't we merge this patch together with the block module?

> ---
> V0 --> V1:
> Removed "default n" for configu options as 'n' is the default
> 
>  drivers/vdpa/Kconfig               |  8 +++-----
>  drivers/vdpa/Makefile              |  2 +-
>  drivers/vdpa/mlx5/Makefile         |  7 +++++--
>  drivers/vdpa/mlx5/core/core_main.c | 20 ++++++++++++++++++++
>  drivers/vdpa/mlx5/core/mr.c        |  3 +++
>  drivers/vdpa/mlx5/core/resources.c | 10 ++++++++++
>  6 files changed, 42 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/vdpa/mlx5/core/core_main.c
> 
> diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> index 4271c408103e..57ff6a7f7401 100644
> --- a/drivers/vdpa/Kconfig
> +++ b/drivers/vdpa/Kconfig
> @@ -29,10 +29,9 @@ config IFCVF
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called ifcvf.
>  
> -config MLX5_VDPA
> -	bool "MLX5 VDPA support library for ConnectX devices"
> +config MLX5_VDPA_CORE
> +	tristate "MLX5 VDPA support library for ConnectX devices"
>  	depends on MLX5_CORE
> -	default n
>  	help
>  	  Support library for Mellanox VDPA drivers. Provides code that is
>  	  common for all types of VDPA drivers. The following drivers are planned:
> @@ -40,8 +39,7 @@ config MLX5_VDPA
>  
>  config MLX5_VDPA_NET
>  	tristate "vDPA driver for ConnectX devices"
> -	depends on MLX5_VDPA
> -	default n
> +	depends on MLX5_VDPA_CORE
>  	help
>  	  VDPA network driver for ConnectX6 and newer. Provides offloading
>  	  of virtio net datapath such that descriptors put on the ring will
> diff --git a/drivers/vdpa/Makefile b/drivers/vdpa/Makefile
> index d160e9b63a66..07353bbb9f8b 100644
> --- a/drivers/vdpa/Makefile
> +++ b/drivers/vdpa/Makefile
> @@ -2,4 +2,4 @@
>  obj-$(CONFIG_VDPA) += vdpa.o
>  obj-$(CONFIG_VDPA_SIM) += vdpa_sim/
>  obj-$(CONFIG_IFCVF)    += ifcvf/
> -obj-$(CONFIG_MLX5_VDPA) += mlx5/
> +obj-$(CONFIG_MLX5_VDPA_CORE) += mlx5/
> diff --git a/drivers/vdpa/mlx5/Makefile b/drivers/vdpa/mlx5/Makefile
> index 89a5bededc9f..9f50f7e8d889 100644
> --- a/drivers/vdpa/mlx5/Makefile
> +++ b/drivers/vdpa/mlx5/Makefile
> @@ -1,4 +1,7 @@
>  subdir-ccflags-y += -I$(srctree)/drivers/vdpa/mlx5/core
>  
> -obj-$(CONFIG_MLX5_VDPA_NET) += mlx5_vdpa.o
> -mlx5_vdpa-$(CONFIG_MLX5_VDPA_NET) += net/main.o net/mlx5_vnet.o core/resources.o core/mr.o
> +obj-$(CONFIG_MLX5_VDPA_CORE) += mlx5_vdpa_core.o
> +mlx5_vdpa_core-$(CONFIG_MLX5_VDPA_CORE) += core/resources.o core/mr.o core/core_main.o
> +
> +obj-$(CONFIG_MLX5_VDPA_NET) += mlx5_vdpa_net.o
> +mlx5_vdpa_net-$(CONFIG_MLX5_VDPA_NET) += net/main.o net/mlx5_vnet.o
> diff --git a/drivers/vdpa/mlx5/core/core_main.c b/drivers/vdpa/mlx5/core/core_main.c
> new file mode 100644
> index 000000000000..4b39b55f57ab
> --- /dev/null
> +++ b/drivers/vdpa/mlx5/core/core_main.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> +/* Copyright (c) 2020 Mellanox Technologies Ltd. */
> +
> +#include <linux/module.h>
> +
> +MODULE_AUTHOR("Eli Cohen <elic@nvidia.com>");
> +MODULE_DESCRIPTION("Mellanox VDPA core driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +
> +static int __init mlx5_vdpa_core_init(void)
> +{
> +	return 0;
> +}
> +
> +static void __exit mlx5_vdpa_core_exit(void)
> +{
> +}
> +
> +module_init(mlx5_vdpa_core_init);
> +module_exit(mlx5_vdpa_core_exit);
> diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
> index ef1c550f8266..c093eab6c714 100644
> --- a/drivers/vdpa/mlx5/core/mr.c
> +++ b/drivers/vdpa/mlx5/core/mr.c
> @@ -434,6 +434,7 @@ int mlx5_vdpa_create_mr(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *iotlb)
>  	mutex_unlock(&mr->mkey_mtx);
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_create_mr);
>  
>  void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev)
>  {
> @@ -456,6 +457,7 @@ void mlx5_vdpa_destroy_mr(struct mlx5_vdpa_dev *mvdev)
>  out:
>  	mutex_unlock(&mr->mkey_mtx);
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_destroy_mr);
>  
>  static bool map_empty(struct vhost_iotlb *iotlb)
>  {
> @@ -484,3 +486,4 @@ int mlx5_vdpa_handle_set_map(struct mlx5_vdpa_dev *mvdev, struct vhost_iotlb *io
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_handle_set_map);
> diff --git a/drivers/vdpa/mlx5/core/resources.c b/drivers/vdpa/mlx5/core/resources.c
> index 96e6421c5d1c..89606a18e286 100644
> --- a/drivers/vdpa/mlx5/core/resources.c
> +++ b/drivers/vdpa/mlx5/core/resources.c
> @@ -98,6 +98,7 @@ int mlx5_vdpa_create_tis(struct mlx5_vdpa_dev *mvdev, void *in, u32 *tisn)
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_create_tis);
>  
>  void mlx5_vdpa_destroy_tis(struct mlx5_vdpa_dev *mvdev, u32 tisn)
>  {
> @@ -108,6 +109,7 @@ void mlx5_vdpa_destroy_tis(struct mlx5_vdpa_dev *mvdev, u32 tisn)
>  	MLX5_SET(destroy_tis_in, in, tisn, tisn);
>  	mlx5_cmd_exec_in(mvdev->mdev, destroy_tis, in);
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_destroy_tis);
>  
>  int mlx5_vdpa_create_rqt(struct mlx5_vdpa_dev *mvdev, void *in, int inlen, u32 *rqtn)
>  {
> @@ -121,6 +123,7 @@ int mlx5_vdpa_create_rqt(struct mlx5_vdpa_dev *mvdev, void *in, int inlen, u32 *
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_create_rqt);
>  
>  void mlx5_vdpa_destroy_rqt(struct mlx5_vdpa_dev *mvdev, u32 rqtn)
>  {
> @@ -131,6 +134,7 @@ void mlx5_vdpa_destroy_rqt(struct mlx5_vdpa_dev *mvdev, u32 rqtn)
>  	MLX5_SET(destroy_rqt_in, in, rqtn, rqtn);
>  	mlx5_cmd_exec_in(mvdev->mdev, destroy_rqt, in);
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_destroy_rqt);
>  
>  int mlx5_vdpa_create_tir(struct mlx5_vdpa_dev *mvdev, void *in, u32 *tirn)
>  {
> @@ -144,6 +148,7 @@ int mlx5_vdpa_create_tir(struct mlx5_vdpa_dev *mvdev, void *in, u32 *tirn)
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_create_tir);
>  
>  void mlx5_vdpa_destroy_tir(struct mlx5_vdpa_dev *mvdev, u32 tirn)
>  {
> @@ -154,6 +159,7 @@ void mlx5_vdpa_destroy_tir(struct mlx5_vdpa_dev *mvdev, u32 tirn)
>  	MLX5_SET(destroy_tir_in, in, tirn, tirn);
>  	mlx5_cmd_exec_in(mvdev->mdev, destroy_tir, in);
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_destroy_tir);
>  
>  int mlx5_vdpa_alloc_transport_domain(struct mlx5_vdpa_dev *mvdev, u32 *tdn)
>  {
> @@ -170,6 +176,7 @@ int mlx5_vdpa_alloc_transport_domain(struct mlx5_vdpa_dev *mvdev, u32 *tdn)
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_alloc_transport_domain);
>  
>  void mlx5_vdpa_dealloc_transport_domain(struct mlx5_vdpa_dev *mvdev, u32 tdn)
>  {
> @@ -180,6 +187,7 @@ void mlx5_vdpa_dealloc_transport_domain(struct mlx5_vdpa_dev *mvdev, u32 tdn)
>  	MLX5_SET(dealloc_transport_domain_in, in, transport_domain, tdn);
>  	mlx5_cmd_exec_in(mvdev->mdev, dealloc_transport_domain, in);
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_dealloc_transport_domain);
>  
>  int mlx5_vdpa_create_mkey(struct mlx5_vdpa_dev *mvdev, struct mlx5_core_mkey *mkey, u32 *in,
>  			  int inlen)
> @@ -266,6 +274,7 @@ int mlx5_vdpa_alloc_resources(struct mlx5_vdpa_dev *mvdev)
>  	mutex_destroy(&mvdev->mr.mkey_mtx);
>  	return err;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_alloc_resources);
>  
>  void mlx5_vdpa_free_resources(struct mlx5_vdpa_dev *mvdev)
>  {
> @@ -282,3 +291,4 @@ void mlx5_vdpa_free_resources(struct mlx5_vdpa_dev *mvdev)
>  	mutex_destroy(&mvdev->mr.mkey_mtx);
>  	res->valid = false;
>  }
> +EXPORT_SYMBOL(mlx5_vdpa_free_resources);
> -- 
> 2.27.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
