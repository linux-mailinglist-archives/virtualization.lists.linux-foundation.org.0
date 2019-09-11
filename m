Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC253AFC80
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 14:25:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2CC4713D1;
	Wed, 11 Sep 2019 12:25:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1980013C5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:25:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AB06189B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:25:10 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27EA12BFD2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 12:25:10 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id b2so23475031qtt.10
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 05:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=hxqdd7sLD0IIJEG1yv3oLsELLYkxr9dTgSFMh9qjyAM=;
	b=lBCz+KUQ/88LFd9Lxx57gAND4kxVRnQhY7t/xaOFIIivh0h+oLn3F+SQXTbqOwq258
	oY+v9v+ApXFsuuvMCFDInZ3l3mMaTRYTWJCTAOUKZGY86w9SdBqJze6FuQmKTtIOJe6J
	B9TwJhoNcVHSAo8ZsDXpcgvKJorsyGXTivvfZT6q8JHVQacY+YUuAXSjdaMfu5nqqvg8
	e6wKVrPP6C4XhtaT5QrlaXwuHo4aevLOsC+Bfh6jxNdUcHmb1Ztzg5VXi09t2jlicMQA
	YhapTxDazXqNbdN0nHC74ikCvLU5ZCTptP69vXjM1WemHIhpusgl5FHrkSqlzBuQCcai
	Bmdw==
X-Gm-Message-State: APjAAAUy6NlZn0ZwvDuSkFuJaWER0d2jBEGcqA1BRgtqVWPZOnoqTYYN
	ghkkEYikHz44adioX+mnkEMlOwiDiB4o613LgIMYOYpMBXGUbPBN5hbJAtTRC4e/NkKWEyIXICe
	FkxPffS8x0cNUhnJHXDiw+GCU4xB8Ib6J53qhSs74Ww==
X-Received: by 2002:a37:a858:: with SMTP id r85mr20448443qke.394.1568204709488;
	Wed, 11 Sep 2019 05:25:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydIpMhvodySW7CTJrCuCWEytvXXGQbmEf5VStZ8nkcJ6t3BKc9d/kPejtfhSjav5sm2yl2eg==
X-Received: by 2002:a37:a858:: with SMTP id r85mr20448417qke.394.1568204709315;
	Wed, 11 Sep 2019 05:25:09 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	w126sm9508107qkd.68.2019.09.11.05.25.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 05:25:08 -0700 (PDT)
Date: Wed, 11 Sep 2019 08:25:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2] vhost: block speculation of translated descriptors
Message-ID: <20190911082236-mutt-send-email-mst@kernel.org>
References: <20190911120908.28410-1-mst@redhat.com>
	<20190911121628.GT4023@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911121628.GT4023@dhcp22.suse.cz>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

On Wed, Sep 11, 2019 at 02:16:28PM +0200, Michal Hocko wrote:
> On Wed 11-09-19 08:10:00, Michael S. Tsirkin wrote:
> > iovec addresses coming from vhost are assumed to be
> > pre-validated, but in fact can be speculated to a value
> > out of range.
> > 
> > Userspace address are later validated with array_index_nospec so we can
> > be sure kernel info does not leak through these addresses, but vhost
> > must also not leak userspace info outside the allowed memory table to
> > guests.
> > 
> > Following the defence in depth principle, make sure
> > the address is not validated out of node range.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > Tested-by: Jason Wang <jasowang@redhat.com>
> 
> no need to mark fo stable? Other spectre fixes tend to be backported
> even when the security implications are not really clear. The risk
> should be low and better to be covered in case.

This is not really a fix - more a defence in depth thing,
quite similar to e.g.  commit b3bbfb3fb5d25776b8e3f361d2eedaabb0b496cd
x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
in scope.

That one doesn't seem to be tagged for stable. Was it queued
there in practice?

> > ---
> > 
> > changes from v1: fix build on 32 bit
> > 
> >  drivers/vhost/vhost.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index 5dc174ac8cac..34ea219936e3 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2071,8 +2071,10 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
> >  		_iov = iov + ret;
> >  		size = node->size - addr + node->start;
> >  		_iov->iov_len = min((u64)len - s, size);
> > -		_iov->iov_base = (void __user *)(unsigned long)
> > -			(node->userspace_addr + addr - node->start);
> > +		_iov->iov_base = (void __user *)
> > +			((unsigned long)node->userspace_addr +
> > +			 array_index_nospec((unsigned long)(addr - node->start),
> > +					    node->size));
> >  		s += size;
> >  		addr += size;
> >  		++ret;
> > -- 
> > MST
> 
> -- 
> Michal Hocko
> SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
