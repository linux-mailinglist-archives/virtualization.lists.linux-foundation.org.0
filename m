Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940221A68A
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 20:01:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 850368834E;
	Thu,  9 Jul 2020 18:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3KHTGhsZnSR; Thu,  9 Jul 2020 18:01:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E855B88301;
	Thu,  9 Jul 2020 18:01:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF07FC016F;
	Thu,  9 Jul 2020 18:01:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8B4EC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 18:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 916AC882BB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 18:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4iTL1irzt-R
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 18:01:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 052D9882B9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594317691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RMDjyEYcFI6gdBDQideBKxDS0JZBtvUdaUYhw9E2e5k=;
 b=A9XcaEI2JIYj6wdWulLdSCpVMX7ap6IDNnLuI+PByD6nkjP6zjMCZONSu/ipsq0spaeIXz
 TXCjtJCGTMtbhTMeoo974ot3Ioup84VyXiYPNcfKbvLbIY+DWf7ups3dNivRo+hv5LH1Cf
 5S8ELIGaAywbPl08nd/z1/e0jFHGKSg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-ppZbgSIiMlWwEpqudvMsZw-1; Thu, 09 Jul 2020 14:01:30 -0400
X-MC-Unique: ppZbgSIiMlWwEpqudvMsZw-1
Received: by mail-wm1-f70.google.com with SMTP id v6so2958694wmg.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 11:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RMDjyEYcFI6gdBDQideBKxDS0JZBtvUdaUYhw9E2e5k=;
 b=mJVDxyW+rOEK6xiVdG4KVsmQZyOX+h6PmCLIszCee3iykqP8V0EZyQWrNQ3IHe1Tgd
 BEPmIpZm9OYnhVeLSethIjWT/YheMeeaQR2AtsBm0JPfwzvqvwln5IbbFLnw5b6RMUS0
 c1JoX/BriNL3YgWzAY0l3Fy5l5URiB0/cO1rFqKh7euUZFsl0uDhxEe1frlB8cFuGyv2
 e7szLyrcKORn4e7gUjixG592DXgrp3MVmyQLpHDWgUR3es5s8wTa8MIXVev2rUerNYQB
 0XIIKs6cjn1uUJXPkkYq+y+13AltaNJhV/241ZblVZCzuXqJagy5S9zWjFnKOvUt4SVy
 QQOQ==
X-Gm-Message-State: AOAM532a/s8/RmB4xacCBVilsC457YUiGyTJSGAfnA0D38a528FW8oK4
 DJgNCME6/xzDpWR/MsBwzJMF33wREdRAY6XSANiUtSnNc4kAM956qPeNM2CYuEBHYZpaqUjQ27o
 ejpDLoVHCVF9fjbusQRNnrpOb5sdbkLiR9ddMUmoV6g==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr68299611wrp.77.1594317687697; 
 Thu, 09 Jul 2020 11:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzry8iHdlGY/tXFHdCmrjjNroFcuFEkfGZh1gKUcbnkdVacPAMWf+y7WZrotWreuoms1y+FXg==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr68299581wrp.77.1594317687435; 
 Thu, 09 Jul 2020 11:01:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id w17sm6397333wra.42.2020.07.09.11.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 11:01:26 -0700 (PDT)
Subject: Re: [PATCH 12/24] scsi: virtio_scsi: Demote seemingly unintentional
 kerneldoc header
To: Lee Jones <lee.jones@linaro.org>, jejb@linux.ibm.com,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org
References: <20200709174556.7651-1-lee.jones@linaro.org>
 <20200709174556.7651-13-lee.jones@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ab85392c-2095-4023-4e20-503ee248a538@redhat.com>
Date: Thu, 9 Jul 2020 20:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709174556.7651-13-lee.jones@linaro.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

On 09/07/20 19:45, Lee Jones wrote:
> This is the only use of kerneldoc in the sourcefile and no
> descriptions are provided.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/scsi/virtio_scsi.c:109: warning: Function parameter or member 'vscsi' not described in 'virtscsi_complete_cmd'
>  drivers/scsi/virtio_scsi.c:109: warning: Function parameter or member 'buf' not described in 'virtscsi_complete_cmd'
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/scsi/virtio_scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
> index 0e0910c5b9424..56875467e4984 100644
> --- a/drivers/scsi/virtio_scsi.c
> +++ b/drivers/scsi/virtio_scsi.c
> @@ -100,7 +100,7 @@ static void virtscsi_compute_resid(struct scsi_cmnd *sc, u32 resid)
>  		scsi_set_resid(sc, resid);
>  }
>  
> -/**
> +/*
>   * virtscsi_complete_cmd - finish a scsi_cmd and invoke scsi_done
>   *
>   * Called with vq_lock held.
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
