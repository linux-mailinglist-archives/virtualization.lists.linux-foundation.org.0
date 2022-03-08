Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C6E4D12F3
	for <lists.virtualization@lfdr.de>; Tue,  8 Mar 2022 09:58:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FA4360F19;
	Tue,  8 Mar 2022 08:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t_afnvPk14LF; Tue,  8 Mar 2022 08:58:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 02CAB60F22;
	Tue,  8 Mar 2022 08:58:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74664C0073;
	Tue,  8 Mar 2022 08:58:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92A1CC000B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 08:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8320940193
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qyif4LqHYuGE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 08:58:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2AE040164
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Mar 2022 08:58:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C63261239;
 Tue,  8 Mar 2022 08:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA6AC340EB;
 Tue,  8 Mar 2022 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646729880;
 bh=g8JnrciyA5hVe9iyiMja39wfKFTI4eghy2XVxEq8voQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t/s29xuMklvlvsfmHRfDg9OiclbQlbVZX8uChLs/iNDYVHYxBhBhmcB/RTVBN8DrM
 sg4pdWLQEckaaK6banT+xBdd6RHSBthFqKnhND6G/1OFKtgE+z7J909kFBLzLQWXKQ
 pqo+UZmD8jNT0P7y8UJ53GCHfD2zkk2UVSkJViy8=
Date: Tue, 8 Mar 2022 09:57:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] vhost: Protect the virtqueue from being cleared
 whilst still in use
Message-ID: <Yicalf1I6oBytbse@kroah.com>
References: <20220307191757.3177139-1-lee.jones@linaro.org>
 <YiZeB7l49KC2Y5Gz@kroah.com> <YicPXnNFHpoJHcUN@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YicPXnNFHpoJHcUN@google.com>
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

On Tue, Mar 08, 2022 at 08:10:06AM +0000, Lee Jones wrote:
> On Mon, 07 Mar 2022, Greg KH wrote:
> 
> > On Mon, Mar 07, 2022 at 07:17:57PM +0000, Lee Jones wrote:
> > > vhost_vsock_handle_tx_kick() already holds the mutex during its call
> > > to vhost_get_vq_desc().  All we have to do here is take the same lock
> > > during virtqueue clean-up and we mitigate the reported issues.
> > > 
> > > Also WARN() as a precautionary measure.  The purpose of this is to
> > > capture possible future race conditions which may pop up over time.
> > > 
> > > Link: https://syzkaller.appspot.com/bug?extid=279432d30d825e63ba00
> > > 
> > > Cc: <stable@vger.kernel.org>
> > > Reported-by: syzbot+adc3cb32385586bec859@syzkaller.appspotmail.com
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/vhost/vhost.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > > index 59edb5a1ffe28..ef7e371e3e649 100644
> > > --- a/drivers/vhost/vhost.c
> > > +++ b/drivers/vhost/vhost.c
> > > @@ -693,6 +693,15 @@ void vhost_dev_cleanup(struct vhost_dev *dev)
> > >  	int i;
> > >  
> > >  	for (i = 0; i < dev->nvqs; ++i) {
> > > +		/* No workers should run here by design. However, races have
> > > +		 * previously occurred where drivers have been unable to flush
> > > +		 * all work properly prior to clean-up.  Without a successful
> > > +		 * flush the guest will malfunction, but avoiding host memory
> > > +		 * corruption in those cases does seem preferable.
> > > +		 */
> > > +		WARN_ON(mutex_is_locked(&dev->vqs[i]->mutex));
> > 
> > So you are trading one syzbot triggered issue for another one in the
> > future?  :)
> > 
> > If this ever can happen, handle it, but don't log it with a WARN_ON() as
> > that will trigger the panic-on-warn boxes, as well as syzbot.  Unless
> > you want that to happen?
> 
> No, Syzbot doesn't report warnings, only BUGs and memory corruption.

Has it changed?  Last I looked, it did trigger on WARN_* calls, which
has resulted in a huge number of kernel fixes because of that.

> > And what happens if the mutex is locked _RIGHT_ after you checked it?
> > You still have a race...
> 
> No, we miss a warning that one time.  Memory is still protected.

Then don't warn on something that doesn't matter.  This line can be
dropped as there's nothing anyone can do about it, right?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
