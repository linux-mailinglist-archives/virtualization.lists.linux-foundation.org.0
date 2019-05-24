Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDA29E78
	for <lists.virtualization@lfdr.de>; Fri, 24 May 2019 20:51:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA76E1105;
	Fri, 24 May 2019 18:51:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B6CA9B0B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 18:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EDCE4F4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 24 May 2019 18:51:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3441821848;
	Fri, 24 May 2019 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558723894;
	bh=+PiQxhORYMt326tyGMmMXRxjOS2IPxS8uRhZIcpuKbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ybqjOnB26JLHuvWJ9GeSMnhWV3+Tb+iqO9nk0HbNeOJPW8bcGYr/IFStHGHhwlb34
	kb8wNFQ/XkYQDzbq2yROu3vLBHMkY1JeRb+bD1NMCOS5JdAH7V7ijCJ/dsH9Lffw2W
	J1Wac1tQbt471p6LglL03GVbvffVTavPWHpueTDw=
Date: Fri, 24 May 2019 20:51:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: amit@kernel.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH] virtio_console: remove vq buf while unpluging port
Message-ID: <20190524185132.GA10695@kroah.com>
References: <1556416204-30311-1-git-send-email-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556416204-30311-1-git-send-email-pizhenwei@bytedance.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de, amit@kernel.org
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

On Sun, Apr 28, 2019 at 09:50:04AM +0800, zhenwei pi wrote:
> A bug can be easily reproduced:
> Host# cat guest-agent.xml
> <channel type="unix">
>   <source mode="bind" path="/var/lib/libvirt/qemu/stretch.agent"/>
>   <target type="virtio" name="org.qemu.guest_agent.0" state="connected"/>
> </channel>
> Host# virsh attach-device instance guest-agent.xml
> Host# virsh detach-device instance guest-agent.xml
> Host# virsh attach-device instance guest-agent.xml
> 
> and guest report: virtio-ports vport0p1: Error allocating inbufs
> 
> The reason is that the port is unplugged and the vq buf still remained.
> So, fix two cases in this patch:
> 1, fix memory leak with attach-device/detach-device.
> 2, fix logic bug with attach-device/detach-device/attach-device.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  drivers/char/virtio_console.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index fbeb719..f6e37f4 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -251,6 +251,7 @@ struct port {
>  
>  /* This is the very early arch-specified put chars function. */
>  static int (*early_put_chars)(u32, const char *, int);
> +static void remove_vq(struct virtqueue *vq);
>  
>  static struct port *find_port_by_vtermno(u32 vtermno)
>  {
> @@ -1550,6 +1551,9 @@ static void unplug_port(struct port *port)
>  	}
>  
>  	remove_port_data(port);
> +	spin_lock_irq(&port->inbuf_lock);
> +	remove_vq(port->in_vq);
> +	spin_unlock_irq(&port->inbuf_lock);
>  
>  	/*
>  	 * We should just assume the device itself has gone off --
> @@ -1945,17 +1949,22 @@ static const struct file_operations portdev_fops = {
>  	.owner = THIS_MODULE,
>  };
>  
> +static void remove_vq(struct virtqueue *vq)
> +{
> +	struct port_buffer *buf;
> +
> +	flush_bufs(vq, true);
> +	while ((buf = virtqueue_detach_unused_buf(vq)))
> +		free_buf(buf, true);
> +}
> +
>  static void remove_vqs(struct ports_device *portdev)
>  {
>  	struct virtqueue *vq;
>  
> -	virtio_device_for_each_vq(portdev->vdev, vq) {
> -		struct port_buffer *buf;
> +	virtio_device_for_each_vq(portdev->vdev, vq)
> +		remove_vq(vq);
>  
> -		flush_bufs(vq, true);
> -		while ((buf = virtqueue_detach_unused_buf(vq)))
> -			free_buf(buf, true);
> -	}
>  	portdev->vdev->config->del_vqs(portdev->vdev);
>  	kfree(portdev->in_vqs);
>  	kfree(portdev->out_vqs);
> -- 
> 2.7.4


Amit, any ideas if this is valid or not and if this should be applied?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
