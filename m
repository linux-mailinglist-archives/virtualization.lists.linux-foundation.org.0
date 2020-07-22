Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B02297A9
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 13:46:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AFF5A88343;
	Wed, 22 Jul 2020 11:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPj7EvAu-lWe; Wed, 22 Jul 2020 11:46:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29AC9882D3;
	Wed, 22 Jul 2020 11:46:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11F4FC004C;
	Wed, 22 Jul 2020 11:46:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68C13C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5CA048813D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtZ3n2OBDR7U
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:46:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D20148813C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595418403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VA50D44PwP36EMatm3r8jkryzFI+xci/xyxPDoYxEHw=;
 b=CDca0dIawbO/q/8JOMnNOsHXDDSsCa6K74P5unPd8U/NHnt48jntlIpUw8py/kvWDYNXJL
 OsumW9kDsD9pLm2ngElLLMMkKVtcKZ1n+O6jGC4v4MH9f7wrnFZSFq4N5XWDtDWvbOJzGP
 0Qih+B6mekM1gLUryQr7xhQqqaGTbCY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-FI-U9F54OYO3lCfUYDpIaQ-1; Wed, 22 Jul 2020 07:46:42 -0400
X-MC-Unique: FI-U9F54OYO3lCfUYDpIaQ-1
Received: by mail-wm1-f69.google.com with SMTP id 65so946906wmd.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 04:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VA50D44PwP36EMatm3r8jkryzFI+xci/xyxPDoYxEHw=;
 b=XpP1L92tAS8uJWQ+Ozd3n/FvOQCz58BT0GxJ/CnSGvmNMMBSA9HWGVq8RBNld6Rq+n
 w3FM9TPdjyNSO69yzzC60+7vyzgzCa83p2wq0WeDKlXdKO4+MTc7P788nfXXyEa1nISU
 ur2GBFkYGu3MF+rcAqSbORRA03JyCa98ObdpoUpY+zjdLo2vJz93zUfWKGt7CsLiatXo
 /fwZ4V/gJ3TQbvXw2Dx0/3h7mGFqmPi5YmrlMH9+7VXbSHiJm2o0lpT3B5lsRh8cH/Ap
 Y6+/7lwMCudTBq+IwVhGVcooY0rdIkhVVpjF8Nerk35uL52W9VwUQxyhqtGTkBXwRL7o
 gZ5Q==
X-Gm-Message-State: AOAM531KxrrGjjXTnAwOOKSWKnYwmT8fb/Hv4UZ/Ckughs2hCAydsThe
 1Ua/eW7zvrBSlqWum9IEp5FVDYq4xUVtNxFE4fEVuPkSodoRGHLPiTH0dHIqbHjDfU+EctfcJoe
 AHEfGPFHDmtQ4DXUGYUjgdAYbdPoL9WAITxwu6/KnOQ==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr14890861wrw.70.1595418400763; 
 Wed, 22 Jul 2020 04:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT9fHDPnqPq43vdSPvjeRis+cuUR2jlT9N/471iNd7v56L0Upt0p7rdaoBly9Dp9gOrJm4TA==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr14890841wrw.70.1595418400524; 
 Wed, 22 Jul 2020 04:46:40 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id 5sm6787929wmk.9.2020.07.22.04.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 04:46:39 -0700 (PDT)
Date: Wed, 22 Jul 2020 07:46:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 2/2] virtio-mmio: Reject invalid IRQ 0 command line
 argument
Message-ID: <20200722074630-mutt-send-email-mst@kernel.org>
References: <20200701221040.3667868-1-helgaas@kernel.org>
 <20200701221040.3667868-3-helgaas@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200701221040.3667868-3-helgaas@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
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

On Wed, Jul 01, 2020 at 05:10:40PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The "virtio_mmio.device=" command line argument allows a user to specify
> the size, address, and IRQ of a virtio device.  Previously the only
> requirement for the IRQ was that it be an unsigned integer.
> 
> Zero is an unsigned integer but an invalid IRQ number, and after
> a85a6c86c25be ("driver core: platform: Clarify that IRQ 0 is invalid"),
> attempts to use IRQ 0 cause warnings.
> 
> If the user specifies IRQ 0, return failure instead of registering a device
> with IRQ 0.
> 
> Fixes: a85a6c86c25be ("driver core: platform: Clarify that IRQ 0 is invalid")
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: virtualization@lists.linux-foundation.org

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/virtio/virtio_mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 9d16aaffca9d..627ac0487494 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -641,11 +641,11 @@ static int vm_cmdline_set(const char *device,
>  			&vm_cmdline_id, &consumed);
>  
>  	/*
> -	 * sscanf() must processes at least 2 chunks; also there
> +	 * sscanf() must process at least 2 chunks; also there
>  	 * must be no extra characters after the last chunk, so
>  	 * str[consumed] must be '\0'
>  	 */
> -	if (processed < 2 || str[consumed])
> +	if (processed < 2 || str[consumed] || irq == 0)
>  		return -EINVAL;
>  
>  	resources[0].flags = IORESOURCE_MEM;
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
