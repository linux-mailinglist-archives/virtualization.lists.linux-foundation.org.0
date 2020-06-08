Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADB1F1BDA
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 17:17:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CDED87277;
	Mon,  8 Jun 2020 15:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzJ3h3pOq5mI; Mon,  8 Jun 2020 15:17:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3260D87117;
	Mon,  8 Jun 2020 15:17:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13D0FC016F;
	Mon,  8 Jun 2020 15:17:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B662C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 15:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A955861C8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 15:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHPF0jZw6SgL
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 15:17:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5861861A1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591629447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hGKEH1dhLlDad944CTVO7vApiXCC7og9k/LEAwnlxtw=;
 b=A8+gs2el5RBoxqjjoc5bsJNPcn+wbSVtitbFs+5czDHk2bhCJA1o7BfrADa2YU3Z2qkzIu
 8aYUIX1ttaQe87sJARGk8hVLidyj983HAzxuMKB06k/L1i6csTJ92MgD3izOVteq6RBjwb
 H3pf4b1jJPvS6TLNLFflT5GgI5x9Re8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-flsqa4hvPWiKZKpyY0Kvdg-1; Mon, 08 Jun 2020 11:17:23 -0400
X-MC-Unique: flsqa4hvPWiKZKpyY0Kvdg-1
Received: by mail-wr1-f69.google.com with SMTP id d6so7287517wrn.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 08:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hGKEH1dhLlDad944CTVO7vApiXCC7og9k/LEAwnlxtw=;
 b=eKACJl2AnAAl4HpM72nrVpHRxqXIO3hU+/m0cTQuV8BvqoDhv+lQrMYX1PAA4sxpiv
 6/2UqREzBoWrkd6OGW1E8oFHtyV1MIHwBu5OG4/L4PRlw4Ut9+UlivnuQF9ci6Q05F9j
 dTtOdd7gKqx/09eJXdl/8qxyVEPYGy+n7AF+5aZZEt2CGJkpmMWWco6gfe3g7afAjeUV
 8g7KkvWXMXG8YUkEzUPDcERnbbYwv9YA/Q2OH08YINj7f2TAzezlgL8zX3RVxjtNkzkq
 mXJmHkZQwQ0fwiDDWIoEtg7D6wOyzFO8MH69pN4QUH3jPPU5qNp+8CuHhqd6DdEnBfuC
 yqWg==
X-Gm-Message-State: AOAM533ObkD7sEmFGA/w269EPy0WLPToVwLGyxJro2uXdwO8ChX5fksS
 s2tg738NfPLtaso6EUafHd6VsyXZOn0Y/RcYJjICoVqp7kgFi1bgn8wMH1tPVeLc0sefmKA4tbc
 VIkczArbLcE8DpfwWg1VjhTZwUgaCPpE+V2AF3PLmaA==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr25340196wrs.313.1591629442391; 
 Mon, 08 Jun 2020 08:17:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXf+wDGo8rFUPMEZIpkA8dnO+aIv3ypXkkQNVdstQgDrqG+2iMjbON1WrY0DIT27qSEK9x+g==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr25340181wrs.313.1591629442198; 
 Mon, 08 Jun 2020 08:17:22 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 h29sm24085wrc.78.2020.06.08.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 08:17:21 -0700 (PDT)
Date: Mon, 8 Jun 2020 11:17:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200608111647-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
 <20200608054234-mutt-send-email-mst@kernel.org>
 <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj6kF2JFyC9c0CY5_f-cv6r97501Z2f8D9x0VhQpRen+bw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Mon, Jun 08, 2020 at 07:36:55PM +0900, David Stevens wrote:
> On Mon, Jun 8, 2020 at 6:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > > > +             vgdev->has_resource_assign_uuid = true;
> > > > > +     }
> > > >
> > > >
> > > > Just a question: this relies on DMA bufs so I assume it is
> > > > not really assumed to work when DMA API is bypassed, right?
> > > > Rather than worry what does it mean, how about just
> > > > disabling  this feature without PLATFORM_DMA for now?
> > >
> > > By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?
> >
> > Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
> > future will be renamed to VIRTIO_F_PLATFORM_ACCESS.
> 
> Shouldn't things work independent of whether or not that feature is
> set? If a virtio driver properly uses the dma_buf APIs (which virtgpu
> seems to), then that should take care of any mapping/synchronization
> related to VIRTIO_F_IOMMU_PLATFORM. If anything, the case where
> VIRTIO_F_IOMMU_PLATFORM isn't set is easier, since then we know that
> the "the device has same access [sic] to memory addresses supplied to
> it as the driver has", according to the specification.
> 
> -David

I don't know much about drm so I can't tell, I was hoping Gerd can
explain.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
