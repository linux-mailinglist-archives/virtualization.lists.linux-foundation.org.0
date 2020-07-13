Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB4B21D4C5
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 13:23:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C4658965F;
	Mon, 13 Jul 2020 11:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIn2r24ck6h5; Mon, 13 Jul 2020 11:23:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4627A89641;
	Mon, 13 Jul 2020 11:23:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13624C0733;
	Mon, 13 Jul 2020 11:23:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9CF5C0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91836250E3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Py2Fl+Cjfhwu
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:23:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 5D740250D0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594639405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cp13jJuIIl8muXNVHzNvpxZz6DmTE1jSSxstK7LrSuw=;
 b=I3YD8cpEE4+NDUiKJZs0nC847r4KvTlXO5w+cYdNCz+RB7DA8nBMVFq5U5oA0C2vP7ilN4
 1k00JdZlNvegDiGid8fBmAQMLoZK41kC7W6zXQUD9re9jvSDfRqRqyWc7uPdFwTuy+YGPS
 v5nOrzgpFjA04oerRdCrjUnVpQjj1rA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-7qa2u-ueP72eOQlDFCoYKg-1; Mon, 13 Jul 2020 07:23:23 -0400
X-MC-Unique: 7qa2u-ueP72eOQlDFCoYKg-1
Received: by mail-wr1-f72.google.com with SMTP id 89so17376741wrr.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 04:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cp13jJuIIl8muXNVHzNvpxZz6DmTE1jSSxstK7LrSuw=;
 b=jidTy37x3eBjA9Q1tMZ4QXQbj31dl5smU9OGsSOp+yp0k9PQCus4pNWZQafv8vpltu
 G22e5kmMHQf44H3cL0Fxu57J2HxacjcvFBMW1swGsTSl2kLTSuFYUsy8hlYt4jPUeU9n
 IYBpeX++KYrOo7R997ltPCA1PBNgTVay9Qy8BQ1gpnPMRMQFYH+9MjGuT90+Ky06HY/h
 VyU/QvEhuvXISxTXyrLGLZuVTKnizd/Cy8Tr4Ex5ssp7z1gTUs6FohYwUl8xQMvrIxWW
 BmIziwMdTaZ7qznjFYgyWi6JthZv/C2JbxqQvpkfd/HYx6WgGyZkgde+CtIb8EtFnMDt
 j8uQ==
X-Gm-Message-State: AOAM531can5bBnUrm/B4WC82yP0i0WSS88NKC8W1zQYLug7toDkqK1TO
 ev9ZbJ7dVnOWjJmKJI/15ITU+GHg/EbMyYHIvFs8dBXbtEPiP4F5QNs7qF8cynNsWLjINCUAiXk
 jBZVAoxuaUCrs+4LFV90uISkHK/qKqxYOjp86gmCz1A==
X-Received: by 2002:adf:84e2:: with SMTP id 89mr82610819wrg.139.1594639402329; 
 Mon, 13 Jul 2020 04:23:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzoCrHCmvHA+9tYCCZvkKCKZhV/F4YlMxW4KU+tbDXUAXf+8nTnhjTJ8IHP6HmlwcPSxo1PQ==
X-Received: by 2002:adf:84e2:: with SMTP id 89mr82610801wrg.139.1594639402164; 
 Mon, 13 Jul 2020 04:23:22 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id m16sm25473869wro.0.2020.07.13.04.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 04:23:21 -0700 (PDT)
Date: Mon, 13 Jul 2020 07:23:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 12/24] scsi: virtio_scsi: Demote seemingly
 unintentional kerneldoc header
Message-ID: <20200713071453-mutt-send-email-mst@kernel.org>
References: <20200713080001.128044-1-lee.jones@linaro.org>
 <20200713080001.128044-13-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200713080001.128044-13-lee.jones@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 jejb@linux.ibm.com
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

On Mon, Jul 13, 2020 at 08:59:49AM +0100, Lee Jones wrote:
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
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls merge with the rest of the patches (which tree is this for?)

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
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
