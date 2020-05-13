Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B01D19BC
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 17:45:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D363C882FB;
	Wed, 13 May 2020 15:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oycYbEG-DR2U; Wed, 13 May 2020 15:45:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16B06882C7;
	Wed, 13 May 2020 15:45:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2FE4C016F;
	Wed, 13 May 2020 15:45:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3B80C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 15:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9866120243
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 15:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRkDeIimEsNZ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 15:45:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 35AAA20111
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 15:45:12 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i13so21807772oie.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mei1LatTmGdj+EOMqNvHhmuC380OhE62eU0mPCj4HIU=;
 b=TIT8H80mk+o//K+Djr3m9ymdXjqeJJh7T1O0QGR3OB+cw9gH6v6k/2XsLqv7s+oaGI
 UWDF28wRCnpwGYavm+XRQfy+8o2ez7RJBPSI+LHD5tVHIt5p1Sr7uwpr2rlisGEov6IA
 64dCFZ8mHEj3yDnfE1IkxFdtbSA94SYqY5inY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mei1LatTmGdj+EOMqNvHhmuC380OhE62eU0mPCj4HIU=;
 b=bm0sofKlAMhs/SWJgjtiKLAj978u4iZfYTLeTC0HuK3ttvbo9AJrsAYKra7yq/lYwF
 3OUIpqgJ8PwrejTmihKJ2F5CkaJ1Gu1R7PiEE42+TliTM/bt+gKqVUxINEnyqVQaXbif
 LKmyHJ3tM4n4m4NG9oKQUDo3AmA/D70sx44JRLEINgepj/jC/IXXeUV954Fn0bYy+Hxs
 9E4mHTIwhVmA27tSURbGrv7b+bZOJiu2D/WTorllGuMkLNu0ILbyqCTQz0AXYeIWVzT4
 rt1TVTMCSH9Ah6lD014UEq3GliOHMFFO5uYHovyGLz8HMgFQ0pA1jNFE2HYHhvK/Aoxx
 u4Fg==
X-Gm-Message-State: AGi0PubDWoBcK8tzDc0SMZgKfiUDT9FlEZ56JlPEMJ5jMnF+rMRRddOq
 HuJf9gWPAHdiTvNP1P2K3ua+mbyP40HxmFM90VzExA==
X-Google-Smtp-Source: APiQypI5v/GPcuUPKMBM3NTNqytmPwdux2KcE1khhFrjveIV/zK1dS2UemFwYRgCFispMAUfUJhE2vXjRmumZEBkQZg=
X-Received: by 2002:aca:3b41:: with SMTP id i62mr9169611oia.101.1589384711122; 
 Wed, 13 May 2020 08:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
In-Reply-To: <20200311112004.47138-2-stevensd@chromium.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 May 2020 17:45:00 +0200
Message-ID: <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To: David Stevens <stevensd@chromium.org>, Tomasz Figa <tfiga@chromium.org>
Cc: virtio-dev@lists.oasis-open.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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

On Wed, Mar 11, 2020 at 12:20 PM David Stevens <stevensd@chromium.org> wrote:
>
> This change adds a new dma-buf operation that allows dma-bufs to be used
> by virtio drivers to share exported objects. The new operation allows
> the importing driver to query the exporting driver for the UUID which
> identifies the underlying exported object.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>

Adding Tomasz Figa, I've discussed this with him at elce last year I
think. Just to make sure.

Bunch of things:
- obviously we need the users of this in a few drivers, can't really
review anything stand-alone
- adding very specific ops to the generic interface is rather awkward,
eventually everyone wants that and we end up in a mess. I think the
best solution here would be if we create a struct virtio_dma_buf which
subclasses dma-buf, add a (hopefully safe) runtime upcasting
functions, and then a virtio_dma_buf_get_uuid() function. Just storing
the uuid should be doable (assuming this doesn't change during the
lifetime of the buffer), so no need for a callback.
- for the runtime upcasting the usual approach is to check the ->ops
pointer. Which means that would need to be the same for all virtio
dma_bufs, which might get a bit awkward. But I'd really prefer we not
add allocator specific stuff like this to dma-buf.
-Daniel

> ---
>  drivers/dma-buf/dma-buf.c | 12 ++++++++++++
>  include/linux/dma-buf.h   | 18 ++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d4097856c86b..fa5210ba6aaa 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1158,6 +1158,18 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
>  }
>  EXPORT_SYMBOL_GPL(dma_buf_vunmap);
>
> +int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid)
> +{
> +       if (WARN_ON(!dmabuf) || !uuid)
> +               return -EINVAL;
> +
> +       if (!dmabuf->ops->get_uuid)
> +               return -ENODEV;
> +
> +       return dmabuf->ops->get_uuid(dmabuf, uuid);
> +}
> +EXPORT_SYMBOL_GPL(dma_buf_get_uuid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index abf5459a5b9d..00758523597d 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -251,6 +251,21 @@ struct dma_buf_ops {
>
>         void *(*vmap)(struct dma_buf *);
>         void (*vunmap)(struct dma_buf *, void *vaddr);
> +
> +       /**
> +        * @get_uuid
> +        *
> +        * This is called by dma_buf_get_uuid to get the UUID which identifies
> +        * the buffer to virtio devices.
> +        *
> +        * This callback is optional.
> +        *
> +        * Returns:
> +        *
> +        * 0 on success or a negative error code on failure. On success uuid
> +        * will be populated with the buffer's UUID.
> +        */
> +       int (*get_uuid)(struct dma_buf *dmabuf, uuid_t *uuid);
>  };
>
>  /**
> @@ -444,4 +459,7 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
>                  unsigned long);
>  void *dma_buf_vmap(struct dma_buf *);
>  void dma_buf_vunmap(struct dma_buf *, void *vaddr);
> +
> +int dma_buf_get_uuid(struct dma_buf *dmabuf, uuid_t *uuid);
> +
>  #endif /* __DMA_BUF_H__ */
> --
> 2.25.1.481.gfbce0eb801-goog
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
