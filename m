Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7CA0C5E
	for <lists.virtualization@lfdr.de>; Wed, 28 Aug 2019 23:28:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E0708399C;
	Wed, 28 Aug 2019 21:28:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ECDB33958
	for <virtualization@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 21:28:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DDC5FEC
	for <virtualization@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 21:28:03 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id 18so2494751ioe.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 28 Aug 2019 14:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pJSmOOGXQE2jhcsJ3xN49XimOe54yldyhDrabvf9aK8=;
	b=k/v42AqaHAf/iP3wyYv0z3pbHwt5b1AktZJOvBGpVZzLU5pAf1sRIix5Q9+UZAHhBP
	ec/9luZcCMy4SV8B3JVvtzJaqGHhfVe5lt/BADb1OE5gs1ObEQ7gdUtQTL6gl7QBNP5R
	KDKVhF0Esxkhid2Ru74RVTOeRLHStIpvI2eJXxKzmfnFpAZL++DyY8q2ZAj9RwHk90Q4
	SpsqUyu9e0pKnIpFr4HHCWpUBea7ACexvG0wSyQs5iIEGVfVK9CxWxuMmMIFAIDavMR1
	W5fcsm23La8kSlSWi9s0zeo9y5Snp3kdgKxisPfuDaZjCkAAp7EP1TxgHYuupkg1/915
	cl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pJSmOOGXQE2jhcsJ3xN49XimOe54yldyhDrabvf9aK8=;
	b=L9j9YiuSkBH8DOLZoGb99WcuSWPHisKhIUOaYT5w0YdnixNBsztF4NyZ0gbabdDJeS
	P+F+xOLrFztJV9siyXHBriUppx/4WbIG1W9KfWiYea5qN9tGmKr0RrHKkaHgBNM8pkA7
	vDKmib6WHZ7eYyb3pCGHhGiIAYjtGs1CXPusHU//4qcBw/b3VdmxNCSU1+YN5nXL09Im
	L3hewzXgVygttwmLmjSG0dquy2M2j2g5yeTv+rRYiv85BKl51wm5D+uQUl7ChZVTw+YM
	0HM9YRyJK+7GzDMCPguQTxFJSbokvPA2jRkRziQI8qTL6yXgmdMRGH7UDQhkD+bB4AkQ
	gXeg==
X-Gm-Message-State: APjAAAXZ+w3G4KLfwLb/97L0AFDJx1jqPUlI8Mt1OEpjlwy9DBC7SgdT
	lR8eBijn0ly/yBG5AY2foYMu6wbkBg/Gavj9/o8=
X-Google-Smtp-Source: APXvYqxkKCeT4BaeHP6brbncMHNHe9V9f4UosnXis3x+V0ZD1tdls9NsC/dLZHd1Qosy/ywgq9p4AsGnl/r013yo7p0=
X-Received: by 2002:a6b:6f06:: with SMTP id k6mr1998685ioc.232.1567027683094; 
	Wed, 28 Aug 2019 14:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190823095503.2261-1-kraxel@redhat.com>
	<20190823095503.2261-8-kraxel@redhat.com>
In-Reply-To: <20190823095503.2261-8-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 28 Aug 2019 14:27:52 -0700
Message-ID: <CAPaKu7QbPeSMQGm+37hUVcSMyjjgYTs5YPKLZtoTn_J13WCeVQ@mail.gmail.com>
Subject: Re: [PATCH v8 07/18] drm/virtio: add virtio_gpu_object_array & helpers
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

