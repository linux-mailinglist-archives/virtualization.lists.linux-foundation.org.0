Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8E3EEED0
	for <lists.virtualization@lfdr.de>; Tue, 17 Aug 2021 16:54:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F02600B6;
	Tue, 17 Aug 2021 14:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrm1d4PPtu-J; Tue, 17 Aug 2021 14:54:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0CCE4605D8;
	Tue, 17 Aug 2021 14:54:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F75DC0022;
	Tue, 17 Aug 2021 14:54:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3362BC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 14:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B2CC400FB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 14:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mlg9FSQR5rdZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 14:54:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3DAF400BD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629212069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iwqtQA5c8IMZ/VG1YjrV8VQlVP1OvjA9/1fjYP9qLvA=;
 b=TzADJ3vrdQstqYDTKdEub5bE/KQj9uNzVZ9D0+c9R3MiRegOTg8ImuN4AePOj48RiRhR4Z
 L8rpCQ0cW4bCUU+iNCUPCyD9kNYzb5hHmSkRWYNIKoOy47saCdMCcl2p805mw3bYN1HdXa
 oNX/0rrJoPv9mR5e97m+/gMqpBMiF3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-k9rS56UMMiK1PsCZaz336w-1; Tue, 17 Aug 2021 10:54:28 -0400
X-MC-Unique: k9rS56UMMiK1PsCZaz336w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2309087D54D;
 Tue, 17 Aug 2021 14:54:27 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.10.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2645B19D9D;
 Tue, 17 Aug 2021 14:54:23 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 9C7B7220637; Tue, 17 Aug 2021 10:54:22 -0400 (EDT)
Date: Tue, 17 Aug 2021 10:54:22 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Subject: Re: [Virtio-fs] [PATCH v4 0/8] fuse,virtiofs: support per-file DAX
Message-ID: <YRvNnmy5Mra/AUix@redhat.com>
References: <20210817022220.17574-1-jefflexu@linux.alibaba.com>
 <CAJfpeguw1hMOaxpDmjmijhf=-JEW95aEjxfVo_=D_LyWx8LDgw@mail.gmail.com>
 <YRuCHvhICtTzMK04@work-vm>
 <CAJfpegvM+S5Xru3Yfc88C64mecvco=f99y-TajQBDfkLD-S8zQ@mail.gmail.com>
 <0896b1f6-c8c4-6071-c05b-a333c6cccacd@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0896b1f6-c8c4-6071-c05b-a333c6cccacd@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtualization@lists.linux-foundation.org,
 virtio-fs-list <virtio-fs@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-fsdevel@vger.kernel.org
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

On Tue, Aug 17, 2021 at 09:08:35PM +0800, JeffleXu wrote:
> 
> 
> On 8/17/21 6:09 PM, Miklos Szeredi wrote:
> > On Tue, 17 Aug 2021 at 11:32, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> >>
> >> * Miklos Szeredi (miklos@szeredi.hu) wrote:
> >>> On Tue, 17 Aug 2021 at 04:22, Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> >>>>
> >>>> This patchset adds support of per-file DAX for virtiofs, which is
> >>>> inspired by Ira Weiny's work on ext4[1] and xfs[2].
> >>>
> >>> Can you please explain the background of this change in detail?
> >>>
> >>> Why would an admin want to enable DAX for a particular virtiofs file
> >>> and not for others?
> >>
> >> Where we're contending on virtiofs dax cache size it makes a lot of
> >> sense; it's quite expensive for us to map something into the cache
> >> (especially if we push something else out), so selectively DAXing files
> >> that are expected to be hot could help reduce cache churn.
> > 
> > If this is a performance issue, it should be fixed in a way that
> > doesn't require hand tuning like you suggest, I think.
> > 
> > I'm not sure what the  ext4/xfs case for per-file DAX is.  Maybe that
> > can help understand the virtiofs case as well.
> > 
> 
> Some hints why ext4/xfs support per-file DAX can be found [1] and [2].
> 
> "Boaz Harrosh wondered why someone might want to turn DAX off for a
> persistent memory device. Hellwig said that the performance "could
> suck"; Williams noted that the page cache could be useful for some
> applications as well. Jan Kara pointed out that reads from persistent
> memory are close to DRAM speed, but that writes are not; the page cache
> could be helpful for frequent writes. Applications need to change to
> fully take advantage of DAX, Williams said; part of the promise of
> adding a flag is that users can do DAX on smaller granularities than a
> full filesystem."
> 
> In summary, page cache is preferable in some cases, and thus more fine
> grained way of DAX control is needed.

In case of virtiofs, we are using page cache on host. So this probably
is not a factor for us. Writes will go in page cache of host.

> 
> 
> As for virtiofs, Dr. David Alan Gilbert has mentioned that various files
> may compete for limited DAX window resource.
> 
> Besides, supporting DAX for small files can be expensive. Small files
> can consume DAX window resource rapidly, and if small files are accessed
> only once, the cost of mmap/munmap on host can not be ignored.

W.r.r access pattern, same applies to large files also. So if a section
of large file is accessed only once, it will consume dax window as well
and will have to be reclaimed.

Dax in virtiofs provides speed gain only if map file once and access
it multiple times. If that pattern does not hold true, then dax does
not seem to provide speed gains and in fact might be slower than
non-dax.

So if there is a pattern where we know some files are accessed repeatedly
while others are not, then enabling/disabling dax selectively will make
sense. Question is how many workloads really know that and how will
you make that decision. Do you have any data to back that up.

W.r.t small file, is that a real concern. If that file is being accessed
mutliple times, then we will still see the speed gain. Only down side
is that there is little wastage of resources because our minimum dax
mapping granularity is 2MB. I am wondering can we handle that by
supporting other dax mapping granularities as well. say 256K and let
users choose it.

Thanks
Vivek
> 
> 
> [1]
> https://lore.kernel.org/lkml/20200428002142.404144-1-ira.weiny@intel.com/
> [2] https://lwn.net/Articles/787973/
> 
> -- 
> Thanks,
> Jeffle
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
