Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E718A634D
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 10:00:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE309CA1;
	Tue,  3 Sep 2019 08:00:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C09F6CA1
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 08:00:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 33850709
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 08:00:46 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 738741E309
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 08:00:45 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id a125so1759722wmh.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 01:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=km45+BEk3dwp3Utn2bSkKzNYGd4+gITECdfMrKLm8PQ=;
	b=SRX7Kl8hikTWRe01iQem4Exoertlv/zj0eHlDcp91i++v/Z8/INkEis3C3Xx2gdZkS
	pYUGfzs5CRGQcM5Vkjm1OLp3LdZCsCqRJpe9HVQugrx8CVMMAuw0LKbYejTDNiTaDJ2W
	ilyIEuLME5zhvRl75rnm/LeMOghrLbkDAKysrHEF5yYIBGwEpxG1v1gz01hn1G2KEtY9
	nf+ukH86EdlU5JPOcmjS0kGZDVt3Eng9ItTOXl+I+klGtWi1pQwOvlUc1rRW6Tg94dFv
	YVIbV+sHBwnwgo6PVyluXOiaerMj7kjbWc2MpkCtSqCRJxGEFT4dhCIwWqc5idW1KNCU
	tDBw==
X-Gm-Message-State: APjAAAWAZSfywI3zs86W9xwElRZeZxla6LXXOyJc6fYsKfG+yZN0r8JZ
	OV+HggJPjClQr+lzmbDEi1Qnz8+fzu+7FNZlO0scQBevVUlY28Yo/OB2qvkd4lsrYgQivyfp5iJ
	CpcOyqotL5ufATxl09ciothjOIILt6HqdUboDXBnLSA==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr7118762wrn.198.1567497644022; 
	Tue, 03 Sep 2019 01:00:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMsaernHW7gP4+VmWPWrfNSo8Uzvmt4xAnmZkVHcbrUv+Po6RA+io+GPiFHKNQgzEQGBpXBw==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr7118749wrn.198.1567497643808; 
	Tue, 03 Sep 2019 01:00:43 -0700 (PDT)
Received: from steredhat (host170-61-dynamic.36-79-r.retail.telecomitalia.it.
	[79.36.61.170]) by smtp.gmail.com with ESMTPSA id
	a7sm31638025wra.43.2019.09.03.01.00.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 01:00:43 -0700 (PDT)
Date: Tue, 3 Sep 2019 10:00:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190903080040.pfsxrlhcny6xyfee@steredhat>
References: <20190730163807-mutt-send-email-mst@kernel.org>
	<20190801104754.lb3ju5xjfmnxioii@steredhat>
	<20190801091106-mutt-send-email-mst@kernel.org>
	<20190801133616.sik5drn6ecesukbb@steredhat>
	<20190901025815-mutt-send-email-mst@kernel.org>
	<20190901061707-mutt-send-email-mst@kernel.org>
	<20190902095723.6vuvp73fdunmiogo@steredhat>
	<20190903003823-mutt-send-email-mst@kernel.org>
	<20190903074554.mq6spyivftuodahy@steredhat>
	<20190903034747-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903034747-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

On Tue, Sep 03, 2019 at 03:52:24AM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 03, 2019 at 09:45:54AM +0200, Stefano Garzarella wrote:
> > On Tue, Sep 03, 2019 at 12:39:19AM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Sep 02, 2019 at 11:57:23AM +0200, Stefano Garzarella wrote:
> > > > > 
> > > > > Assuming we miss nothing and buffers < 4K are broken,
> > > > > I think we need to add this to the spec, possibly with
> > > > > a feature bit to relax the requirement that all buffers
> > > > > are at least 4k in size.
> > > > > 
> > > > 
> > > > Okay, should I send a proposal to virtio-dev@lists.oasis-open.org?
> > > 
> > > How about we also fix the bug for now?
> > 
> > This series unintentionally fix the bug because we are introducing a way
> > to split the packet depending on the buffer size ([PATCH 4/5] vhost/vsock:
> > split packets to send using multiple buffers) and we removed the limit
> > to 4K buffers ([PATCH 5/5] vsock/virtio: change the maximum packet size
> > allowed).
> > 
> > I discovered that there was a bug while we discussed memory accounting.
> > 
> > Do you think it's enough while we introduce the feature bit in the spec?
> > 
> > Thanks,
> > Stefano
> 
> Well locking is also broken (patch 3/5).  It seems that 3/5 and 4/5 work
> by themselves, right?  So how about we ask Dave to send these to stable?

Yes, they work by themselves and I agree that should be send to stable.

> Also, how about 1/5? Also needed for stable?

I think so, without this patch if we flood the guest with 1-byte packets,
we can consume ~ 1 GB of guest memory per-socket.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
