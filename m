Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0CB433260
	for <lists.virtualization@lfdr.de>; Tue, 19 Oct 2021 11:36:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C04406EB;
	Tue, 19 Oct 2021 09:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSKm8aWVhuLa; Tue, 19 Oct 2021 09:36:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B08E9406FF;
	Tue, 19 Oct 2021 09:36:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 462CAC000D;
	Tue, 19 Oct 2021 09:36:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DF37C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 09:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41E3E83C24
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 09:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKfYtTy90dbs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 09:36:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2002182FCE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 09:36:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 404BE61355;
 Tue, 19 Oct 2021 09:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634636177;
 bh=NQqE2z/KGm5u9Kr3otcrSyoobhm80I6yy3yCvR3GYKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwh/w953n9lU67AgSajdSyi3JfGbgMvFnBZBfQ6EmJie20mFp6VBqkXYzmSfUyYOQ
 BS/G9tsasHOJb0RZHmwg8RV7gr/RhavCI+G+hYxd9qnzDn0sHbX3xn92jAJULqdPOb
 c53PNOyBtzXKXntSDfT3+rdzswQ23N5a0OXlfBIU=
Date: Tue, 19 Oct 2021 11:36:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] i2c: virtio: disable timeout handling
Message-ID: <YW6Rj/T6dWfMf7lU@kroah.com>
References: <20211019074647.19061-1-vincent.whitchurch@axis.com>
 <20211019074647.19061-2-vincent.whitchurch@axis.com>
 <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211019080913.oajrvr2msz5enzvz@vireshk-i7>
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, kernel@axis.com, linux-i2c@vger.kernel.org
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

On Tue, Oct 19, 2021 at 01:39:13PM +0530, Viresh Kumar wrote:
> +Greg.
> 
> On 19-10-21, 09:46, Vincent Whitchurch wrote:
> > If a timeout is hit, it can result is incorrect data on the I2C bus
> > and/or memory corruptions in the guest since the device can still be
> > operating on the buffers it was given while the guest has freed them.
> > 
> > Here is, for example, the start of a slub_debug splat which was
> > triggered on the next transfer after one transfer was forced to timeout
> > by setting a breakpoint in the backend (rust-vmm/vhost-device):
> > 
> >  BUG kmalloc-1k (Not tainted): Poison overwritten
> >  First byte 0x1 instead of 0x6b
> >  Allocated in virtio_i2c_xfer+0x65/0x35c age=350 cpu=0 pid=29
> >  	__kmalloc+0xc2/0x1c9
> >  	virtio_i2c_xfer+0x65/0x35c
> >  	__i2c_transfer+0x429/0x57d
> >  	i2c_transfer+0x115/0x134
> >  	i2cdev_ioctl_rdwr+0x16a/0x1de
> >  	i2cdev_ioctl+0x247/0x2ed
> >  	vfs_ioctl+0x21/0x30
> >  	sys_ioctl+0xb18/0xb41
> >  Freed in virtio_i2c_xfer+0x32e/0x35c age=244 cpu=0 pid=29
> >  	kfree+0x1bd/0x1cc
> >  	virtio_i2c_xfer+0x32e/0x35c
> >  	__i2c_transfer+0x429/0x57d
> >  	i2c_transfer+0x115/0x134
> >  	i2cdev_ioctl_rdwr+0x16a/0x1de
> >  	i2cdev_ioctl+0x247/0x2ed
> >  	vfs_ioctl+0x21/0x30
> >  	sys_ioctl+0xb18/0xb41
> > 
> > There is no simple fix for this (the driver would have to always create
> > bounce buffers and hold on to them until the device eventually returns
> > the buffers), so just disable the timeout support for now.
> 
> That is a very valid problem, and I have faced it too when my QEMU
> setup is very slow :)
> 
> > Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> > ---
> >  drivers/i2c/busses/i2c-virtio.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
> > index f10a603b13fb..7b2474e6876f 100644
> > --- a/drivers/i2c/busses/i2c-virtio.c
> > +++ b/drivers/i2c/busses/i2c-virtio.c
> > @@ -106,11 +106,10 @@ static int virtio_i2c_prepare_reqs(struct virtqueue *vq,
> >  
> >  static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> >  				    struct virtio_i2c_req *reqs,
> > -				    struct i2c_msg *msgs, int num,
> > -				    bool timedout)
> > +				    struct i2c_msg *msgs, int num)
> >  {
> >  	struct virtio_i2c_req *req;
> > -	bool failed = timedout;
> > +	bool failed = false;
> >  	unsigned int len;
> >  	int i, j = 0;
> >  
> > @@ -132,7 +131,7 @@ static int virtio_i2c_complete_reqs(struct virtqueue *vq,
> >  			j++;
> >  	}
> >  
> > -	return timedout ? -ETIMEDOUT : j;
> > +	return j;
> >  }
> >  
> >  static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > @@ -141,7 +140,6 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  	struct virtio_i2c *vi = i2c_get_adapdata(adap);
> >  	struct virtqueue *vq = vi->vq;
> >  	struct virtio_i2c_req *reqs;
> > -	unsigned long time_left;
> >  	int count;
> >  
> >  	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
> > @@ -164,11 +162,9 @@ static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> >  	reinit_completion(&vi->completion);
> >  	virtqueue_kick(vq);
> >  
> > -	time_left = wait_for_completion_timeout(&vi->completion, adap->timeout);
> > -	if (!time_left)
> > -		dev_err(&adap->dev, "virtio i2c backend timeout.\n");
> > +	wait_for_completion(&vi->completion);
> 
> Doing this may not be a good thing based on the kernel rules I have
> understood until now. Maybe Greg and Wolfram can clarify on this.
> 
> We are waiting here for an external entity (Host kernel) or a firmware
> that uses virtio for transport. If the other side is hacked, it can
> make the kernel hang here for ever. I thought that is something that
> the kernel should never do.

What is the "other side" here?  Is it something that you trust or not?

Usually we trust the hardware, but if you do not trust the hardware,
then yes, you need to have a timeout here.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
