Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA2E0046
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 11:06:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A5E581176;
	Tue, 22 Oct 2019 09:05:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4C2B310BA
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 09:05:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A8CF287E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 09:05:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o28so17102671wro.7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 02:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=sender:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=i9cWg6hkC3Jwd63HaaPFghAt5dBBQDhYdlHJZBLH9+s=;
	b=lKVMMF8g8YiYTjlh2fqJFDY3PXwKTV+YIsCC2A+Y7rv0/syyGNnigyxwTKYIJjrBgK
	+SydfOo9H8S9CQJnwAGQRgvNvyWYVdxsGV0uvnJa2h22JPjrjwPocmjxVAHK3w663hHQ
	bI7kCLc9VTBs/oElUMSqxYs7bHKplYJbhethI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=i9cWg6hkC3Jwd63HaaPFghAt5dBBQDhYdlHJZBLH9+s=;
	b=DNoPaqxvRu3hYLgol0nOaeakhX7baOtvKgyo+VXjREG3PJhzZMXvlyla/MG83mw2c1
	RM4CdjGqsPpo7IBFlaWOEyJgdLyfHJEzaw/nF0qvJa9pIlDAWZ6At0P43nJE17L0GQ2r
	uiTTo1zNRecMNrVSASw6u4tE9+bxftN/I6sGxZUgPuu5jTlQS842V0xEeGPBVw6gMTjb
	fCGQ1ohPLw7uM+uefb0zhu1ou4jWSfVUvl/+4OSLyDTdErfyNA/gSR85w5bxYPVBwETc
	/wTjoq17tzpVP104ilZudL0QuVirBl3xOuh3XR/Ron6tiIzacrlPg8N3tT54GROHPxgs
	zq3Q==
X-Gm-Message-State: APjAAAWCvu+eEiHgvTD68BIenGGhrdhCpKwIrTlEPSQIOBPeqRUKG+va
	ltmKr6YxyTaJNJCDc/DlFH6sVw==
X-Google-Smtp-Source: APXvYqzpbMbxT2yU70Z+fHkQQr9yWCG0/09XbqcMbnTOZqVwPDK93hJ38k/7uXKowUqTJaukb4eMTg==
X-Received: by 2002:adf:f4cb:: with SMTP id h11mr2679088wrp.260.1571735136188; 
	Tue, 22 Oct 2019 02:05:36 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
	[212.51.149.96]) by smtp.gmail.com with ESMTPSA id
	s21sm20815085wrb.31.2019.10.22.02.05.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 02:05:35 -0700 (PDT)
Date: Tue, 22 Oct 2019 11:05:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: print a single line with device features
Message-ID: <20191022090533.GB11828@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>, 
	open list <linux-kernel@vger.kernel.org>
References: <20191018113832.5460-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018113832.5460-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
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

On Fri, Oct 18, 2019 at 01:38:32PM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_kms.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 0b3cdb0d83b0..2f5773e43557 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -155,16 +155,15 @@ int virtio_gpu_init(struct drm_device *dev)
>  #ifdef __LITTLE_ENDIAN
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
>  		vgdev->has_virgl_3d = true;
> -	DRM_INFO("virgl 3d acceleration %s\n",
> -		 vgdev->has_virgl_3d ? "enabled" : "not supported by host");
> -#else
> -	DRM_INFO("virgl 3d acceleration not supported by guest\n");
>  #endif
>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
>  		vgdev->has_edid = true;
> -		DRM_INFO("EDID support available.\n");
>  	}
>  
> +	DRM_INFO("features: %cvirgl %cedid\n",
> +		 vgdev->has_virgl_3d ? '+' : '-',
> +		 vgdev->has_edid     ? '+' : '-');

Maybe we should move the various yesno/onoff/enableddisabled helpers from
i915_utils.h to drm_utils.h and use them more widely?

Anyway Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> +
>  	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
>  	if (ret) {
>  		DRM_ERROR("failed to find virt queues\n");
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
