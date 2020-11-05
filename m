Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3E92A77A6
	for <lists.virtualization@lfdr.de>; Thu,  5 Nov 2020 08:01:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A6163855A1;
	Thu,  5 Nov 2020 07:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NoRPF3WbQSP5; Thu,  5 Nov 2020 07:00:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3ABD585580;
	Thu,  5 Nov 2020 07:00:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23FCAC0889;
	Thu,  5 Nov 2020 07:00:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68C81C0889
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4CC2785579
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxQc_jw123dW
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:00:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D210C85572
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 07:00:57 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x13so667699pfa.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Nov 2020 23:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=In22z4zSRFjmN0f9ZWT4tSWe/e4QLia1xEowLwJnVsw=;
 b=MXqPgs8+6JTdO/hUoDQw5oReQIcGnaaVfUbxHiTj/WNMBS0cf3z4ohV+gF45hY58w/
 aoFliyd9R/tnYceFsDd1i5ZqyVInBUwnOTkO0iGVPUyoNe059GQEoAK6RMQUzn3dMo1l
 n9M7VKH4+IyCkaIL+7QBE2LQmvswOpQQnMjujNrQlvxsPx87Z28CxZPz+egzh8LAELS1
 S+F/AqaP302QLGtQjTyL4M7IxF1We073NibdHPAzDHgpmmJILhf1mJaq6BnvAlrSjSh2
 LzOl1rH84hlkjcyzBvUXH9e57VW746Fzr1Vd5+qP9c9nk8Gtt7KQOSjZhfNjGgPBap4m
 fuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=In22z4zSRFjmN0f9ZWT4tSWe/e4QLia1xEowLwJnVsw=;
 b=az0ErELFf3pWyJe7A4MoKUFyYKItU5SNBiPN9leu9VSyM+g5HJlB4y4xWDUbhXoVNB
 ooNcUNOivM1k4KQ4wPLaA/Jpo8MJDizl0PAFovHDGauHKH+yaShKLvUkkStmTeEw+AUO
 VnOiJTIPozm+JBzainUYwR7FXBI7AKkjqXrykMBq9Pnbv4xTbztLlsXfQKhtzkd98V/N
 82V4Uuef+VGFQyi6ythetmw0eIknwFWuwOSGb+//pFKX0dsHOiOm4wouun+kAjHyYpHf
 h6cMBU/JPbP0sdPbgFBaV4OrkPrjZ3aHHC2MWYVX5WWGcdI5w2+X8vlU80Tdsf9/1YSG
 dODw==
X-Gm-Message-State: AOAM533txL1pMkScCsw21nK51xBSbsIpqA+LlSXmxyVT5xH7ux98w1Uu
 c8qZgLHKWutCUgG5gO9Rcxc=
X-Google-Smtp-Source: ABdhPJxccwbMNiHKtX8PlDU2gsnrWVHgRU2ASpOcGh5rnfj0CZusDbR0R9TyZJHcK06SvgZWWBZTOw==
X-Received: by 2002:a65:4b84:: with SMTP id t4mr1159089pgq.138.1604559657437; 
 Wed, 04 Nov 2020 23:00:57 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
 by smtp.gmail.com with ESMTPSA id c11sm814474pjn.26.2020.11.04.23.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 23:00:56 -0800 (PST)
Date: Thu, 5 Nov 2020 16:00:54 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: use kvmalloc for large allocations
Message-ID: <20201105070054.GD128655@google.com>
References: <20201105014744.1662226-1-senozhatsky@chromium.org>
 <20201105065233.3td3zuyfmbypjtvq@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105065233.3td3zuyfmbypjtvq@sirius.home.kraxel.org>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Suleiman Souhlal <suleiman@google.com>
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

Hi,

On (20/11/05 07:52), Gerd Hoffmann wrote:
> > -	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
> > -			      GFP_KERNEL);
> > +	*ents = kvmalloc_array(*nents,
> > +			       sizeof(struct virtio_gpu_mem_entry),
> > +			       GFP_KERNEL);
> 
> Shouldn't that be balanced with a kvfree() elsewhere?

I think it already is. ents pointer is assigned to vbuf->data_buf,
and free_vbuf() already uses kvfree(vbuf->data_buf) to free it.

	-ss
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
