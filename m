Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5694C5ECFA
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 21:52:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48BF7EA3;
	Wed,  3 Jul 2019 19:52:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 663ACE81
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 19:52:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CBC5270D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 19:52:31 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id w25so7719521ioc.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 03 Jul 2019 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L4H4TOfyLAfsMNQ6KlYVmN2d3wCdPkK9USRqsxEO8Ys=;
	b=PbX/zorGSn1qwb4ZpcKi4XK3kHpCF9c68JDwzqSzG2LSIzadqTkeAKy28E38rLK+Ew
	EZBJcopVJO9X476DfsouDX8FomhOtrETgkx3KMGKr96SNEtkNJe3EKBsnL4bwri9x2Q2
	DhEBa3QnWAxo9r4wkqmp9TiAUgLIWSvdGZm/3Mg7cjbDIKzvdQNdyEynHZoNholrX60l
	25NvVzruc1Z6DE372tfzeb11HVoFfUBqd07c8P1rV+yvNVQ9MmMXR0/wnS+rvvcAWlDS
	BkkqwqmjMQUkdvBxJS46cQd2CSXD05GD2S/Qa1Ey+PB1qjWgHy5OMT5VO9peoOlkW63R
	5Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L4H4TOfyLAfsMNQ6KlYVmN2d3wCdPkK9USRqsxEO8Ys=;
	b=roRiMo4duEvaHU/WN9FwXSyrsl3rdyVtc3wvrIbn6xOUehvaCFdzJPTS3j3z5mmR5y
	kX78SUZp6MjUIp/KTm+wTarBAQCyFcaWq4bINf0n0AvjkPmLeUc4VCyDcH4H9LwIXQ2P
	dCO5vI/2eHzkJQhuxb0z2DgJ8vOOyxc5gGFVXmdW491wX1oyb14hP/tM0vfjYo/PsFDC
	wWP7g2JD+BABqf75YrBsT9VJZWYwa///rFUoWFTSARYqNQRH/xqp4j9cG2ze1T8QgvjI
	grgDvgrMQoaaBLbuqQ8NrCLV6/m2VeqsWuPdEMenGVgyxfNMSZ1Cn3FyVUdSTJzlWCdX
	5sjA==
X-Gm-Message-State: APjAAAW+JWWLrKErDJCy99ejFRw5aE8MAz5/7uTS/OCb133ysQtBRsX+
	7wL0RJe/P7ZvSCwhZm836EOpq27N/lzE9tmItSs=
X-Google-Smtp-Source: APXvYqyg6L2E9fD6xiWEGNYlIX9RYdd1Rysp6RIq1uwMBpZNhy+YqsXx/duJBEZ1ZHBSgYyU1RZvHzcsXybl184Z8II=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr33493624iot.200.1562183550911; 
	Wed, 03 Jul 2019 12:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-8-kraxel@redhat.com>
	<CAPaKu7TJ1RgL_CjGnieE1hOOXnT-ECRk67ntRCPTFiv+EmrX4Q@mail.gmail.com>
