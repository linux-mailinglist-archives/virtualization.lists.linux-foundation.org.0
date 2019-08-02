Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 463B17FBB2
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 16:04:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3CB0C1444;
	Fri,  2 Aug 2019 14:04:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2386C13FC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 14:03:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BC4497ED
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 14:03:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k10so4821157qtq.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 02 Aug 2019 07:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=WV2Ae/gfauZPjPhFYOLLqagCyB4HyL2HjQauKn3bqsM=;
	b=BjygQP7zwidUQtJ3jH9hHNBtbolzxcNJMfENqTu9E9KkuxH4ayHBtof4SThK2NFUtN
	KQm2GaIS/DzpHfZdyFTZzbhmhmowSsqg69phbN5BHKoZ8a1PZ8VbCuj7T0Fc+HnMYvFA
	H47r+xR9LqZ9mi74HlCZK0DAoWPYtoJrIsn5fmLdqjXvC2qfdNFL+bugd3Wclqa4q/Ga
	CUOEyLuyQLD0a8KzPLTd8BqMfhMzl7VaLomt1Gx5dtf5YjEaycAdMnasOtQoXHpSP19W
	MG5G8JUQTSSZQDaCIwPyFCtQ4aLTRDWMvZqz+G4DCvIiPo6ZbPTzeDc7pYV+N6DlSbpP
	zKFA==
X-Gm-Message-State: APjAAAVybtJL/NJmT+jYMnt8+1LkvHSZ75mSoVzZMbi3UN5xzjRAAPyo
	J+e7353dgO1KViVtuD0TeA7NHw==
X-Google-Smtp-Source: APXvYqxqWV5TMaysY1q7/YjNkaoGeUmT+T8Aja0Ppx3ngtfg+CGh7SDzsuYF2FJmZ32u93WwxfAAKw==
X-Received: by 2002:ac8:2b49:: with SMTP id 9mr99459163qtv.343.1564754637929; 
	Fri, 02 Aug 2019 07:03:57 -0700 (PDT)
Received: from redhat.com ([147.234.38.1]) by smtp.gmail.com with ESMTPSA id
	v4sm30651268qtq.15.2019.08.02.07.03.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 07:03:56 -0700 (PDT)
Date: Fri, 2 Aug 2019 10:03:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190802094331-mutt-send-email-mst@kernel.org>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-8-jasowang@redhat.com>
	<20190731123935.GC3946@ziepe.ca>
	<7555c949-ae6f-f105-6e1d-df21ddae9e4e@redhat.com>
	<20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Fri, Aug 02, 2019 at 05:40:07PM +0800, Jason Wang wrote:
> Btw, I come up another idea, that is to disable preemption when vhost thread
> need to access the memory. Then register preempt notifier and if vhost
> thread is preempted, we're sure no one will access the memory and can do the
> cleanup.

Great, more notifiers :(

Maybe can live with
1- disable preemption while using the cached pointer
2- teach vhost to recover from memory access failures,
   by switching to regular from/to user path

So if you want to try that, fine since it's a step in
the right direction.

But I think fundamentally it's not what we want to do long term.

It's always been a fundamental problem with this patch series that only
metadata is accessed through a direct pointer.

The difference in ways you handle metadata and data is what is
now coming and messing everything up.

So if continuing the direct map approach,
what is needed is a cache of mapped VM memory, then on a cache miss
we'd queue work along the lines of 1-2 above.

That's one direction to take. Another one is to give up on that and
write our own version of uaccess macros.  Add a "high security" flag to
the vhost module and if not active use these for userspace memory
access.


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
