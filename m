Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4514A374
	for <lists.virtualization@lfdr.de>; Tue, 18 Jun 2019 16:09:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A31DE46;
	Tue, 18 Jun 2019 14:09:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8C040AD1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DFC157DB
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 14:09:30 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k8so21920088edr.11
	for <virtualization@lists.linux-foundation.org>;
	Tue, 18 Jun 2019 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rd5swHtQn6I4g05FOd476JWDZK1W4dVOi6bXk+VCUPQ=;
	b=iz+ztRpIBrIo4iXy7HZw7wvhbwfGBVktYhUlYiMIbgaOxZQNafxnYMroWZS3Hvj4V/
	qIDUojvQUiaWn1A5Vt3azHhw+MYeoDPl5oah6fT//VjXyLmBISjRJLLZKJ4fPrbUnB6I
	c5RFdqjzd7ASAlYn1rZ96LAmB/zO6r2XJM6QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=rd5swHtQn6I4g05FOd476JWDZK1W4dVOi6bXk+VCUPQ=;
	b=iuPNIxKvLrIfhnvC1ySsj15vT6VupWgx/WrTnR2NDEarvWmdqs794c6S25YY9I9rQw
	fWJdK2Cmr/PRiINUdSv7V0WHy204ua1tezADTAIFok5Wc9isEtMm2y/zOzJaIaMSL9MB
	LkNnSMedbyO/CZ639hZisrVlB5C7AISczv5wEB9vlICNhtZa8Ehwnvrveev4MBaz0GXD
	GxY0tej5Ot749iFPol3IFffPotGcN5tWdrqNiUsxw4CmM01+X8NBklEeytX4a6OXPA9+
	7H4Pj6g7bQZtaEl6C4X+45PvkpAz4rJcFj89PyJC4GJx2JtufjbPb1jdEEb2Bvuqj8ws
	Trrw==
X-Gm-Message-State: APjAAAVBNbgF+qc4FermvN7W5q5HMB1dD2U1F95rtNXq0mwjn1AIn1pG
	xF9LYjqYE4d0hpOGZKHDeAJzZNcDt2U=
X-Google-Smtp-Source: APXvYqxfjGPU2BQiQCTzJdcSdy/5MdYMFSVDaL4zuBQZvv/UJIsO2W/GMuSac5Zl+3oa3BfMmQ4AWg==
X-Received: by 2002:a50:b635:: with SMTP id b50mr31792908ede.293.1560866969483;
	Tue, 18 Jun 2019 07:09:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
	by smtp.gmail.com with ESMTPSA id a9sm4932323edc.44.2019.06.18.07.09.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 07:09:27 -0700 (PDT)
Date: Tue, 18 Jun 2019 16:09:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 06/12] drm/virtio: remove ttm calls from in
	virtio_gpu_object_{reserve,unreserve}
Message-ID: <20190618140925.GB12905@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20190618135821.8644-1-kraxel@redhat.com>
	<20190618135821.8644-7-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618135821.8644-7-kraxel@redhat.com>
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

On Tue, Jun 18, 2019 at 03:58:14PM +0200, Gerd Hoffmann wrote:
> Call reservation_object_* directly instead
> of using ttm_bo_{reserve,unreserve}.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 06cc0e961df6..91c320819a8c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -402,7 +402,7 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>  {
>  	int r;
>  
> -	r = ttm_bo_reserve(&bo->tbo, true, false, NULL);
> +	r = reservation_object_lock_interruptible(bo->gem_base.resv, NULL);
>  	if (unlikely(r != 0)) {
>  		if (r != -ERESTARTSYS) {

errno semantics change here, I think you now get EINTR. With that fixed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  			struct virtio_gpu_device *qdev =
> @@ -416,7 +416,7 @@ static inline int virtio_gpu_object_reserve(struct virtio_gpu_object *bo)
>  
>  static inline void virtio_gpu_object_unreserve(struct virtio_gpu_object *bo)
>  {
> -	ttm_bo_unreserve(&bo->tbo);
> +	reservation_object_unlock(bo->gem_base.resv);
>  }
>  
>  /* virgl debufs */
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
