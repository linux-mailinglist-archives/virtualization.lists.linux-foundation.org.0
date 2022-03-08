Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDCB4D1402
	for <lists.virtualization@lfdr.de>; Tue,  8 Mar 2022 10:57:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB32F4047B;
	Tue,  8 Mar 2022 09:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0XbsqcUL1pf; Tue,  8 Mar 2022 09:57:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F180140489;
	Tue,  8 Mar 2022 09:57:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52BA8C000B;
	Tue,  8 Mar 2022 09:57:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEEF9C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 09:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C72B960F34
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 09:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uxf-Oz73zRCl
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 09:57:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABCF860F32
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 09:57:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 12ABDB81840;
 Tue,  8 Mar 2022 09:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E02C340EB;
 Tue,  8 Mar 2022 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646733465;
 bh=7GPwiQFAd5CuYvQ6BoG6+MDynbTBHNmzU2GdfJdpniw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyV5TecsHnCQcROeM6ptXccS+s2HQjlww+bQgyjZlDS12CoULoQ9IwWiP3e4BOx+R
 xTttNLd0bQzd40C40Q+UNSCG7MkHW3syr8Rwwq+5XkKzHqxDFeJVg7KjprApnRaiL4
 EBBlUc+GVKbwA0LxjpX4jt/a+64eFlAefvSZifuk=
Date: Tue, 8 Mar 2022 10:57:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] vhost: Protect the virtqueue from being cleared
 whilst still in use
Message-ID: <YicolvcbY9VT6AKc@kroah.com>
References: <20220307191757.3177139-1-lee.jones@linaro.org>
 <YiZeB7l49KC2Y5Gz@kroah.com> <YicPXnNFHpoJHcUN@google.com>
 <Yicalf1I6oBytbse@kroah.com> <Yicer3yGg5rrdSIs@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yicer3yGg5rrdSIs@google.com>
Cc: syzbot+adc3cb32385586bec859@syzkaller.appspotmail.com, kvm@vger.kernel.org,
 mst@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, Mar 08, 2022 at 09:15:27AM +0000, Lee Jones wrote:
> On Tue, 08 Mar 2022, Greg KH wrote:
> 
> > On Tue, Mar 08, 2022 at 08:10:06AM +0000, Lee Jones wrote:
> > > On Mon, 07 Mar 2022, Greg KH wrote:
> > > 
> > > > On Mon, Mar 07, 2022 at 07:17:57PM +0000, Lee Jones wrote:
> > > > > vhost_vsock_handle_tx_kick() already holds the mutex during its call
> > > > > to vhost_get_vq_desc().  All we have to do here is take the same lock
> > > > > during virtqueue clean-up and we mitigate the reported issues.
> > > > > 
> > > > > Also WARN() as a precautionary measure.  The purpose of this is to
> > > > > capture possible future race conditions which may pop up over time.
> > > > > 
> > > > > Link: https://syzkaller.appspot.com/bug?extid=279432d30d825e63ba00
> > > > > 
> > > > > Cc: <stable@vger.kernel.org>
> > > > > Reported-by: syzbot+adc3cb32385586bec859@syzkaller.appspotmail.com
> > > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > > ---
> > > > >  drivers/vhost/vhost.c | 10 ++++++++++
> > > > >  1 file changed, 10 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > > > > index 59edb5a1ffe28..ef7e371e3e649 100644
> > > > > --- a/drivers/vhost/vhost.c
> > > > > +++ b/drivers/vhost/vhost.c
> > > > > @@ -693,6 +693,15 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
> > > > >  	int i;
> > > > >  
> > > > >  	for (i = 0; i < dev->nvqs; ++i) {
> > > > > +		/* No workers should run here by design. However, races have
> > > > > +		 * previously occurred where drivers have been unable to flush
> > > > > +		 * all work properly prior to clean-up.  Without a successful
> > > > > +		 * flush the guest will malfunction, but avoiding host memory
> > > > > +		 * corruption in those cases does seem preferable.
> > > > > +		 */
> > > > > +		WARN_ON(mutex_is_locked(&dev->vqs[i]->mutex));
> > > > 
> > > > So you are trading one syzbot triggered issue for another one in the
> > > > future?  :)
> > > > 
> > > > If this ever can happen, handle it, but don't log it with a WARN_ON() as
> > > > that will trigger the panic-on-warn boxes, as well as syzbot.  Unless
> > > > you want that to happen?
> > > 
> > > No, Syzbot doesn't report warnings, only BUGs and memory corruption.
> > 
> > Has it changed?  Last I looked, it did trigger on WARN_* calls, which
> > has resulted in a huge number of kernel fixes because of that.
> 
> Everything is customisable in syzkaller, so maybe there are specific
> builds which panic_on_warn enabled, but none that I'm involved with
> do.

Many systems run with panic-on-warn (i.e. the cloud), as they want to
drop a box and restart it if anything goes wrong.

That's why syzbot reports on WARN_* calls.  They should never be
reachable by userspace actions.

> Here follows a topical example.  The report above in the Link: tag
> comes with a crashlog [0].  In there you can see the WARN() at the
> bottom of vhost_dev_cleanup() trigger many times due to a populated
> (non-flushed) worker list, before finally tripping the BUG() which
> triggers the report:
> 
> [0] https://syzkaller.appspot.com/text?tag=CrashLog&x=16a61fce700000

Ok, so both happens here.  But don't add a warning for something that
can't happen.  Just handle it and move on.  It looks like you are
handling it in this code, so please drop the WARN_ON().

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
