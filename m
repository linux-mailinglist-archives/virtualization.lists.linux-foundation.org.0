Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DDA4025F1
	for <lists.virtualization@lfdr.de>; Tue,  7 Sep 2021 11:07:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 993E982813;
	Tue,  7 Sep 2021 09:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsVlOoMN3RfA; Tue,  7 Sep 2021 09:07:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 622998290B;
	Tue,  7 Sep 2021 09:07:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6688C000D;
	Tue,  7 Sep 2021 09:07:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A2A7C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 09:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C2E860BE9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 09:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCyyjN2DaCAV
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 09:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5852460BA3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631005654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAbrajUImQsNbl+54xKWY1HmrI2rlWAF0jAOLQ+Wpp0=;
 b=RsIfrasbUTi6NjG5ploafVG1iViS6oZPPz3r5taRr5Le1pmtDQXUS65DMR6BH0S9NS0nYk
 fzLQLgaMR32+cT1sU/oLv34lnPcwgFFeaJhuiPwTeoxvvxmKFyItzGTClecX7NaCS+PI0v
 d+cR0I/iMGUbkPDcCRomPMfpaRyjvxw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-7Op_6TvrNL6TLQdw4_C81w-1; Tue, 07 Sep 2021 05:07:33 -0400
X-MC-Unique: 7Op_6TvrNL6TLQdw4_C81w-1
Received: by mail-lj1-f197.google.com with SMTP id
 q62-20020a2e2a41000000b001d37080f948so4489844ljq.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Sep 2021 02:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qAbrajUImQsNbl+54xKWY1HmrI2rlWAF0jAOLQ+Wpp0=;
 b=ElPCqZ2dLK/51ijzERNXbcizCMSdleNUTLzTlgHWBvfHSQnQ2MYASHg4DClozhng9y
 oKYSXFHprkXFYSyTVA6K4zGtQ5EH0YV4MysTHxBjyfO97ArFuwCmkCyA7gFAxOrfHxXa
 GwB6J0ezSj0gfwwWPSYZaSUP74lUF58p9+teeq395iEtAg/UK2l4RMZ/44RUuH+xcYeo
 58vcay03sGcDC2jGji1cI0pCA4IOTYAObRcBJRXfVgO63bgKQmFVL5qRRY2Mr0WPJFZ+
 ZeL5A+9slOxU+4faKAagSbKeAgOcJ3OKe167h9Hjcrk2As+pfXj6N+YLmeA09vTsmXcn
 0pRA==
X-Gm-Message-State: AOAM530x3hyidit2stwlDjZcArXiLEsZ4+BAacEUItmaByMb0nu9kE7e
 JuHrRHQYNoR99eNtKmarXuroLxg2pqIXBmuPvCqZxu8rsqKEsVcfUEopmD7vihAC/iJo9H/ew2J
 p0u8+IBf2qH16ZzOoMJEIRHUQd48oWQIfogqYxQGfWPvhl6EVF9JjNFQShQ==
X-Received: by 2002:a05:651c:b09:: with SMTP id
 b9mr13632669ljr.307.1631005651616; 
 Tue, 07 Sep 2021 02:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyA6rmhH92bvEWu5eHDzbTkJhlWL/S7ozNl5daqqIyvMCYBZW0fhd4JHi1HidLOXMM7y8Jq3TpJyu7x5JjY70=
X-Received: by 2002:a05:651c:b09:: with SMTP id
 b9mr13632654ljr.307.1631005651422; 
 Tue, 07 Sep 2021 02:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210907073253.GB18254@kili>
In-Reply-To: <20210907073253.GB18254@kili>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 7 Sep 2021 17:07:20 +0800
Message-ID: <CACGkMEux1WRD_9kWhvUXThwWo7DUPCM==eXAj9PO6mqcAvVtQQ@mail.gmail.com>
Subject: Re: [PATCH] vdpa: potential uninitialized return in
 vhost_vdpa_va_map()
To: Dan Carpenter <dan.carpenter@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Xie Yongji <xieyongji@bytedance.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 kernel-janitors@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
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

On Tue, Sep 7, 2021 at 3:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The concern here is that "ret" can be uninitialized if we hit the
> "goto next" condition on every iteration through the loop.
>
> Fixes: 41ba1b5f9d4b ("vdpa: Support transferring virtual addressing during DMA mapping")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/vhost/vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index d0c0fedf2c09..170166806714 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -640,7 +640,7 @@ static int vhost_vdpa_va_map(struct vhost_vdpa *v,
>         u64 offset, map_size, map_iova = iova;
>         struct vdpa_map_file *map_file;
>         struct vm_area_struct *vma;
> -       int ret;
> +       int ret = 0;
>
>         mmap_read_lock(dev->mm);
>
> --
> 2.20.1
>

Acked-by: Jason Wang <jasowang@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
