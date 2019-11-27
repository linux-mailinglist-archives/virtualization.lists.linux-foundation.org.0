Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3709710B718
	for <lists.virtualization@lfdr.de>; Wed, 27 Nov 2019 20:58:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE076876A4;
	Wed, 27 Nov 2019 19:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRdWp716lxvR; Wed, 27 Nov 2019 19:58:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7136587686;
	Wed, 27 Nov 2019 19:58:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 572C1C0881;
	Wed, 27 Nov 2019 19:58:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84947C0881
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 77C2F8798A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LubnCCUGrE87
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 19:58:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 722D787938
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 19:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574884733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4tGDBi5zjoUswRrgwv5c3aU+wWyuxHCnduBquwVclQ=;
 b=ern9GlGKmZ7X0TB4I+P4WnIg9gZL+ZmxPzz8ROypfualgjZsbYHBfS0a9yBidIrx981o/I
 gPRqdsWb5pCDjOoiAl1vKBAPfR67myFHgFKrWHabi03k7MLgNcx6vpBJ8/D7TaLYxJCbqH
 qMUS0Yo969dwIorakc9ngO4Y7MRtWgQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-eovFB0sLNde1qahI1mVY8Q-1; Wed, 27 Nov 2019 14:58:52 -0500
Received: by mail-qt1-f197.google.com with SMTP id m8so13012694qta.20
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Nov 2019 11:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w7lbDjreCJ/+n3nZbRY5zssEIPogdb2ZU5R4OKVip7Q=;
 b=Ilv46w8/3+OqunQtRIysYRyB4/IBRRaU7uA/xe0ObmHuW5/u0BR7SC0XTiEbJeAHfx
 4Z/CK6paaxRdY2w7/MsuidWvVHVmIXga5gXur+GAZ7SSJcghws5ROIfODSuGj03lBZXY
 BWg/UTvISeeNeY8UPRUWe31Ld8aRk9ZzgCXKoYNs9dBUv04VfdI8zo37Fp6XRfNJdcWA
 i4z2WstUWk/zfuUQyjeSSBWRePpV/kETp6wFy7RPNnkvNBLhw8j+x8atfdugpCiTopwe
 7Op6ddJFvk2rCZznopbSlxYu14lA6MgPCLlzXUL7Md+HoU456/taL4pVIEwnycSBxLkS
 k2vw==
X-Gm-Message-State: APjAAAUUJeh3E89verQl8l5JeRjbjzElI34eDUemMqEhWv/LsOHpamaO
 teZehiKYsyYezBo7LaPaYixKg0C7w05iBtO78QoLB7xYtcTvvEmkZpg/14uZcFEDwEVLx7h0F7E
 IT9Ovj/+4FdsFTL3cWNRlRa0qE+dnsybL+hfB7E1ZGQ==
X-Received: by 2002:ac8:7550:: with SMTP id b16mr42375281qtr.286.1574884732213; 
 Wed, 27 Nov 2019 11:58:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyp1uYljGzQNQj1GUOP8o1QRLYz3GJR/t9h5oKrZE1r3QICK2aYBTYfj0ZMQGR+d/lwG3YesQ==
X-Received: by 2002:ac8:7550:: with SMTP id b16mr42375271qtr.286.1574884731992; 
 Wed, 27 Nov 2019 11:58:51 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id 97sm8245913qtb.11.2019.11.27.11.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2019 11:58:51 -0800 (PST)
Date: Wed, 27 Nov 2019 14:58:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [net-next V3 0/2] drivers: net: virtio_net: implement
Message-ID: <20191127145831-mutt-send-email-mst@kernel.org>
References: <20191126200628.22251-1-jcfaracco@gmail.com>
 <20191126.140630.1195989367614358026.davem@davemloft.net>
 <20191127063624-mutt-send-email-mst@kernel.org>
 <20191127.105956.842685942160278820.davem@davemloft.net>
MIME-Version: 1.0
In-Reply-To: <20191127.105956.842685942160278820.davem@davemloft.net>
X-MC-Unique: eovFB0sLNde1qahI1mVY8Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, jcfaracco@gmail.com,
 virtualization@lists.linux-foundation.org
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

On Wed, Nov 27, 2019 at 10:59:56AM -0800, David Miller wrote:
> From: "Michael S. Tsirkin" <mst@redhat.com>
> Date: Wed, 27 Nov 2019 06:38:35 -0500
> 
> > On Tue, Nov 26, 2019 at 02:06:30PM -0800, David Miller wrote:
> >> 
> >> net-next is closed
> > 
> > Could you merge this early when net-next reopens though?
> > This way I don't need to keep adding drivers to update.
> 
> It simply needs to be reposted this as soon as net-next opens back up.
> 
> I fail to understand even what special treatment you want given to
> a given change, it doesn't make any sense.  We have a process for
> doing this, it's simple, it's straightforward, and is fair to
> everyone.
> 
> Thanks.

Will do, thanks.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
