Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD61F2148
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 23:09:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9063B20483;
	Mon,  8 Jun 2020 21:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id djqKXWFe0Un7; Mon,  8 Jun 2020 21:09:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5EF9420C92;
	Mon,  8 Jun 2020 21:09:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D623C016F;
	Mon,  8 Jun 2020 21:09:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA68EC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D892520483
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2+PIsv5s20g
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 21:09:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id C078220415
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 21:09:07 +0000 (UTC)
IronPort-SDR: Yn9SDMkhUoMHq7BO68DxbZYdpIfD0//4a9GBlIqJNbSaH233t9OW+OaVn6lKhCJO47S99+aZ6V
 KsY18AmKniyA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 14:09:06 -0700
IronPort-SDR: frmd7NyexTaQPNjw1Wq1AJSAV6dMLQE7KIOqLtiiSTgWfM1QMpgYdkgCZm7nHZaMI3r22Vvpob
 O5elf8Oxn2/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,489,1583222400"; d="scan'208";a="288603314"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.152])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 14:09:06 -0700
Date: Mon, 8 Jun 2020 14:09:06 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio_net: Unregister and re-register xdp_rxq across
 freeze/restore
Message-ID: <20200608210906.GG8223@linux.intel.com>
References: <20200605214624.21430-1-sean.j.christopherson@intel.com>
 <20200607091542-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607091542-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
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

On Sun, Jun 07, 2020 at 09:23:03AM -0400, Michael S. Tsirkin wrote:
> On Fri, Jun 05, 2020 at 02:46:24PM -0700, Sean Christopherson wrote:
> > @@ -1480,17 +1495,10 @@ static int virtnet_open(struct net_device *dev)
> >  			if (!try_fill_recv(vi, &vi->rq[i], GFP_KERNEL))
> >  				schedule_delayed_work(&vi->refill, 0);
> >  
> > -		err = xdp_rxq_info_reg(&vi->rq[i].xdp_rxq, dev, i);
> > +		err = virtnet_reg_xdp(&vi->rq[i].xdp_rxq, dev, i);
> >  		if (err < 0)
> >  			return err;
> >  
> > -		err = xdp_rxq_info_reg_mem_model(&vi->rq[i].xdp_rxq,
> > -						 MEM_TYPE_PAGE_SHARED, NULL);
> > -		if (err < 0) {
> > -			xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
> > -			return err;
> > -		}
> > -
> >  		virtnet_napi_enable(vi->rq[i].vq, &vi->rq[i].napi);
> >  		virtnet_napi_tx_enable(vi, vi->sq[i].vq, &vi->sq[i].napi);
> >  	}
> > @@ -2306,6 +2314,7 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
> >  
> >  	if (netif_running(vi->dev)) {
> >  		for (i = 0; i < vi->max_queue_pairs; i++) {
> > +			xdp_rxq_info_unreg(&vi->rq[i].xdp_rxq);
> >  			napi_disable(&vi->rq[i].napi);
> >  			virtnet_napi_tx_disable(&vi->sq[i].napi);
> 
> I suspect the right thing to do is to first disable all NAPI,
> then play with XDP. Generally cleanup in the reverse order
> of init is a good idea.

Hmm, I was simply following virtnet_close().  Actually, the entire loop
could be factored out into a separate helper.  Perhaps do that as part of
the fix, and then invert the ordering in a separate patch?

> >  		}
> > @@ -2313,6 +2322,8 @@ static void virtnet_freeze_down(struct virtio_device *vdev)
> >  }
> >  
> >  static int init_vqs(struct virtnet_info *vi);
> > +static void virtnet_del_vqs(struct virtnet_info *vi);
> > +static void free_receive_page_frags(struct virtnet_info *vi);
> 
> I'd really rather we reordered code so forward decls are not necessary.

Yeah, no argument from me.  Would you prefer the reordering in a separate
patch on top, e.g. to simplify potential backporting?

> >  static int virtnet_restore_up(struct virtio_device *vdev)
> >  {
> > @@ -2331,6 +2342,10 @@ static int virtnet_restore_up(struct virtio_device *vdev)
> >  				schedule_delayed_work(&vi->refill, 0);
> >  
> >  		for (i = 0; i < vi->max_queue_pairs; i++) {
> > +			err = virtnet_reg_xdp(&vi->rq[i].xdp_rxq, vi->dev, i);
> > +			if (err)
> > +				goto free_vqs;
> > +
> >  			virtnet_napi_enable(vi->rq[i].vq, &vi->rq[i].napi);
> >  			virtnet_napi_tx_enable(vi, vi->sq[i].vq,
> >  					       &vi->sq[i].napi);
> > @@ -2340,6 +2355,12 @@ static int virtnet_restore_up(struct virtio_device *vdev)
> >  	netif_tx_lock_bh(vi->dev);
> >  	netif_device_attach(vi->dev);
> >  	netif_tx_unlock_bh(vi->dev);
> > +	return 0;
> > +
> > +free_vqs:
> > +	cancel_delayed_work_sync(&vi->refill);
> > +	free_receive_page_frags(vi);
> > +	virtnet_del_vqs(vi);
> 
> 
> I am not sure this is safe to do after device-ready.
> 
> Can reg xdp happen before device ready?

From a code perspective, I don't see anything that will explode, but I have
no idea if that's correct/sane behavior.

FWIW, the xdp error handling in virtnet_open() also looks bizarre to me,
e.g. bails in the middle of a loop without doing any cleanup.  I assume
virtnet_close() wouldn't called if open failed?  But I can't determine
whether or not that holds true based on code inspection, there are too many
call sites that lead to open and close.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
