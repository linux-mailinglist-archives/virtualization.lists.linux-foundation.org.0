Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B35830FF
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 13:53:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E964CDB1;
	Tue,  6 Aug 2019 11:53:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B2853BE7
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 11:53:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AFFE8B2
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 11:53:20 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r6so62629220qkc.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eo4243fxJunv120eldJ+yINhsaoHQ/b07ic+MhyUnUY=;
	b=Z0mI1c0biLAyuHhq5HIH9liJ9V9NmYB6TCZCXG/MS5n6b7MXngGDqXWAvW9Q3wU70f
	Yuj4Gf5hmNpwIefJdv3jpcVqzwrm17rlQpqCpa8h75KznnlVcHW+bOQ8mi52XzW32i5X
	xMyKUlZMHS1zgPqQftCrIwo83eGAnrddpriXhq4ERkbDt3WwCS0upZb4/WtoahuAO8kW
	rLLLe/brCqzVyuGIKUWxPpcJJrKlwgWXPRE3jAKSeJ2mD0cdUXjpM0rJYi2yNTADYoYQ
	aDzSN7ZZQHTrS2/K7nALIkgZpt7+fyciFkxjLncICC8fqlQT1qsJ9jdY2CtN6k6kVuIQ
	kuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eo4243fxJunv120eldJ+yINhsaoHQ/b07ic+MhyUnUY=;
	b=GhdPhNH1ZziDUiyX5MB3w4njrO25wDTGjEnUAa+tR0XzcZJfPiiQbCMNhoPNlqCeCs
	FeW/FdGKxau+JaTbOzzM42vtVRaELX4y0Bn8KNPR10GxKt1JYj5errAMgx8l1Ly8Vb2s
	FSUUcbJztNGad4rc7WEfxEwOUXcnXYgpLipOqthP3AG+WdP76Ra1ikxWyWKSCR2HvOfa
	eCNXxQoCfiZz2UgiEQSQn+II7uAW0In4Ib6YUPWuwW6HxGphmRKFnHvW7OT3fewEAQUb
	sqsly9SJK9JFrFU2J+Ycv2qnkCABOBEbJPC8/jT7iQJIPxo+hBxpbiuZX4YvRAHLPtv0
	zfYg==
X-Gm-Message-State: APjAAAW2UFMCjolrtwdLMDcz2pO1qZS5q9NMhzrXlDpZo1FSRmDc94bA
	echRNARXyCSisGa4UOHgFUobGw==
X-Google-Smtp-Source: APXvYqw8Kp97Codo4loFeh85jsMCmVqW5Bh1vzUEuORvgfGzgHvIynQzybQA5mb0rqsqpydwn040qg==
X-Received: by 2002:a05:620a:127c:: with SMTP id
	b28mr2606352qkl.299.1565092399391; 
	Tue, 06 Aug 2019 04:53:19 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	r14sm40128814qke.47.2019.08.06.04.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Aug 2019 04:53:18 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1huy1l-0003cs-Vr; Tue, 06 Aug 2019 08:53:17 -0300
Date: Tue, 6 Aug 2019 08:53:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190806115317.GA11627@ziepe.ca>
References: <20190731193057.GG3946@ziepe.ca>
	<a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
	<20190803172944-mutt-send-email-mst@kernel.org>
	<20190804001400.GA25543@ziepe.ca>
	<20190804040034-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804040034-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Sun, Aug 04, 2019 at 04:07:17AM -0400, Michael S. Tsirkin wrote:
> > > > Also, why can't this just permanently GUP the pages? In fact, where
> > > > does it put_page them anyhow? Worrying that 7f466 adds a get_user page
> > > > but does not add a put_page??
> > 
> > You didn't answer this.. Why not just use GUP?
> > 
> > Jason
> 
> Sorry I misunderstood the question. Permanent GUP breaks lots of
> functionality we need such as THP and numa balancing.

Really? It doesn't look like that many pages are involved..

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
