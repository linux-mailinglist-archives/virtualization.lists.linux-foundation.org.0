Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 12241475C06
	for <lists.virtualization@lfdr.de>; Wed, 15 Dec 2021 16:43:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF2AA401F1;
	Wed, 15 Dec 2021 15:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dONXaNYbEWIh; Wed, 15 Dec 2021 15:43:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 28A65409D2;
	Wed, 15 Dec 2021 15:43:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD3CC0070;
	Wed, 15 Dec 2021 15:43:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28BBDC0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 15:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13FEF41575
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 15:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzBGwSvrbbeb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 15:43:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3288A41570
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639583020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUFi5HYw/QsmVtr4Iq57nJgL1HfI/Nq8EZnbybSwxkw=;
 b=gk9QuNhMW/5ovQepZdMW4q+C4GT2eVPTpAt+3KtmSeBwZTW3BWBOpi3Mj8QnM8kp8lYkGQ
 NszC9t9vQg7ZCyQ/vxB7XBa7KQd/9gQjUtFvQFe1taM39rwHlBqB7DSppvpC8fXljcxGz/
 ygjHqHoinKeotP5OJUDbGGZM5rbNqGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-8jIwBgHyM02sDIafyuGRpg-1; Wed, 15 Dec 2021 10:43:37 -0500
X-MC-Unique: 8jIwBgHyM02sDIafyuGRpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742DB81426A;
 Wed, 15 Dec 2021 15:43:34 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCC3E196F1;
 Wed, 15 Dec 2021 15:43:33 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 194412206B8; Wed, 15 Dec 2021 10:43:33 -0500 (EST)
Date: Wed, 15 Dec 2021 10:43:33 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 4/5] dax: remove the copy_from_iter and copy_to_iter
 methods
Message-ID: <YboNJWC3jhX4Vsn7@redhat.com>
References: <20211209063828.18944-1-hch@lst.de>
 <20211209063828.18944-5-hch@lst.de> <YbNhPXBg7G/ridkV@redhat.com>
 <CAPcyv4g4_yFqDeS+pnAZOxcB=Ua+iArK5mqn0iMG4PX6oL=F_A@mail.gmail.com>
 <20211213082318.GB21462@lst.de> <YbiosqZoG8e6rDkj@redhat.com>
 <CAPcyv4hFjKsPrPTB4NtLHiY8gyaELz9+45N1OFj3hz+uJ=9JnA@mail.gmail.com>
 <Ybj/azxrUyU4PZEr@redhat.com>
 <YbnD2iDmN92Bure9@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YbnD2iDmN92Bure9@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 linux-s390 <linux-s390@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Vishal Verma <vishal.l.verma@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 device-mapper development <dm-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>
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

