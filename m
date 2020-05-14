Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D471D2FB3
	for <lists.virtualization@lfdr.de>; Thu, 14 May 2020 14:29:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1471289695;
	Thu, 14 May 2020 12:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxI3O4G6pDVB; Thu, 14 May 2020 12:29:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5AD758968E;
	Thu, 14 May 2020 12:29:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36EC5C016F;
	Thu, 14 May 2020 12:29:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D5CDC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E612322BA3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbxYb10tKG+n
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:28:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by silver.osuosl.org (Postfix) with ESMTPS id A9936226B7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:28:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y3so3844588wrt.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 May 2020 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MhSXdQmfGHknlE+HXPCeR7P0ZV8ATRBftwFVeEaaAyc=;
 b=Y7Vf7sChBCU2rfY8xBEExV0I7QnH8MFNWEbOMktjW3Gqlslx3DnyxK4la9SJtQSxKI
 qA++/9v8+v5pkkRVDBpP4CdBvWBlirOOedPFWd8Aq1yzrLg/tcnPNWRJcRikJ/+OFVkM
 VlrAr49vd56PtJvX3vY9cjGnsRty23kLF2Xlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MhSXdQmfGHknlE+HXPCeR7P0ZV8ATRBftwFVeEaaAyc=;
 b=mkxGGby+4KoPS0HfPvBPTJHbvNCDa17H81eFc8Xx3MS2jtZc1+iJmYlliHFlnS0LAo
 Af/gOGOLoLY9l9OPdy42/A1tCa9tnQogdpjhvsN25CkF6d0Dg87csvngWaolWgtgo474
 bG2N7DqgDv/Y/sru3pekIMNrEBWKQKm9Br1nD0jC72JVk9Z0x4XFgasWT+GWw3qWjZgJ
 Rs7jaeEbV8v4Z5B+Jn3FxmHpBHvaxutGoLKeO8UdU8TtJdvN3UZq4MhO25UiJnkK8oSs
 /JtcWrCfqWoUH2qNf2643fKhkTy6i2NDUtSWlWaIsHHvlLLMeqRvrkR/MDeXqqwT2vd3
 HqDw==
X-Gm-Message-State: AOAM532sdQ4Xc/jUTDOEEp8ML7zCphThRYwDoaCYTdIVqik2EK5BzDfO
 GgmiBjL/aEP4TVWfi1Rab49vRw==
X-Google-Smtp-Source: ABdhPJyi0dv4TvrSEI6BLeM7V23XeYGER8KAK6n/kWqLKYuPlyYwM4QLzJwBgLkyP3bhqCn4hd3iBw==
X-Received: by 2002:adf:f38b:: with SMTP id m11mr5136675wro.65.1589459334793; 
 Thu, 14 May 2020 05:28:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b2sm4451847wrm.30.2020.05.14.05.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:28:53 -0700 (PDT)
Date: Thu, 14 May 2020 14:28:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514122851.GO206103@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6d9gdZegTGad6thKdHv5b+qOZnkCv5VcWo9AcHifR9uA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj6d9gdZegTGad6thKdHv5b+qOZnkCv5VcWo9AcHifR9uA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

On Thu, May 14, 2020 at 11:08:52AM +0900, David Stevens wrote:
> On Thu, May 14, 2020 at 12:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Mar 11, 2020 at 12:20 PM David Stevens <stevensd@chromium.org> wrote:
> > >
> > > This change adds a new dma-buf operation that allows dma-bufs to be used
> > > by virtio drivers to share exported objects. The new operation allows
> > > the importing driver to query the exporting driver for the UUID which
> > > identifies the underlying exported object.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> >
> > Adding Tomasz Figa, I've discussed this with him at elce last year I
> > think. Just to make sure.
> >
> > Bunch of things:
> > - obviously we need the users of this in a few drivers, can't really
> > review anything stand-alone
> 
> Here is a link to the usage of this feature by the currently under
> development virtio-video driver:
> https://markmail.org/thread/j4xlqaaim266qpks
> 
> > - adding very specific ops to the generic interface is rather awkward,
> > eventually everyone wants that and we end up in a mess. I think the
> > best solution here would be if we create a struct virtio_dma_buf which
> > subclasses dma-buf, add a (hopefully safe) runtime upcasting
> > functions, and then a virtio_dma_buf_get_uuid() function. Just storing
> > the uuid should be doable (assuming this doesn't change during the
> > lifetime of the buffer), so no need for a callback.
> 
> So you would prefer a solution similar to the original version of this
> patchset? https://markmail.org/message/z7if4u56q5fmaok4

yup.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
