Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 35284484F9
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 16:12:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3C6F3D48;
	Mon, 17 Jun 2019 14:11:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1CD60CD1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:11:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C13E87DB
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:11:53 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so16343500edr.11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zlCo9TC98c5FZkjUzIf1KLkN5UgmU6J99oGWDzFXHpI=;
	b=E1lV/u7o1nMu/5qcTlwV2LMql4XhweKWVE452oSFGI9R9SjCnpHHJnbxQXIKoXvsmz
	MjEC7OHqO9/kJOeec+mu0Z8koL5fprasZn58JKAQBBN+0wxWXoJYVbr7u+ap7ulflBy9
	qPQrTUudwz+GPCINTlkK6HQ+6xSffoDX3Zgzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=zlCo9TC98c5FZkjUzIf1KLkN5UgmU6J99oGWDzFXHpI=;
	b=OJAHa4bLZPhBTcXhx/JgV/DXllXqh3cymP5Iji4QeXQy3thL7r+wk7qtNmWxFcU1La
	rZHshUjjjOJfPgFU24gIMVxUiRyfkx3iIqmQSyP5UtphRIdwik9srYyi4k86g/JhFh/I
	/FvzHiDomicGBc+VC+4lnC4xETP5euF4wBqUU1s9CITW7oH5HiJQUgCrcL+0IsenCAKD
	uVkkb53nvshD2tD9jszo1lRBhKwUGdjfNEWhsMp3U/AM4m/oJCdKmsuFAYy77piWilxq
	w8SRX6uu1eRl04VK0MLQ7/TzfWAD1fwL0tKrOCLSyGRCoDs9Ya6uQN1TJ+WhF9I0Ugmr
	y77A==
X-Gm-Message-State: APjAAAUqmzJ7ZHxHG1a+ju6YQEMvO7rxHxcQ6C+O6wmdOzyzl+TSpll7
	3m8pZw769Q7Q9C2RBB6yZt5uww==
X-Google-Smtp-Source: APXvYqyFOj7EMYy9qivyoZv6/j9iQIWwU8H2myH8qg8E6iBR3g1ZdPTuAJd2zbKKIw0TxP9ixHftTQ==
X-Received: by 2002:aa7:c486:: with SMTP id m6mr54266304edq.298.1560780712473; 
	Mon, 17 Jun 2019 07:11:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id
	m19sm2186424eje.30.2019.06.17.07.11.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 07:11:50 -0700 (PDT)
Date: Mon, 17 Jun 2019 16:11:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
	David Airlie <airlied@linux.ie>, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/virtio: pass gem reservation object to ttm init
Message-ID: <20190617141148.GE12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190617111406.14765-1-kraxel@redhat.com>
	<20190617111406.14765-2-kraxel@redhat.com>
	<20190617140825.GD12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617140825.GD12905@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Jun 17, 2019 at 04:08:25PM +0200, Daniel Vetter wrote:
> On Mon, Jun 17, 2019 at 01:14:03PM +0200, Gerd Hoffmann wrote:
> > With this gem and ttm will use the same reservation object,
> > so mixing and matching ttm / gem reservation helpers should
> > work fine.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> While doing my prime doc+cleanup series I wondered whether we should do
> this for everyone, and perhaps even remove ttm_bo.ttm_resv. Only driver
> which doesn't yet have a gem_bo embedded in the same allocation is vmwgfx,
> and that would be easy to fix by adding a vmwgfx_resv somehwere.
> 
> Anyway, looks like a solid start into the convergence story.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Aside: if virtio ever allows dma-buf sharing with something else (or
multiple virtio-gpu instances), then together with my patch series this
will fix dma-buf import. Atm virtio ignores the reservation object of the
imported dma-buf, which for foreing objects really isn't correct.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_object.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> > index b2da31310d24..242766d644a7 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> > @@ -132,7 +132,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> >  	virtio_gpu_init_ttm_placement(bo);
> >  	ret = ttm_bo_init(&vgdev->mman.bdev, &bo->tbo, params->size,
> >  			  ttm_bo_type_device, &bo->placement, 0,
> > -			  true, acc_size, NULL, NULL,
> > +			  true, acc_size, NULL,
> > +			  bo->gem_base.resv,
> >  			  &virtio_gpu_ttm_bo_destroy);
> >  	/* ttm_bo_init failure will call the destroy */
> >  	if (ret != 0)
> > -- 
> > 2.18.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