On Wed, Dec 15, 2021 at 10:30:50AM +0000, Stefan Hajnoczi wrote:
> On Tue, Dec 14, 2021 at 03:32:43PM -0500, Vivek Goyal wrote:
> > On Tue, Dec 14, 2021 at 08:41:30AM -0800, Dan Williams wrote:
> > > On Tue, Dec 14, 2021 at 6:23 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> > > >
> > > > On Mon, Dec 13, 2021 at 09:23:18AM +0100, Christoph Hellwig wrote:
> > > > > On Sun, Dec 12, 2021 at 06:44:26AM -0800, Dan Williams wrote:
> > > > > > On Fri, Dec 10, 2021 at 6:17 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> > > > > > > Going forward, I am wondering should virtiofs use flushcache version as
> > > > > > > well. What if host filesystem is using DAX and mapping persistent memory
> > > > > > > pfn directly into qemu address space. I have never tested that.
> > > > > > >
> > > > > > > Right now we are relying on applications to do fsync/msync on virtiofs
> > > > > > > for data persistence.
> > > > > >
> > > > > > This sounds like it would need coordination with a paravirtualized
> > > > > > driver that can indicate whether the host side is pmem or not, like
> > > > > > the virtio_pmem driver. However, if the guest sends any fsync/msync
> > > > > > you would still need to go explicitly cache flush any dirty page
> > > > > > because you can't necessarily trust that the guest did that already.
> > > > >
> > > > > Do we?  The application can't really know what backend it is on, so
> > > > > it sounds like the current virtiofs implementation doesn't really, does it?
> > > >
> > > > Agreed that application does not know what backend it is on. So virtiofs
> > > > just offers regular posix API where applications have to do fsync/msync
> > > > for data persistence. No support for mmap(MAP_SYNC). We don't offer persistent
> > > > memory programming model on virtiofs. That's not the expectation. DAX
> > > > is used only to bypass guest page cache.
> > > >
> > > > With this assumption, I think we might not have to use flushcache version
> > > > at all even if shared filesystem is on persistent memory on host.
> > > >
> > > > - We mmap() host files into qemu address space. So any dax store in virtiofs
> > > >   should make corresponding pages dirty in page cache on host and when
> > > >   and fsync()/msync() comes later, it should flush all the data to PMEM.
> > > >
> > > > - In case of file extending writes, virtiofs falls back to regular
> > > >   FUSE_WRITE path (and not use DAX), and in that case host pmem driver
> > > >   should make sure writes are flushed to pmem immediately.
> > > >
> > > > Are there any other path I am missing. If not, looks like we might not
> > > > have to use flushcache version in virtiofs at all as long as we are not
> > > > offering guest applications user space flushes and MAP_SYNC support.
> > > >
> > > > We still might have to use machine check safe variant though as loads
> > > > might generate synchronous machine check. What's not clear to me is
> > > > that if this MC safe variant should be used only in case of PMEM or
> > > > should it be used in case of non-PMEM as well.
> > > 
> > > It should be used on any memory address that can throw exception on
> > > load, which is any physical address, in paths that can tolerate
> > > memcpy() returning an error code, most I/O paths, and can tolerate
> > > slower copy performance on older platforms that do not support MC
> > > recovery with fast string operations, to date that's only PMEM users.
> > 
> > Ok, So basically latest cpus can do fast string operations with MC
> > recovery so that using MC safe variant is not a problem.
> > 
> > Then there is range of cpus which can do MC recovery but do slower
> > versions of memcpy and that's where the issue is.
> > 
> > So if we knew that virtiofs dax window is backed by a pmem device
> > then we should always use MC safe variant. Even if it means paying
> > the price of slow version for the sake of correctness. 
> > 
> > But if we are not using pmem on host, then there is no point in
> > using MC safe variant.
> > 
> > IOW.
> > 
> > 	if (virtiofs_backed_by_pmem) {
> > 		use_mc_safe_version
> > 	else
> > 		use_non_mc_safe_version
> > 	}
> > 
> > Now question is, how do we know if virtiofs dax window is backed by
> > a pmem or not. I checked virtio_pmem driver and that does not seem
> > to communicate anything like that. It just communicates start of the
> > range and size of range, nothing else.
> > 
> > I don't have full handle on stack of modules of virtio_pmem, but my guess
> > is it probably is using MC safe version always (because it does not
> > know anthing about the backing storage).
> > 
> > /me will definitely like to pay penalty of slower memcpy if virtiofs
> > device is not backed by a pmem.
> 
> Reads from the page cache handle machine checks (filemap_read() ->
> raw_copy_to_user()). I think virtiofs should therefore always handle
> machine checks when reading from the DAX Window.

IIUC, raw_copy_to_user() does not handle recovery from machine check. For
example, it can call copy_user_enhanced_fast_string() if cpu supports
X86_FEATURE_ERMS. But equivalent machine check safe version is
copy_mc_enhanced_fast_string() instead.

Hence, I don't think reading from page cache is using machine check safe
variants by default. This copy_mc_to_user() path has to be taken
explicitly for machine check safe variants. And currently only pmem driver
seems to take it by calling _copy_mc_to_iter().

Thanks
Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
