Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292D4A3D5
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 16:23:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C7329B4B;
	Tue, 18 Jun 2019 14:23:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63A0AAD1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:23:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8550087D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:23:46 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e3so21956886edr.10
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fX3MfhN+akKdud7rTKeAfhE9NPiCnKEnOrlfRRG5bLU=;
	b=K+oUUGqY9nx/DClDvm9BJhPBn9lGzoNKYelLu7dy6gc19R7pMmooKs7+GHNFp1EfbG
	mMK0u/ITPRK4ugJPWAESn72Rt+tpT9GawQE39QCYHzgs2bj4/IWhfJY8vmDmvhmyPf9p
	e2gbTk9YlzkDOpNNV7eieonjZLrmk8wW8LWHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=fX3MfhN+akKdud7rTKeAfhE9NPiCnKEnOrlfRRG5bLU=;
	b=dnQv1t0SIse2+BggVU+ZnC28BwJJH7lu9WBonQJdCOZyY6vtK+/cwIL57myrPrGX2C
	bI7MCWsQYrY9BiyQIIqPj4GAhAu5DQbj+C8ceqc9ssOI1KPcEyEOU6fb8v8tXSFtzhZ1
	T28GPXxa+PiRr/lr1Hbq7TDG2DFhUTnosA2VP+WodetzVDoeh74tP6bl6RA95n+gPUSv
	OBROWowT9auWnjTQuSMw4K2JUUBDC99XIOp7ipgx7O+b/xrB1kVSZ6B87lXJdndMULdo
	Kd87zIRX6p3WojOvS6j4/us4kNnJO9O7pGk/uBZa+Ef17sIX+knF87Cf+8HXKgVXYKBN
	BfgA==
X-Gm-Message-State: APjAAAUYsldl/3bxc9mtH7aAAouLaY+ohQmjb/KGAcfgo5hxH524u+3I
	HAdopUIaUq494PkDoapKC4bgaA==
X-Google-Smtp-Source: APXvYqywX4L/MXBiZ6gvbs/ba2m6OFFGgNkS1QZb/dqTtCFDk5frIdc7t9AugsLvIRc6kFMRaTVcyw==
X-Received: by 2002:a05:6402:64a:: with SMTP id
	u10mr85306567edx.35.1560867825135; 
	Tue, 18 Jun 2019 07:23:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id u9sm3383709edm.71.2019.06.18.07.23.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 07:23:44 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:23:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 07/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
Message-ID: <20190618142342.GD12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
	<20190618135821.8644-8-kraxel@redhat.com>
	<20190618141604.GC12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618141604.GC12905@phenom.ffwll.local>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
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

