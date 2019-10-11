Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AA4D434F
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 16:46:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C76821A62;
	Fri, 11 Oct 2019 14:46:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F9AA1A60
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA28D735
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:35:02 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 386787E421
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:35:02 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id c188so2857064wmd.9
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 07:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BMhlHZig+1RhiRk7V7Pz4VOZHaUmDl77u5gqUPus1Vw=;
	b=sdgrdgIcGkitY51JUI8gE9XkgVcm45D7ywAqwQ4c3kbsiV5xWheQrXT9HWPLAjXjqJ
	+WmizasAR+Veu9Gq04q2F1rEfz/25tEMTp1o53ozS4trchI99li7hyW5OdpFLHTbZ6xX
	12jtIJ1wt0OS0z3adqUOS1DJz9nLLEyOd/WdU/KXm02s7qX+j1P1VV0x/iFg0I1V2GU9
	KlMXB3xreNrGTdd2lp/jrYHGQ+i2CzfN3+tO5D7w0clDTDiwG0NvzDqIMvNk8E+WG7ie
	oOytpH2Cu/xzsohrenZjTWxcn6XFyWhLgKncRiOHX9mk5iB3c+m84qygkC9UX4/bqIQP
	LTPg==
X-Gm-Message-State: APjAAAWF7BrkLG3j44A/xYY7+oQ1Z91aGD6/XSQNSc7EYwMJd6yJYc0x
	NMdNsnfEb4Ur8wY5glEnqlpcJ6YbUKk4jUdq480/GrYYTvFOq3UyrqcFg/yCAmmuBAkq6nTAuKg
	EbaXX2HiVDmXPpP5nBYWpBtpTmRbfX/huE/upvaUQNQ==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr3048518wrl.140.1570804500913; 
	Fri, 11 Oct 2019 07:35:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+Irj2vNmRio/nFmNCYUOj5zRQn/cFuQoq8tEJPRY6eLYwjr9hshihDbQlKDa3IF+n7XZANw==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr3048504wrl.140.1570804500699; 
	Fri, 11 Oct 2019 07:35:00 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	g185sm12205685wme.10.2019.10.11.07.34.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 07:35:00 -0700 (PDT)
Date: Fri, 11 Oct 2019 16:34:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net 0/2] vsock: don't allow half-closed socket in the
	host transports
Message-ID: <20191011143457.4ujt3gg7oxco6gld@steredhat>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011101408-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011101408-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adit Ranadive <aditr@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Fri, Oct 11, 2019 at 10:19:13AM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 11, 2019 at 03:07:56PM +0200, Stefano Garzarella wrote:
> > We are implementing a test suite for the VSOCK sockets and we discovered
> > that vmci_transport never allowed half-closed socket on the host side.
> > 
> > As Jorgen explained [1] this is due to the implementation of VMCI.
> > 
> > Since we want to have the same behaviour across all transports, this
> > series adds a section in the "Implementation notes" to exaplain this
> > behaviour, and changes the vhost_transport to behave the same way.
> > 
> > [1] https://patchwork.ozlabs.org/cover/847998/#1831400
> 
> Half closed sockets are very useful, and lots of
> applications use tricks to swap a vsock for a tcp socket,
> which might as a result break.

Got it!

> 
> If VMCI really cares it can implement an ioctl to
> allow applications to detect that half closed sockets aren't supported.
> 
> It does not look like VMCI wants to bother (users do not read
> kernel implementation notes) so it does not really care.
> So why do we want to cripple other transports intentionally?

The main reason is that we are developing the test suite and we noticed
the miss match. Since we want to make sure that applications behave in
the same way on different transports, we thought we would solve it that
way.

But what you are saying (also in the reply of the patches) is actually
quite right. Not being publicized, applications do not expect this behavior,
so please discard this series.

My problem during the tests, was trying to figure out if half-closed
sockets were supported or not, so as you say adding an IOCTL or maybe
better a getsockopt() could solve the problem.

What do you think?

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
