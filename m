Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 576231FEFC0
	for <lists.virtualization@lfdr.de>; Thu, 18 Jun 2020 12:39:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E66EB88671;
	Thu, 18 Jun 2020 10:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t75oeEgxGkIj; Thu, 18 Jun 2020 10:39:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E20E88612;
	Thu, 18 Jun 2020 10:39:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A79AC016E;
	Thu, 18 Jun 2020 10:39:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39378C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 10:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 279C7875C8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 10:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXAcDVmP2g4u
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 10:39:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB085874F0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 10:39:46 +0000 (UTC)
IronPort-SDR: 1cIZ77mXlawks0/w6diEhajYKZKZ7ao5WupwE2Cck8RA+ZxzVAEIKwnO1JT6J1KP8Y38oVKcBZ
 kL/FImwAwFNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="144030396"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="144030396"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 03:39:46 -0700
IronPort-SDR: efmyAhrqnUUTVa+J63doBzvYUY1z7NNmys4bQPFZTyiAe3pBGjl1rdgMxijYPFf493+uF4+pal
 RokuuUbx4CfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; d="scan'208";a="273815896"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.48.152])
 by orsmga003.jf.intel.com with ESMTP; 18 Jun 2020 03:39:43 -0700
Date: Thu, 18 Jun 2020 12:39:40 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200618103940.GB4189@ubuntu>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
 <20200617191741.whnp7iteb36cjnia@axis.com>
 <20200618090341.GA4189@ubuntu>
 <20200618093324.tu7oldr332ndfgev@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618093324.tu7oldr332ndfgev@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

On Thu, Jun 18, 2020 at 11:33:24AM +0200, Vincent Whitchurch wrote:
> On Thu, Jun 18, 2020 at 11:03:42AM +0200, Guennadi Liakhovetski wrote:
> > On Wed, Jun 17, 2020 at 09:17:42PM +0200, Vincent Whitchurch wrote:
> > > On Wed, May 27, 2020 at 08:05:41PM +0200, Guennadi Liakhovetski wrote:
> > > > Linux supports running the RPMsg protocol over the VirtIO transport
> > > > protocol, but currently there is only support for VirtIO clients and
> > > > no support for a VirtIO server. This patch adds a vhost-based RPMsg
> > > > server implementation.
> > > 
> > > This looks really useful, but why is it implemented as an API and not as
> > > a real vhost driver which implements an rpmsg bus?  If you implement it
> > > as a vhost driver which implements rpmsg_device_ops and
> > > rpmsg_endpoint_ops, then wouldn't you be able to implement your
> > > vhost-sof driver using the normal rpmsg APIs?
> > 
> > Sorry, not sure what you mean by the "normal rpmsg API?" Do you mean the 
> > VirtIO RPMsg API? But that's the opposite side of the link - that's the 
> > guest side in the VM case and the Linux side in the remoteproc case. What 
> > this API is adding is a vhost RPMsg API. The kernel vhost framework 
> > itself is essentially a library of functions. Kernel vhost drivers simply 
> > create a misc device and use the vhost functions for some common 
> > functionality. This RPMsg vhost API stays in the same concept and provides 
> > further functions for RPMsg specific vhost operation.
> 
> By the "normal rpmsg API" I mean register_rpmsg_driver(), rpmsg_send(),
> etc.  That API is not tied to virtio in any way and there are other
> non-virtio backends for this API in the tree.  So it seems quite natural
> to implement a vhost backend for this API so that both sides of the link
> can use the same API but different backends, instead of forcing them to
> use of different APIs.

Ok, I see what you mean now. But I'm not sure this is useful or desired. I'm 
not an expert in KVM / VirtIO, I've only been working in the area for less 
than a year, so, I might well be wrong.

You're proposing to use the rpmsg API in vhost drivers. As far as I 
understand so far that API was only designated for the Linux side (in case of 
AMPs) which corresponds to VM guests in virtualisation case. So, I'm not sure 
we want to use the same API for the hosts? This can be done as you have 
illustrated, but is it desirable? The vhost API is far enough from the VirtIO 
driver API, so I'm not sure why we want the same API for rpmsg?

Thanks
Guennadi

> > > I tried quickly hooking up this code to such a vhost driver and I was
> > > able to communicate between host and guest systems with both
> > > rpmsg-client-sample and rpmsg-char which almost no modifications to
> > > those drivers.
> > 
> > You mean you used this patch to create RPMsg vhost drivers? Without 
> > creating a vhost RPMsg bus? Nice, glad to hear that!
> 
> Not quite, I hacked togther a single generic vhost-rpmsg-bus driver
> which just wraps the API in this patch and implements a basic
> rpmsg_device_ops and rpmsg_endpoint_ops.  Then with the following
> patches and no other vhost-specific API use, I was able to load and use
> the same rpmsg-char and rpmsg-client-sample drivers on both host and
> guest kernels.
> 
> Userspace sets up the vhost using vhost-rpmsg-bus' misc device and
> triggers creation of an rpdev which leads to a probe of the (for
> example) rpmsg-client-sample driver on the host (server), which, in
> turn, via NS announcement, triggers a creation of an rpdev and a probe
> of the rpmsg-client-sample driver on the guest (client).
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index a76b963a7e5..7a03978d002 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -104,6 +104,11 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>  	struct rpmsg_eptdev *eptdev = priv;
>  	struct sk_buff *skb;
>  
> +	if (rpdev->dst == RPMSG_ADDR_ANY) {
> +		printk("%s: got client address %#x from first rx!\n", __func__, addr);
> +		rpdev->dst = addr;
> +	}
> +
>  	skb = alloc_skb(len, GFP_ATOMIC);
>  	if (!skb)
>  		return -ENOMEM;
> @@ -235,6 +240,12 @@ static ssize_t rpmsg_eptdev_write(struct file *filp, const char __user *buf,
>  		goto unlock_eptdev;
>  	}
>  
> +	if (eptdev->rpdev->dst == RPMSG_ADDR_ANY) {
> +		ret = -EPIPE;
> +		WARN(1, "Cannot write first on server, must wait for client!\n");
> +		goto unlock_eptdev;
> +	}
> +
>  	if (filp->f_flags & O_NONBLOCK)
>  		ret = rpmsg_trysend(eptdev->ept, kbuf, len);
>  	else
> diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
> index f161dfd3e70..5d8ca84dce0 100644
> --- a/samples/rpmsg/rpmsg_client_sample.c
> +++ b/samples/rpmsg/rpmsg_client_sample.c
> @@ -46,6 +46,9 @@ static int rpmsg_sample_cb(struct rpmsg_device *rpdev, void *data, int len,
>  		return 0;
>  	}
>  
> +	if (rpdev->dst == RPMSG_ADDR_ANY)
> +		rpdev->dst = src;
> +
>  	/* send a new message now */
>  	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
>  	if (ret)
> @@ -68,11 +71,13 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
>  
>  	dev_set_drvdata(&rpdev->dev, idata);
>  
> -	/* send a message to our remote processor */
> -	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
> -	if (ret) {
> -		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> -		return ret;
> +	if (rpdev->dst != RPMSG_ADDR_ANY) {
> +		/* send a message to our remote processor */
> +		ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
> +		if (ret) {
> +			dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
