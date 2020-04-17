Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F071ADAD3
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 12:19:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 999DB86381;
	Fri, 17 Apr 2020 10:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZnPrfiTnRZo; Fri, 17 Apr 2020 10:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3764085F92;
	Fri, 17 Apr 2020 10:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 269DFC0172;
	Fri, 17 Apr 2020 10:19:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 036E3C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E1EC987A5F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlUohq4Q-xDV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DA83387A56
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587118783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3TUJZerD7ww4xJJoAIJo7rH3xpPgagex189uQ35kVr0=;
 b=WuP2mQSQSn3oSMC/7am14TSQD8QoLbrxVzE64HZ1T3SqTnqKwc/tVBaUvZ0SKY7IGzjcR4
 TvkQL9UrTEp2URdgplcjIZB0YQvnfeSNMkYjv4MDWO0tqnXJ60gJSPO0UYKhDQZ06MZNXw
 6EoxKKfjw/rr4EwTM+b9WZ30dhk35SQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-mD_nkSqTPJuk_FXicJSDGQ-1; Fri, 17 Apr 2020 06:19:42 -0400
X-MC-Unique: mD_nkSqTPJuk_FXicJSDGQ-1
Received: by mail-wm1-f71.google.com with SMTP id c196so636610wmd.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3TUJZerD7ww4xJJoAIJo7rH3xpPgagex189uQ35kVr0=;
 b=rIpOO68Qo1pSfNCS1UKdCb81QXPal/CZdAjKtMZW4PP1KcuuqESiTbBi4F5gkoBisR
 Z1knh+qM2OBQKk2ME1Oh6rT1llP9mDKuKrcg9wgeF3c3rTUTIo2vUy/KLtpcobmo7fR/
 d55pP+iv0WQlq70ZDhesf4G9ETG7jPeDuV/7vIuJKuWlymdplz5nkPOqfwpFqe4EXyCW
 Cbv5mDR/FR4srfeHGp1wS/VsW7tV4ngLFxWuI7rK3cas9SdMCIdDu1i+mSMRczkrh0TI
 wABS+UhZlVjncVzrjH/A8BVz5Ztk1/CFBgkMhndf3HYCaBCMEQzzgaA0a30FdADccd30
 TVbw==
X-Gm-Message-State: AGi0PuZMxt1Q938M2Y+3pLmuYXpyU4iu3z/x68ULMO/jfjvLVIr2FPf4
 O+DEXc9SfdiisuS6A372wSouDD8yAaYOGJ4pNvImG6Pe/F6SETXZN4rhS7QUhtU17x4vgtapaJH
 SxahtYzViT1Cxzp9u0Ftj2uQ2qIQq08/QgnSF/5fC6w==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr2624286wmi.88.1587118781002; 
 Fri, 17 Apr 2020 03:19:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypLGu+f51hqVlSUrZLVY77gxUJY6S/IdGrxN0ykk/dghme70K7+GUhXMIpX0OegZRqrGztLzTQ==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr2624275wmi.88.1587118780816; 
 Fri, 17 Apr 2020 03:19:40 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id 5sm7289804wmg.34.2020.04.17.03.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 03:19:40 -0700 (PDT)
Date: Fri, 17 Apr 2020 06:19:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [virtio-dev] Re: [PATCH] virtio-balloon: Disable free page
 hinting/reporting if page poison is disabled
Message-ID: <20200417061815-mutt-send-email-mst@kernel.org>
References: <20200416180845-mutt-send-email-mst@kernel.org>
 <CAKgT0UfWHHyCekU+dReNfhAa6u6FNbm7Ff5wmyN58d1VymmAMA@mail.gmail.com>
 <20200417021335-mutt-send-email-mst@kernel.org>
 <08d2c4e2-8c0f-7d3c-89f1-0e6c6a2756c8@redhat.com>
 <20200417044641-mutt-send-email-mst@kernel.org>
 <0f867029-aef4-72b9-356f-ec25c265db1b@redhat.com>
 <20200417051223-mutt-send-email-mst@kernel.org>
 <3447361c-4d07-1785-c59b-8c98ddaebd92@redhat.com>
 <20200417055217-mutt-send-email-mst@kernel.org>
 <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1823d9be-d175-6cb5-0c7d-8a68d959a0d5@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org,
 Alexander Duyck <alexander.duyck@gmail.com>,
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

On Fri, Apr 17, 2020 at 12:09:38PM +0200, David Hildenbrand wrote:
>  > What do you call "hinting ends" though? The fact we put
> > a page in the VQ is not a guarantee that it's been consumed
> > by the hypervisor.
> > 
> 
> I'd say hinting ends once the hypervisor sets FREE_PAGE_REPORT_S_DONE.

Can't find that one anywhere. what did I miss?



> > 
> > I think a strict definition is this:
> > - hint includes a command ID
> > - hint implies "page was unused at some point after guest reading command ID"
> > 
> > 
> > Hypervisor can use dirty tracking tricks to get from that to
> > "page is unused at the moment".
> > 
> >> Whereby X is
> >> currently assumed to be 0, correct?
> > 
> > 
> > 
> > Now we are talking about what's safe to do with the page.
> > 
> > If POISON flag is set by hypervisor but clear by guest,
> > or poison_val is 0, then it's clear it's safe to blow
> > away the page if we can figure out it's unused.
> > 
> > Otherwise, it's much less clear :)
> 
> Hah! Agreed :D
> 
> > 
> > 
> > 
> > I'll have to come back and re-read the rest next week, this
> > is complex stuff and I'm too rushed with other things today.
> 
> Yeah, I'm also loaded with other stuff. Maybe Alex has time to
> understand the details as well.
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
