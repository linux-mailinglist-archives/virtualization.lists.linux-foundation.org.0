Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 386BC785553
	for <lists.virtualization@lfdr.de>; Wed, 23 Aug 2023 12:25:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F25E81405;
	Wed, 23 Aug 2023 10:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F25E81405
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=E+vlYrSd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5wJ2gNJ-zgb; Wed, 23 Aug 2023 10:25:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B67E81419;
	Wed, 23 Aug 2023 10:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B67E81419
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20836C0DD3;
	Wed, 23 Aug 2023 10:25:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CE40C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Aug 2023 10:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A688405A9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Aug 2023 10:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A688405A9
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=E+vlYrSd
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qc_jSMzj4LrI
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Aug 2023 10:25:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2A1E40533
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Aug 2023 10:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2A1E40533
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD91F61D7E;
 Wed, 23 Aug 2023 10:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8125AC433C7;
 Wed, 23 Aug 2023 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1692786344;
 bh=1SoNFlSDBESEpcUsmvCkcrZqM4mjft2HogS2NbeyGmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+vlYrSdAnPcxsYLLO0ChKFjh+9XZ9zyLgRhKIgkovbbZIZeZ7KMiIpxNmZSyQsib
 XUqttnDDlRKi8yHkzUyoVLIAFjZE9HQ5iBqaYvdUxO7HHNVceekz6YVg0Z/+PIoVXk
 2qGQRJCr5xBydAuNg9TMlrZGkrvrkOt1txoiQ3ag=
Date: Wed, 23 Aug 2023 12:25:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Babis Chalios <bchalios@amazon.es>
Subject: Re: [RFC PATCH 1/2] random: emit reseed notifications for PRNGs
Message-ID: <2023082317-bauble-appeasing-90c0@gregkh>
References: <20230823090107.65749-1-bchalios@amazon.es>
 <20230823090107.65749-2-bchalios@amazon.es>
 <2023082322-semester-heave-e5bc@gregkh>
 <ff6aa77e-4e5c-488e-bd45-319fc09720c3@amazon.es>
 <2023082340-daybreak-lagged-f157@gregkh>
 <89ce1064-e4a3-461f-8a78-88e72e5b6419@amazon.es>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89ce1064-e4a3-461f-8a78-88e72e5b6419@amazon.es>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, graf@amazon.de,
 Theodore Ts'o <tytso@mit.edu>, Herbert Xu <herbert@gondor.apana.org.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, xmarcalx@amazon.co.uk,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
 aams@amazon.de, dwmw@amazon.co.uk
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Aug 23, 2023 at 12:08:35PM +0200, Babis Chalios wrote:
> 
> 
> On 23/8/23 12:06, Greg KH wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Wed, Aug 23, 2023 at 11:27:11AM +0200, Babis Chalios wrote:
> > > Hi Greg,
> > > 
> > > On 23/8/23 11:08, Greg KH wrote:
> > > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > 
> > > > 
> > > > 
> > > > On Wed, Aug 23, 2023 at 11:01:05AM +0200, Babis Chalios wrote:
> > > > > Sometimes, PRNGs need to reseed. For example, on a regular timer
> > > > > interval, to ensure nothing consumes a random value for longer than e.g.
> > > > > 5 minutes, or when VMs get cloned, to ensure seeds don't leak in to
> > > > > clones.
> > > > > 
> > > > > The notification happens through a 32bit epoch value that changes every
> > > > > time cached entropy is no longer valid, hence PRNGs need to reseed. User
> > > > > space applications can get hold of a pointer to this value through
> > > > > /dev/(u)random. We introduce a new ioctl() that returns an anonymous
> > > > > file descriptor. From this file descriptor we can mmap() a single page
> > > > > which includes the epoch at offset 0.
> > > > > 
> > > > > random.c maintains the epoch value in a global shared page. It exposes
> > > > > a registration API for kernel subsystems that are able to notify when
> > > > > reseeding is needed. Notifiers register with random.c and receive a
> > > > > unique 8bit ID and a pointer to the epoch. When they need to report a
> > > > > reseeding event they write a new epoch value which includes the
> > > > > notifier ID in the first 8 bits and an increasing counter value in the
> > > > > remaining 24 bits:
> > > > > 
> > > > >                 RNG epoch
> > > > > *-------------*---------------------*
> > > > > | notifier id | epoch counter value |
> > > > > *-------------*---------------------*
> > > > >        8 bits           24 bits
> > > > Why not just use 32/32 for a full 64bit value, or better yet, 2
> > > > different variables?  Why is 32bits and packing things together here
> > > > somehow simpler?
> > > We made it 32 bits so that we can read/write it atomically in all 32bit
> > > architectures.
> > > Do you think that's not a problem?
> > What 32bit platforms care about this type of interface at all?
> 
> I think, any 32bit platform that gets random bytes from the kernel.

You are making a new api, for some new functionality, for what I thought
was virtual machines (hence the virtio driver), none of which work in a
32bit system.

I thought this was an ioctl for userspace, which can handle 64bits at
once (or 2 32bit numbers).

For internal kernel stuff, a lock should be fine, or better yet, a 64bit
atomic value read (horrible on 32bit platforms, I know...)

Just asking, it feels odd to pack bits in these days for when 90% of the
cpus really don't need it.

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
