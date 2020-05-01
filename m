Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB91C17FF
	for <lists.virtualization@lfdr.de>; Fri,  1 May 2020 16:41:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6CBC321517;
	Fri,  1 May 2020 14:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eP9Q3VjH4Rtz; Fri,  1 May 2020 14:41:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DC292221A9;
	Fri,  1 May 2020 14:41:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9EDCC016F;
	Fri,  1 May 2020 14:41:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B865C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0030C889FA
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id df6mxAslaDJ6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DDF5889F6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  1 May 2020 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588344069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMCVUX3SZIQcfGxvWeP6Mw5R9IcHL0EXZloLxMg4CEI=;
 b=Omm4X9bSs6kHRwasNF5KOufg0lNKs7j5Q0bIKrYQlIz2VI/pQJIfH9/W797UimdcJOMVKO
 metCThkSxEQ+WKO3xdpMqWc8FV8rBq8J/wTY9A0IqpbsaORvUb5VIc0RoZfVMVJqyZU3+V
 EhpPbGS1VZJKoFLUJlEZgIWC20o2VlQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-J7UlnTLMN4OFzcYrpWgA9Q-1; Fri, 01 May 2020 10:40:56 -0400
X-MC-Unique: J7UlnTLMN4OFzcYrpWgA9Q-1
Received: by mail-wr1-f70.google.com with SMTP id u4so5776146wrm.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 01 May 2020 07:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FMCVUX3SZIQcfGxvWeP6Mw5R9IcHL0EXZloLxMg4CEI=;
 b=eX4Y4AlqIbSUDgp8xMIli7TlPKJ5VGC0iguXQOQBf2Lm+BDNV6dJQx1FC4wreVREx3
 ime8NZMUnLJvYx+CWPdPg2vna1SAPwkZfXugCu4tP2DHaHFOpyE02G2zTlVKLRvO7cnB
 TaddTYSuPPdklao9Bv4cfVXpkMWxvtR0q6dGbgG7VYZV5WLlz+kbnCJvj+e3jhi5tEYD
 6LwBwP3kZx49Dn487L49vXaEoUe7/gOd8ohof1GqRvr49H1UcfTQu8n2HjIplIc4Egzf
 gyAELa6KhRKcNS3Iwha59hmAg200jPGHOuFt2/bWSvunbF5aZVjqsoBYXIjXx2YCbCKO
 /a0A==
X-Gm-Message-State: AGi0Pub2oQRHljBexSbXn8LVbMf7bkPLZMH9Zt4YuaPUcs8d8JcJsIZw
 tmEUns2/zKGGrxGDLIsTZuFd28txbb9twvmmimIuYgpuWjTgE6egmXpWO3zfCQ0N9Qrp6ulJEUQ
 mZPgqtFcqiclXAnTXFhO2tpgbvVEjvMmdSJshfxkGmA==
X-Received: by 2002:adf:df82:: with SMTP id z2mr4930984wrl.58.1588344054920;
 Fri, 01 May 2020 07:40:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlKvu49W7Dejd9vm/UPweyZkYbpJJGe7ZlU91a4UNN1ZrYUoJL1vdxXdT4Bd7iUQNCZUPcMg==
X-Received: by 2002:adf:df82:: with SMTP id z2mr4930967wrl.58.1588344054718;
 Fri, 01 May 2020 07:40:54 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id j13sm4611452wrq.24.2020.05.01.07.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 07:40:53 -0700 (PDT)
Date: Fri, 1 May 2020 16:40:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia He <justin.he@arm.com>
Subject: Re: [PATCH v2] vhost: vsock: kick send_pkt worker once device is
 started
Message-ID: <20200501144051.aotbofpyuy5tqcfp@steredhat>
References: <20200501043840.186557-1-justin.he@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200501043840.186557-1-justin.he@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Kaly Xin <Kaly.Xin@arm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Fri, May 01, 2020 at 12:38:40PM +0800, Jia He wrote:
> Ning Bo reported an abnormal 2-second gap when booting Kata container [1].
> The unconditional timeout was caused by VSOCK_DEFAULT_CONNECT_TIMEOUT of
> connecting from the client side. The vhost vsock client tries to connect
> an initializing virtio vsock server.
> 
> The abnormal flow looks like:
> host-userspace           vhost vsock                       guest vsock
> ==============           ===========                       ============
> connect()     -------->  vhost_transport_send_pkt_work()   initializing
>    |                     vq->private_data==NULL
>    |                     will not be queued
>    V
> schedule_timeout(2s)
>                          vhost_vsock_start()  <---------   device ready
>                          set vq->private_data
> 
> wait for 2s and failed
> connect() again          vq->private_data!=NULL         recv connecting pkt
> 
> Details:
> 1. Host userspace sends a connect pkt, at that time, guest vsock is under
>    initializing, hence the vhost_vsock_start has not been called. So
>    vq->private_data==NULL, and the pkt is not been queued to send to guest
> 2. Then it sleeps for 2s
> 3. After guest vsock finishes initializing, vq->private_data is set
> 4. When host userspace wakes up after 2s, send connecting pkt again,
>    everything is fine.
> 
> As suggested by Stefano Garzarella, this fixes it by additional kicking the
> send_pkt worker in vhost_vsock_start once the virtio device is started. This
> makes the pending pkt sent again.
> 
> After this patch, kata-runtime (with vsock enabled) boot time is reduced
> from 3s to 1s on a ThunderX2 arm64 server.
> 
> [1] https://github.com/kata-containers/runtime/issues/1917
> 
> Reported-by: Ning Bo <n.b@live.com>
> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Jia He <justin.he@arm.com>
> ---
> v2: new solution suggested by Stefano Garzarella
> 
>  drivers/vhost/vsock.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index e36aaf9ba7bd..0716a9cdffee 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -543,6 +543,11 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
>  		mutex_unlock(&vq->mutex);
>  	}
>  
> +	/* Some packets may have been queued before the device was started,
> +	 * let's kick the send worker to send them.
> +	 */
> +	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
> +
>  	mutex_unlock(&vsock->dev.mutex);
>  	return 0;
>  
> -- 
> 2.17.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
