Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB11559BD
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 15:37:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6957E86516;
	Fri,  7 Feb 2020 14:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEjlMzBnwuF4; Fri,  7 Feb 2020 14:37:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2AF186508;
	Fri,  7 Feb 2020 14:37:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4F77C013E;
	Fri,  7 Feb 2020 14:37:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E7E0C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 842A185B4A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yjb_dO8jFigB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:37:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D784C86508
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=66b7XSZ892In4dZ1AtrKGUvL65iL8vLWanZ6tyoqMyM=; b=fDjZZd5Te5Rl4u+13tgU7fo1yE
 t0hdo1JSajVqq/0GyXpgPjWr34xG0ck/qHXuXiA7BaXEPZxkZZvu9kz5/vtschpCjAz7mRdZ4JU5e
 /t4JvBnn+8BAMawK/EUP+Vg1Ttqw1XX/RAYzuW5B5QxNmYPcryDzcYiYufL2aprt5aRlaTwFRXRuh
 sM1UBRz6YgGBCjioJvSrIzeD7TRHbIGNodRufiOFereFgTYpnypEcRxgkzhu+SEhiqA+vFvgWfxux
 GmOh6bF5tlYq2gGIvRAOvc4T2fjbsWcNlW0SZJEIwxKsVgLgGQfdyjIfn3nlg12KrAhyWuEviug7A
 hZq/uDJg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:54428
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j04kb-0006FI-2F; Fri, 07 Feb 2020 15:36:57 +0100
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kraxel@redhat.com, sam@ravnborg.org, alexander.deucher@amd.com,
 emil.velikov@collabora.com
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e43dcf9c-e228-dd01-2e55-5ad75804cf79@tronnes.org>
Date: Fri, 7 Feb 2020 15:36:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200207084135.4524-3-tzimmermann@suse.de>
Cc: spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
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



Den 07.02.2020 09.41, skrev Thomas Zimmermann:
> The simple-encoder helpers initialize an encoder with an empty
> implementation. This covers the requirements of most of the existing
> DRM drivers. A call to drm_simple_encoder_create() allocates and
> initializes an encoder instance, a call to drm_simple_encoder_init()
> initializes a pre-allocated instance.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_encoder.c | 116 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_encoder.h     |  10 +++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c

<snip>

> +/**
> + * drm_simple_encoder_create - Allocate and initialize an encoder
> + * @dev: drm device
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL for
> + *        default name
> + *
> + * Allocates and initialises an encoder that has no further functionality. The
> + * encoder will be released automatically.
> + *
> + * Returns:
> + * The encoder on success, a pointer-encoder error code on failure.
> + */
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type,
> +					      const char *name, ...)
> +{
> +	char *namestr = NULL;
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder = devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);

The encoder can outlive the devres if the device is unbound when
userspace has open fds, so you can't use devm_ here.

Noralf.

> +	if (!encoder)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (name) {
> +		va_list ap;
> +
> +		va_start(ap, name);
> +		namestr = kvasprintf(GFP_KERNEL, name, ap);
> +		va_end(ap);
> +		if (!namestr) {
> +			ret = -ENOMEM;
> +			goto err_devm_kfree;
> +		}
> +	}
> +
> +	ret = __drm_encoder_init(dev, encoder,
> +				 &drm_simple_encoder_funcs_destroy,
> +				 encoder_type, namestr);
> +	if (ret)
> +		goto err_kfree;
> +
> +	return encoder;
> +
> +err_kfree:
> +	if (name)
> +		kfree(namestr);
> +err_devm_kfree:
> +	devm_kfree(dev->dev, encoder);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_create);
> +
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
