Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38FCB653
	for <lists.virtualization@lfdr.de>; Fri,  4 Oct 2019 10:36:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 91ADBF9E;
	Fri,  4 Oct 2019 08:35:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A83A1DA3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 08:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B63998A8
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 08:35:53 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 254613D955
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 08:35:53 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id w198so5653852qka.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 04 Oct 2019 01:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=yOIexdKqJ/XmthCQk04jTfHtrXV34o1+lsRFuo44Ftk=;
	b=k9Jco3zlcgcxoArCPbGozreMmQWm5RsfykzCvpCpPGxw4dpM6mLdO4llvjRTHa2+qg
	13EwYpSntYwy3LUlOMuhveDYtrI/3OKpq9NblXvhEjqlg9LVlI9jDXQenlcLnZQPjE5X
	mun6TUbt/fXyMtMDRpoPt605dshrW3ux/H3fE+b/2vxvFrkBz2sE4Kr8+FZwEsSUR9T8
	RtKvPtRkkfoOrJ93DiLToOGexVWJ3c7KUNUgoG6y7Gg3OaGIuwT/kFA2agyt11S9SguC
	vsf6qXggiDmEySYNF/uuLXByxQWoK2/g2ztxBQAdsvXakkDINdt7RT45M8GtWNxP/iCw
	caIw==
X-Gm-Message-State: APjAAAX3ExXFN8J0eRoQ78mRqfWPxM4bvcT4KYr5Xdoxonqtx4it2YbY
	RxqernMkJjGWJE6wiOuplJyBlFVDr0bSF0ni9RjDRvs3q0tJcrOjuPrLW1YGolnIi1fR+sKDa2E
	qfaLoSm2YEbjxl2P9yx7whkGFRAmZAio1vEfGyyxNYg==
X-Received: by 2002:ac8:550d:: with SMTP id j13mr15030484qtq.338.1570178152518;
	Fri, 04 Oct 2019 01:35:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuBXb8ZqP+K+GD9ik7GP8ezCoWBK+PxqDoeFWK1rLUv4NeRRuNTFKwpeP3gRBVrB5NJZDnww==
X-Received: by 2002:ac8:550d:: with SMTP id j13mr15030469qtq.338.1570178152301;
	Fri, 04 Oct 2019 01:35:52 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	c26sm3720050qtk.93.2019.10.04.01.35.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Oct 2019 01:35:51 -0700 (PDT)
Date: Fri, 4 Oct 2019 04:35:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20191004043446-mutt-send-email-mst@kernel.org>
References: <CAJuQAmpQmNN1EJHm4RinZnBven9Bx4GGqd-8Mt+L=3Z-3pd+zg@mail.gmail.com>
	<5D7EE856.2080602@intel.com>
	<09257686-90df-5c31-c35f-9d16fc77fee1@redhat.com>
	<CAJuQAmpQV26kb9vTyoW-Q7PsD0SOfX+otkiQZAks1L6k7rgdig@mail.gmail.com>
	<20191003142854-mutt-send-email-mst@kernel.org>
	<CAJuQAmrCiPsofYpDvm8=i32d9c9yCmKpJRBSRFkeubP_2=XKtw@mail.gmail.com>
	<0df87f00-5102-973b-3a7a-735e44f4ac3f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0df87f00-5102-973b-3a7a-735e44f4ac3f@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tyler Sanderson <tysand@google.com>,
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

On Fri, Oct 04, 2019 at 10:06:03AM +0200, David Hildenbrand wrote:
> On 04.10.19 01:15, Tyler Sanderson wrote:
> > I was mistaken, the problem with overcommit accounting is not fixed by
> > the change to shrinker interface.
> > This means that large allocations are stopped even if they could succeed
> > by deflating the balloon.
> 
> Please note that some people use the balloon for actual memory unplug -
> so initiating to deflate the balloon under any circumstances is
> undesired. It's different with "VIRTIO_BALLOON_F_DEFLATE_ON_OOM" being
> set - however that is barely the case (at least in the setups I know :) ).
> 
> So yes, free page reporting is a different thing, because it really is
> used to "hint" and not to "agree to unplug" in any scenario.
> 
> -- 
> 
> Thanks,
> 


VIRTIO_BALLOON_F_DEFLATE_ON_OOM isn't really well thought through
at the spec level either. For example, when will we inflate again?
Current code does this at the next interrupt, which requires
host to somehow know it's time to inflate.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
