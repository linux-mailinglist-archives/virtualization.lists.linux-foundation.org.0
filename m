Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3A13C239
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 14:04:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C67282040A;
	Wed, 15 Jan 2020 13:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKjhnHXDLZ4G; Wed, 15 Jan 2020 13:04:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A77E2044F;
	Wed, 15 Jan 2020 13:04:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08809C077D;
	Wed, 15 Jan 2020 13:04:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8BA5C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 95C0181429
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xGWbZhlOf0l1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:04:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 02B7C81425
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579093450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpyInUgk4xmThkqKcuu8EEK88ntJNtXCgXJQyiJXbs4=;
 b=B5EsIJ6N+DBf1a+pqzPTb972O/f+aIwJ47Mpr5WP/jOMeSYTCYeMgKgctXLYZSWFCrOOcB
 Y3anZvhftRizZpog1vgFktIAvHOA5mbE8w+T5zVNDJCacBoOG+Q3kw8vNQUOP/qUa3VeT2
 ARqNTGIeRwZ/Ak0D0r1AAKikK5EarZc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-dxqfAiH1Pp2kJAc4ox-inA-1; Wed, 15 Jan 2020 08:04:09 -0500
Received: by mail-wr1-f70.google.com with SMTP id k18so8004144wrw.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 05:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mpyInUgk4xmThkqKcuu8EEK88ntJNtXCgXJQyiJXbs4=;
 b=ag1UBQlbAhxMJaOHrS+pvDl2cVYEEzo6uYb8g4fCiHIZxPXaShK/hsTjs/P/iYbTnl
 6TG+W+srqKl4LiSKUCQzHbRHBiDNmcr/e4M9eGxioW09SnoJjuG1jJ+SSc48kuW2B9lS
 VtXwxxysN4sd3H9x5oTUgziAnVhbZLgUw7DxUVwIT2agBW5Pzl2JBk8jpsX/Ebn9+Z8l
 40TVsccAPJgOo+tI34O8YpwX86djEKOTKuKv+TMF52j1jMHx8rbkIrjNI1mnQp2jbenZ
 pJkPa2EAQSQSO+ONn5QEzZEEP/Ect+O5rNLleDxs9M0OO5uG+QS44KuCoxcQGdm80Mep
 QV+A==
X-Gm-Message-State: APjAAAWZYaSCrvwTVVT2jRLTJNnrmo+UZoKCQdcnutDaxwg4uYTRgnL+
 YO4B+boqbHdlvAkQlLumVxt/Aa+h0R6L2q/iYg0dWw+4ImaOuRKfnKaf1NH1+EHsf8YHAlcKQRl
 48Aei7/hFvhqIKcLkvdUyEX7TqJxL3VGOUaWANLRxOw==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr35642420wmk.42.1579093448408; 
 Wed, 15 Jan 2020 05:04:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNc3UH/JZrFdOQ0n0slHlGFi13fSa9Le8xaSC3jQ78spxTvbop6nGuqW1/hkGMIAJTiMuYcw==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr35642387wmk.42.1579093448204; 
 Wed, 15 Jan 2020 05:04:08 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id n1sm23434301wrw.52.2020.01.15.05.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 05:04:07 -0800 (PST)
Subject: Re: [PATCH v2 0/4] Use no_vblank property for drivers without VBLANK
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, david@lechnology.com, noralf@tronnes.org,
 sean@poorly.run, oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
References: <20200115125226.13843-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <91623f34-cc25-5045-0214-db18ecf29c61@redhat.com>
Date: Wed, 15 Jan 2020 14:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
Content-Language: en-US
X-MC-Unique: dxqfAiH1Pp2kJAc4ox-inA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi,

On 15-01-2020 13:52, Thomas Zimmermann wrote:
> (Resending because I did not cc dri-devel properly.)
> 
> Instead of faking VBLANK events by themselves, drivers without VBLANK
> support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
> The patchset makes this official and converts over several drivers.
> 
> Ast already uses the functionality and just needs a cleanup. Cirrus can
> be converted easily by setting the field in the check() callback and
> removing the existing VBLANK code. For most other simple-KMS drivers
> without enable_vblank() and check(), simple-KMS helpers can enable the
> faked VBLANK by default. The only exception is Xen, which comes with
> its own VBLANK logic and should rather to disable no_vblank.
> 
> v2:
> 	* document functionality (Daniel)
> 	* cleanup ast (Daniel)
> 	* let simple-kms handle no_vblank where possible

Entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> Thomas Zimmermann (4):
>    drm: Document struct drm_crtc_state.no_vblank for faking VBLANK events
>    drm/ast: Set struct drm_crtc_state.no_vblank in atomic_check()
>    drm/cirrus: Let DRM core send VBLANK events
>    drm/simple-kms: Let DRM core send VBLANK events by default
> 
>   drivers/gpu/drm/ast/ast_mode.c          |  4 ++--
>   drivers/gpu/drm/bochs/bochs_kms.c       |  9 ---------
>   drivers/gpu/drm/cirrus/cirrus.c         | 10 ++--------
>   drivers/gpu/drm/drm_atomic_helper.c     |  4 +++-
>   drivers/gpu/drm/drm_mipi_dbi.c          |  9 ---------
>   drivers/gpu/drm/drm_simple_kms_helper.c | 19 +++++++++++++++----
>   drivers/gpu/drm/tiny/gm12u320.c         |  9 ---------
>   drivers/gpu/drm/tiny/ili9225.c          |  9 ---------
>   drivers/gpu/drm/tiny/repaper.c          |  9 ---------
>   drivers/gpu/drm/tiny/st7586.c           |  9 ---------
>   drivers/gpu/drm/udl/udl_modeset.c       | 11 -----------
>   drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
>   include/drm/drm_crtc.h                  |  9 +++++++--
>   include/drm/drm_simple_kms_helper.h     |  7 +++++--
>   14 files changed, 47 insertions(+), 84 deletions(-)
> 
> --
> 2.24.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
