Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316C322A80
	for <lists.virtualization@lfdr.de>; Tue, 23 Feb 2021 13:29:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE83A848C2;
	Tue, 23 Feb 2021 12:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sn_otAiSHhK6; Tue, 23 Feb 2021 12:29:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F2A48544C;
	Tue, 23 Feb 2021 12:29:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38DEAC0012;
	Tue, 23 Feb 2021 12:29:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C5A6C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 07A5C85359
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gXIVD8wSfgK
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:29:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2CA5E848C2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614083378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2pPGjn1L2OCanUWSSCwQKIX3l54iDUbuwOkt25b4CnI=;
 b=ZCC/BEbcVWEXdzWoqPSaKM9qDTpvRYEEcY0mnLc1hrxsSeGN/OgkUgNFn55RvgvHuhozmz
 1pKO6uIByCb9tlFjglNzHT0sIbdULFpKGEEZKIpzsphHKNjiU908Gh8CUbcCqahboT5sxr
 eVB8Kf8akC8HFxN8n9pJCxgGsXcbrNU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-ffa_jBHjPiC_DRQJKtgJcw-1; Tue, 23 Feb 2021 07:29:36 -0500
X-MC-Unique: ffa_jBHjPiC_DRQJKtgJcw-1
Received: by mail-wm1-f69.google.com with SMTP id r21so614542wmq.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 04:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2pPGjn1L2OCanUWSSCwQKIX3l54iDUbuwOkt25b4CnI=;
 b=VzkZ3uY5MKWkceTWghlcbAS7mSmfW0fr91yb1xEQF3bGWIVzJT21YEBrBQuAWUagZp
 9kDUeQRBK3DCCpkVnPFX/MdFb6GvgbXecFl25eAM/SRWzYZzodbtwTKCuPJvFImfMKcY
 PcRHo1t7cRnh6NolxuaAaRzDeNQrz4/JsDYmqIflEbwOUe8DaDr8lfXLR9i8P35ly9Ry
 /9EiNCsi2I2+yNLXAS7tUkoJfcCLsmxhbsULJ/jziGN7rUDiDoJCVp2GtvC0OuBcW3wL
 LO6lSzhfya6paCOVc6leEgZdmX2bC04s+EJ/nnV14TZv/B6ACCxTQ2xTr5sAwmJZToRv
 C6cQ==
X-Gm-Message-State: AOAM530WPxeCz7wvAzhbBzujNgZFUlC++lfYwq2Hbqbo+DiCGbuOB5wd
 Wyjr9Ac4VgVqJxxUp1bbcKvLrLPPVz/cvyx/CtZG2M/QN0DXDZIq97KWYfEgEPrlCoiGYMUc1Nl
 Wn75yGyjxJFudrBu5kGPbbcre3TPSWBWZlS3g73anIA==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr9277732wrw.221.1614083375345; 
 Tue, 23 Feb 2021 04:29:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT9ETBZCwu34Y3jqc+iCOoGTGTw/wVdbbWPNouqoXWdCS/xdvtKEfF0VAgTzO3xgZORzM2aQ==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr9277717wrw.221.1614083375192; 
 Tue, 23 Feb 2021 04:29:35 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id j14sm20083473wrw.34.2021.02.23.04.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:29:34 -0800 (PST)
Date: Tue, 23 Feb 2021 07:29:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH v2] vdpa/mlx5: Enable user to add/delete vdpa device
Message-ID: <20210223072847-mutt-send-email-mst@kernel.org>
References: <20210218074157.43220-1-elic@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210218074157.43220-1-elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, si-wei.liu@oracle.com
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

On Thu, Feb 18, 2021 at 09:41:57AM +0200, Eli Cohen wrote:
> Allow to control vdpa device creation and destruction using the vdpa
> management tool.
> 
> Examples:
> 1. List the management devices
> $ vdpa mgmtdev show
> pci/0000:3b:00.1:
>   supported_classes net
> 
> 2. Create vdpa instance
> $ vdpa dev add mgmtdev pci/0000:3b:00.1 name vdpa0
> 
> 3. Show vdpa devices
> $ vdpa dev show
> vdpa0: type network mgmtdev pci/0000:3b:00.1 vendor_id 5555 max_vqs 16 \
> max_vq_size 256
> 
> Signed-off-by: Eli Cohen <elic@nvidia.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>

Not sure which tree this is for, I could not apply this.

