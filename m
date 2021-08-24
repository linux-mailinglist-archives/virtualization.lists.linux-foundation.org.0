Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6973F55F2
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 04:48:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 316BE608B5;
	Tue, 24 Aug 2021 02:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8fFFkjSGITi; Tue, 24 Aug 2021 02:48:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0E4AD60733;
	Tue, 24 Aug 2021 02:48:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75C0AC000E;
	Tue, 24 Aug 2021 02:48:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A101AC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 874C440379
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NOgU-qu_9z0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:48:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44C8A40457
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629773281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fwaWgiERsG1JcbIwR2cIzqtgKwKsqVeO59xySGEKNhA=;
 b=L5VzPyokBIFGBROEn4jng2CRJehjBdHktRq3NEy41w5fZBqXMk0VYx/gQUCvDJ7+T0XTTe
 Zwb2tllIV81tsyzMucASLhFk2VKUMDD1UPk4q5NtgwI/KEaiTJwfDlMuVHOi4DO3fwRIjT
 3jSt1UYWRgpyIN6KVXczlXirCjxnqc8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-v2q9UDnzOBqUsv9woBIBYw-1; Mon, 23 Aug 2021 22:47:59 -0400
X-MC-Unique: v2q9UDnzOBqUsv9woBIBYw-1
Received: by mail-lj1-f198.google.com with SMTP id
 w28-20020a2e161c000000b001ba14fc0cd4so7023686ljd.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Aug 2021 19:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fwaWgiERsG1JcbIwR2cIzqtgKwKsqVeO59xySGEKNhA=;
 b=jdFkl2mitJLIGCMEjtEGhArzuS3UMBDqiB8YstwTeYXI8GqStRnd0cNhYZe0rRUisp
 RN7XLyvRrtBzcGMSn6ULnBUxYAvy6qkABZUZLGifO8hleBdAZKMkCIVz32l9YTNK42s7
 K/Dg5yJ/3qwlGCYP0CqSTPR9eC5aWm68Dz809n6gRXEe0ZZfdaadv9VZJx4qCy6AiYLm
 1kyRIzaRShL5KDOFKqwhMzsQwINVKzguF0lTi7h9I2GwM7Qlm4SnbsW/JbDDdqtBB6J6
 enCzN5YcrlrDzJWhCz6oYoxi0t1K2VuCTh36VFPDCx3rRA8cpnco6QDWUBvxBlMmSHG/
 CF6w==
X-Gm-Message-State: AOAM530HBk/DcvtAK7QYniojCcerowpJmuPqbm6Xjv8ODGtAu7/PDOYm
 pcnz2hc2OHVixpVGVbSWvT27iuxNCyH6TwuM9BqlA5npEypPH5Am1pHxUfzUOZHQVkN2VX0NoMn
 n2/Raw1Q5r8kcmZ/DJLN0oRCnSkwQ3qqj2f+pjHJx+vaQAIhjZiC278aWrQ==
X-Received: by 2002:a2e:bf23:: with SMTP id c35mr29023161ljr.404.1629773278450; 
 Mon, 23 Aug 2021 19:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRj72YTFI5L2JcyZ+SRAIpY0EIDTg26qrzM45Tor/6ZXhVwoZ2v9X2i+Ndkrplm/lp6kSxo3hJVi4QwS74z+4=
X-Received: by 2002:a2e:bf23:: with SMTP id c35mr29023150ljr.404.1629773278247; 
 Mon, 23 Aug 2021 19:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210809101609.148-1-xieyongji@bytedance.com>
 <e6ab104e-a18b-3f17-9cd8-6a6b689b56b4@nvidia.com>
 <CACycT3sNRRBrSTJOUr=POc-+BOAgfT7+qgFE2BLBTGJ30cZVsQ@mail.gmail.com>
 <dc8e7f6d-9aa6-58c6-97f7-c30391aeac5d@nvidia.com>
 <CACycT3v83sVvUWxZ-+SDyeXMPiYd0zi5mtmg8AkXYgVLxVpTvA@mail.gmail.com>
 <06af4897-7339-fca7-bdd9-e0f9c2c6195b@nvidia.com>
 <CACycT3usFyVyBuJBz2n5TRPveKKUXTqRDMo76VkGu7NCowNmvg@mail.gmail.com>
 <6d6154d7-7947-68be-4e1e-4c1d0a94b2bc@nvidia.com>
 <CACycT3sxeUQa7+QA0CAx47Y3tVHKigcQEfEHWi04aWA5xbgA9A@mail.gmail.com>
 <7f0181d7-ff5c-0346-66ee-1de3ed23f5dd@nvidia.com>
 <20210823080952-mutt-send-email-mst@kernel.org>
 <b9636f39-1237-235e-d1fe-8f5c0d422c7d@nvidia.com>
In-Reply-To: <b9636f39-1237-235e-d1fe-8f5c0d422c7d@nvidia.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 24 Aug 2021 10:47:47 +0800
Message-ID: <CACGkMEuc0C0=te3O6z76BniiuHJgfxHnaAZoX=+PCy4Y7DxRow@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-blk: Add validation for block size in config
 space
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 linux-block@vger.kernel.org, Yongji Xie <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Tue, Aug 24, 2021 at 6:31 AM Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>
>
> On 8/23/2021 3:13 PM, Michael S. Tsirkin wrote:
> > On Mon, Aug 23, 2021 at 01:45:31PM +0300, Max Gurtovoy wrote:
> >> It helpful if there is a justification for this.
> >>
> >> In this case, no such HW device exist and the only device that can cause
> >> this trouble today is user space VDUSE device that must be validated by the
> >> emulation VDUSE kernel driver.
> >>
> >> Otherwise, will can create 1000 commit like this in the virtio level (for
> >> example for each feature for each virtio device).
> > Yea, it's a lot of work but I don't think it's avoidable.
> >
> >>>>>>> And regardless of userspace device, we still need to fix it for other cases.
> >>>>>> which cases ? Do you know that there is a buggy HW we need to workaround ?
> >>>>>>
> >>>>> No, there isn't now. But this could be a potential attack surface if
> >>>>> the host doesn't trust the device.
> >>>> If the host doesn't trust a device, why it continues using it ?
> >>>>
> >>> IIUC this is the case for the encrypted VMs.
> >> what do you mean encrypted VM ?
> >>
> >> And how this small patch causes a VM to be 100% encryption supported ?
> >>
> >>>> Do you suggest we do these workarounds in all device drivers in the kernel ?
> >>>>
> >>> Isn't it the driver's job to validate some unreasonable configuration?
> >> The check should be in different layer.
> >>
> >> Virtio blk driver should not cover on some strange VDUSE stuff.
> > Yes I'm not convinced VDUSE is a valid use-case. I think that for
> > security and robustness it should validate data it gets from userspace
> > right there after reading it.
> > But I think this is useful for the virtio hardening thing.
> > https://lwn.net/Articles/865216/
>
> I don't see how this change is assisting confidential computing.
>
> Confidential computingtalks about encrypting guest memory from the host,
> and not adding some quirks to devices.

In the case of confidential computing, the hypervisor and hard device
is not in the trust zone. It means the guest doesn't trust the cloud
vendor.

That's why we need to validate any input from them.

Thanks

>
> >
> > Yongji - I think the commit log should be much more explicit that
> > this is hardening. Otherwise people get confused and think this
> > needs a CVE or a backport for security.
> >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
