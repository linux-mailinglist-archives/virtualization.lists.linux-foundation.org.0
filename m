Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D57521555C1
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 11:33:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7C07387E14;
	Fri,  7 Feb 2020 10:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-TGrG7AdAGY; Fri,  7 Feb 2020 10:33:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF77087E13;
	Fri,  7 Feb 2020 10:33:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7D35C013E;
	Fri,  7 Feb 2020 10:33:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC11C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A4902037E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFi+kHjUMm3L
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:33:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id AA13F20338
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 10:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IONKJ8TyL8qr6kjL8TsN2CChBscp5AIgxr8gruOmSbY=;
 b=e2R6UzYlw8ognEkanIlJfnqqr3HFQFF7HebgKpYbN9bJs/vUDEVmjCYsoKivhSmAovaMn7
 anO1YJHvYMjFCy1Yei0w2P4vhQX9sn51dNrbbBxMlH+pgNgUp2Z1bchQKP+cYS58U51KJG
 f69F1kuI4UfS2nWzMwSd1qPGLkmtKEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-YKGTqmbqNx67jbKFI2bxwg-1; Fri, 07 Feb 2020 05:33:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92356100551A;
 Fri,  7 Feb 2020 10:33:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C622386;
 Fri,  7 Feb 2020 10:33:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6D783A1E0; Fri,  7 Feb 2020 11:33:33 +0100 (CET)
Date: Fri, 7 Feb 2020 11:33:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207103333.rxebukm4hukavlq5@sirius.home.kraxel.org>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200207084135.4524-3-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: YKGTqmbqNx67jbKFI2bxwg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, noralf@tronnes.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
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

> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/**
> + * drm_simple_encoder_init - Init a preallocated encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + * @name: printf style format string for the encoder name, or NULL
> + *        for default name
> + *
> + * Initialises a preallocated encoder that has no further functionality. The
> + * encoder will be released automatically.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type, const char *name, ...)

How about using

#define drm_simple_encoder_init(dev, type, name, ...) \
        drm_encoder_init(dev, drm_simple_encoder_funcs_cleanup, type, name, __VA_ARGS__)

instead ?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