On Fri, Aug 23, 2019 at 2:55 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Some helper functions to manage an array of gem objects.
>
> v6:
>  - add ticket to struct virtio_gpu_object_array.
>  - add virtio_gpu_array_{lock,unlock}_resv helpers.
>  - add virtio_gpu_array_add_fence helper.
> v5: some small optimizations (Chia-I Wu).
> v4: make them virtio-private instead of generic helpers.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 17 +++++
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 93 ++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index db57bbb36216..b6bd2b1141fb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -84,6 +84,12 @@ struct virtio_gpu_object {
>  #define gem_to_virtio_gpu_obj(gobj) \
>         container_of((gobj), struct virtio_gpu_object, gem_base)
>
> +struct virtio_gpu_object_array {
> +       struct ww_acquire_ctx ticket;
> +       u32 nents, total;
> +       struct drm_gem_object *objs[];
> +};
> +
>  struct virtio_gpu_vbuffer;
>  struct virtio_gpu_device;
>
> @@ -251,6 +257,17 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
>                               struct drm_device *dev,
>                               uint32_t handle, uint64_t *offset_p);
>
> +struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
> +struct virtio_gpu_object_array*
> +virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
> +void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
> +                             struct drm_gem_object *obj);
> +int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs);
> +void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs);
> +void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
> +                               struct dma_fence *fence);
> +void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
> +
>  /* virtio vg */
>  int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 6fe6f72f64d1..f3799f2e97cb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -171,3 +171,96 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
>                                                 qobj->hw_res_handle);
>         virtio_gpu_object_unreserve(qobj);
>  }
> +
> +struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
> +{
> +       struct virtio_gpu_object_array *objs;
> +       size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
> +
> +       objs = kmalloc(size, GFP_KERNEL);
> +       if (!objs)
> +               return NULL;
> +
> +       objs->nents = 0;
> +       objs->total = nents;
> +       return objs;
> +}
> +
> +static void virtio_gpu_array_free(struct virtio_gpu_object_array *objs)
> +{
> +       kfree(objs);
> +}
> +
> +struct virtio_gpu_object_array*
> +virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents)
> +{
> +       struct virtio_gpu_object_array *objs;
> +       u32 i;
> +
> +       objs = virtio_gpu_array_alloc(nents);
> +       if (!objs)
> +               return NULL;
> +
> +       for (i = 0; i < nents; i++) {
> +               objs->objs[i] = drm_gem_object_lookup(drm_file, handles[i]);
> +               if (!objs->objs[i]) {
> +                       objs->nents = i;
> +                       virtio_gpu_array_put_free(objs);
> +                       return NULL;
> +               }
> +       }
> +       objs->nents = i;
> +       return objs;
> +}
> +
> +void virtio_gpu_array_add_obj(struct virtio_gpu_object_array *objs,
> +                             struct drm_gem_object *obj)
> +{
> +       if (WARN_ON_ONCE(objs->nents == objs->total))
> +               return;
> +
> +       drm_gem_object_get(obj);
> +       objs->objs[objs->nents] = obj;
> +       objs->nents++;
> +}
> +
> +int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
> +{
> +       int ret;
> +
> +       if (objs->nents == 1) {
> +               ret = dma_resv_lock(objs->objs[0]->resv, NULL);
dma_resv_lock_interruptible to match what drm_gem_lock_reservations uses.
> +       } else {
> +               ret = drm_gem_lock_reservations(objs->objs, objs->nents,
> +                                               &objs->ticket);
> +       }
> +       return ret;
> +}
> +
> +void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
> +{
> +       if (objs->nents == 1) {
> +               dma_resv_unlock(objs->objs[0]->resv);
> +       } else {
> +               drm_gem_unlock_reservations(objs->objs, objs->nents,
> +                                           &objs->ticket);
> +       }
> +}
> +
> +void virtio_gpu_array_add_fence(struct virtio_gpu_object_array *objs,
> +                               struct dma_fence *fence)
> +{
> +       int i;
> +
> +       for (i = 0; i < objs->nents; i++)
> +               dma_resv_add_excl_fence(objs->objs[i]->resv, fence);
> +}
> +
> +void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
> +{
> +       u32 i;
> +
> +       for (i = 0; i < objs->nents; i++)
> +               drm_gem_object_put_unlocked(objs->objs[i]);
> +       virtio_gpu_array_free(objs);
> +}
> --
> 2.18.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
