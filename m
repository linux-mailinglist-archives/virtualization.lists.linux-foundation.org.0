Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EED73832CF
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 15:37:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 83660E27;
	Tue,  6 Aug 2019 13:37:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AFE1DC7F
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 13:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5832689D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 13:37:07 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w190so62844952qkc.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 06:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+EmwYezlru/6l1RGke6OfmjMerhgmwmHntHPbq6+2AE=;
	b=VJjiZcUSxobFDsPe7V46Bx3WyzLHk4EmFPf4+T1h5gYRv9wS0PCPNPx57t3ksD+o3L
	8g5SDoeS5B0xiFCjq/Ap2FeCfscfr89LOBnl+dGKn5JYg0O3jaO0Gg+TJp/Rm9f1QCeJ
	wjHrvMFpFixsmLpk1HCX1aAtc7AtJNJMtWXL+Itk87YwfjFaoXaIUfxHfCXBh9fR90YJ
	nM+Ix+EuFQi1tLYrawH8A6MIDs5bBxz7aTbbUT/am7O4l3M9c9yfFlObLz/kXm6+XhG/
	KI/aPkjvJhxlZjrey7uAzJGcwOejghY7+0X2qUUupBDEKD4G91NQT2s7WxdoupoT0Ty0
	a3Ow==
X-Gm-Message-State: APjAAAXq6GBFO2MGs2Tdse01JwPL2QW8RiHS2k2IlEZTZSZSCOAUZEKY
	YHfQfcacuqgY6LeSMM34HHqFvQ==
X-Google-Smtp-Source: APXvYqwQogResfBtEcBuAcFTuCtTWGzeNFF/0eeIOxkxJPkA8JpnI8WBDTcUIzFbb3AvBDILVnFfYQ==
X-Received: by 2002:ae9:efc6:: with SMTP id d189mr2946499qkg.323.1565098625407;
	Tue, 06 Aug 2019 06:37:05 -0700 (PDT)
Received: from redhat.com ([147.234.38.1]) by smtp.gmail.com with ESMTPSA id
	q73sm24068906qke.90.2019.08.06.06.37.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 06:37:04 -0700 (PDT)
Date: Tue, 6 Aug 2019 09:36:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190806093633-mutt-send-email-mst@kernel.org>
References: <a3bde826-6329-68e4-2826-8a9de4c5bd1e@redhat.com>
	<20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
	<20190803172944-mutt-send-email-mst@kernel.org>
	<20190804001400.GA25543@ziepe.ca>
	<20190804040034-mutt-send-email-mst@kernel.org>
	<20190806115317.GA11627@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806115317.GA11627@ziepe.ca>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
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

On Tue, Aug 06, 2019 at 08:53:17AM -0300, Jason Gunthorpe wrote:
> On Sun, Aug 04, 2019 at 04:07:17AM -0400, Michael S. Tsirkin wrote:
> > > > > Also, why can't this just permanently GUP the pages? In fact, where
> > > > > does it put_page them anyhow? Worrying that 7f466 adds a get_user page
> > > > > but does not add a put_page??
> > > 
> > > You didn't answer this.. Why not just use GUP?
> > > 
> > > Jason
> > 
> > Sorry I misunderstood the question. Permanent GUP breaks lots of
> > functionality we need such as THP and numa balancing.
> 
> Really? It doesn't look like that many pages are involved..
> 
> Jason

Yea. But they just might happen to be heavily accessed ones....

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
