Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A39832F3
	for <lists.virtualization@lfdr.de>; Tue,  6 Aug 2019 15:40:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 564C0E27;
	Tue,  6 Aug 2019 13:40:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 44BFDCC4
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 13:40:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BDCAC8A7
	for <virtualization@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 13:40:33 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r4so62768202qkm.13
	for <virtualization@lists.linux-foundation.org>;
	Tue, 06 Aug 2019 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dNzsOgLAi4DpECpGRrewtthquhRyGxeGVQXq8haedDU=;
	b=nc3ULfAxivmoeOVWtx4pEkcKqWu7gMWhZ1T9c67WVWKwR/tqg4tjz06IHSiy7/T1mM
	1Q9OgN3SKGqoN0fTofviJhtk+Y8Fnu6Rb9wlYk2j8XzfT49iKaQgZskM/1nQuoKXVyrg
	x7tKm90nh5lvD0if38GgDipFfBZn9HvMJg3lzYCC5JZp61ytJWsdqe/KqqgbJCT1alsH
	YRrG5mFigDCgWFVNUPK0RWvRiPVQp4r15i+HE+vsy+0UofzeByMFI318I8OMNMaejIys
	JaRCTgreBgdiEAQrQGSv5kop0m94iD49e5Xbjmt0OHKcuev72yVdTxaI38Rng+Q3PBaC
	NvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dNzsOgLAi4DpECpGRrewtthquhRyGxeGVQXq8haedDU=;
	b=r6Yg7kX1ZOosnGOI8Yujm8FqvMHMjedSanpK03/vyPu0FkGCzCvjf4TK0F0qGmaLqN
	TqDxaQiY9A9ObRlELJgP1lMtHS9g33hCnhuWekxaHbl4DoA+K77Qyn6QyWLrJWScHu1Y
	hkhNviqnS5e2Hko/CtivFXAUNSsDlCglwCtng93SohMRsGgoOiymMF5CWovpeWslKUVs
	+GfsQBQ/CSp87uoVbr2M0psZ/4gG27p7UHoTHwWwB9GFT0YZLUgxhhbY0NQe4znlB7J3
	ppNW2gH3Yqm6l9oTcIXcDQJbmBkoghyNXfj/cwI6T70mI9p9OEOShV5yXFmSgLL/QEUC
	qd1w==
X-Gm-Message-State: APjAAAW6N1ZImSP6Yt0QqWqA/dxgbxwHBDCLUmN6ZDlHQanYbQvtTrmJ
	GSYGLWw9pZCGp/KiyCSbUffwJg==
X-Google-Smtp-Source: APXvYqxMfwBB47axCWNEJctHilcnayHipqGXZY261+EFRwNZ/6dzvsnkK6i+idF6ma2zmUwEOo/rBA==
X-Received: by 2002:a05:620a:31b:: with SMTP id
	s27mr3219001qkm.264.1565098832774; 
	Tue, 06 Aug 2019 06:40:32 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	u18sm36087109qkj.98.2019.08.06.06.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Aug 2019 06:40:32 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1huzhW-0004zI-Ru; Tue, 06 Aug 2019 10:40:30 -0300
Date: Tue, 6 Aug 2019 10:40:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190806134030.GD11627@ziepe.ca>
References: <20190801141512.GB23899@ziepe.ca>
	<42ead87b-1749-4c73-cbe4-29dbeb945041@redhat.com>
	<20190802124613.GA11245@ziepe.ca>
	<20190802100414-mutt-send-email-mst@kernel.org>
	<20190802172418.GB11245@ziepe.ca>
	<20190803172944-mutt-send-email-mst@kernel.org>
	<20190804001400.GA25543@ziepe.ca>
	<20190804040034-mutt-send-email-mst@kernel.org>
	<20190806115317.GA11627@ziepe.ca>
	<20190806093633-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806093633-mutt-send-email-mst@kernel.org>
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

On Tue, Aug 06, 2019 at 09:36:58AM -0400, Michael S. Tsirkin wrote:
> On Tue, Aug 06, 2019 at 08:53:17AM -0300, Jason Gunthorpe wrote:
> > On Sun, Aug 04, 2019 at 04:07:17AM -0400, Michael S. Tsirkin wrote:
> > > > > > Also, why can't this just permanently GUP the pages? In fact, where
> > > > > > does it put_page them anyhow? Worrying that 7f466 adds a get_user page
> > > > > > but does not add a put_page??
> > > > 
> > > > You didn't answer this.. Why not just use GUP?
> > > > 
> > > > Jason
> > > 
> > > Sorry I misunderstood the question. Permanent GUP breaks lots of
> > > functionality we need such as THP and numa balancing.
> > 
> > Really? It doesn't look like that many pages are involved..
> > 
> > Jason
> 
> Yea. But they just might happen to be heavily accessed ones....

Maybe you can solve the numa balance problem some other way and use
normal GUP..

Jason 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
