Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 147522C737
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 15:01:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E1A891CD5;
	Tue, 28 May 2019 13:01:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF4AF1CCE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 12:59:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7818313A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=Content-Transfer-Encoding:Mime-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l65emkDB6YfIx5Ve1iueFrhApsDtoK/gPzAciJVNODE=;
	b=wpd7rWQeLaPU+zoeaHpc2R9x80
	+3n5d3y2iBXjQIhbfzoz+jRn55C6z21KQ/A9RLFH59jMY6+GCMobkLkzOr6PTIbIrRMdlINMJFKaO
	xuj5mjx1OyUKDQHVQ5D3IJ6cQ4HUQNAajZUTKTFLowP13NP8cBJBcIxZCF2kmNjSzPRGFcSPhCtO7
	5P/Sd7W3JCL1KBX6dVxX/hV3SqnJD9af2qwwkswJ2292lg3ORsdhLYNDtsaLs7CwiKraVa4s1aF26
	7uCWimLss7oL7zTu6Q4i27/3m08Wiue4QRox84Z+UInIVCZV7dMJQqG6JFPmaMnJpoWj1jZ2HXB0K
	1yVSSrQQ==;
Received: from [54.239.6.185] (helo=u9312026164465a.ant.amazon.com)
	by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVbhk-0003wi-Rj; Tue, 28 May 2019 12:59:49 +0000
Message-ID: <f8fccc5745755e92077306189577da2fe591f586.camel@infradead.org>
Subject: Re: [PATCH] virtio_console: remove vq buf while unpluging port
From: Amit Shah <amit@infradead.org>
To: Greg KH <gregkh@linuxfoundation.org>, amit@kernel.org, zhenwei pi
	<pizhenwei@bytedance.com>
Date: Tue, 28 May 2019 14:59:46 +0200
In-Reply-To: <20190524185132.GA10695@kroah.com>
References: <1556416204-30311-1-git-send-email-pizhenwei@bytedance.com>
	<20190524185132.GA10695@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de,
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

On Fri, 2019-05-24 at 20:51 +0200, Greg KH wrote:
> On Sun, Apr 28, 2019 at 09:50:04AM +0800, zhenwei pi wrote:
> > A bug can be easily reproduced:
> > Host# cat guest-agent.xml
> > <channel type="unix">
> >   <source mode="bind" path="/var/lib/libvirt/qemu/stretch.agent"/>
> >   <target type="virtio" name="org.qemu.guest_agent.0"
> > state="connected"/>
> > </channel>
> > Host# virsh attach-device instance guest-agent.xml
> > Host# virsh detach-device instance guest-agent.xml
> > Host# virsh attach-device instance guest-agent.xml
> > 
> > and guest report: virtio-ports vport0p1: Error allocating inbufs
> > 
> > The reason is that the port is unplugged and the vq buf still
> > remained.
> > So, fix two cases in this patch:
> > 1, fix memory leak with attach-device/detach-device.
> > 2, fix logic bug with attach-device/detach-device/attach-device.

The "leak" happens because the host-side of the connection is still
connected.  This is by design -- if a guest has written data before
being unplugged, the port isn't released till the host connection goes
down to ensure a host process reads all the data out of the port.

Can you try similar, but also disconnecting the host side and see if
that fixes things?

> Amit, any ideas if this is valid or not and if this should be
> applied?

This had indeed been missed, thanks!


			Amit

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