> ---
> v0->v1:
> set mgtdev->ndev NULL on dev delete
> v1->v2: Resend
> 
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 79 +++++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index a51b0f86afe2..08fb481ddc4f 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1974,23 +1974,32 @@ static void init_mvqs(struct mlx5_vdpa_net *ndev)
>  	}
>  }
>  
> -static int mlx5v_probe(struct auxiliary_device *adev,
> -		       const struct auxiliary_device_id *id)
> +struct mlx5_vdpa_mgmtdev {
> +	struct vdpa_mgmt_dev mgtdev;
> +	struct mlx5_adev *madev;
> +	struct mlx5_vdpa_net *ndev;
> +};
> +
> +static int mlx5_vdpa_dev_add(struct vdpa_mgmt_dev *v_mdev, const char *name)
>  {
> -	struct mlx5_adev *madev = container_of(adev, struct mlx5_adev, adev);
> -	struct mlx5_core_dev *mdev = madev->mdev;
> +	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
>  	struct virtio_net_config *config;
>  	struct mlx5_vdpa_dev *mvdev;
>  	struct mlx5_vdpa_net *ndev;
> +	struct mlx5_core_dev *mdev;
>  	u32 max_vqs;
>  	int err;
>  
> +	if (mgtdev->ndev)
> +		return -ENOSPC;
> +
> +	mdev = mgtdev->madev->mdev;
>  	/* we save one virtqueue for control virtqueue should we require it */
>  	max_vqs = MLX5_CAP_DEV_VDPA_EMULATION(mdev, max_num_virtio_queues);
>  	max_vqs = min_t(u32, max_vqs, MLX5_MAX_SUPPORTED_VQS);
>  
>  	ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops,
> -				 2 * mlx5_vdpa_max_qps(max_vqs), NULL);
> +				 2 * mlx5_vdpa_max_qps(max_vqs), name);
>  	if (IS_ERR(ndev))
>  		return PTR_ERR(ndev);
>  
> @@ -2018,11 +2027,12 @@ static int mlx5v_probe(struct auxiliary_device *adev,
>  	if (err)
>  		goto err_res;
>  
> -	err = vdpa_register_device(&mvdev->vdev);
> +	mvdev->vdev.mdev = &mgtdev->mgtdev;
> +	err = _vdpa_register_device(&mvdev->vdev);
>  	if (err)
>  		goto err_reg;
>  
> -	dev_set_drvdata(&adev->dev, ndev);
> +	mgtdev->ndev = ndev;
>  	return 0;
>  
>  err_reg:
> @@ -2035,11 +2045,62 @@ static int mlx5v_probe(struct auxiliary_device *adev,
>  	return err;
>  }
>  
> +static void mlx5_vdpa_dev_del(struct vdpa_mgmt_dev *v_mdev, struct vdpa_device *dev)
> +{
> +	struct mlx5_vdpa_mgmtdev *mgtdev = container_of(v_mdev, struct mlx5_vdpa_mgmtdev, mgtdev);
> +
> +	_vdpa_unregister_device(dev);
> +	mgtdev->ndev = NULL;
> +}
> +
> +static const struct vdpa_mgmtdev_ops mdev_ops = {
> +	.dev_add = mlx5_vdpa_dev_add,
> +	.dev_del = mlx5_vdpa_dev_del,
> +};
> +
> +static struct virtio_device_id id_table[] = {
> +	{ VIRTIO_ID_NET, VIRTIO_DEV_ANY_ID },
> +	{ 0 },
> +};
> +
> +static int mlx5v_probe(struct auxiliary_device *adev,
> +		       const struct auxiliary_device_id *id)
> +
> +{
> +	struct mlx5_adev *madev = container_of(adev, struct mlx5_adev, adev);
> +	struct mlx5_core_dev *mdev = madev->mdev;
> +	struct mlx5_vdpa_mgmtdev *mgtdev;
> +	int err;
> +
> +	mgtdev = kzalloc(sizeof(*mgtdev), GFP_KERNEL);
> +	if (!mgtdev)
> +		return -ENOMEM;
> +
> +	mgtdev->mgtdev.ops = &mdev_ops;
> +	mgtdev->mgtdev.device = mdev->device;
> +	mgtdev->mgtdev.id_table = id_table;
> +	mgtdev->madev = madev;
> +
> +	err = vdpa_mgmtdev_register(&mgtdev->mgtdev);
> +	if (err)
> +		goto reg_err;
> +
> +	dev_set_drvdata(&adev->dev, mgtdev);
> +
> +	return 0;
> +
> +reg_err:
> +	kfree(mdev);
> +	return err;
> +}
> +
>  static void mlx5v_remove(struct auxiliary_device *adev)
>  {
> -	struct mlx5_vdpa_dev *mvdev = dev_get_drvdata(&adev->dev);
> +	struct mlx5_vdpa_mgmtdev *mgtdev;
>  
> -	vdpa_unregister_device(&mvdev->vdev);
> +	mgtdev = dev_get_drvdata(&adev->dev);
> +	vdpa_mgmtdev_unregister(&mgtdev->mgtdev);
> +	kfree(mgtdev);
>  }
>  
>  static const struct auxiliary_device_id mlx5v_id_table[] = {
> -- 
> 2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
