Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D1A11CDF3
	for <lists.virtualization@lfdr.de>; Thu, 12 Dec 2019 14:15:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 014E1882F1;
	Thu, 12 Dec 2019 13:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1mubSttNNe0; Thu, 12 Dec 2019 13:15:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3AC4D882E1;
	Thu, 12 Dec 2019 13:15:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C021C1D85;
	Thu, 12 Dec 2019 13:15:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2673EC0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 13:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0D1F88706F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 13:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81dF7MZnmo8P
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 13:15:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 38BAE8706E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576156499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hn0xCwYEq0XQfRnXOVVAHvtgv1nH7FtNpc92A2V9U6g=;
 b=ZlHbQiSwh61v2RYRawt0Rm1XSbOLLjB5L/aBZyEAw2pBvH3IERcHMUPThgA8/EIr/0ViJD
 o7bro0E0Ie0UhQnq83lzcbffO64ENfPYvTMrIWn7J8XLf8n9vAn/gP+pDo+xbARVV4q1z2
 l/OEbHkfVJTXl/62W9Kgsq0WRvjSDTA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-D2SNfqPhN0WqQbAnrQaHBQ-1; Thu, 12 Dec 2019 08:14:58 -0500
Received: by mail-wm1-f69.google.com with SMTP id l11so1652768wmi.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Dec 2019 05:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fLjEJ9DPJesgnmsDD/FbLzKF663mvixPtyFrapicoaw=;
 b=E6kcKMlt4xVxLKHE4+hwAKRW+JrdFuKdnGzJN4eSjuunKvAvPh1a+sseuGHTRNKxIb
 lb+36g59uWKxo7JnOg/84LZZqLJ98fH8cPbZw6PpYYNpGsQy1zGzd8iVlIFnqODdSMZi
 mlM/rtt8NZOIHekqjM+7+KZdNZEiwYoaqU6QLLf2Liq2KJAX4+b5I7wPJzlCz8KWEBI/
 iHeYC34kAFChBNezJEAzfM5/PrpiRtYqHzcOQxS8za3vPbdtEGrwiF29Y+YiBLT/uk6i
 XI/QsqYYMl2islotlodLTpFIYJhSvWlFL0BPpgxd+L7+2i5EiSoCNuzaLmvR4v3pymsb
 AbVg==
X-Gm-Message-State: APjAAAVZ70B5rg45e4eG/yLsuS9P3/2a4M+4a0dO3qWxO9vywjrWjvnh
 qM3S8mYqJkhFl4Ui0qXueg5oOgedph4nwgme+gXLJ6+pvRc+cFlEfbQrMAiP+W700OC2AXrYm1W
 uL3p4Zf7QnvGLW9jjkJcAapcgefiIB4p04KwWBp/FdQ==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr6343835wru.296.1576156496998; 
 Thu, 12 Dec 2019 05:14:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfIILiE0bsGuZKwQ+0ufP4htjxim2PfR+3JovR5iPj+PI79E6uhhtXaVikmm1YgkD8oUUC6Q==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr6343805wru.296.1576156496681; 
 Thu, 12 Dec 2019 05:14:56 -0800 (PST)
Received: from steredhat ([95.235.120.92])
 by smtp.gmail.com with ESMTPSA id e18sm5965389wrr.95.2019.12.12.05.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 05:14:56 -0800 (PST)
Date: Thu, 12 Dec 2019 14:14:53 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, davem@davemloft.net
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <20191212131453.yocx6wckoluwofbb@steredhat>
References: <20191206143912.153583-1-sgarzare@redhat.com>
 <20191211110235-mutt-send-email-mst@kernel.org>
 <20191212123624.ahyhrny7u6ntn3xt@steredhat>
 <20191212075356-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191212075356-mutt-send-email-mst@kernel.org>
X-MC-Unique: D2SNfqPhN0WqQbAnrQaHBQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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

On Thu, Dec 12, 2019 at 07:56:26AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 12, 2019 at 01:36:24PM +0100, Stefano Garzarella wrote:
> > On Wed, Dec 11, 2019 at 11:03:07AM -0500, Michael S. Tsirkin wrote:
> > > On Fri, Dec 06, 2019 at 03:39:12PM +0100, Stefano Garzarella wrote:
> > > > When we receive a new packet from the guest, we check if the
> > > > src_cid is correct, but we forgot to check the dst_cid.
> > > > 
> > > > The host should accept only packets where dst_cid is
> > > > equal to the host CID.
> > > > 
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > 
> > > Stefano can you clarify the impact pls?
> > 
> > Sure, I'm sorry I didn't do it earlier.
> > 
> > > E.g. is this needed on stable? Etc.
> > 
> > This is a better analysis (I hope) when there is a malformed guest
> > that sends a packet with a wrong dst_cid:
> > - before v5.4 we supported only one transport at runtime, so the sockets
> >   in the host can only receive packets from guests. In this case, if
> >   the dst_cid is wrong, maybe the only issue is that the getsockname()
> >   returns an inconsistent address (the cid returned is the one received
> >   from the guest)
> > 
> > - from v5.4 we support multi-transport, so the L1 VM (e.g. L0 assigned
> >   cid 5 to this VM) can have both Guest2Host and Host2Guest transports.
> >   In this case, we have these possible issues:
> >   - L2 (or L1) guest can use cid 0, 1, and 2 to reach L1 (or L0),
> >     instead we should allow only CID_HOST (2) to reach the level below.
> >     Note: this happens also with not malformed guest that runs Linux v5.4
> >   - if a malformed L2 guest sends a packet with the wrong dst_cid, for example
> >     instead of CID_HOST, it uses the cid assigned by L0 to L1 (5 in this
> >     example), this packets can wrongly queued to a socket on L1 bound to cid 5,
> >     that only expects connections from L0.
> 
> Oh so a security issue?
> 

It seems so, I'll try to see if I can get a real example,
maybe I missed a few checks.

> > 
> > Maybe we really need this only on stable v5.4, but the patch is very simple
> > and should apply cleanly to all stable branches.
> > 
> > What do you think?
> > 
> > Thanks,
> > Stefano
> 
> I'd say it's better to backport to all stable releases where it applies,
> but yes it's only a security issue in 5.4.  Dave could you forward pls?

Yes, I agree with you.

@Dave let me know if I should do it.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
