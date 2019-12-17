Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E412369B
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 21:11:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2350E86911;
	Tue, 17 Dec 2019 20:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SO4g_xf_abN0; Tue, 17 Dec 2019 20:11:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BC14868F3;
	Tue, 17 Dec 2019 20:11:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79FC4C077D;
	Tue, 17 Dec 2019 20:11:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 683F4C077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5199187D41
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1fyDh+bupQP
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:11:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 492FF87B18
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 20:11:07 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j26so3255121ljc.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 12:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IhOckD76IYosFsL3fNH5wHclYGh+F14DuD7rqFCf6w0=;
 b=hKgu92NZqr0NNUKjzHULdJzb287WUdvPYr9/iJ5bTQLo7La7AL83Z8Y0Dnp3sUqA2V
 yPgmSgeCvbKzHi35Tyuc0/EzZkLYxpnu2oWgxE5QCZeBzpL6ra88wyo1KYA+yrkT3u3q
 VTxA5/xayfxjW4oPqiKNz7WBVX/Pdfy+6/Rk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IhOckD76IYosFsL3fNH5wHclYGh+F14DuD7rqFCf6w0=;
 b=lnqXSu4u+zCE/MG6pzUGVXOgHoLqi1D2ZhNppiZzUcLP0OsoBZYsDDhA41lnBZs5u8
 TF5dBh/nTnftBBLHq4nRhne2AH0J+Tp+AUxiychx6V2ntsm7ADfbcA4TgZ2ZiDjTlzTu
 xlFzdi74BHG1ikKCukX4M7LWGFGPe/D0F6q2OfLXhmGVgpx7smbkCWX6psAbxxFW5un5
 UVrXqOOom/BJaHAf3e4yQDD9Quwzj/WT8+iG4V+9U3by5GM+UY5s++4eg3wafOPiuFSH
 RrS6yzQguS/glwJRmF8XNSP0QyjuuW7xseXVOWqma8TT+a7keRYFCiuoZjtYRLPIUh/3
 UuWQ==
X-Gm-Message-State: APjAAAUGWb+mWFBFEK0C4xUeG9MDLBr4sFz3tzLJBNuCHqzF5FnSvEfz
 sOhciP0kIq5ysGgoRwnjE9KhIk89MBo=
X-Google-Smtp-Source: APXvYqxtwt92Eg3KNW3PPbmk5DMFEAO0xg+LHNkseDM5GiQG8uFWZrLEQmqOZEGqFnTzGKu6G9CJ+A==
X-Received: by 2002:a2e:9bcc:: with SMTP id w12mr4552201ljj.105.1576613464068; 
 Tue, 17 Dec 2019 12:11:04 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id c189sm11299389lfg.75.2019.12.17.12.11.02
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 12:11:02 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id a13so12367580ljm.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 12:11:02 -0800 (PST)
X-Received: by 2002:a2e:99d0:: with SMTP id l16mr4624730ljj.1.1576613462203;
 Tue, 17 Dec 2019 12:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20191217190610.248061-1-dverkamp@chromium.org>
 <20191217150500-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191217150500-mutt-send-email-mst@kernel.org>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Tue, 17 Dec 2019 12:10:35 -0800
X-Gmail-Original-Message-ID: <CABVzXAkeYehSS_DWTBm0Ebx+ei+_TFmdBGEgxXHAsb4rVBrU-A@mail.gmail.com>
Message-ID: <CABVzXAkeYehSS_DWTBm0Ebx+ei+_TFmdBGEgxXHAsb4rVBrU-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio-balloon: initialize all vq callbacks
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux-foundation.org
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

On Tue, Dec 17, 2019 at 12:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Dec 17, 2019 at 11:06:09AM -0800, Daniel Verkamp wrote:
> > Ensure that elements of the array that correspond to unavailable
> > features are set to NULL; previously, they would be left uninitialized.
> >
> > Since the corresponding names array elements were explicitly set to
> > NULL, the uninitialized callback pointers would not actually be
> > dereferenced; however, the uninitialized callbacks elements would still
> > be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
> > vectors required.
> >
> > Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> > Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
>
> Actually, we already have the issue with the stats VQ, no?
>
> So I think this one is more appropriate:
> Fixes: 9564e138b1f6 ("virtio: Add memory statistics reporting to the balloon driver (V4)")

I think things were OK in 9564e138b1f6 because nvqs was calculated
based on the available features, so the later elements of the array
would not have been inspected by find_vqs.  86a559787e6f introduced
the uninitialized array elements as well as the removal of dynamic
nvqs based on features.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
