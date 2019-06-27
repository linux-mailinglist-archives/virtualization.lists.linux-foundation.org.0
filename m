Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D8646577D8
	for <lists.virtualization@lfdr.de>; Thu, 27 Jun 2019 02:49:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0F12FDD8;
	Thu, 27 Jun 2019 00:49:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 03775DC2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 00:49:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 858A93D0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 00:49:18 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s7so859465iob.11
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FnuQP7CTcbJye7wkfnNka2bWrrxEpDeN1sGJnHRjqmw=;
	b=beyZvOpIoSnCiVUg3YQYCGXioF/dyxle9eDYc/zWVKmJCbs27jCH009EwTbRKHLTou
	cVQhkKfw0ZS43zSlmtqoFOoQ2oxY/xV6BXq7e9uT98Fag+EEx17DrFjsNGQKlTY7zczB
	3njyfFCt8K+Z4uBOJHEv02y2R21GVOsUeD+xk4Ny5/Dt2CZ8bs2s5SdBf00OQIJTsTrw
	/7RqtCzM+S8vEz99lQul2d9fheRAQucnLsy4i5eWDhwWYo47zbuZBFpcQF2cFQrFBaus
	1LFkn9tcjwldGgIW3KJtGM//tMgEt9bkTuGP6/6eQexPpO+V7QEp/PR28DJAjKr6sKq0
	PwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FnuQP7CTcbJye7wkfnNka2bWrrxEpDeN1sGJnHRjqmw=;
	b=m754xAMTAo6SHAG1UJHpA3vTD30jXnnoyUqh2iAgGcPdIkoo7Ndn2wYpezrzvj/f3c
	7I9UAKOSFq/ejHAC4XlCZ+b6CYEkDgXmYi9Ab5LV67htzjutMpuzcpA8goMmNeTGwmfS
	77eoA+t+wqthE2lkocRD/8+pnIvzmmpc3qDxBgDd/0OZccDVaZHpjCTRt59Fca5LUtBa
	qp+Yum2/U55X7H4iR/XHQdn5dmGZPiqAELJet1HkTSOyb2FEvJmt3/vTA0n82Et1mw//
	X7uwCgjTvJhTALTueSbzHVYg+GnvA+l6swLneDjcYzafskhvmKyvI9dbGLy1g7V0sZ+6
	5FnA==
X-Gm-Message-State: APjAAAXStWc6A478Vbeq8OOSZmBo3dkDxD+XIIm5PsvLy96qX/XEp0vQ
	aP8l8mHayyzzV0owHwOiGpXE35gcMw4+7hgs0Ak=
X-Google-Smtp-Source: APXvYqzVlHJw5tL36/rn9Qjl/0Q9Vf2GB+usOUX6IiDa54+5zwayzncbpLfYPkKaUkSvv1Vo6TLxRYG5GYVer4iwUEQ=
X-Received: by 2002:a6b:9257:: with SMTP id u84mr1277575iod.278.1561596557688; 
	Wed, 26 Jun 2019 17:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
	<20190620060726.926-8-kraxel@redhat.com>
In-Reply-To: <20190620060726.926-8-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 26 Jun 2019 17:49:06 -0700
Message-ID: <CAPaKu7RwVC3p=K0gxy=NfJaCJd_RkRc1vCKH4e7oS8rn-6wyOQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] drm/virtio: add virtio_gpu_object_array & helpers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

On Wed, Jun 19, 2019 at 11:08 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Some helper functions to manage an array of gem objects.
>
> v4: make them virtio-private instead of generic helpers.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 10 ++++++
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 50 ++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 07f6001ea91e..98d646789d23 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -84,6 +84,11 @@ struct virtio_gpu_object {
>  #define gem_to_virtio_gpu_obj(gobj) \
>         container_of((gobj), struct virtio_gpu_object, gem_base)
>
> +struct virtio_gpu_object_array {
> +       u32 nents;
> +       struct drm_gem_object *objs[];
> +};
> +
>  struct virtio_gpu_vbuffer;
>  struct virtio_gpu_device;
>
> @@ -251,6 +256,11 @@ int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
>                               struct drm_device *dev,
>                               uint32_t handle, uint64_t *offset_p);
>
> +struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
> +struct virtio_gpu_object_array*
> +virtio_gpu_array_from_handles(struct drm_file *drm_file, u32 *handles, u32 nents);
> +void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
> +
>  /* virtio vg */
>  int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
>  void virtio_gpu_free_vbufs(struct virtio_gpu_device *vgdev);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 9c9ad3b14080..456cc382ce68 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -169,3 +169,53 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
>                                                 qobj->hw_res_handle);
>         virtio_gpu_object_unreserve(qobj);
>  }
> +
> +struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents)
> +{
> +       struct virtio_gpu_object_array *objs;
> +       size_t size = sizeof(*objs) + sizeof(objs->objs[0]) * nents;
> +
> +       objs = kzalloc(size, GFP_KERNEL);
It seems unlikely to get wrong.  Use kmalloc instead?
> +       if (!objs)
> +               return NULL;
> +
> +       objs->nents = nents;
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
> +                       virtio_gpu_array_put_free(objs);
Set objs->nents to i before calling i915_gem_object_lookup;
> +                       return NULL;
Should we distinguish ENOMEM and ENOENT?
> +               }
> +       }
> +       return objs;
> +}
> +
> +void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs)
> +{
> +       u32 i;
> +
> +       for (i = 0; i < objs->nents; i++) {
> +               if (!objs->objs[i])
> +                       continue;
The check can be removed if the change in virtio_gpu_array_from_handles.
> +               drm_gem_object_put_unlocked(objs->objs[i]);
> +       }
> +       virtio_gpu_array_free(objs);
> +}
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
