Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D82C616B95
	for <lists.virtualization@lfdr.de>; Tue,  7 May 2019 21:43:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3242BDDE;
	Tue,  7 May 2019 19:43:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A748D95
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 19:43:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB078FD
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 19:43:11 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y42so1032823qtk.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 07 May 2019 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ee/vWvn/Ifzj7Fj8CJW5WypvdZbF3rI74RwswfNy3s8=;
	b=SlqXQH6cdfmDcoXK151NvgNOEL8C9rtVLRGZYegxJ5pRaiMErghgNSEUNcm8XOgnBm
	Q7Olw9WbgFBUGU2iDCkwi5y4P6LbPvssY/y8G7sAy2o/IDwVIW3UNJk3oNH5uTnEQBe6
	xnWNiXRxQs3KTm02xrq9ERvEvl5ab/N6pff2NY2lmzVtA6niaZiWeWugHSt5nXVR8rAP
	HfJg3A/UXegsz8XhYGpG7nzAqlNS2FaltaSNlZrWib25/KUPpoCEj3wQ43V8sDx7W81w
	TwgyJAj04iwS6mmd+p6VlrrTRvtd2PQDCDNh26OQvcQ/YuDQgItrhSo51NDIJloaDsLp
	l6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ee/vWvn/Ifzj7Fj8CJW5WypvdZbF3rI74RwswfNy3s8=;
	b=XFQrUcOTHtuo7Ka5zxfBhwbXcmx2o9L6EPfPgN984PLoVTivrtZfRxy/ZpFUnHZwQa
	KL/Y/9xzd3sDpvI5nYlVGetPrMxnhab3BHljJnmrkpu+muHPEcE58GLgsGMtcmKapDho
	xVx18JckatRXLC7NjMnFYypfWHmpF2AmeU2ZqhLTrfo8w5OiqIeNFesDT1cFNmADH4BY
	uacSo+hiwq5ONyDnAAacuYN/7/tX+k8ZFfoCJfWzPfkTLiQIS4WCoO+/OqRWDlAiDTSv
	gvpUrw9+Ls4VSnm6jkcbxBb1FWvCoeIb3jVsPi1truhAN52THxG66hrPIMrs4jpIKH/t
	CpFQ==
X-Gm-Message-State: APjAAAXVywVostIbKJyEmXKTsF4cPtwjaJybcNTXLD1wB2qEA2fJus3R
	eI3+up7jwLXZiTPdcy9Za7IZvw==
X-Google-Smtp-Source: APXvYqw3KSJ3ehNU8RQ0M4ocEOtB2IpJ3gJQrhf2sWV4FOnrdHCkkwNpNrnHzJv7qop0/fuwyZ7GaA==
X-Received: by 2002:ac8:2a10:: with SMTP id k16mr28126307qtk.220.1557258190850;
	Tue, 07 May 2019 12:43:10 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-49-251.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.49.251]) by smtp.gmail.com with ESMTPSA id
	n21sm7704457qkk.30.2019.05.07.12.43.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 12:43:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hO5zY-0007dD-NA; Tue, 07 May 2019 16:43:08 -0300
Date: Tue, 7 May 2019 16:43:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yuval Shaia <yuval.shaia@oracle.com>
Subject: Re: [Qemu-devel] [RFC 0/3] VirtIO RDMA
Message-ID: <20190507194308.GK6201@ziepe.ca>
References: <20190411110157.14252-1-yuval.shaia@oracle.com>
	<20190411190215.2163572e.cohuck@redhat.com>
	<20190415103546.GA6854@lap1>
	<e73e03c2-ea2b-6ffc-cd23-e8e44d42ce80@suse.de>
	<20190422164527.GF21588@ziepe.ca> <20190430171350.GA2763@lap1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430171350.GA2763@lap1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mst@redhat.com, linux-rdma@vger.kernel.org,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
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

On Tue, Apr 30, 2019 at 08:13:54PM +0300, Yuval Shaia wrote:
> On Mon, Apr 22, 2019 at 01:45:27PM -0300, Jason Gunthorpe wrote:
> > On Fri, Apr 19, 2019 at 01:16:06PM +0200, Hannes Reinecke wrote:
> > > On 4/15/19 12:35 PM, Yuval Shaia wrote:
> > > > On Thu, Apr 11, 2019 at 07:02:15PM +0200, Cornelia Huck wrote:
> > > > > On Thu, 11 Apr 2019 14:01:54 +0300
> > > > > Yuval Shaia <yuval.shaia@oracle.com> wrote:
> > > > > 
> > > > > > Data center backends use more and more RDMA or RoCE devices and more and
> > > > > > more software runs in virtualized environment.
> > > > > > There is a need for a standard to enable RDMA/RoCE on Virtual Machines.
> > > > > > 
> > > > > > Virtio is the optimal solution since is the de-facto para-virtualizaton
> > > > > > technology and also because the Virtio specification
> > > > > > allows Hardware Vendors to support Virtio protocol natively in order to
> > > > > > achieve bare metal performance.
> > > > > > 
> > > > > > This RFC is an effort to addresses challenges in defining the RDMA/RoCE
> > > > > > Virtio Specification and a look forward on possible implementation
> > > > > > techniques.
> > > > > > 
> > > > > > Open issues/Todo list:
> > > > > > List is huge, this is only start point of the project.
> > > > > > Anyway, here is one example of item in the list:
> > > > > > - Multi VirtQ: Every QP has two rings and every CQ has one. This means that
> > > > > >    in order to support for example 32K QPs we will need 64K VirtQ. Not sure
> > > > > >    that this is reasonable so one option is to have one for all and
> > > > > >    multiplex the traffic on it. This is not good approach as by design it
> > > > > >    introducing an optional starvation. Another approach would be multi
> > > > > >    queues and round-robin (for example) between them.
> > > > > > 
> > > Typically there will be a one-to-one mapping between QPs and CPUs (on the
> > > guest). 
> > 
> > Er we are really overloading words here.. The typical expectation is
> > that a 'RDMA QP' will have thousands and thousands of instances on a
> > system.
> > 
> > Most likely I think mapping 1:1 a virtio queue to a 'RDMA QP, CQ, SRQ,
> > etc' is a bad idea...
> 
> We have three options, no virtqueue for QP, 1 to 1 or multiplexing. What
> would be your vote on that?
> I think you are for option #1, right? but in this case there is actually no
> use of having a virtio-driver, isn't it?

The virtio driver is supposed to be a standard, like a hardware
standard, for doing the operation.

It doesn't mean that every single element under the driver needs to
use the virtio format QP.

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
