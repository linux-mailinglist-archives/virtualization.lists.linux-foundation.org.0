Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4531BF2B6
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 10:26:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 558CF87916;
	Thu, 30 Apr 2020 08:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFc6Z+vSUDb7; Thu, 30 Apr 2020 08:26:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C01F87AEF;
	Thu, 30 Apr 2020 08:26:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8F7DC016F;
	Thu, 30 Apr 2020 08:26:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08938C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0242588648
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-wk9QgaCZNq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:26:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4DF3288615
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588235176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YGyRDtb4bigS4OJJzosmGsfyXf9UuewqBG5sz68PxEc=;
 b=XD4+LjTR67qMiJunq9cF1ctpi5eWEO1IxZjj904vBOR9NTSrzkz9rnVY4l5fm684p4FtUe
 lo53d4oVFvaL+3rFdvIGx3E4/7bbuuJeG8iU7Yn2me8kn+6RINWv4K/X4DI7B1+T0vVJfD
 YYthciY3/DHq5OJ51ihV+R7xOUp7HpA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-4bLQtLGNMs6uKw7esT0Vmg-1; Thu, 30 Apr 2020 04:26:14 -0400
X-MC-Unique: 4bLQtLGNMs6uKw7esT0Vmg-1
Received: by mail-wm1-f70.google.com with SMTP id f128so492048wmf.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 01:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YGyRDtb4bigS4OJJzosmGsfyXf9UuewqBG5sz68PxEc=;
 b=QRlnBdqrnaIpeZLbkIsEEk/fNKGs0eldpcD/DoGu6OlFniksFV6qZY6zeKXk6h73l5
 bgK1jNNwmDKiRdKOJ6QjlusiLctfSxdJGuHSORoXgSktcmu9PlSkg8IREe5ww7XgetAd
 GlJb8N3/Bq5QlFXcxAwZjmakkpv7N93aUbdQlfeNB92S69JfOlHtyjWzhgZBtHbrjDLY
 xnd5B5mpdIqlVWMKWEt+63wR6uZPeGb7fhuMrHluOZsW8bf55HvVy7gp4Z3O2M7YK+Rp
 uxsgTmVl+P2qAnlhR//b559HS3GTBcCtepL5RwJiB3dVxk2O/Ou2ZvyKZmF83Kp6nlP+
 pWzQ==
X-Gm-Message-State: AGi0PuYc24iiNJFDjwBSOHegLjjMzMDOl8jBFvPIhrQAHHm29LT/CwGS
 DEuI9+iwXcXtjvjQExoVeQgtmlXumtUnLsezjhsloMHIvoepF0FXDlt9mw3fzIGHQVNzOaS7UNn
 YYfsrrW8359ZAUoZQ7XICIiwKPdnMC7Sqj80OP77e7g==
X-Received: by 2002:adf:f781:: with SMTP id q1mr2361214wrp.323.1588235172030; 
 Thu, 30 Apr 2020 01:26:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJoi4cvRWNuIpuOzpMBz+IGc+hNuGVeAAtdk4bhTz0tRoJTi6UyA0vRsxW70RBXtjBsbtVC5Q==
X-Received: by 2002:adf:f781:: with SMTP id q1mr2361196wrp.323.1588235171773; 
 Thu, 30 Apr 2020 01:26:11 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id z8sm2874873wrr.40.2020.04.30.01.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 01:26:11 -0700 (PDT)
Date: Thu, 30 Apr 2020 10:26:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia He <justin.he@arm.com>
Subject: Re: [PATCH] vhost: vsock: don't send pkt when vq is not started
Message-ID: <20200430082608.wbtqgglmtnd7e5ci@steredhat>
References: <20200430021314.6425-1-justin.he@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200430021314.6425-1-justin.he@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Kaly.Xin@arm.com,
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

Hi Jia,
thanks for the patch, some comments below:

On Thu, Apr 30, 2020 at 10:13:14AM +0800, Jia He wrote:
> Ning Bo reported an abnormal 2-second gap when booting Kata container [1].
> The unconditional timeout is caused by VSOCK_DEFAULT_CONNECT_TIMEOUT of
> connect at client side. The vhost vsock client tries to connect an
> initlizing virtio vsock server.
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
> 
> connect() again          vq->private_data!=NULL          recv connecting pkt
> 
> 1. host userspace sends a connect pkt, at that time, guest vsock is under
> initializing, hence the vhost_vsock_start has not been called. So
> vq->private_data==NULL, and the pkt is not been queued to send to guest.
> 2. then it sleeps for 2s
> 3. after guest vsock finishes initializing, vq->private_data is set.
> 4. When host userspace wakes up after 2s, send connecting pkt again,
> everything is fine.
> 
> This fixes it by checking vq->private_data in vhost_transport_send_pkt,
> and return at once if !vq->private_data. This makes user connect()
> be returned with ECONNREFUSED.
> 
> After this patch, kata-runtime (with vsock enabled) boottime reduces from
> 3s to 1s on ThunderX2 arm64 server.
> 
> [1] https://github.com/kata-containers/runtime/issues/1917
> 
> Reported-by: Ning Bo <n.b@live.com>
> Signed-off-by: Jia He <justin.he@arm.com>
> ---
>  drivers/vhost/vsock.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index e36aaf9ba7bd..67474334dd88 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -241,6 +241,7 @@ vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
>  {
>  	struct vhost_vsock *vsock;
>  	int len = pkt->len;
> +	struct vhost_virtqueue *vq;
>  
>  	rcu_read_lock();
>  
> @@ -252,6 +253,13 @@ vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
>  		return -ENODEV;
>  	}
>  
> +	vq = &vsock->vqs[VSOCK_VQ_RX];
> +	if (!vq->private_data) {

I think is better to use vhost_vq_get_backend():

	if (!vhost_vq_get_backend(&vsock->vqs[VSOCK_VQ_RX])) {
		...

This function should be called with 'vq->mutex' acquired as explained in
the comment, but here we can avoid that, because we are not using the vq,
so it is safe, because in vhost_transport_do_send_pkt() we check it again.

Please add a comment explaining that.


As an alternative to this patch, should we kick the send worker when the
device is ready?

IIUC we reach the timeout because the send worker (that runs
vhost_transport_do_send_pkt()) exits immediately since 'vq->private_data'
is NULL, and no one will requeue it.

Let's do it when we know the device is ready:

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index e36aaf9ba7bd..295b5867944f 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -543,6 +543,11 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
                mutex_unlock(&vq->mutex);
        }
 
+       /* Some packets may have been queued before the device was started,
+        * let's kick the send worker to send them.
+        */
+       vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
+
        mutex_unlock(&vsock->dev.mutex);
        return 0;

I didn't test it, can you try if it fixes the issue?

I'm not sure which is better...

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
