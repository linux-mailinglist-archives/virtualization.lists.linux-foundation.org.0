Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA122AABC
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 10:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E158894FA;
	Thu, 23 Jul 2020 08:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7IdInPZgQ6T; Thu, 23 Jul 2020 08:34:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A37BB894F6;
	Thu, 23 Jul 2020 08:34:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73FADC004C;
	Thu, 23 Jul 2020 08:34:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4642AC004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 08:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42508894F8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 08:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hv5PMl+wGnUP
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 08:34:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F315894F4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595493284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xGTIbgCx+rDVKvWTlEHAJATfxUUpkuPfnD7JMbYkQY8=;
 b=Q9TvbV+hkGZs0MeWmEiWZfVRPg9TshPH0P6bYkmZqO65IbKU0DAppaVlRQ68GjfZOcP0HJ
 B3DkQzb4kTuQAD8ufADqOolDQUj32HbSaHLrLeyl9+gYkuaN7ve3TQqWM83Tn15QCQ8PRE
 /j6cUe58LoAd9gjVN3ufIngDREaYieo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476--45CYZzLNDeqBF4RFZFQBQ-1; Thu, 23 Jul 2020 04:34:43 -0400
X-MC-Unique: -45CYZzLNDeqBF4RFZFQBQ-1
Received: by mail-wr1-f72.google.com with SMTP id c6so1148630wru.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 01:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xGTIbgCx+rDVKvWTlEHAJATfxUUpkuPfnD7JMbYkQY8=;
 b=r416qxFgfWquXLHBDQtbG7RjMFQPLxOX9w0ZxA8TwBqx0vSFQIjAoIgdib0cb4o26U
 N8/J3Bi5Pqly5jHxr1MPDdhC1FFrA8af7zZOTS69L3BoS1Wp60+WOGjGWU58QwR/bfzK
 Ys1RLXFV8OFtHY1dTG3d9Qz/8o1LKxepJAI+n8MBaOSS+1vpWprRbvEs/Mo7t+wTSLca
 M7B4PlTqV5+WvbjBxaohL2j5pKDF1F8c1WJm2rKp/V/qxzyH+r0i0TjT79bY+rTh2cAt
 39cD2k30ISp2cYYPt+ZJEELQh10cK8RvxaXVcbrLj8SuEhwMYV6U42DthKy7HLphld9c
 CgrQ==
X-Gm-Message-State: AOAM532b4Sp06hmDElQ9VA2asaNp86pGYIkdmTQ+mSKhlK5AWr3z35Cn
 HEpV5x9yAePJlxQwgaShvLWIRWmP+G2FCpLFwgoxcnMTRd7lP4Ac2pDyC+7uHQ9Jn9XqG5BYdyI
 jnAN8c3VRuqrkt8oOMrG1LY1qZ961TAN7aJo+1eMwGA==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr2650628wmi.120.1595493281556; 
 Thu, 23 Jul 2020 01:34:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXZi0KGyqccwK0YBH6EPSIFaT3xENgDnbzBhFqPmSY7XV5a91YqQHX0IHrfs3AUaL6q2mXag==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr2650615wmi.120.1595493281258; 
 Thu, 23 Jul 2020 01:34:41 -0700 (PDT)
Received: from steredhat.lan ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id o2sm2897806wrj.21.2020.07.23.01.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 01:34:40 -0700 (PDT)
Date: Thu, 23 Jul 2020 10:34:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v4 1/4] vhost: convert VHOST_VSOCK_SET_RUNNING to a
 generic ioctl
Message-ID: <20200723083435.3rjn5qiqhxcvxxwk@steredhat.lan>
References: <20200722150927.15587-1-guennadi.liakhovetski@linux.intel.com>
 <20200722150927.15587-2-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200722150927.15587-2-guennadi.liakhovetski@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

On Wed, Jul 22, 2020 at 05:09:24PM +0200, Guennadi Liakhovetski wrote:
> VHOST_VSOCK_SET_RUNNING is used by the vhost vsock driver to perform
> crucial VirtQueue initialisation, like assigning .private fields and
> calling vhost_vq_init_access(), and clean up. However, this ioctl is
> actually extremely useful for any vhost driver, that doesn't have a
> side channel to inform it of a status change, e.g. upon a guest
> reboot. This patch makes that ioctl generic, while preserving its
> numeric value and also keeping the original alias.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> ---
>  include/uapi/linux/vhost.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> index 0c2349612e77..5d9254e2a6b6 100644
> --- a/include/uapi/linux/vhost.h
> +++ b/include/uapi/linux/vhost.h
> @@ -95,6 +95,8 @@
>  #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
>  #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
>  
> +#define VHOST_SET_RUNNING _IOW(VHOST_VIRTIO, 0x61, int)
> +
>  /* VHOST_NET specific defines */
>  
>  /* Attach virtio net ring to a raw socket, or tap device.
> @@ -116,7 +118,7 @@
>  /* VHOST_VSOCK specific defines */
>  
>  #define VHOST_VSOCK_SET_GUEST_CID	_IOW(VHOST_VIRTIO, 0x60, __u64)
> -#define VHOST_VSOCK_SET_RUNNING		_IOW(VHOST_VIRTIO, 0x61, int)
> +#define VHOST_VSOCK_SET_RUNNING		VHOST_SET_RUNNING
>  
>  /* VHOST_VDPA specific defines */
>  
> -- 
> 2.27.0
> 

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