In-Reply-To: <CAPaKu7TJ1RgL_CjGnieE1hOOXnT-ECRk67ntRCPTFiv+EmrX4Q@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 3 Jul 2019 12:52:19 -0700
Message-ID: <CAPaKu7RFd4EVsV8VbNtNbVv2cPmSbpQ7pkBPpbbeUDz+i=nEfQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/18] drm/virtio: add virtio_gpu_object_array & helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Wed, Jul 3, 2019 at 11:31 AM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Tue, Jul 2, 2019 at 7:19 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > Some helper functions to manage an array of gem objects.
> >
> > v6:
> >  - add ticket to struct virtio_gpu_object_array.
> >  - add virtio_gpu_array_{lock,unlock}_resv helpers.
> >  - add virtio_gpu_array_add_fence helper.
> > v5: some small optimizations (Chia-I Wu).
> > v4: make them virtio-private instead of generic helpers.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.h | 17 ++++++
> >  drivers/gpu/drm/virtio/virtgpu_gem.c | 83 ++++++++++++++++++++++++++++
> >  2 files changed, 100 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > index 07f6001ea91e..abb078a5dedf 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> > @@ -84,6 +84,12 @@ struct virtio_gpu_object {
> >  #define gem_to_virtio_gpu_obj(gobj) \
> >         container_of((gobj), struct virtio_gpu_object, gem_base)
> >
> > +struct virtio_gpu_object_array {
> > +       struct ww_acquire_ctx ticket;
> > +       u32 nents, total;
> > +       struct drm_gem_object *objs[];
> > +};
> > +
> >  struct virtio_gpu_vbuffer;
> >  struct virtio_gpu_device;
> >
> > @@ -251,6 +257,17 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
> >                               struct drm_device *dev,
> >                               uint32_t handle, uint64_t *offset_p);
> >
> > +struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
> > +struct virtio_gpu_object_array*
> > +virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
> > +void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
> > +                             struct drm_gem_object *obj);
> > +int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
> > +void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
> > +void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
> > +                               struct dma_fence *fence);
> > +void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
> > +
> >  /* virtio vg */
> >  int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
> >  void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> > index 9c9ad3b14080..e88df5e06d06 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> > @@ -169,3 +169,86 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
> >                                                 qobj->hw_res_handle);
> >         virtio_gpu_object_unreserve(qobj);
> >  }
> > +
> > +struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
> > +{
> > +       struct virtio_gpu_object_array *objs;
> > +       size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
> > +
> > +       objs = kmalloc(size, GFP_KERNEL);
> > +       if (!objs)
> > +               return NULL;
> > +
> > +       objs->nents = 0;
> > +       objs->total = nents;
> > +       return objs;
> > +}
> > +
> > +static void virtio_gpu_array_free(struct virtio_gpu_object_array *objs)
> > +{
> > +       kfree(objs);
> > +}
> > +
> > +struct virtio_gpu_object_array*
> > +virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents)
> > +{
> > +       struct virtio_gpu_object_array *objs;
> > +       u32 i;
> > +
> > +       objs = virtio_gpu_array_alloc(nents);
> > +       if (!objs)
> > +               return NULL;
> > +
> > +       for (i = 0; i < nents; i++) {
> > +               objs->nents = i;
> This line can be moved into the if-block just below.
> > +               objs->objs[i] = drm_gem_object_lookup(drm_file, handles[i]);
> > +               if (!objs->objs[i]) {
> > +                       virtio_gpu_array_put_free(objs);
> > +                       return NULL;
> > +               }
> > +       }
> > +       objs->nents = i;
> > +       return objs;
> > +}
> > +
> > +void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
> > +                             struct drm_gem_object *obj)
> > +{
> > +       if (WARN_ON_ONCE(objs->nents == objs->total))
> > +               return;
> > +
> > +       drm_gem_object_get(obj);
> > +       objs->objs[objs->nents] = obj;
> > +       objs->nents++;
> > +}
> > +
> > +int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
> > +{
> > +       return drm_gem_lock_reservations(objs->objs, objs->nents,
> > +                                        &objs->ticket);
Unlike in other drivers where an "object array" is only needed in
execbuffer, we will use this in several places, and often with only 1
object in the array.  Can we special case that and do a quick
reservation_object_lock?

> > +}
> > +
> > +void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
> > +{
> > +       drm_gem_unlock_reservations(objs->objs, objs->nents,
> > +                                   &objs->ticket);
> > +}
> > +
> > +void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
> > +                               struct dma_fence *fence)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < objs->nents; i++)
> > +               reservation_object_add_excl_fence(objs->objs[i]->resv,
> > +                                                 fence);
> > +}
> > +
> > +void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
> > +{
> > +       u32 i;
> > +
> > +       for (i = 0; i < objs->nents; i++)
> > +               drm_gem_object_put_unlocked(objs->objs[i]);
> > +       virtio_gpu_array_free(objs);
> > +}
> > --
> > 2.18.1
> >
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