On Tue, Jun 18, 2019 at 04:16:04PM +0200, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 03:58:15PM +0200, Gerd Hoffmann wrote:
> > Use gem reservation helpers and direct reservation_object_* calls
> > instead of ttm.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 36 ++++++++++++--------------
> >  1 file changed, 17 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 5cffd2e54c04..6db6a6e92dde 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -107,12 +107,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >  	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
> >  	struct drm_gem_object *gobj;
> >  	struct virtio_gpu_fence *out_fence;
> > -	struct virtio_gpu_object *qobj;
> >  	int ret;
> >  	uint32_t *bo_handles = NULL;
> >  	void __user *user_bo_handles = NULL;
> >  	struct list_head validate_list;
> > -	struct ttm_validate_buffer *buflist = NULL;
> > +	struct drm_gem_object **buflist = NULL;
> >  	int i;
> >  	struct ww_acquire_ctx ticket;
> >  	struct sync_file *sync_file;
> > @@ -157,12 +156,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >  
> >  	INIT_LIST_HEAD(&validate_list);
> >  	if (exbuf->num_bo_handles) {
> > -
> >  		bo_handles = kvmalloc_array(exbuf->num_bo_handles,
> > -					   sizeof(uint32_t), GFP_KERNEL);
> > +					    sizeof(uint32_t), GFP_KERNEL);
> >  		buflist = kvmalloc_array(exbuf->num_bo_handles,
> > -					   sizeof(struct ttm_validate_buffer),
> > -					   GFP_KERNEL | __GFP_ZERO);
> > +					 sizeof(struct drm_gem_object*),
> > +					 GFP_KERNEL | __GFP_ZERO);
> >  		if (!bo_handles || !buflist) {
> >  			ret = -ENOMEM;
> >  			goto out_unused_fd;
> > @@ -181,19 +179,15 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >  				ret = -ENOENT;
> >  				goto out_unused_fd;
> >  			}
> > -
> > -			qobj = gem_to_virtio_gpu_obj(gobj);
> > -			buflist[i].bo = &qobj->tbo;
> > -
> > -			list_add(&buflist[i].head, &validate_list);
> > +			buflist[i] = gobj;
> 
> I didn't bother looking, but I guess there's some room for a
> array-of-gem-id to gem_bo-pointers helper function? Would only make sense
> if we can share it with panfrost/v3d maybe.
> 
> >  		}
> >  		kvfree(bo_handles);
> >  		bo_handles = NULL;
> >  	}
> >  
> > -	ret = virtio_gpu_object_list_validate(&ticket, &validate_list);
> > +	ret = drm_gem_lock_reservations(buflist, exbuf->num_bo_handles, &ticket);
> >  	if (ret)
> > -		goto out_free;
> > +		goto out_unused_fd;
> >  
> >  	buf = memdup_user(u64_to_user_ptr(exbuf->command), exbuf->size);
> >  	if (IS_ERR(buf)) {
> > @@ -222,21 +216,25 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >  	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
> >  			      vfpriv->ctx_id, out_fence);
> >  
> > -	ttm_eu_fence_buffer_objects(&ticket, &validate_list, &out_fence->f);
> > +	for (i = 0; i < exbuf->num_bo_handles; i++)
> > +		reservation_object_add_excl_fence(buflist[i]->resv, &out_fence->f);
> 
> Helper to unref an array of gem bo? Probably also needed by other drivers.
> 
> 
> > +	drm_gem_unlock_reservations(buflist, exbuf->num_bo_handles, &ticket);
> >  
> > -	/* fence the command bo */
> > -	virtio_gpu_unref_list(&validate_list);
> > +	for (i = 0; i < exbuf->num_bo_handles; i++)
> > +		if (buflist[i])
> > +			drm_gem_object_put_unlocked(buflist[i]);
> 
> I am left wondering who's holding references onto these buffers now? How
> do you make sure they don't disappear untimely?
> 
> I think atm it's ttm making sure of that, but if you drop that completely
> there needs to be something else.
> 
> >  	kvfree(buflist);
> >  	return 0;
> >  
> >  out_memdup:
> >  	kfree(buf);
> >  out_unresv:
> > -	ttm_eu_backoff_reservation(&ticket, &validate_list);
> > -out_free:
> > -	virtio_gpu_unref_list(&validate_list);
> > +	drm_gem_unlock_reservations(buflist, exbuf->num_bo_handles, &ticket);
> >  out_unused_fd:
> >  	kvfree(bo_handles);
> > +	for (i = 0; i < exbuf->num_bo_handles; i++)
> > +		if (buflist && buflist[i])
> > +			drm_gem_object_put_unlocked(buflist[i]);
> >  	kvfree(buflist);
> >  
> >  	if (out_fence_fd >= 0)
> 
> Patch itself looks correct, just put down my thoughts while reviewing it.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

r-b retracted after reviewing the next patch. You remove ttm_bo_fence
here, which also moves/adds the bo to the lru, which is the think grabbing
a reference, which has been preventing the oopses here thus far.

With that gone you blow up.

The callchain is:

ttm_eu_fence_buffer_objects -> ttm_bo_add_to_lru -> ttm_bo_add_mem_to_lru
-> kref_get.

I honestly never looked too closely at that part of ttm, but it's a lot
different from what at least i915 does. Design principles we use there:
- lru lists only hold a weak reference, i.e. it's a pointer, but it
  doesn't prevent the final kput from freeing the object. In the actual
  object free callback we remove those references while grabbing the right
  locks (which might need to be offloaded to a worker in some cases to
  avoid recursions).

- we only hold a kref while the object is under active use by the gpu.

I very much prefer this weak reference model for lookup tables, caches,
lrus and all that since imo it leads to clearer code. And you can always
upgrade to a full reference using kref_get_unless_zero. ttm seems to be
using a completely different design here, not sure how old memory gets
released when a client dies.

I guess this is a gap we'd need to first fix in gem helpers, maybe even
needs some kind of notion of an lru and some memory region an object sits
in ...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
